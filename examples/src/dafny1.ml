(** Generate Isabelle code
*)


open Utils
open Core.Std
open Re2
open Paramecium
open Loach
open InvFinder

open Isa_base

exception Unsupported of string

let types_ref = ref []

let name_count=ref 0
let old_dependency=ref ""

let analyze_rels_among_pfs pfs_lists =
  let rec wrapper pfs_lists res =
    match pfs_lists with
    | [] -> raise Empty_exception (*TODO*)
    | [_] -> res
    | pfs_list::pfs_lists' ->
      let parts = List.map pfs_list ~f:(fun (Paramfix(vn, tn, c)) ->
        let related =
          List.filter (List.concat pfs_lists') ~f:(fun (Paramfix(_, tn', _)) -> tn = tn')
        in
        let equals = List.filter related ~f:(fun (Paramfix(_, _, c')) -> c = c') in
        if List.is_empty equals then
          String.concat ~sep:"&&" (List.map related ~f:(fun (Paramfix(vn', _, _)) ->
            sprintf "%s!=%s" vn vn'
          ))
        else begin
          String.concat ~sep:"&&" (List.map equals ~f:(fun (Paramfix(vn', _, _)) ->
            sprintf "%s==%s" vn vn'
          ))
        end
      ) in
      let r = String.concat ~sep:"&&" (List.filter parts ~f:(fun s -> not (s = ""))) in
      wrapper pfs_lists' (res@[r])
  in
  let res =
    List.filter (wrapper pfs_lists []) ~f:(fun s -> not (s = ""))
    |> String.concat ~sep:"&&"
  in
  if res = "" then "true" else res

let get_pf_name_list pfs =
  String.concat ~sep:"," (List.map pfs ~f:(fun pf ->
    let Paramfix(vn, _, _) = pf in vn
  ))

let get_pf_name_type_list pfs =
  String.concat ~sep:"," (List.map pfs ~f:(fun pf ->
    let Paramfix(vn, _, _) = pf in (vn^":"^"nat")
  ))
  
let analyze_rels_in_pfs ?(quant="") t name pfs =
  let pfs_str_of_a_type pfs =
    let part1 = List.map pfs ~f:(fun pf ->
      let Paramfix(vn, tn, _) = pf in 
      let Some(symbOrd)=Hashtbl.find ToDafny.paraNameMapSymbolName_table tn in
      sprintf "%s<N%d" vn symbOrd
    ) in
    let pairs = combination pfs 2 in
    let part2 = List.map pairs ~f:(fun [pf1; pf2] ->
      let Paramfix(vn1, _, _), Paramfix(vn2, _, _) = pf1, pf2 in sprintf "%s!=%s" vn1 vn2
    ) in
    String.concat ~sep:"&&" (part1@part2)
  in
  let param_str_part =
    partition pfs ~f:(fun (Paramfix(_, tn, _)) -> tn)
    |> List.map ~f:pfs_str_of_a_type
    |> String.concat ~sep:"&&"
  in
  if List.is_empty pfs then
    sprintf "%s%s(%s)"  name quant (get_pf_name_list pfs)
  else
    sprintf "%s&&%s%s(%s)"  param_str_part name quant (get_pf_name_list pfs)

let get_pd_name_list pds =
  String.concat ~sep:" " (List.map pds ~f:(fun pd ->
    let Paramdef(vn, _) = pd in vn
  ))

let analyze_rels_in_pds ?(quant="") t name pds =
  let pds_str_of_a_type pds =
    let part1 = List.map pds ~f:(fun pd ->
      let Paramdef(vn, _) = pd in sprintf "%s<N" vn
    ) in
    let pairs = combination pds 2 in
    let part2 = List.map pairs ~f:(fun [pd1; pd2] ->
      let Paramdef(vn1, _), Paramdef(vn2, _) = pd1, pd2 in sprintf "%s!=%s" vn1 vn2
    ) in
    String.concat ~sep:"&&" (part1@part2)
  in
  let param_str_part =
    partition pds ~f:(fun (Paramdef(_, tn)) -> tn)
    |> List.map ~f:pds_str_of_a_type
    |> String.concat ~sep:"&&"
  in
  if List.is_empty pds then
    sprintf "%s=%s %s %s" t name quant (get_pd_name_list pds)
  else
    sprintf "%s&&%s=%s %s %s" param_str_part t name quant (get_pd_name_list pds)

let pds_param_constraints ?(quant="") t name pds =
  if List.is_empty pds then
    sprintf "(%s)" (analyze_rels_in_pds ~quant t name pds)
  else 
    sprintf "(\\<exists> %s. %s)" (get_pd_name_list pds) (analyze_rels_in_pds ~quant t name pds)

let pfs_param_constraints ?(quant="") t name pfs =
  if List.is_empty pfs then
    sprintf "%s" (analyze_rels_in_pfs ~quant t name pfs)
  else 
    sprintf " %s"  (analyze_rels_in_pfs ~quant t name pfs)

let gen_tmp_vars n =
  let nums = up_to n in
  List.map nums ~f:(fun i -> sprintf "i%d" i)


let quant_in_rule = ref false

let const_act c =
  match c with
  | Boolc(b) ->
    Some (sprintf "definition %b::\"scalrValueType\" where [simp]: \"%b\\<equiv> boolV %s\""
      b b (if b then "True" else "False")
    )
  | Strc(s) ->
    Some (sprintf "definition %s::\"scalrValueType\" where [simp]: \"%s\\<equiv> enum ''control'' ''%s''\""
      s s s
    )
  | Intc(i) -> None
  
let const_to_str c =
  match c with
  | Boolc(b) -> sprintf "%s" (if b then "TRUE" else "FALSE")
  | Strc(s) -> s
  | Intc(i) -> sprintf "%d" i

let type_act (Enum(name, consts)) =
  let const_strs = List.filter_map consts ~f:const_act in
  match const_strs with
  | [] -> None
  | _ -> Some (String.concat ~sep:"\n" const_strs)

let var_act (Arr(name_with_prs)) =
  let cast_to_string init prs =
    List.fold prs ~init ~f:(fun res x -> sprintf "(Para %s %s)" res (name_of_param x))
  in
  match name_with_prs with
  | [] -> raise Empty_exception
  | (name, prs)::name_with_prs' ->
    let ident = sprintf "(Ident ''%s'')" name in
    let init = cast_to_string ident prs in
    List.fold name_with_prs' ~init ~f:(fun res (name, prs) ->
      cast_to_string (sprintf "(Field %s ''%s'')" res name) prs
    )

let paramref_to_index pr =
  match pr with
  | Paramref(name) -> name
  | Paramfix(_, _, c) -> (
    match c with
    | Intc(i) -> sprintf "%d" i
    | _ -> raise (Unsupported("Non-integer indexes are not supported yet"))
  )

let rec exp_act e =
  match e with
  | Const(c) -> sprintf "(Const %s)" (const_to_str c)
  | Var(v) -> sprintf "(IVar %s)" (var_act v)
  | Param(pr) -> sprintf "(Const (index %s))" (paramref_to_index pr)
  | Ite(f, e1, e2) -> sprintf "(iteForm %s %s %s)"
    (formula_act f) (exp_act e1) (exp_act e2)
  | UIF(n, el) ->
    let els = List.fold el ~init:"[]" ~f:(fun res x ->
      sprintf "%s#%s" (exp_act x) res
    ) in
    sprintf "(UIF ''%s'' (%s))" n els
and formula_act f =
  match f with
  | Chaos -> "chaos"
  | Miracle -> "miracle"
  | UIP(n, el) ->
    let els = List.fold el ~init:"[]" ~f:(fun res x ->
      sprintf "%s#%s" (exp_act x) res
    ) in
    sprintf "(UIP ''%s'' (%s))" n els
  | Eqn(e1, e2) -> sprintf "(eqn %s %s)" (exp_act e1) (exp_act e2)
  | Neg(g) -> sprintf "(neg %s)" (formula_act g)
  | AndList(fl) -> (
    match fl with
    | [] -> formula_act chaos
    | [g] -> formula_act g
    | f1::f2::fl' -> 
      let init = sprintf "(andForm %s %s)" (formula_act f1) (formula_act f2) in
      List.fold fl' ~init ~f:(fun res x -> sprintf "(andForm %s %s)" res (formula_act x))
  )
  | OrList(fl) -> (
    match fl with
    | [] -> formula_act miracle
    | [g] -> formula_act g
    | f1::f2::fl' -> 
      let init = sprintf "(orForm %s %s)" (formula_act f1) (formula_act f2) in
      List.fold fl' ~init ~f:(fun res x -> sprintf "(orForm %s %s)" res (formula_act x))
  )
  | Imply(f1, f2) -> sprintf "(implyForm %s %s)" (formula_act f1) (formula_act f2)
  | ForallFormula(paramdefs, form) ->
    begin
      quant_in_rule := true;
      match paramdefs with
      | [] -> raise Empty_exception
      | [Paramdef(name, tname)] ->
        let form_str = formula_act form in
        sprintf "(forallForm (down N) (\\<lambda>%s. %s))" name form_str
      | _ -> raise (Unsupported "More than 1 paramters in forall are not supported yet")
    end
  | ExistFormula(paramdefs, form) ->
    begin
      quant_in_rule := true;
      match paramdefs with
      | [] -> raise Empty_exception
      | [Paramdef(name, tname)] ->
        let form_str = formula_act form in
        sprintf "(existsForm (down N) (\\<lambda>%s. %s))" name form_str
      | _ -> raise (Unsupported "More than 1 paramters in exists are not supported yet")
    end
    
let paramdef_act_in_murphi (Paramdef(vn, tn)) = 
	sprintf "%s : %s" vn tn    

let const_act_in_murphi c =
  match c with
  | Intc(i) -> Int.to_string i
  | Strc(s) -> s
  | Boolc(b) -> Bool.to_string b

let const_to_str_in_murphi c =
  match c with
  | Boolc(b) -> sprintf "%b" b
  | Strc(s) -> s
  | Intc(i) -> sprintf "%d" i

let paramref_act_in_murphi pr =
  match pr with
  | Paramfix(_, _, c) -> const_act_in_murphi c
  | Paramref(name) -> name

let var_act_in_murphi v =
  let Arr(ls) = v in
  let str=String.concat ~sep:"." (List.map ls ~f:(fun (n, prs) ->
    match prs with
    | [] -> sprintf "%s" n
    | _ ->
      let actual_ps = List.map prs ~f:paramref_act_in_murphi in
      sprintf "%s%s" n (String.concat (List.map actual_ps ~f:(fun p -> sprintf "[%s]" p)))
  )) in
  sprintf "top.%s" str
  
let rec exp_act_in_murphi exp =
  match exp with
  | Const(c) -> const_act_in_murphi c
  | Var(v) -> var_act_in_murphi v
  | Param(pr) -> paramref_act_in_murphi pr
  | Ite(f, e1, e2) ->
    sprintf "if (%s) then %s else %s)" (form_act_in_murphi f) (exp_act_in_murphi e1) (exp_act_in_murphi e2)
  | UIF(n, el) -> sprintf "(%s)" (String.concat ~sep:n (List.map el ~f:exp_act_in_murphi))
and form_act_in_murphi form =
  match form with
  | Chaos -> "true"
  | Miracle -> "false"
  | UIP(n, el) -> sprintf "(%s)" (String.concat ~sep:n (List.map el ~f:exp_act_in_murphi))
  | Eqn(e1, e2) -> sprintf "(%s == %s)" (exp_act_in_murphi e1) (exp_act_in_murphi e2)
  | Neg(form) -> sprintf "(!%s)" (form_act_in_murphi form)
  | AndList(fl) ->
    List.map fl ~f:(form_act_in_murphi)
    |> reduce ~default:"true" ~f:(fun res x -> sprintf "%s && %s" res x)
    |> sprintf "(%s)"
  | OrList(fl) ->
    List.map fl ~f:(form_act_in_murphi)
    |> reduce ~default:"false" ~f:(fun res x -> sprintf "%s || %s" res x)
    |> sprintf "(%s)"
  | Imply(f1, f2) -> sprintf "(%s ==> %s)" (form_act_in_murphi f1) (form_act_in_murphi f2)
  | ForallFormula(pds, f) ->
    let pds_str = String.concat ~sep:"; " (List.map pds ~f:paramdef_act_in_murphi) in
    sprintf "(forall %s do %s endforall)" pds_str (form_act_in_murphi f)
  | ExistFormula(pds, f) ->
    let pds_str = String.concat ~sep:"; " (List.map pds ~f:paramdef_act_in_murphi) in
    sprintf "(exists %s do %s endexists)" pds_str (form_act_in_murphi f)



let statement_act statement =
  let Parallel(ite_formed) = eliminate_ifelse statement in
  let rec trans bs =
    match bs with
    | Assign(v, e) -> sprintf "(assign (%s, %s))" (var_act v) (exp_act e)
    | ForStatement(s, pd) ->
      begin
        quant_in_rule := true;
        match pd with
        | [] -> raise Empty_exception
        | [Paramdef(name, tname)] ->
          let type_range = name2type ~tname ~types:(!types_ref) in
          let s_str = trans s in
          sprintf "(forallSent (down N) (\\<lambda>%s. %s))" name s_str
        | _ -> raise (Unsupported "More than 1 paramters in for statement are not supported yet")
      end
    | _ -> raise Empty_exception
  in
  sprintf "(parallelList [%s])" (String.concat ~sep:", " (List.map ite_formed ~f:trans))

let rule_quant_table = Hashtbl.create ~hashable:String.hashable ()

let rule_act r =
  quant_in_rule := false;
  let Rule(name, pds, f, s) = r in
  let pd_count_t = List.map pds ~f:(fun _ -> "nat") in
  let pd_str = String.concat ~sep:" \\<Rightarrow> " pd_count_t in
  let rule_type =
    if pd_str = "" then "rule" else sprintf "%s \\<Rightarrow> rule" pd_str
  in
  let pd_names = String.concat ~sep:" " (List.map pds ~f:(fun (Paramdef(n, _)) -> n)) in
  let guard = formula_act f in
  let statements = statement_act s in
  let quant = if (!quant_in_rule) then "N" else "" in
  let quant_type = if (!quant_in_rule) then "nat \\<Rightarrow> " else "" in
  Hashtbl.replace rule_quant_table ~key:name ~data:quant;
  (pds_param_constraints ~quant "r" name pds,
  sprintf "definition %s::\"%s%s\" where [simp]:
\"%s %s %s\\<equiv>\nlet g = %s in\nlet s = %s in\nguard g s\""
    name quant_type rule_type name quant pd_names guard statements)

let rules_act rs =
  let rule_inst_strs, rules_strs = List.unzip (List.map rs ~f:rule_act) in
  let rstrs = String.concat ~sep:"\n\n" rules_strs in
  let r_insts_str = String.concat ~sep:" \\<or>\n" rule_inst_strs in
  sprintf "%s\n\nsubsection{*The set of All actual Rules w.r.t. a Protocol Instance with Size $N$*}\ndefinition rules::\"nat \\<Rightarrow> rule set\" where [simp]:
\"rules N \\<equiv> {r.\n%s\n}\"" rstrs r_insts_str

let rec paramecium_exp_to_loach e =
  match e with
  | Paramecium.Const(c) -> const c
  | Var(v) -> var v
  | Param(pr) -> param pr
  | Ite(f, e1, e2) ->
    ite (paramecium_form_to_loach f) (paramecium_exp_to_loach e1) (paramecium_exp_to_loach e2)
and paramecium_form_to_loach form =
  match form with
  | Paramecium.Chaos -> chaos
  | Paramecium.Miracle -> miracle
  | Paramecium.Eqn(e1, e2) -> eqn (paramecium_exp_to_loach e1) (paramecium_exp_to_loach e2)
  | Paramecium.Neg(f) -> neg (paramecium_form_to_loach f)
  | Paramecium.AndList(fl) -> andList (List.map fl ~f:paramecium_form_to_loach)
  | Paramecium.OrList(fl) -> orList (List.map fl ~f:paramecium_form_to_loach)
  | Paramecium.Imply(f1, f2) -> imply (paramecium_form_to_loach f1) (paramecium_form_to_loach f2)

let inv_act cinv =
  let InvFinder.ConcreteProp(Paramecium.Prop(name, pds, gened_inv), pfs) = cinv in
  let gened_inv' = paramecium_form_to_loach gened_inv in
  let has_not_sym = List.exists pfs ~f:(fun (Paramfix(_, _, c)) -> c = intc 0) in
  let pds' =
    if has_not_sym then
      let Paramfix(name, _, _) = List.find_exn pfs ~f:(fun (Paramfix(_, _, c)) -> c = intc 0) in
      List.filter pds ~f:(fun (Paramdef(n, _)) -> not (n = name))
    else begin pds end
  in
  let gened_inv'' =
    if has_not_sym then
      let not_sym_pf = List.find_exn pfs ~f:(fun (Paramfix(_, _, c)) -> c = intc 0) in
      apply_form gened_inv' ~p:[not_sym_pf]
    else begin gened_inv' end
  in
  let pd_count_t = List.map pds' ~f:(fun (Paramdef(n, t)) -> sprintf "%s:nat" n) in
  let pd_str = String.concat ~sep:", " pd_count_t in
  let inv_type = pd_str
    (*if pd_str = "" then "formula" else sprintf "%s \\<Rightarrow> formula" pd_str*)
  in
  let varNames =(*let s'=Trans.trans_statement ~types s in  VarNames.of_statement s' in*)
  	(let ()=VarNamesWithParam.of_var_ref :=  (fun _x -> String.Set.of_list [ToDafny.var_act _x]) in
  	 VarNamesWithParam.of_form ~types:[] gened_inv'' )   in
  let ()=print_endline ("show1"^(String.concat ~sep:"&&&" (Set.to_list varNames))) in	 
  let allArrNames=List.concat (List.map ~f:ToDafny.getallArrNames (Set.to_list varNames)) in
  let ()=print_endline ("show"^(String.concat ~sep:"---" allArrNames)) in 
  let allReadConstr=String.concat ~sep:"\n" 
  	(List.map ~f:(fun x->sprintf "reads %s" x) allArrNames) in
  let pd_names = String.concat ~sep:" " (List.map pds' ~f:(fun (Paramdef(n, _)) -> n)) in
  let allNames=Hashtbl.keys ToDafny.var2SymbNoTab in 
  let containArrName n=
    		  List.find    allNames  (fun x->ToDafny.contains n x) in
    			
  let var_act n=
    		
    			let ele=containArrName n in
    			match ele with
    			|Some(ele) ->
    				begin
    				(*	let ()=print_endline (sprintf "%scontains %s\n" n ele) in*)
    					let result=Hashtbl.find    ToDafny.var2SymbNoTab ele in
    					match result with
    					|Some(i) ->
    						sprintf "requires top.%s.Length ==N%d\n requires N%d>0\n" ele i i  
    					|None ->"" 
    			 end
    			|None ->""
    		  in
    		
  let paramConstrOnNs=String.concat ~sep:"" (List.map ~f:var_act (Set.to_list varNames)) in
  let paramdefInRule_act pdf=
   			let (Paramdef(vn, tn)) = pdf in
   			(*let ()=print_endline vn in*)
				let Some(symbOrd)=Hashtbl.find ToDafny.paraNameMapSymbolName_table tn in
				(sprintf "requires 0<= %s<N%d" vn 	symbOrd,
				 sprintf "N%d:nat" symbOrd
				 )  in
	let pds_str1 = 
    		String.concat ~sep:", " (String.Set.to_list (String.Set.of_list (List.map ~f:snd (List.map pds ~f:paramdefInRule_act)))) in
  let param_constr_str2 = 
    		String.concat ~sep:"\n " (List.map ~f:fst (List.map pds ~f:paramdefInRule_act)) in				 
  (*name, List.length pds', sprintf "definition %s::\"%s\" where [simp]:\"%s %s \\<equiv>\n%s\"" name inv_type name pd_names (formula_act (neg gened_inv''))*)
  name, List.length pds', pd_str,
  sprintf "predicate  %s(top:TopC,%s,%s)
  reads top
  %s
  %s 
  %s
  {\n%s\n}\n" name  pds_str1 pd_str allReadConstr paramConstrOnNs param_constr_str2  (form_act_in_murphi (neg gened_inv''))

let invs_act cinvs =
  let invs_with_pd_count = List.map cinvs ~f:inv_act in
  let inv_strs = String.concat ~sep:"\n\n" (List.map invs_with_pd_count ~f:(fun (_, _, _,s) -> s)) in
  (*let inv_insts_str = String.concat ~sep:" \\<or>\n" (
    List.map cinvs ~f:(fun (ConcreteProp(Prop(name, pds, _), _)) ->
      if List.is_empty pds then
        sprintf "(%s)" (analyze_rels_in_pds "f" name pds)
      else
        sprintf "(\\<exists> %s. %s)" (get_pd_name_list pds) (analyze_rels_in_pds "f" name pds)
    )
  ) in*)
   inv_strs 









let init_act statement i =
  let quant, body =
    match statement with
    | Assign(v, e) -> "", sprintf "(eqn %s %s)" (exp_act (var v)) (exp_act e)
    | IfelseStatement(f, Assign(v, e1), Assign(_, e2)) ->
      "", sprintf "(eqn %s (iteForm %s %s %s))" (exp_act (var v)) (formula_act f) (exp_act e1) (exp_act e2)
    | ForStatement(Assign(v, e), pd) ->
      begin
        match pd with
        | [] -> raise Empty_exception
        | [Paramdef(name, tname)] ->
          let type_range = name2type ~tname ~types:(!types_ref) in
          let s_str = sprintf "(eqn %s %s)" (exp_act (var v)) (exp_act e) in
          "N", sprintf "(forallForm (down N) (%% %s . %s))" name s_str
        | _ -> raise (Unsupported "More than 1 paramters in exists are not supported yet")
      end
    | ForStatement(IfelseStatement(f, Assign(v, e1), Assign(_, e2)), pd) ->
      begin
        match pd with
        | [] -> raise Empty_exception
        | [Paramdef(name, tname)] ->
          let type_range = name2type ~tname ~types:(!types_ref) in
          let s_str = sprintf "(eqn %s (iteForm %s %s %s))"
            (exp_act (var v)) (formula_act f) (exp_act e1) (exp_act e2) in
          "N", sprintf "(forallForm (down N) (%% %s . %s))" name s_str
        | _ -> raise (Unsupported "More than 1 paramters in exists are not supported yet")
      end
    | _ -> raise Empty_exception
  in
  let init_type_str = if quant = "" then "formula" else begin "nat \\<Rightarrow> formula" end in
  quant, sprintf "definition initSpec%d::\"%s\" where [simp]:
\"initSpec%d %s \\<equiv> %s\"" i init_type_str i quant body

let inits_act statements =
  let balanced = balance_ifstatement statements in
  let init_no = up_to (List.length balanced) in
  let init_strs_with_quant = List.map2_exn balanced init_no ~f:init_act in
  let init_strs = String.concat ~sep:"\n\n" (List.map init_strs_with_quant ~f:(fun (_, s) -> s)) in
  let init_insts_str = String.concat ~sep:",\n" (
    List.map2_exn init_no (List.map init_strs_with_quant ~f:(fun (q, _) -> q)) ~f:(fun i q ->
      sprintf "(initSpec%d %s)" i q
    )
  ) in
  sprintf "%s\n\ndefinition allInitSpecs::\"nat \\<Rightarrow> formula list\" where [simp]:
\"allInitSpecs N \\<equiv> [\n%s\n]\"" init_strs init_insts_str







module ToIsabelle = struct

  let const_act c =
    match c with
    | Intc(i) -> sprintf "%d" i
    | Strc(s) -> s
    | Boolc(b) -> sprintf "%b" b

  let paramref_act pr =
    match pr with
    | Paramref(name) -> name
    | Paramfix(_, _, c) -> const_act c

  let var_act (Arr(vs)) =
    String.concat ~sep:"_" (List.map vs ~f:(fun (name, prs) ->
      sprintf "%s%s" name (String.concat (List.map prs ~f:(fun pr ->
        sprintf "[%s]" (paramref_act pr)
      )))
    ))
  
  let rec exp_act e =
    match e with
    | Paramecium.Const(c) -> const_act c
    | Var(v) -> var_act v
    | Param(pr) -> paramref_act pr
    | Ite(_) -> raise Empty_exception
    | UIF(n, el) -> String.concat ~sep:n (List.map el ~f:exp_act)

  let rec form_act f =
    match f with
    | Paramecium.Chaos -> "True"
    | Miracle -> "False"
    | UIP(n, el) -> String.concat ~sep:n (List.map el ~f:exp_act)
    | Eqn(e1, e2) -> sprintf "%s=%s" (exp_act e1) (exp_act e2)
    | Neg(f) -> sprintf "\\<not>(%s)" (form_act f)
    | AndList(fl) ->
      String.concat ~sep:"&&" (List.map fl ~f:(fun f -> sprintf "(%s)" (form_act f)))
    | OrList(fl) -> 
      String.concat ~sep:"\\<or>" (List.map fl ~f:(fun f -> sprintf "(%s)" (form_act f)))
    | Imply(f1, f2) -> sprintf "(%s)\\<rightarrow>(%s)" (form_act f1) (form_act f2)

end









let gen_case_1 indent cut_tacs ="//1"
  (*let cmd = if cut_tacs = "" then "show" else "have" in
  sprintf
"  %shave \"?P1 s\"
  %sproof(cut_tac a1 a2 %s, auto) qed
  %sthen %s \"invHoldForRule s f r (invariants N)\" by auto" indent indent cut_tacs indent cmd*)

let gen_case_2 indent cut_tacs invStr=sprintf "requires %s//2" invStr
  (*let cmd = if cut_tacs = "" then "show" else "have" in
  sprintf
"  %shave \"?P2 s\"
  %sproof(cut_tac a1 a2 %s, auto) qed
  %sthen %s \"invHoldForRule s f r (invariants N)\" by auto" indent indent cut_tacs indent cmd*)

let gen_case_3 indent cut_tacs (ConcreteProp(Prop(_, _, f), _)) =
	sprintf "requires %s//3" (ToDafny.form_act (Trans.invTrans_formula(Paramecium.neg f)))
 (* let cmd = if cut_tacs = "" then "show" else "have" in
  let f = paramecium_form_to_loach f in
  sprintf
"  %shave \"?P3 s\"
  %sapply (cut_tac a1 a2 %s, simp, rule_tac x=\"%s\" in exI, auto) done
  %sthen %s \"invHoldForRule s f r (invariants N)\" by auto"
    indent indent cut_tacs (formula_act (neg f)) indent cmd*)

let gen_branch branch case =
  (*sprintf "  moreover {\n    assume c1: \"%s\"\n%s\n  }" branch case*)
  sprintf "requires %s//branch" branch

let gen_inst relations condition has_outer_moreover =
  let cut_tacs = if has_outer_moreover then "b1" else "" in
  (* if has many branches *)
  if List.length relations > 1 then
    let analyze_branch {rule; inv; branch; relation} =
      let ConcreteProp(Prop(_, _, g), pfs) = branch in
      let ConcreteRule(_, pfs_rule) = rule in
      let ConcreteProp(Prop(_, _, invP), pfs_prop) = inv in
      let pfs_current = pfs_rule@pfs_prop in
      let branch_constraint =
        let overflow = List.filter pfs ~f:(fun (Paramfix(_, tn, c)) ->
          not (List.exists pfs_current ~f:(fun (Paramfix(_, tn', c')) -> tn = tn' && c = c'))
        ) in
        let param_rels = String.concat ~sep:"&&" (List.map overflow ~f:(fun (Paramfix(vn, _, _)) ->
          String.concat ~sep:"&&" (List.map pfs_current ~f:(fun (Paramfix(vn', _, _)) ->
            sprintf "%s!=%s" vn vn'
          ))
        )) in
        match overflow with
        | [] -> ""
        | _ -> sprintf "\\<exists> %s. %s&&" (get_pf_name_list overflow) param_rels
      in
      let branch_str =
        (*sprintf "(%s(formEval %s s))" branch_constraint (formula_act (paramecium_form_to_loach g))*)
        sprintf "%s" (ToDafny.form_act (Trans.invTrans_formula(g)))
      in
      let case_str =
        match relation with
        | InvHoldForRule1 -> gen_case_1 "  " (cut_tacs^" c1")  
        | InvHoldForRule2 -> gen_case_2 "  " (cut_tacs^" c1") 
        	(ToDafny.form_act (Trans.invTrans_formula(Paramecium.neg invP))) (*add invStr*)
        | InvHoldForRule3(cp) -> gen_case_3 "  " (cut_tacs^" c1")   cp
      in
      branch_str, gen_branch branch_str case_str
    in
    let branches, moreovers = List.unzip (List.map relations ~f:analyze_branch) in
    moreovers
    (*(String.concat ~sep:"\n" moreovers)*)
    (*if has_outer_moreover then
      sprintf
"moreover {
  assume b1: \"%s\"
  have \"%s\" by auto
%s
  ultimately have \"invHoldForRule s f r (invariants N)\" by satx
}" condition (String.concat ~sep:"\\<or>" branches) (String.concat ~sep:"\n" moreovers)
		
    else begin
      sprintf
"have \"%s\" by auto
%s
ultimately show \"invHoldForRule s f r (invariants N)\" by satx"
        (String.concat ~sep:"\\<or>" branches) (String.concat ~sep:"\n" moreovers)
    end*)
  else begin
    (* if there is only one TRUE branch *)
    let [{rule=_; inv; branch=_; relation}] = relations in
    let ConcreteProp(Prop(_, _, invP), pfs_prop) = inv in
    let case_str =
      match relation with
      | InvHoldForRule1 -> gen_case_1 "" cut_tacs
      | InvHoldForRule2 -> gen_case_2 "" cut_tacs   
      	(ToDafny.form_act (Trans.invTrans_formula(Paramecium.neg invP)))
      | InvHoldForRule3(cp) -> gen_case_3 "" cut_tacs cp
    in [case_str]
  end  
  (*   if has_outer_moreover then
    case_str
     sprintf
"moreover {
  assume b1: \"%s\"
%s
}" condition case_str 
    else begin
      case_str
    end
  end*)

let analyze_lemma rels pfs_prop has_outer_moreover =
  let pfs =
    match rels with
    | [] -> raise Empty_exception
    | {rule; inv=_; branch=_; relation=_}::_ ->
      let ConcreteRule(_, pfs) = rule in
      pfs
  in
  let condition = sprintf "requires %s" (analyze_rels_among_pfs [pfs; pfs_prop]) in
  let moreovers = gen_inst rels condition has_outer_moreover in
  condition, moreovers

let gen_lemma types record_var_str relations rules =
  let crule, cinv =
    match relations with
    | ({rule; inv; branch=_; relation=_}::_)::_ -> rule, inv
    | _ -> raise Empty_exception
  in
  let (ConcreteProp(Prop(_, _, f), _)) =cinv in
  let propEnsure=(ToDafny.form_act (Trans.invTrans_formula(Paramecium.neg f))) in
  
  let ConcreteProp(Prop(pn, _, _), pfs_prop) = cinv in
  
  let prop_constraint = pfs_param_constraints "f" pn pfs_prop in
  let replace s d =
        Re2.Regex.rewrite_exn (Re2.Regex.of_string s) ~template:d in
  let prop_constraint'=replace "&&" "&"  prop_constraint in     
  let splitStrs = String.split_on_chars ~on:['&'] prop_constraint' in
  let Some(tmp)=(List.tl (List.rev splitStrs)) in
  let requiresOfPropConstr=String.concat ~sep:"&&" tmp in 
  let requiresOfPropConstr="requires "^requiresOfPropConstr in
  let Some(tmp) =List.nth splitStrs (List.length splitStrs - 1) in
  let prop_constraint="ensures   "^propEnsure in
  let extraParamsOfInv=get_pf_name_type_list pfs_prop in
  let varNamesOfInv =(*let s'=Trans.trans_statement ~types s in  VarNames.of_statement s' in*)
  	(let ()=VarNamesWithParam.of_var_ref :=  (fun _x -> String.Set.of_list [ToDafny.var_act _x]) in
  	 VarNamesWithParam.of_form (Trans.invTrans_formula f) ~types:types)   in
  
  match crule with
  | ConcreteRule(rn, pfs_r) ->
    let rn = get_rname_of_crname rn in
    (*let rule_constraint =
      pfs_param_constraints ~quant:(Hashtbl.find_exn rule_quant_table rn) "r" rn pfs_r
    in*)
    let outer_moreovers =
      match relations with
      | [rels] ->
        let _, moreover = analyze_lemma rels pfs_prop false in
        Some([("",moreover)])
      | _ ->
        let res = List.map relations ~f:(fun rels -> analyze_lemma rels pfs_prop true) in
        let conditions, moreovers = List.unzip res in
        let conditions = List.filter conditions ~f:(fun s -> not (s = "")) in
        List.zip conditions moreovers
    in
   
   (*let ensureStr=form_act_in_murphi pfs_prop in*)
   let rn = get_rname_of_crname rn in
   let rule=
    match List.find rules ~f:(fun (Rule(n, _, _, _)) -> rn = n) with
    | None -> Prt.error (sprintf "can't find rule %s" rn); raise Empty_exception
    | Some(the_rule) ->the_rule in
    
   let doOneMoreOver one=
   	  let (condition, tags)=one in 
   	  let funDo tag=
   	  	let one'=String.concat ~sep:"\n" [requiresOfPropConstr;condition;tag] in
   	  	
   	  	let ()= if (!old_dependency=rn^pn) 
   	  					then name_count:=!name_count + 1
   	  					else begin name_count:=0; old_dependency:=rn^pn end in   
   	  	let pn'=sprintf "%s_%d" pn (!name_count) in		
   	  				  					
    		ToDafny.rule_act  types   pn' extraParamsOfInv one' prop_constraint varNamesOfInv rule in
    	List.map ~f:funDo tags in	
    	
   let Some(outer_moreovers)=outer_moreovers  in
   String.concat ~sep:"\n" (List.concat (List.map ~f:doOneMoreOver outer_moreovers))
    
  | AllRuleInst(rn) ->
    let rn = get_rname_of_crname rn in
    let rule=
    match List.find rules ~f:(fun (Rule(n, _, _, _)) -> rn = n) with
    | None -> Prt.error (sprintf "can't find rule %s" rn); raise Empty_exception
    | Some(the_rule) ->the_rule  in
      (*let Rule(_, pds, _, _) = the_rule in
      let rule_constraint =
        if List.is_empty pds then
          analyze_rels_in_pds ~quant:(Hashtbl.find_exn rule_quant_table rn) "r" rn pds
        else
          sprintf "\\<exists> %s. %s"
            (get_pd_name_list pds)
            (analyze_rels_in_pds ~quant:(Hashtbl.find_exn rule_quant_table rn) "r" rn pds)
      in
      sprintf
  "lemma %sVs%s:
  assumes a1: \"%s\" and
  a2: \"%s\"
  shows \"invHoldForRule s f r (invariants N)\"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  "
      rn pn
      rule_constraint
      prop_constraint*)
    let ()= if (!old_dependency=rn^pn) 
   	  					then name_count:=!name_count + 1
   	  					else begin name_count:=0; old_dependency:=rn^pn end in   
   	let pn'=sprintf "%s_%d" pn (!name_count) in	 
   	let additionReqStr="\nrequires "^propEnsure^"//statement has nothing with prop--it guranttee itself\n" in
    let ensureStr=prop_constraint in
    (*let ()=print_endline *)
   	  ToDafny.rule_act  types   pn' extraParamsOfInv (requiresOfPropConstr^additionReqStr) ensureStr varNamesOfInv rule  







let gen_lemma_invs_on_ini invs =
  let do_work (Paramecium.Prop(name, pds, _)) =
    sprintf
"lemma iniImply_%s:
assumes a1: \"%s\"
and a2: \"formEval (andList (allInitSpecs N)) s\"
shows \"formEval f s\"
using a1 a2 by auto"
      name
      (pds_param_constraints "f" name pds)
  in
  String.concat ~sep:"\n\n" (List.map invs ~f:do_work)









let gen_lemma_inv_on_rules (Paramecium.Prop(pn, p_pds, _)) rules =
  let prop_constraint = pds_param_constraints "f" pn p_pds in
  let gen_lemma_inv_on_rule (Rule(rn, r_pds, _, _)) =
    let rule_constraint =
      pds_param_constraints ~quant:(Hashtbl.find_exn rule_quant_table rn) "r" rn r_pds
    in
    rule_constraint,
    sprintf
"    moreover {
      assume d1: \"%s\"
      have \"invHoldForRule s f r (invariants N)\"
      apply (cut_tac b2 d1, metis %sVs%s) done
    }
" rule_constraint rn pn
  in
  let rule_constraints, moreovers = List.unzip (List.map rules ~f:gen_lemma_inv_on_rule) in
  sprintf
"lemma lemma_%s_on_rules:
  assumes b1: \"r \\<in> rules N\" and b2: \"%s\"
  shows \"invHoldForRule s f r (invariants N)\"
  proof -
  have c1: \"%s\"
  apply (cut_tac b1, auto) done
%s
  ultimately show \"invHoldForRule s f r (invariants N)\"
  by satx
qed
"
    pn
    prop_constraint
    (String.concat ~sep:"\\<or>\n    " rule_constraints)
    (String.concat ~sep:"\n" moreovers)







let gen_lemma_invs_on_rules invs =
  let inv_on_rules inv =
    let Paramecium.Prop(pn, p_pds, _) = inv in
    let prop_constraint = pds_param_constraints "f" pn p_pds in
    prop_constraint,
    sprintf
"    moreover {
      assume c1: \"%s\"
      have \"invHoldForRule s f r (invariants N)\"
      apply (cut_tac a2 c1, metis lemma_%s_on_rules) done
    }
" prop_constraint pn
  in
  let prop_constraints, moreovers = List.unzip (List.map invs ~f:(inv_on_rules)) in
  sprintf
"lemma invs_on_rules:
  assumes a1: \"f \\<in> invariants N\" and a2: \"r \\<in> rules N\"
  shows \"invHoldForRule s f r (invariants N)\"
  proof -
  have b1: \"%s\"
  apply (cut_tac a1, auto) done
%s
  ultimately show \"invHoldForRule s f r (invariants N)\"
  by satx
qed
"
    (String.concat ~sep:"\\<or>\n    " prop_constraints)
    (String.concat ~sep:"\n" moreovers)









let gen_lemma_invs_on_inis invs =
  let analyze_inv_on_ini (Paramecium.Prop(pn, pds, _)) =
    let prop_constraint = pds_param_constraints "f" pn pds in
    prop_constraint,
    sprintf
"    moreover {
      assume d1: \"%s\"
      have \"formEval f s\"
      apply (rule iniImply_%s)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }
" prop_constraint pn
  in
  let prop_constraints, moreovers = List.unzip (List.map invs ~f:analyze_inv_on_ini) in
  sprintf
"lemma on_inis:
  assumes b1: \"f \\<in> (invariants N)\" and b2: \"ini \\<in> {andList (allInitSpecs N)}\" \
and b3: \"formEval ini s\"
  shows \"formEval f s\"
  proof -
  have c1: \"%s\"
  apply (cut_tac b1, simp) done
%s
  ultimately show \"formEval f s\"
  by satx
qed
" (String.concat ~sep:"\\<or>\n    " prop_constraints) (String.concat ~sep:"\n" moreovers)










let gen_main =
"lemma main:
assumes a1: \"s \\<in> reachableSet {andList (allInitSpecs N)} (rules N)\"
and a2: \"0 < N\"
shows \"\\<forall> f. f \\<in> (invariants N) --> formEval f s\"
proof (rule consistentLemma)
show \"consistent (invariants N) {andList (allInitSpecs N)} (rules N)\"
proof (cut_tac a1, unfold consistent_def, rule conjI)
show \"\\<forall> f ini s. f \\<in> (invariants N) --> ini \\<in> {andList (allInitSpecs N)} \
--> formEval ini s --> formEval f s\"
proof ((rule allI)+, (rule impI)+)
  fix f ini s
  assume b1: \"f \\<in> (invariants N)\" and b2: \"ini \\<in> {andList (allInitSpecs N)}\" \
and b3: \"formEval ini s\"
  have b4: \"formEval (andList (allInitSpecs N)) s\"
  apply (cut_tac b2 b3, simp) done
  show \"formEval f s\"
  apply (rule on_inis, cut_tac b1, assumption, cut_tac b2, assumption, \
cut_tac b3, assumption) done
qed
next show \"\\<forall> f r s. f \\<in> invariants N --> r \\<in> rules N --> \
invHoldForRule s f r (invariants N)\"
proof ((rule allI)+, (rule impI)+)
  fix f r s
  assume b1: \"f \\<in> invariants N\" and b2: \"r \\<in> rules N\"
  show \"invHoldForRule s f r (invariants N)\"
  apply (rule invs_on_rules, cut_tac b1, assumption, cut_tac b2, assumption) done
qed
qed
next show \"s \\<in> reachableSet {andList (allInitSpecs N)} (rules N)\"
  apply (metis a1) done
qed"









let file_pub name types_str  () =
  let pub_str = sprintf
"//(*  Title:      HOL/Auth/%s.dfy
 //   Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
 //   Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
//*)

//header{*The %s Protocol Case Study*} 

//theory %s_base imports paraTheory
//begin

//section{*Main definitions of dafny  file*}

//subsection{* Definitions of Constants*}

%s\n" (sprintf "%s_base" name) name name types_str   in
  Out_channel.write_all (sprintf "%s/%s_base.dfy" name name) pub_str;;

let file_inv types types_str vardefStr name relations rules () =
	(*let types_str = String.concat ~sep:"\n" (List.map types ~f:ToDafny.type_act) in
  let types_str=types_str^"type boolean=bool\n" in*)
  
  let rec wrapper relations =
    match relations with
    | [] -> ()
    | rel::relations' ->
      let (({rule=_; inv=ConcreteProp(Prop(inv_name, _, _), _); branch=_; relation=_}::_)::_)::_ = rel in
      let strs =
        String.concat ~sep:"\n\n" (List.map rel ~f:(fun rs -> gen_lemma  types vardefStr rs rules))
      in 
      let strs=sprintf "%s\n%s\n%s\n\n" types_str vardefStr  strs in
      print_endline strs;
      Out_channel.write_all (sprintf "%s/%s_lemma_on%s.dfy" name name inv_name) strs; 
      wrapper relations'
  in    wrapper relations;;
(*      let lemmas_str = sprintf
"(*  Title:      HOL/Auth/%s.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The %s Protocol Case Study*} 

theory %s_lemma_on_%s imports %s_base
begin
section{*All lemmas on causal relation between %s and some rule r*}
%s
end
" (sprintf "%s_lemma_on_%s" name inv_name) name name inv_name name inv_name strs in
      Out_channel.write_all (sprintf "%s/%s_lemma_on_%s.thy" name name inv_name) lemmas_str;
      wrapper relations'
  in
  wrapper relations;;*)

let file_inv_on_rules name invs rules () =
  let rec wrapper invs =
    match invs with
    | [] -> ()
    | inv::invs' ->
      let Paramecium.Prop(pn, _, _) = inv in
      let lemma_str = sprintf
"(*  Title:      HOL/Auth/%s.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The %s Protocol Case Study*} 

theory %s_lemma_%s_on_rules imports %s_lemma_on_%s
begin
section{*All lemmas on causal relation between %s*}
%s
end
" (sprintf "%s_lemma_%s_on_rules" name pn) name name pn name pn pn (gen_lemma_inv_on_rules inv rules) in
      Out_channel.write_all (sprintf "%s/%s_lemma_%s_on_rules.thy" name name pn) lemma_str;
      wrapper invs'
  in
  wrapper invs;;

let file_invs_on_rules name invs () =
  let imports = List.map invs ~f:(fun (Paramecium.Prop(pn, _, _)) ->
    sprintf "%s_lemma_%s_on_rules" name pn
  ) in
  let lemma_str = sprintf
"(*  Title:      HOL/Auth/%s.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The %s Protocol Case Study*} 

theory %s_lemma_invs_on_rules imports %s
begin
%s
end
" (sprintf "%s_lemma_invs_on_rules" name) name name
  (String.concat ~sep:" " imports) (gen_lemma_invs_on_rules invs) in
  Out_channel.write_all (sprintf "%s/%s_lemma_invs_on_rules.thy" name name) lemma_str;;

let file_init name invs () =
  let init_str = sprintf
"(*  Title:      HOL/Auth/%s.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The %s Protocol Case Study*} 

theory %s_on_ini imports %s_base
begin
%s
end
" (sprintf "%s_on_ini" name) name name name (gen_lemma_invs_on_ini invs) in
  Out_channel.write_all (sprintf "%s/%s_on_ini.thy" name name) init_str;;

let file_invs_on_inis name invs () =
  let lemma_str = sprintf
"(*  Title:      HOL/Auth/%s.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The %s Protocol Case Study*} 

theory %s_on_inis imports %s_on_ini
begin
%s
end
" (sprintf "%s_on_inis" name) name name name (gen_lemma_invs_on_inis invs) in
  Out_channel.write_all (sprintf "%s/%s_on_inis.thy" name name) lemma_str;;

let file_main name () =
  let main_str = sprintf
"(*  Title:      HOL/Auth/%s.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The %s Protocol Case Study*} 

theory %s imports %s_lemma_invs_on_rules %s_on_inis
begin
%s
end
" name name name name name (gen_main) in
  Out_channel.write_all (sprintf "%s/%s.thy" name name) main_str;;

let file_root name n () =
  let ss_str ss_name ss_parent ss_theories = sprintf
"session %s_Session = %s +
    theories
        %s
" ss_name ss_parent (String.concat ~sep:"\n        " ss_theories)
  in
  let ss_paraTheory = ss_str "paraTheory" "HOL" ["paraTheory"] in
  let base_name = sprintf "%s_base" name in
  let lemma_ss_name i = sprintf "%s_lemma_on_inv__%d" name i in
  let lemma_on_rules_name i = sprintf "%s_lemma_inv__%d_on_rules" name i in
  let ss_base = ss_str base_name "paraTheory_Session" [base_name] in
  let ss_lemma1 =
    ss_str (lemma_ss_name 1) (base_name^"_Session") [lemma_on_rules_name 1]
  in
  let ss_lemmas =
    List.map (up_to (n - 1)) ~f:(fun i ->
      ss_str (lemma_ss_name (i + 2)) (lemma_ss_name (i + 1)^"_Session")
        [lemma_on_rules_name (i + 2)]
    )
  in
  let lemma_invs_on_rules_name = sprintf "%s_lemma_invs_on_rules" name in 
  let ss_invs_on_rules =
    ss_str lemma_invs_on_rules_name (lemma_ss_name n^"_Session") [sprintf "%s_lemma_invs_on_rules" name]
  in
  let invs_on_inis_name = sprintf "%s_invs_on_inis" name in
  let ss_invs_on_inis =
    ss_str invs_on_inis_name (lemma_invs_on_rules_name^"_Session") [sprintf "%s_on_inis" name]
  in
  let ss_main = ss_str name (invs_on_inis_name^"_Session") [name] in
  let root_str =
    String.concat ~sep:"\n" (
      [ss_paraTheory; ss_base; ss_lemma1]@
      ss_lemmas@
      [ss_invs_on_rules; ss_invs_on_inis; ss_main]
    )
  in
  Out_channel.write_all (sprintf "%s/ROOT" name) root_str;;

let file_sh name n () =
  (*let gen_cmd ss_name = sprintf "isabelle build -v -d . -b %s" ss_name in
  let cmd_paraTheory = gen_cmd "paraTheory_Session" in
  let cmd_base = gen_cmd (sprintf "%s_base_Session" name) in
  let cmd_lemmas = List.map (up_to n) ~f:(fun i ->
    gen_cmd (sprintf "%s_lemma_on_inv__%d_Session" name (i + 1))
  ) in
  let cmd_invs_on_rules = gen_cmd (sprintf "%s_lemma_invs_on_rules_Session" name) in
  let cmd_invs_on_inis = gen_cmd (sprintf "%s_invs_on_inis_Session" name) in
  let cmd_main = gen_cmd (sprintf "%s_Session" name) in*)
  
  let gen_cmd ss_name = sprintf "dafny %s" ss_name in
  let cmd_lemmas = List.map (up_to n) ~f:(fun i ->
    gen_cmd (sprintf "%s_lemma_oninv__%d.dfy" name (i + 1))
  ) in
  let sh_str = sprintf
  
"#!/bin/bash
shopt -s expand_aliases
source ~/.bashrc
%s
" (String.concat ~sep:"\n" (
    
    cmd_lemmas
  ))
  in
  let filename = sprintf "%s/run.sh" name in
  Out_channel.write_all filename sh_str;
  Unix.chmod filename ~perm:0O777;;








 (*let protocol_act {name; types; vardefs; init; rules; properties} cinvs_with_varnames relations () =
  types_ref := types;
  Unix.mkdir_p name;
  (*Out_channel.write_all (sprintf "%s/paraTheory.thy" name) Isa_base.para_theory;*)
  let types_str = String.concat ~sep:"\n" (List.filter_map types ~f:type_act) in
  let rules_str = rules_act rules in
  let (cinvs, _) = List.unzip cinvs_with_varnames in
  let invs = List.map cinvs ~f:(fun (ConcreteProp(p, _)) -> p) in
  let invs_str = invs_act cinvs in
  let inits_str = inits_act init in
  file_pub name types_str rules_str invs_str inits_str ();
  file_inv types name relations rules ();
 file_inv_on_rules name invs rules ();
  file_invs_on_rules name invs ();
  file_init name invs ();
  file_invs_on_inis name invs ();
  file_main name ();
  file_root name (List.length invs) ();
  file_sh name (List.length invs) ();;*)
  
  
let protocol_act' protocol cinvs_with_varnames relations=
  let {name; types; vardefs; init; rules; properties} = protocol in
  let types_str = String.concat ~sep:"\n" (List.map types ~f:ToDafny.type_act) in
  let types_str=types_str^"type boolean=bool\n" in
  let record_var_str = ToDafny.record_act vardefs in
  let (cinvs, _) = List.unzip cinvs_with_varnames in
  let invs = List.map cinvs ~f:(fun (ConcreteProp(p, _)) -> p) in
  let predicates_str=invs_act cinvs in
  let init_str = ToDafny.init_act init in
 (* let rules_str = String.concat ~sep:"\n\n\n" (List.map rules ~f:(ToDafny.rule_act types   "" "" "" "" (String.Set.of_list []))) in*)
  let props_str = String.concat ~sep:"\n\n\n" (List.map properties ~f:ToDafny.prop_act ) in
 (* let ()=print_endline (sprintf "%d\n" (Hashtbl.length ToDafny.var2SymbNoTab)) in
  let ()=Hashtbl.iter    ToDafny.var2SymbNoTab ~f:(fun ~key:k ~data:d -> (print_endline (sprintf "(%s,%d)\n" k d))) in*)
  
  let ()=file_pub name types_str () in
  let ()=file_inv types types_str record_var_str  name relations rules () in
  let ()=file_sh name (List.length invs) () in
  
  String.concat ~sep:"\n\n\n" [types_str; record_var_str; init_str; ""; predicates_str]   
   

