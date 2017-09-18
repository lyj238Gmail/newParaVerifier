
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
  enum "client" (int_consts [1; 2]);
  enum "client1" (int_consts [1]);
  enum "boolean" [_True; _False];
]



let vardefs = List.concat [
  [arrdef [("n", [paramdef "i0" "client"])] "state"];
  [arrdef [("x", [])] "boolean"]
]

let init = (parallel [(forStatement (assign (arr [("n", [paramref "i"])]) (const _I)) [paramdef "i" "client"]); (assign (global "x") (const (boolc true)))])

let n_Try =
  let name = "n_Try" in
  let params = [] in
  let formula = (eqn (var (arr [("n", [paramref "1"])])) (const _I)) in
  let statement = (assign (arr [("n", [paramref "1"])]) (const _T)) in
  rule name params formula statement

let n_Crit =
  let name = "n_Crit" in
  let params = [] in
  let formula = (andList [(eqn (var (arr [("n", [paramref "1"])])) (const _T)); (eqn (var (global "x")) (const (boolc true)))]) in
  let statement = (parallel [(assign (arr [("n", [paramref "1"])]) (const _C)); (assign (global "x") (const (boolc false)))]) in
  rule name params formula statement

let n_Exit =
  let name = "n_Exit" in
  let params = [] in
  let formula = (eqn (var (arr [("n", [paramref "1"])])) (const _C)) in
  let statement = (assign (arr [("n", [paramref "1"])]) (const _E)) in
  rule name params formula statement

let n_Idle =
  let name = "n_Idle" in
  let params = [] in
  let formula = (eqn (var (arr [("n", [paramref "1"])])) (const _E)) in
  let statement = (parallel [(assign (arr [("n", [paramref "1"])]) (const _I)); (assign (global "x") (const (boolc true)))]) in
  rule name params formula statement

let n_Crit2 =
  let name = "n_Crit2" in
  let params = [] in
  let formula = (andList [(andList [(neg (eqn (var (arr [("n", [paramref "1"])])) (const _C))); (neg (eqn (var (arr [("n", [paramref "1"])])) (const _E)))]); (eqn (var (global "x")) (const (boolc true)))]) in
  let statement = (parallel [(assign (global "x") (const (boolc false))); (assign (arr [("n", [paramref "2"])]) (const _C))]) in
  rule name params formula statement

let n_Exit2 =
  let name = "n_Exit2" in
  let params = [] in
  let formula = (andList [(andList [(neg (eqn (var (arr [("n", [paramref "1"])])) (const _C))); (neg (eqn (var (arr [("n", [paramref "1"])])) (const _E)))]); (eqn (var (global "x")) (const (boolc false)))]) in
  let statement = (assign (arr [("n", [paramref "2"])]) (const _E)) in
  rule name params formula statement

let n_Idle2 =
  let name = "n_Idle2" in
  let params = [] in
  let formula = (andList [(andList [(neg (eqn (var (arr [("n", [paramref "1"])])) (const _C))); (neg (eqn (var (arr [("n", [paramref "1"])])) (const _E)))]); (eqn (var (global "x")) (const (boolc false)))]) in
  let statement = (parallel [(assign (global "x") (const (boolc true))); (assign (arr [("n", [paramref "2"])]) (const _I))]) in
  rule name params formula statement

let rules = [n_Try; n_Crit; n_Exit; n_Idle; n_Crit2; n_Exit2; n_Idle2]

let n_coherence =
  let name = "n_coherence" in
  let params = [] in
  let formula = (imply (eqn (var (arr [("n", [paramref "1"])])) (const _C)) (neg (eqn (var (arr [("n", [paramref "2"])])) (const _C)))) in
  prop name params formula

let properties = [n_coherence]


let protocol = {
  name = "n_mutualExAbs";
  types;
  vardefs;
  init;
  rules;
  properties;
}

let () = run_with_cmdline (fun () ->
  let protocol = preprocess_rule_guard ~loach:protocol in
  let cinvs_with_varnames, relations = find protocol
    ~murphi:(In_channel.read_all "n_mutualExAbs.m")
  in
  Isabelle.protocol_act protocol cinvs_with_varnames relations ()
)

