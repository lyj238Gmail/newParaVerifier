(* This program is translated from its corresponding murphi version *)

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
  enum "client" (int_consts [1; 2; 3]);
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

let properties = [n_coherence]


let protocol = {
  name = "n_mutualEx";
  types;
  vardefs;
  init;
  rules;
  properties;
}


open Paramecium

let () = run_with_cmdline (fun () ->
  let protocol = preprocess_rule_guard ~loach:protocol in
  let insym_types = [] in
  let {name; types; vardefs; init; rules; properties} = Loach.Trans.act ~loach:protocol in
  let _smt_context = Smt.set_context name (ToStr.Smt2.context_of ~insym_types ~types ~vardefs) in
  let inits = List.concat (List.map properties ~f:(fun property ->
    let Prop(n, pds, f) = property in
    if List.length pds > 0 then
      let ps = cart_product_with_paramfix pds types in
      List.map ps ~f:(fun p -> simplify ~eli_eqn:true (neg (apply_form f ~p)))
    else begin
      [simplify ~eli_eqn:true (neg f)]
    end
  )) |> List.filter ~f:(fun g -> Formula.is_satisfiable g) in
  let inits = List.fold inits ~init:[] ~f:(fun remained x ->
    match List.exists remained ~f:(fun g -> StateGen.can_imply x g) with
    | true -> remained
    | false -> remained@[x]
  ) in
  let rules = List.concat (List.map rules ~f:(fun r ->
    let Rule(n, pds, f, s) = r in
    if List.length pds > 0 then
      let ps = cart_product_with_paramfix pds types in
      List.map ps ~f:(fun p -> apply_rule r ~p)
    else begin
      [r]
    end
  )) in
  let bad_states = StateGen.bfs inits rules 200 in
  let good_states =
    let rec wrapper s =
      match s with
      | Assign(v, e) -> eqn (var v) e
      | Parallel(sl) -> andList (List.map sl ~f:wrapper)
    in
    FwdStateGen.fwdBfs (simplify (wrapper init)) rules 200
  in
  let vars_str = String.concat ~sep:"\n" (List.map vardefs ~f:(ToStr.Smv.vardef_act ~types)) in
  let bad_states_str = String.concat ~sep:"\n" (List.map bad_states ~f:ToStr.Smv.form_act) in
  let good_states_str = String.concat ~sep:"\n" (List.map good_states ~f:ToStr.Smv.form_act) in
  printf "begindef\n%s\nenddef\nbeginbad\n%s\nendbad\nbegingood\n%s\nendgood\n"
    vars_str bad_states_str good_states_str
)
