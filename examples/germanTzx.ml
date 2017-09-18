open Core.Std
open Utils
open Paramecium
open Loach
open Formula
open InvFinder
open Cmdline

let _I = strc "I"
let _S = strc "S"
let _E = strc "E"
let _Empty = strc "Empty"
let _ReqS = strc "ReqS"
let _ReqE = strc "ReqE"
let _Inv = strc "Inv"
let _InvAck = strc "InvAck"
let _GntS = strc "GntS"
let _GntE = strc "GntE"
let _true = boolc true
let _false = boolc false

let types = [
  enum "NODE" (int_consts [1;2;3;4;5]);
  enum "DATA" (int_consts [1;2]);
  enum "CACHE_STATE" [_I;_S;_E];
  enum "MSG_CMD" [_Empty;_ReqS;_ReqE;_Inv;_InvAck;_GntS;_GntE];
  enum "boolean" [_true; _false];
] 

let _CACHE = List.concat  [
  [arrdef [("State",[])] "CACHE_STATE"];
  [arrdef [("Data",[])] "DATA"]
]
let _MSG = List.concat  [
  [arrdef [("Cmd",[])] "MSG_CMD"];
  [arrdef [("Data",[])] "DATA"]
]
let vardefs = List.concat[
  record_def "Cache" [paramdef "0" "NODE"] _CACHE;
  record_def "Chan1" [paramdef "1" "NODE"] _MSG;
  record_def "Chan2" [paramdef "2" "NODE"] _MSG;
  record_def "Chan3" [paramdef "3" "NODE"] _MSG;
  [arrdef [("InvSet", [paramdef "i4" "NODE"])] "boolean"];
  [arrdef [("ShrSet", [paramdef "i5" "NODE"])] "boolean"];
  [arrdef [("ExGntd",[])] "boolean"];
  [arrdef [("CurCmd",[])] "MSG_CMD"];
  [arrdef [("CurPtr",[])] "NODE"];
  [arrdef [("MemData",[])] "DATA"];
  [arrdef [("AuxData",[])] "DATA"];
] 


let init=
let params=[paramdef "d" "DATA"] in
(parallel [(forStatement (parallel [(assign (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"]) (const _Empty) );(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"]) (const _Empty) );(assign (record [(arr [("Chan3",[paramref "i"])]);  global "Cmd"]) (const _Empty) );(assign (record [(arr [("Cache",[paramref "i"])]);  global "State"]) (const _I) );(assign (arr [("InvSet",[paramref "i"])]) (const _false) );(assign (arr [("ShrSet",[paramref "i"])]) (const _false) )])[paramdef "i" "NODE"]);(assign (global "ExGntd") (const _false) );(assign (global "CurCmd") (const _Empty) );(assign (global "MemData") (param (paramref "d")) );(assign (global "AuxData") (param (paramref "d")) )])

