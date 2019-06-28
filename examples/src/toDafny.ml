
open Core.Std
open Utils
open Paramecium
open Loach

open InvFinder

open Isa_base




let spaces = ref 2

let gen_spaces () = String.make (!spaces) ' ' 
let paraNameMapSymbolName_table= Hashtbl.create ~hashable:String.hashable ()

(*tname->N e.g., Node -> N0, DATA ->N1
when deal with v:array [NODE] of vt; we need record v->N0, which helps to generate v.length =N *)

let var2SymbNoTab= Hashtbl.create ~hashable:String.hashable ()

let symbOrder=ref 0

let const_act c =
  match c with
  | Intc(i) -> Int.to_string i
  | Strc(s) -> s
  | Boolc(b) -> Bool.to_string b






let type_act t = 
  let Enum(name, consts) = t in
  match consts with
  | c::_ ->
    begin
      match c with
      | Boolc(_) -> ""
      | Strc(_) ->
        let items_str = String.concat ~sep:"| " (List.map consts ~f:const_act) in
        sprintf "%sdatatype %s = %s" (gen_spaces ()) name items_str
      | Intc(_) ->
        (*let c'::_ = List.rev consts in
        sprintf "%s%s : %s..%s;" (gen_spaces ()) name (const_act c) (const_act c')
        
        *)
        begin
        Hashtbl.replace paraNameMapSymbolName_table ~key:name ~data:!symbOrder;
        symbOrder:=!symbOrder+1;
        sprintf "%stype %s=nat" (gen_spaces ()) name
        end
    end
  | _ -> raise Empty_exception








type node =
  | Node of string * paramdef list * node list * string

let find_vdp vd_part ls =
  let (name, pds) = vd_part in
  let rec wrapper heads ls =
    match ls with
    | [] -> Node(name, pds, [], ""), heads
    | i::ls' ->
      let Node(name', _, _, _) = i in
      if name = name' then
        i, (heads@ls')
      else begin
        wrapper (heads@[i]) ls'
      end
  in
  wrapper [] ls

let build_vars_tree vardefs =
  let rec traverse cur_list ~cur_vd ~tname =
    match cur_vd with
    | [] -> cur_list
    | vd_part::cur_vd' ->
      let (Node(name, pds, next_ls, _)), cur_list = find_vdp vd_part cur_list in
      let next_ls = traverse next_ls ~cur_vd:cur_vd' ~tname in
      if cur_vd' = [] then
        (Node(name, pds, next_ls, tname))::cur_list
      else begin
        (Node(name, pds, next_ls, ""))::cur_list
      end
  in
  List.fold vardefs ~init:[] ~f:(fun res x ->
    let Arrdef(vd_parts, tname) = x in
    traverse res ~cur_vd:vd_parts ~tname
  )

let record_table = Hashtbl.create ~hashable:String.hashable ()


let get_type_id nodes =
  let names = List.map nodes ~f:(fun (Node(name, _, _, _)) -> name) in
  String.concat ~sep:"," (List.sort names ~cmp:String.compare)

let gen_var_str trees =
  let records = ref [] in
  let get_arr_of pds base_t varName= (*String.concat ~sep:" " (
    List.map pds ~f:(fun (Paramdef(_, t)) -> sprintf "array [%s] of" t))*)
    List.fold pds ~init:base_t
     ~f:(fun res a -> match a with 
    			(Paramdef(n, t)) ->
    			if (Hashtbl.mem   paraNameMapSymbolName_table t) 
    			then begin
    				let result=Hashtbl.find paraNameMapSymbolName_table t in
          	(match result with
          	|Some(symbN)->	Hashtbl.replace var2SymbNoTab ~key:varName ~data:symbN
          	|None -> ()); sprintf "array<%s>" res 
          	end
    			else begin Hashtbl.replace paraNameMapSymbolName_table ~key:t ~data:!symbOrder;
    				 	symbOrder:=!symbOrder+1;  
    				  sprintf "array<%s>" res end )
  in
  let rec wrapper tree =
    match tree with
    | Node(name, pds, [], tname) -> sprintf "%s : %s" name (get_arr_of pds tname name)
    | Node(name, pds, nodes, _) ->
      begin
        let key = get_type_id nodes in
        match Hashtbl.find record_table key with
        | Some(record_name) -> (*sprintf "%s : %s %s;" name (get_arr_of pds) record_name*)
        	let result=Hashtbl.find paraNameMapSymbolName_table record_name in
          	(match result with
          	|Some(symbN)->	Hashtbl.replace var2SymbNoTab ~key:name ~data:symbN
          	|None -> ()); 
        	sprintf "%s : %s " name (get_arr_of pds record_name name)
        | None ->
          let sub_items = List.map nodes ~f:wrapper in
         (* let record_name = sprintf "record_%d" (Hashtbl.length record_table) in
          let record_body = String.concat ~sep:"\n" sub_items in
          let record_str = sprintf "%s : record\n%s\nend;" record_name record_body in
          records := (!records)@[record_str];
          Hashtbl.replace record_table ~key ~data:record_name;
          sprintf "%s : %s %s;" name (get_arr_of pds) record_name*)
          
          let record_name = sprintf "class_%d " (Hashtbl.length record_table) in
          let record_body = String.concat ~sep:",\n" sub_items in
          let record_str = sprintf "class  %s {\nvar \n%s\n}" record_name record_body in
          records := (!records)@[record_str];
          Hashtbl.replace record_table ~key ~data:record_name;
          let result=Hashtbl.find paraNameMapSymbolName_table record_name in
          	(match result with
          	|Some(symbN)->	Hashtbl.replace var2SymbNoTab ~key:name ~data:symbN
          	|None -> ()); 
          sprintf "%s : %s " name (get_arr_of pds record_name name)
          
      end
  in
  let vars = List.map trees ~f:wrapper in
  (!records), vars

let record_act vardefs =
  let trees = build_vars_tree vardefs in
  let record_defs, var_defs = gen_var_str trees in
  sprintf "%s\n\n\nclass TopC{\nvar\n%s}\n" 
  (String.concat ~sep:"\n\n\n" record_defs) 
  (String.concat ~sep:",\n" var_defs)








let paramdef_act (Paramdef(vn, tn)) = 
	sprintf "%s : %s" vn tn
	
let paramdef_act' (Paramdef(vn, tn)) = 
	let Some(symbOrd)=Hashtbl.find paraNameMapSymbolName_table tn in
	sprintf "%s : int |0<= %s<N%d" vn tn	symbOrd

let paramref_act pr =
  match pr with
  | Paramfix(_, _, c) -> const_act c
  | Paramref(name) -> name

let var_act v =
  let Arr(ls) = v in
  let str=String.concat ~sep:"." (List.map ls ~f:(fun (n, prs) ->
    match prs with
    | [] -> sprintf "%s" n
    | _ ->
      let actual_ps = List.map prs ~f:paramref_act in
      sprintf "%s%s" n (String.concat (List.map actual_ps ~f:(fun p -> sprintf "[%s]" p)))
  )) in
  sprintf "top.%s" str
  
let paramdef_act'' (Paramdef(vn, tn)) = 
	let Some(symbOrd)=Hashtbl.find paraNameMapSymbolName_table tn in
	sprintf "%s  |0<= %s<N%d" vn vn	symbOrd  

let rec exp_act exp =
  match exp with
  | Const(c) -> const_act c
  | Var(v) -> var_act v
  | Param(pr) -> paramref_act pr
  | Ite(f, e1, e2) ->
    sprintf "if (%s) then %s else %s)" (form_act f) (exp_act e1) (exp_act e2)
  | UIF(n, el) -> sprintf "(%s)" (String.concat ~sep:n (List.map el ~f:exp_act))
and form_act form =
  match form with
  | Chaos -> "true"
  | Miracle -> "false"
  | UIP(n, el) -> sprintf "(%s)" (String.concat ~sep:n (List.map el ~f:exp_act))
  | Eqn(e1, e2) -> sprintf "(%s == %s)" (exp_act e1) (exp_act e2)
  | Neg(form) -> sprintf "(!%s)" (form_act form)
  | AndList(fl) ->
    List.map fl ~f:(form_act)
    |> reduce ~default:"true" ~f:(fun res x -> sprintf "%s && %s" res x)
    |> sprintf "(%s)"
  | OrList(fl) ->
    List.map fl ~f:(form_act)
    |> reduce ~default:"false" ~f:(fun res x -> sprintf "%s || %s" res x)
    |> sprintf "(%s)"
  | Imply(f1, f2) -> sprintf "(%s ==> %s)" (form_act f1) (form_act f2)
  | ForallFormula(pds, f) ->
    let pds_str = String.concat ~sep:"; " (List.map pds ~f:paramdef_act'') in
    sprintf "(forall %s :: %s )" pds_str (form_act f)
  | ExistFormula(pds, f) ->
    let pds_str = String.concat ~sep:"; " (List.map pds ~f:paramdef_act'') in
    sprintf "(exists %s :: %s)" pds_str (form_act f)


	
let rec statement_act s =
  match s with
  | Assign(v, e) -> sprintf "%s%s := %s;" (gen_spaces ()) (var_act v) (exp_act e)
  | Parallel(ss) -> String.concat ~sep:"\n" (List.map ss ~f:statement_act)
  | IfStatement(f, s) ->
    spaces := (!spaces) + 2;
    let s_str = statement_act s in
    spaces := (!spaces) - 2;
    sprintf "%sif %s {\n%s\n%s}" (gen_spaces ()) (form_act f) s_str (gen_spaces ())
  | IfelseStatement(f, s1, s2) ->
    spaces := (!spaces) + 2;
    let s1_str = statement_act s1 in
    let s2_str = statement_act s2 in
    spaces := (!spaces) - 2;
    sprintf "%sif %s {\n%s}\nelse{\n%s\n%s}" (gen_spaces ()) (form_act f) s1_str s2_str (gen_spaces ())
  | ForStatement(s, pds) ->
    let pds_str = String.concat ~sep:"; " (List.map pds ~f:paramdef_act'') in
    spaces := (!spaces) + 2;
    let s_str = statement_act s in
    spaces := (!spaces) - 2;
    sprintf "%sforall %s {\n%s\n%s}" (gen_spaces ()) pds_str s_str (gen_spaces ())
    
let contains s1 s2 =
    let re = Str.regexp_string s2
    in
        try ignore (Str.search_forward re s1 0); true
        with Not_found -> false    
(*contains "abcde" "bc";;*)

let elimia str=
			let ()=print_endline ("elimi "^str) in
			match  String.index str '['     with
			|Some(j)->String.sub ~pos:0 ~len:(j  ) str
			|None -> str  

let getallArrNames str=
	(*let splitStrs = Str.split (Str.regexp_string "\.") str in*)
	let splitStrs = String.split_on_chars ~on:['.'] str in
	
	let construc i=
		match  String.find ~f:(fun x-> x=']') 
			(match List.nth splitStrs i with |Some(one) ->one ) with
		 	|Some(j)->[String.concat ~sep:"." (List.filter ~f:(fun x-> not (x="")) 
		 																			(List.mapi ~f:(fun k a -> 
		 																			   if k<=i then begin if k=(List.length splitStrs - 1) then (elimia a) else a end  else "" ) splitStrs))
		 							 ]
		 	|None ->[] in
		List.concat (List.map ~f:construc (up_to (List.length 	splitStrs)))
		 	

(*nameAdd: n_RecvInvAckinv__51_0 ---_0*)

let rule_act  types  nameAdd extraInvParas reqStr ensureStr varNamesOfInv  r=
	
  (*let types_str = String.concat ~sep:"\n" (List.map types ~f:type_act) in
  let types_str=types_str^"type boolean=bool\n" in
  let record_var_str = record_act vardefs in*)
  
  let Rule(name, pds, f, s) = r in
  let varNamesOfStatements =(*let s'=Trans.trans_statement ~types s in  VarNames.of_statement s' in*)
  	(let ()=VarNamesWithParam.of_var_ref :=  (fun _x -> String.Set.of_list [var_act _x]) in
  	 VarNamesWithParam.of_statement s ~types)   in
  let varNameOfGuards= 
  	(let ()=VarNamesWithParam.of_var_ref :=  (fun _x -> String.Set.of_list [var_act _x]) in
  	 VarNamesWithParam.of_form f ~types)   in 	 
  let varNames=String.Set.union_list [varNamesOfStatements;varNamesOfInv;varNameOfGuards] in	
   
  let varNamesOfStatementsLeft =(*let s'=Trans.trans_statement ~types s in  VarNames.of_statement s' in*)
  	(let ()=VarNamesWithParam.of_var_ref :=  (fun _x -> String.Set.of_list [var_act _x]) in
  	 VarNamesWithParam.of_statement_left s ~types)   in
  	 
  let varInEnsures=String.Set.union_list [varNamesOfStatementsLeft;varNamesOfInv] in	
  let allArrNames=remove_duplicates (List.concat (List.map ~f:getallArrNames ( (Set.to_list varNames)))) in
  
   let allModiArrNames=remove_duplicates (List.concat (List.map ~f:getallArrNames ( (Set.to_list varNamesOfStatementsLeft)))) in
  
  let allModifyConstr=String.concat ~sep:"\n" 
  	(List.map ~f:(fun x->sprintf "modifies %s" x) allModiArrNames) in
  	
  (*let allEnsureConstr="" in *)(*String.concat ~sep:"\n" 
  	(List.map ~f:(fun x->sprintf "ensures top.%s==old(top.%s)" x x) (Set.to_list varNames) ) in	*)
  let allNames=Hashtbl.keys var2SymbNoTab in 
    	
  let containArrName n=
    		  List.find    allNames  (fun x->contains n x) in
    		  	
  let	varNamesOfInv_str=String.concat ~sep:"," (String.Set.to_list varNamesOfInv) in
  let ()=print_endline ("varNamesOfInv_st:"^varNamesOfInv_str) in	
  let varInEnsures_str=String.concat ~sep:"," (String.Set.to_list varInEnsures) in
  let ()=print_endline ("varInEnsures_str:"^varInEnsures_str) in
  	
  let allModifyConstr=allModifyConstr^"\nmodifies top\n" in
  if pds = [] then
    let guard = sprintf "//guard condition\nrequires %s%s;" (gen_spaces ()) (form_act f) in
    let statements = statement_act s in
    let paramStr="(top:TopC)" in
    sprintf "method %s%s\n%s\n%s\n%s{\n%s\n};" name paramStr (reqStr^guard) 
    ((*allEnsureConstr^*)ensureStr) allModifyConstr statements
    
  else begin
    (*spaces := (!spaces) + 2;*)
    let guard = sprintf "//guard condition\nrequires %s%s" (gen_spaces ()) (form_act f) in
    let statements = statement_act s in
    (*spaces := (!spaces) - 2;*)
    (*let sp = gen_spaces () in*)
    let sp="" in
    
    			
    let rec var_acts usedNs usedVarnames ns=
    	match ns with
    		|n::ns'->
    		 begin
    			let ele=containArrName n in
    			match ele with
    			|Some(ele) ->
    				begin
    				(*	let ()=print_endline (sprintf "%scontains %s\n" n ele) in*)
    					let result=Hashtbl.find    var2SymbNoTab ele in
    					match result with
    					|Some(i) ->
    						if not(Int.Set.mem usedNs i) 
    						then begin
    								if (String.Set.mem varInEnsures ele)
    								then (sprintf "requires top.%s.Length ==N%d\nrequires N%d>0\nensures top.%s==old(top.%s)\n" ele i i  ele ele)::
    								(var_acts (Int.Set.union_list [usedNs; Int.Set.of_list [i]])  (String.Set.union_list [usedVarnames;String.Set.of_list [ele]])  ns')
    								else (sprintf "requires top.%s.Length ==N%d\nrequires N%d>0\n ensures top.%s==old(top.%s)\n" ele i i ele ele )::
    								(var_acts (Int.Set.union_list [usedNs; Int.Set.of_list [i]])  (String.Set.union_list [usedVarnames;String.Set.of_list [ele]])  ns')
    								end
    						else if (String.Set.mem usedVarnames ele) 
    						then ""::(var_acts usedNs usedVarnames ns') 		
    						else 
    							begin
    							if (String.Set.mem varInEnsures ele)
    							then     							(sprintf "requires top.%s.Length ==N%d\nensures top.%s==old(top.%s)\n" ele i    ele ele)::
    						    (var_acts usedNs (String.Set.union_list [usedVarnames;String.Set.of_list [ele]]) ns')
    						  else  (sprintf "requires top.%s.Length ==N%d\nensures top.%s==old(top.%s)\n" ele i ele ele  )::
    						    (var_acts usedNs (String.Set.union_list [usedVarnames;String.Set.of_list [ele]]) ns') 
    						  end  
    					|None ->"":: (var_acts usedNs (String.Set.union_list [usedVarnames;String.Set.of_list [ele]]) ns')
    			 end
    			|None ->""::(var_acts usedNs usedVarnames ns')
    		 end
    		 
    		|[]->[]	
    		  in
    		
    let paramConstrOnNs=String.concat ~sep:"\n" (  (var_acts (Int.Set.of_list []) (String.Set.of_list []) ( (Set.to_list varNames)))) in
    let paramdefInRule_act pdf=
   			let (Paramdef(vn, tn)) = pdf in
   			(*let ()=print_endline vn in*)
				let Some(symbOrd)=Hashtbl.find paraNameMapSymbolName_table tn in
				(sprintf "requires 0<= %s<N%d" vn 	symbOrd,
				 sprintf "%s:nat, N%d:nat " vn 	symbOrd
				 )  in
    let pds_str = 
    		String.concat ~sep:", " (List.map ~f:snd (List.map pds ~f:paramdefInRule_act)) in
    let param_constr_str2 = 
    		String.concat ~sep:"\n " (List.map ~f:fst (List.map pds ~f:paramdefInRule_act)) in		
    let rstr =
      sprintf "%smethod %s%s\n%s\n%s\n%s\n%s\n{\n%s\n%s}\n"    sp (name^nameAdd)
      (sprintf "(top:TopC,%s%s)" pds_str (if (extraInvParas="") then extraInvParas else (","^extraInvParas)))
      (sprintf "%s\n%s%s\n%s\n" param_constr_str2 paramConstrOnNs reqStr guard)
      ((*allEnsureConstr^*)ensureStr)  
      allModifyConstr 
       sp statements sp in
       rstr
    (*in
    let pds_str = String.concat ~sep:"; " (List.map pds ~f:paramdef_act) in
    sprintf "ruleset %s do\n%s\nendruleset;" pds_str rstr*)
  end

let prop_act p =
  let Prop(name, pds, f) = p in
  if pds = [] then
    sprintf "invariant \"%s\"\n%s%s;" name (gen_spaces ()) (form_act f)
  else begin
    spaces := (!spaces) + 2;
    let fstr = sprintf "%s%s" (gen_spaces ()) (form_act f) in
    spaces := (!spaces) - 2;
    let pds_str = String.concat ~sep:"; " (List.map pds ~f:paramdef_act) in
    sprintf "ruleset %s do\n%sinvariant \"%s\"\n%s;\nendruleset;" pds_str (gen_spaces ()) name fstr
  end

let init_act init =
  sprintf "startstate\nbegin\n%s\nendstartstate;" (statement_act init)

(*let protocol_act protocol cinvs_with_varnames=
  let {name; types; vardefs; init; rules; properties} = protocol in
  let types_str = String.concat ~sep:"\n" (List.map types ~f:type_act) in
  let types_str=types_str^"type boolean=bool\n" in
  let record_var_str = record_act vardefs in
  let (cinvs, _) = List.unzip cinvs_with_varnames in
  let invs = List.map cinvs ~f:(fun (ConcreteProp(p, _)) -> p) in
   
  let init_str = init_act init in
  let rules_str = String.concat ~sep:"\n\n\n" (List.map rules ~f:(rule_act types "" "")) in
  let props_str = String.concat ~sep:"\n\n\n" (List.map properties ~f:prop_act ) in
  let ()=print_endline (sprintf "%d\n" (Hashtbl.length var2SymbNoTab)) in
  let ()=Hashtbl.iter    var2SymbNoTab ~f:(fun ~key:k ~data:d -> (print_endline (sprintf "(%s,%d)\n" k d)))in
  String.concat ~sep:"\n\n\n" [types_str; record_var_str; init_str; rules_str; predicates_str]*)


