

open Core.Std
open Utils
open Paramecium
open Loach
open Formula
open InvFinder
open Cmdline

let _I = strc "I"
let _T = strc "T"
let _C = strc "C"
let _E = strc "E"
let _True = boolc true
let _False = boolc false

let types = [
  enum "state" [_I; _T; _C; _E];
  enum "client" (int_consts [1; 2;3]);
  enum "boolean" [_True; _False];
]



let vardefs = List.concat [
  [arrdef [("n", [paramdef "i0" "client"])] "state"];
  [arrdef [("x", [])] "boolean"]
]

let init = (parallel [(forStatement (assign (arr [("n", [paramref "i"])]) (const _I)) [paramdef "i" "client"]); (assign (global "x") (const (boolc true)))])


let n_Try =
  let name = "n_Try" in
  let params = [paramdef "i" "client"] in
  let formula = (eqn (var (arr [("n", [paramref "i"])])) (const _I)) in
  let statement = (assign (arr [("n", [paramref "i"])]) (const _T)) in
  rule name params formula statement

let n_Crit =
  let name = "n_Crit" in
  let params = [paramdef "i" "client"] in
  let formula = (andList [(eqn (var (arr [("n", [paramref "i"])])) (const _T)); (eqn (var (global "x")) (const (boolc true)))]) in
  let statement = (parallel [(assign (arr [("n", [paramref "i"])]) (const _C)); (assign (global "x") (const (boolc false)))]) in
  rule name params formula statement

let n_Exit =
  let name = "n_Exit" in
  let params = [paramdef "i" "client"] in
  let formula = (eqn (var (arr [("n", [paramref "i"])])) (const _C)) in
  let statement = (assign (arr [("n", [paramref "i"])]) (const _E)) in
  rule name params formula statement

let n_Idle =
  let name = "n_Idle" in
  let params = [paramdef "i" "client"] in
  let formula = (eqn (var (arr [("n", [paramref "i"])])) (const _E)) in
  let statement = (parallel [(assign (arr [("n", [paramref "i"])]) (const _I)); (assign (global "x") (const (boolc true)))]) in
  rule name params formula statement


let rules = [n_Try; n_Crit; n_Exit; n_Idle]

let n_coherence =
  let name = "n_coherence" in
  let params = [paramdef "i" "client"; paramdef "j" "client"] in
  let formula = (imply (neg (eqn (param (paramref "i")) (param (paramref "j")))) (imply (eqn (var (arr [("n", [paramref "i"])])) (const _C)) (neg (eqn (var (arr [("n", [paramref "j"])])) (const _C))))) in
  prop name params formula

let (f1 )=((imply
 (eqn (var (arr [("n", [paramfix "i" "client" (intc 1)])])) (const _C )) 
 (neg (eqn (var (arr [("n", [paramfix "j" "client" (intc 2)])])) (const _T)))) )
(*let f1=Loach.Trans.form_act f1*)
 
let (f2 )=(imply
 (eqn (var (arr [("n", [paramfix "i" "client" (intc 2)])])) (const _C )) 
 (neg (eqn (var (arr [("n", [paramfix "j" "client" (intc 1)])])) (const _T)))) 
 
let (f3 )=neg ((imply
 (eqn (var (arr [("n", [paramfix "i" "client" (intc 1)])])) (const _C )) 
 (neg (eqn (var (arr [("n", [paramfix "j" "client" (intc 2)])])) (const _T)))) ) 
 
 let f3=eqn (var (global "x")) (const (boolc true)) 
 
let properties = [prop "" [] f1;prop "" []  f2;prop "" []  f3;n_coherence]


let protocol = {
  name = "n_mutualEx";
  types;
  vardefs;
  init;
  rules;
  properties;
}

let prot=Loach.Trans.act protocol

let ({ name;
   types;
   vardefs;
   init;
   rules;
   properties;}:Paramecium.protocol)=prot
  
 