let n_RecvGntE=
  let name="RecvGntE" in
  let params=[paramdef "i" "NODE"] in
  let formula=(eqn (var (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"])) (const _GntE)) in
  let statement=(parallel [(assign (record [(arr [("Cache",[paramref "i"])]);  global "State"]) (const _E) );(assign (record [(arr [("Cache",[paramref "i"])]);  global "Data"]) (var (record [(arr [("Chan2",[paramref "i"])]);  global "Data"])));(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"]) (const _Empty) )]) in
  rule name params formula statement

let n_RecvGntS=
  let name="RecvGntS" in
  let params=[paramdef "i" "NODE"] in
  let formula=(eqn (var (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"])) (const _GntS)) in
  let statement=(parallel [(assign (record [(arr [("Cache",[paramref "i"])]);  global "State"]) (const _S) );(assign (record [(arr [("Cache",[paramref "i"])]);  global "Data"]) (var (record [(arr [("Chan2",[paramref "i"])]);  global "Data"])));(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"]) (const _Empty) )]) in
  rule name params formula statement

let n_SendGntE=
  let name="SendGntE" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(eqn (var (global "CurCmd")) (const _ReqE)); (eqn (var (global "CurPtr")) (param (paramref "i")))]); (eqn (var (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"])) (const _Empty))]); (eqn (var (global "ExGntd")) (const _false))]); (forallFormula [paramdef "j" "NODE"](eqn (var (arr [("ShrSet",[paramref "j"])])) (const _false)))]) in
  let statement=(parallel [(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"]) (const _GntE) );(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Data"]) (var (global "MemData")));(assign (arr [("ShrSet",[paramref "i"])]) (const _true) );(assign (global "ExGntd") (const _true) );(assign (global "CurCmd") (const _Empty) )]) in
  rule name params formula statement

let n_SendGntS=
  let name="SendGntS" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(andList [(andList [(eqn (var (global "CurCmd")) (const _ReqS)); (eqn (var (global "CurPtr")) (param (paramref "i")))]); (eqn (var (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"])) (const _Empty))]); (eqn (var (global "ExGntd")) (const _false))]) in
  let statement=(parallel [(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"]) (const _GntS) );(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Data"]) (var (global "MemData")));(assign (arr [("ShrSet",[paramref "i"])]) (const _true) );(assign (global "CurCmd") (const _Empty) )]) in
  rule name params formula statement

let n_RecvInvAck=
  let name="RecvInvAck" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(eqn (var (record [(arr [("Chan3",[paramref "i"])]);  global "Cmd"])) (const _InvAck)); (neg (eqn (var (global "CurCmd")) (const _Empty)))]) in
  let statement=(parallel [(assign (record [(arr [("Chan3",[paramref "i"])]);  global "Cmd"]) (const _Empty) );(assign (arr [("ShrSet",[paramref "i"])]) (const _false) );(ifStatement (eqn (var (global "ExGntd")) (const _true))(parallel [(assign (global "ExGntd") (const _false) );(assign (global "MemData") (var (record [(arr [("Chan3",[paramref "i"])]);  global "Data"])))]))]) in
  rule name params formula statement

let n_SendInvAck=
  let name="SendInvAck" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(eqn (var (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"])) (const _Inv)); (eqn (var (record [(arr [("Chan3",[paramref "i"])]);  global "Cmd"])) (const _Empty))]) in
  let statement=(parallel [(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"]) (const _Empty) );(assign (record [(arr [("Chan3",[paramref "i"])]);  global "Cmd"]) (const _InvAck) );(ifStatement (eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "State"])) (const _E))(parallel [(assign (record [(arr [("Chan3",[paramref "i"])]);  global "Data"]) (var (record [(arr [("Cache",[paramref "i"])]);  global "Data"])))]));(assign (record [(arr [("Cache",[paramref "i"])]);  global "State"]) (const _I) )]) in
  rule name params formula statement

let n_SendInv=
  let name="SendInv" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(andList [(eqn (var (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"])) (const _Empty)); (eqn (var (arr [("InvSet",[paramref "i"])])) (const _true))]); (orList [(eqn (var (global "CurCmd")) (const _ReqE)); (andList [(eqn (var (global "CurCmd")) (const _ReqS)); (eqn (var (global "ExGntd")) (const _true))])])]) in
  let statement=(parallel [(assign (record [(arr [("Chan2",[paramref "i"])]);  global "Cmd"]) (const _Inv) );(assign (arr [("InvSet",[paramref "i"])]) (const _false) )]) in
  rule name params formula statement

let n_RecvReqE=
  let name="RecvReqE" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(eqn (var (global "CurCmd")) (const _Empty)); (eqn (var (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"])) (const _ReqE))]) in
  let statement=(parallel [(assign (global "CurCmd") (const _ReqE) );(assign (global "CurPtr") (param (paramref "i")) );(assign (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"]) (const _Empty) );(forStatement (parallel [(assign (arr [("InvSet",[paramref "j"])]) (var (arr [("ShrSet",[paramref "j"])])))])[paramdef "j" "NODE"])]) in
  rule name params formula statement

let n_RecvReqS=
  let name="RecvReqS" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(eqn (var (global "CurCmd")) (const _Empty)); (eqn (var (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"])) (const _ReqS))]) in
  let statement=(parallel [(assign (global "CurCmd") (const _ReqS) );(assign (global "CurPtr") (param (paramref "i")) );(assign (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"]) (const _Empty) );(forStatement (parallel [(assign (arr [("InvSet",[paramref "j"])]) (var (arr [("ShrSet",[paramref "j"])])))])[paramdef "j" "NODE"])]) in
  rule name params formula statement

let n_SendReqE=
  let name="SendReqE" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(eqn (var (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"])) (const _Empty)); (orList [(eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "State"])) (const _I)); (eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "State"])) (const _S))])]) in
  let statement=(parallel [(assign (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"]) (const _ReqE) )]) in
  rule name params formula statement

let n_SendReqS=
  let name="SendReqS" in
  let params=[paramdef "i" "NODE"] in
  let formula=(andList [(eqn (var (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"])) (const _Empty)); (eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "State"])) (const _I))]) in
  let statement=(parallel [(assign (record [(arr [("Chan1",[paramref "i"])]);  global "Cmd"]) (const _ReqS) )]) in
  rule name params formula statement

let n_Store=
  let name="Store" in
  let params=[paramdef "d" "DATA"; paramdef "i" "NODE"] in
  let formula=(eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "State"])) (const _E)) in
  let statement=(parallel [(assign (record [(arr [("Cache",[paramref "i"])]);  global "Data"]) (param (paramref "d")) );(assign (global "AuxData") (param (paramref "d")) )]) in
  rule name params formula statement

let rules = [n_RecvGntE; n_RecvGntS; n_SendGntE; n_SendGntS; n_RecvInvAck; n_SendInvAck; n_SendInv; n_RecvReqE; n_RecvReqS; n_SendReqE; n_SendReqS; n_Store]

let n_DataProp=
  let name="DataProp" in
  let params=[] in
  let formula=(andList [(imply (eqn (var (global "ExGntd")) (const _false)) (eqn (var (global "MemData")) (var (global "AuxData")))); (forallFormula [paramdef "i" "NODE"](imply (neg (eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "State"])) (const _I))) (eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "Data"])) (var (global "AuxData")))))]) in
  prop name params formula

let n_CntrlProp=
  let name="CntrlProp" in
  let params=[paramdef "j" "NODE"; paramdef "i" "NODE"] in
  let formula=(imply (neg (eqn (param (paramref "i")) (param (paramref "j")))) (andList [(imply (eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "State"])) (const _E)) (eqn (var (record [(arr [("Cache",[paramref "j"])]);  global "State"])) (const _I))); (imply (eqn (var (record [(arr [("Cache",[paramref "i"])]);  global "State"])) (const _S)) (orList [(eqn (var (record [(arr [("Cache",[paramref "j"])]);  global "State"])) (const _I)); (eqn (var (record [(arr [("Cache",[paramref "j"])]);  global "State"])) (const _S))]))])) in
  prop name params formula

let properties = [n_DataProp; n_CntrlProp]

let protocol = {
  name = "n_german";
  types;
  vardefs;
  init;
  rules;
  properties;
}

let () = run_with_cmdline (fun () ->
  let protocol = preprocess_rule_guard ~loach:protocol in
  let cinvs_with_varnames, relations = find protocol
  ~murphi:(In_channel.read_all "n_g2k.m") in
  Isabelle.protocol_act protocol cinvs_with_varnames relations ()
)