let [p1;p2;p3;f]=properties in 
let Paramecium.Prop( n1, ps1, f11)=p1 in
let Paramecium.Prop( n2, ps2, f21)=p2 in
let Paramecium.Prop( n3, ps3, f31)=p3 in
let _smt_context = Smt.set_context name (ToStr.Smt2.context_of ~insym_types:[] ~types ~vardefs) in  
let (pds,prs,f1')=Generalize.form_act f11 in
let partition_pds=partition pds ~f:(fun (Paramdef(_,tname))-> tname) in
let printL l=
	let ()= printf "length=%d " (List.length l) in
	List.map ~f:(fun (Paramdef(name,tname))->printf "%s-%s ;" name tname) l in
let printLL l=let ()=printf "\npartition LLength=%d\n" (List.length l)  in
		List.map ~f:printL l in
let lll=	 printLL 	partition_pds in
let prefss=Paramecium.cart_product_with_name_partition partition_pds ~types in
let printL l=
	let ()= printf "length=%d " (List.length l) in
	List.map ~f:(fun x->printf "%s" (ToStr.Debug.paramref_act x)) l in
let printLL l=let ()=printf "\n\n allrps LLength=%d\n" (List.length l)  in
		List.map ~f:printL l in
let lll=	 printLL 	prefss in
let  f1= Paramecium.apply_form f11 
[paramfix "i" "client" (intc 11); paramfix "j" "client" (intc 21)] in
let ()=printf "\n f1=%s\n" (ToStr.Debug.form_act f1) in
let  f1= Paramecium.apply_form f1' 
[paramfix "p__Inv0" "client" (intc 11); paramfix "p__Inv1" "client" (intc 21)] in
let ()=printf "%s\n" (ToStr.Debug.form_act f1) in
let result=  symmetry_form f11 f21 in
let ()=printf "%d" result in
let result=  symmetry_form f11 f11 in
let ()=printf "%d" result in
let result=  symmetry_form f11 f31 in
let ()=printf "%d\n\n" result in
printf "subf31=%s" (ToStr.Debug.form_act (Formula.form2AllSymForm ~f:f31 ~types))

let l=[[[1;2;3];[2;3;1];[3;2;1]];[[4;5];[5;4]];[[6;7;8;];[6;8;7;];[8;7;6;]]] in
let l0=Utils.cartesian_product l in
let printL l=
	let ()= printf "length=%d " (List.length l) in
	List.map ~f:(printf "%d;") l in
let printLL l=let ()=printf "\nLLength=%d\n" (List.length l)  in
		List.map ~f:printL l in
let printLLL l=
		let ()=printf "LLLength=%d\n" (List.length l)  in
		List.map ~f:printLL l in
printLLL l0

(*let l=Utils.permutation [1;2;3] in
let pf l=
		let ()=printf "\n" in
		List.map ~f:(printf "%d;") l in
List.map ~f:pf l
Utils.permutation [1;2;3]
[[1;2;3];
[1;3;2];
[2;1;3];
[2;3;1];
[3;1;2];
[3;2;1];
]

let l=Utils.combination [1;2;3] 2 in
let pf l=
		let ()=printf "\n" in
		List.map ~f:(printf "%d;") l in
List.map ~f:pf l

let f1=(imply
 (eqn (var (arr [("n", [paramfix "i" "boolean" (intc 1)])])) (const _True )) 
 (neg (eqn (var (arr [("n", [paramfix "j" "client" (intc 2)])])) (const _T))))
 
let f2=(imply
 (eqn (var (arr [("n", [paramfix "i" "boolean" (intc 2)])])) (const _True )) 
 (neg (eqn (var (arr [("n", [paramfix "j" "client" (intc 1)])])) (const _T)))) 
 
let (pds,prs,f1')=Generalize.form_act f1 in 
let pdsStr=String.concat ~sep:"\n" (List.map ~f:ToStr.Debug.paramdef_act pds) in
let ()=printf "%s\n" pdsStr in 
let prsStr=String.concat ~sep:"\n" (List.map ~f:ToStr.Debug.paramref_act prs) in
let ()=printf "%s\n" prsStr in 
let fs1=List.map (apply_form f1') in

let (pds,prs,f1')=Generalize.form_act f1 in
let ()=printf "%s\n" (ToStr.Debug.form_act f1') in
let f1''=Formula.normalize f1 types in
let ()=printf "%s\n" (ToStr.Debug.form_act f1) in
let ()=printf "%s\n" (ToStr.Debug.form_act f1'') in
let (pds,prs,f2')=Generalize.form_act f2 in
let ()=printf "%s\n" (ToStr.Debug.form_act f2') in
let f2''=Formula.normalize f2 types in
let ()=printf "%s\n" (ToStr.Debug.form_act f2) in
let ()=printf "%s\n" (ToStr.Debug.form_act f2'') in
let Some( f')=Formula.can_imply f1 f2 in
   printf "%s\n" (ToStr.Debug.form_act f')
let () = run_with_cmdline (fun () ->
  let protocol = preprocess_rule_guard ~loach:protocol in
  let cinvs_with_varnames, relations = find protocol
    ~murphi:(In_channel.read_all "n_mutualEx.m")
  in
  Isabelle.protocol_act protocol cinvs_with_varnames relations ()
)*)

