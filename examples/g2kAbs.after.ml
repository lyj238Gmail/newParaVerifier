
(* This program is translated from its corresponding murphi version *)

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
let _True = boolc true
let _False = boolc false

let types = [
  enum "CACHE_STATE" [_I; _S; _E];
  enum "MSG_CMD" [_Empty; _ReqS; _ReqE; _Inv; _InvAck; _GntS; _GntE];
  enum "NODE" (int_consts [1]);
  enum "AUX_NODE" (int_consts [1]);
  enum "ALL_NODE" (int_consts [1]);
  enum "DATA" (int_consts [1; 2]);
  enum "boolean" [_True; _False];
]

let _record_0 = List.concat [
  [arrdef [("Data", [])] "DATA"];
  [arrdef [("Cmd", [])] "MSG_CMD"]
]

let _record_1 = List.concat [
  [arrdef [("Data", [])] "DATA"];
  [arrdef [("State", [])] "CACHE_STATE"]
]

let vardefs = List.concat [
  [arrdef [("AuxData", [])] "DATA"];
  [arrdef [("MemData", [])] "DATA"];
  [arrdef [("CurPtr", [])] "ALL_NODE"];
  [arrdef [("CurCmd", [])] "MSG_CMD"];
  [arrdef [("ExGntd", [])] "boolean"];
  [arrdef [("AInvSet_1", [])] "boolean"];
  [arrdef [("AShrSet_1", [])] "boolean"];
  record_def "AChan3_1" [] _record_0;
  record_def "AChan2_1" [] _record_0;
  record_def "AChan1_1" [] _record_0;
  record_def "ACache_1" [] _record_1;
  [arrdef [("InvSet_1", [])] "boolean"];
  [arrdef [("ShrSet_1", [])] "boolean"];
  record_def "Chan3_1" [] _record_0;
  record_def "Chan2_1" [] _record_0;
  record_def "Chan1_1" [] _record_0;
  record_def "Cache_1" [] _record_1
]

let init = (parallel [(assign (record [global "Chan1_1"; global "Cmd"]) (const _Empty)); (assign (record [global "Chan2_1"; global "Cmd"]) (const _Empty)); (assign (record [global "Chan3_1"; global "Cmd"]) (const _Empty)); (assign (record [global "Chan1_1"; global "Data"]) (const (intc 1))); (assign (record [global "Chan2_1"; global "Data"]) (const (intc 1))); (assign (record [global "Chan3_1"; global "Data"]) (const (intc 1))); (assign (record [global "Cache_1"; global "State"]) (const _I)); (assign (record [global "Cache_1"; global "Data"]) (const (intc 1))); (assign (global "ShrSet_1") (const (boolc false))); (assign (global "InvSet_1") (const (boolc false))); (assign (record [global "AChan1_1"; global "Cmd"]) (const _Empty)); (assign (record [global "AChan2_1"; global "Cmd"]) (const _Empty)); (assign (record [global "AChan3_1"; global "Cmd"]) (const _Empty)); (assign (record [global "AChan1_1"; global "Data"]) (const (intc 1))); (assign (record [global "AChan2_1"; global "Data"]) (const (intc 1))); (assign (record [global "AChan3_1"; global "Data"]) (const (intc 1))); (assign (record [global "ACache_1"; global "State"]) (const _I)); (assign (record [global "ACache_1"; global "Data"]) (const (intc 1))); (assign (global "AShrSet_1") (const (boolc false))); (assign (global "AInvSet_1") (const (boolc false))); (assign (global "CurCmd") (const _Empty)); (assign (global "ExGntd") (const (boolc false))); (assign (global "MemData") (const (intc 1))); (assign (global "AuxData") (const (intc 1)))])

let n_n_Store_i1 =
  let name = "n_n_Store_i1" in
  let params = [paramdef "d" "DATA"] in
  let formula = (eqn (var (record [global "Cache_1"; global "State"])) (const _E)) in
  let statement = (parallel [(assign (record [global "Cache_1"; global "Data"]) (param (paramref "d"))); (assign (global "AuxData") (param (paramref "d")))]) in
  rule name params formula statement

let n_n_AStore_i1 =
  let name = "n_n_AStore_i1" in
  let params = [paramdef "d" "DATA"] in
  let formula = (eqn (var (record [global "ACache_1"; global "State"])) (const _E)) in
  let statement = (parallel [(assign (record [global "ACache_1"; global "Data"]) (param (paramref "d"))); (assign (global "AuxData") (param (paramref "d")))]) in
  rule name params formula statement

let n_n_SendReqS_j1 =
  let name = "n_n_SendReqS_j1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "Cache_1"; global "State"])) (const _I)); (eqn (var (record [global "Chan1_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (assign (record [global "Chan1_1"; global "Cmd"]) (const _ReqS)) in
  rule name params formula statement

let n_n_SendReqEI_i1 =
  let name = "n_n_SendReqEI_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "Cache_1"; global "State"])) (const _I)); (eqn (var (record [global "Chan1_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (assign (record [global "Chan1_1"; global "Cmd"]) (const _ReqE)) in
  rule name params formula statement

let n_n_SendReqES_i1 =
  let name = "n_n_SendReqES_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "Cache_1"; global "State"])) (const _S)); (eqn (var (record [global "Chan1_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (assign (record [global "Chan1_1"; global "Cmd"]) (const _ReqE)) in
  rule name params formula statement

let n_n_RecvReq_i1 =
  let name = "n_n_RecvReq_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (global "CurCmd")) (const _Empty)); (neg (eqn (var (record [global "Chan1_1"; global "Cmd"])) (const _Empty)))]) in
  let statement = (parallel [(assign (global "CurCmd") (var (record [global "Chan1_1"; global "Cmd"]))); (assign (record [global "Chan1_1"; global "Cmd"]) (const _Empty)); (assign (global "CurPtr") (const (intc 1))); (assign (global "InvSet_1") (var (global "ShrSet_1"))); (assign (global "AInvSet_1") (var (global "AShrSet_1")))]) in
  rule name params formula statement

let n_n_SendInvE_i1 =
  let name = "n_n_SendInvE_i1" in
  let params = [] in
  let formula = (andList [(andList [(eqn (var (global "CurCmd")) (const _ReqE)); (eqn (var (global "InvSet_1")) (const (boolc true)))]); (eqn (var (record [global "Chan2_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (record [global "Chan2_1"; global "Cmd"]) (const _Inv)); (assign (global "InvSet_1") (const (boolc false)))]) in
  rule name params formula statement

let n_n_SendInvS_i1 =
  let name = "n_n_SendInvS_i1" in
  let params = [] in
  let formula = (andList [(andList [(andList [(eqn (var (global "CurCmd")) (const _ReqS)); (eqn (var (global "ExGntd")) (const (boolc true)))]); (eqn (var (global "InvSet_1")) (const (boolc true)))]); (eqn (var (record [global "Chan2_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (record [global "Chan2_1"; global "Cmd"]) (const _Inv)); (assign (global "InvSet_1") (const (boolc false)))]) in
  rule name params formula statement

let n_n_SendInvAck_i1 =
  let name = "n_n_SendInvAck_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "Chan2_1"; global "Cmd"])) (const _Inv)); (eqn (var (record [global "Chan3_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (record [global "Chan2_1"; global "Cmd"]) (const _Empty)); (assign (record [global "Chan3_1"; global "Cmd"]) (const _InvAck)); (ifStatement (eqn (var (record [global "Cache_1"; global "State"])) (const _E)) (assign (record [global "Chan3_1"; global "Data"]) (var (record [global "Cache_1"; global "Data"])))); (assign (record [global "Cache_1"; global "State"]) (const _I))]) in
  rule name params formula statement

let n_n_RecvInvAck_i1 =
  let name = "n_n_RecvInvAck_i1" in
  let params = [] in
  let formula = (andList [(neg (eqn (var (global "CurCmd")) (const _Empty))); (eqn (var (record [global "Chan3_1"; global "Cmd"])) (const _InvAck))]) in
  let statement = (parallel [(assign (global "ShrSet_1") (const (boolc false))); (ifStatement (eqn (var (global "ExGntd")) (const (boolc true))) (parallel [(assign (global "ExGntd") (const (boolc false))); (assign (global "MemData") (var (record [global "Chan3_1"; global "Data"])))])); (assign (record [global "Chan3_1"; global "Cmd"]) (const _Empty))]) in
  rule name params formula statement

let n_n_SendGntS_i1 =
  let name = "n_n_SendGntS_i1" in
  let params = [] in
  let formula = (andList [(andList [(andList [(eqn (var (global "CurCmd")) (const _ReqS)); (eqn (var (global "CurPtr")) (const (intc 1)))]); (eqn (var (global "ExGntd")) (const (boolc false)))]); (eqn (var (record [global "Chan2_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (global "ShrSet_1") (const (boolc true))); (assign (global "CurCmd") (const _Empty)); (assign (record [global "Chan2_1"; global "Cmd"]) (const _GntS)); (assign (record [global "Chan2_1"; global "Data"]) (var (global "MemData")))]) in
  rule name params formula statement

let n_n_SendGntE_i1 =
  let name = "n_n_SendGntE_i1" in
  let params = [] in
  let formula = (andList [(andList [(andList [(andList [(andList [(eqn (var (global "CurCmd")) (const _ReqE)); (eqn (var (global "CurPtr")) (const (intc 1)))]); (eqn (var (global "ExGntd")) (const (boolc false)))]); (forallFormula [paramdef "j" "NODE"] (eqn (var (arr [("ShrSet", [paramref "j"])])) (const (boolc false))))]); (forallFormula [paramdef "j" "AUX_NODE"] (eqn (var (arr [("AShrSet", [paramref "j"])])) (const (boolc false))))]); (eqn (var (record [global "Chan2_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (global "ShrSet_1") (const (boolc true))); (assign (global "CurCmd") (const _Empty)); (assign (global "ExGntd") (const (boolc true))); (assign (record [global "Chan2_1"; global "Cmd"]) (const _GntE)); (assign (record [global "Chan2_1"; global "Data"]) (var (global "MemData")))]) in
  rule name params formula statement

let n_n_RecvGntS_i1 =
  let name = "n_n_RecvGntS_i1" in
  let params = [] in
  let formula = (eqn (var (record [global "Chan2_1"; global "Cmd"])) (const _GntS)) in
  let statement = (parallel [(assign (record [global "Cache_1"; global "State"]) (const _S)); (assign (record [global "Chan2_1"; global "Cmd"]) (const _Empty)); (assign (record [global "Cache_1"; global "Data"]) (var (record [global "Chan2_1"; global "Data"])))]) in
  rule name params formula statement

let n_n_RecvGntE_i1 =
  let name = "n_n_RecvGntE_i1" in
  let params = [] in
  let formula = (eqn (var (record [global "Chan2_1"; global "Cmd"])) (const _GntE)) in
  let statement = (parallel [(assign (record [global "Cache_1"; global "State"]) (const _E)); (assign (record [global "Chan2_1"; global "Cmd"]) (const _Empty)); (assign (record [global "Cache_1"; global "Data"]) (var (record [global "Chan2_1"; global "Data"])))]) in
  rule name params formula statement

let n_n_ASendReqIS_j1 =
  let name = "n_n_ASendReqIS_j1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "ACache_1"; global "State"])) (const _I)); (eqn (var (record [global "AChan1_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (assign (record [global "AChan1_1"; global "Cmd"]) (const _ReqS)) in
  rule name params formula statement

let n_n_ASendReqSE_j1 =
  let name = "n_n_ASendReqSE_j1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "ACache_1"; global "State"])) (const _E)); (eqn (var (record [global "AChan1_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (assign (record [global "AChan1_1"; global "Cmd"]) (const _ReqS)) in
  rule name params formula statement

let n_n_ASendReqEI_i1 =
  let name = "n_n_ASendReqEI_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "ACache_1"; global "State"])) (const _I)); (eqn (var (record [global "AChan1_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (assign (record [global "AChan1_1"; global "Cmd"]) (const _ReqE)) in
  rule name params formula statement

let n_n_ASendReqES_i1 =
  let name = "n_n_ASendReqES_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "ACache_1"; global "State"])) (const _S)); (eqn (var (record [global "AChan1_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (assign (record [global "AChan1_1"; global "Cmd"]) (const _ReqE)) in
  rule name params formula statement

let n_n_SendReqEE_i1 =
  let name = "n_n_SendReqEE_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "ACache_1"; global "State"])) (const _E)); (eqn (var (record [global "AChan1_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (assign (record [global "AChan1_1"; global "Cmd"]) (const _ReqE)) in
  rule name params formula statement

let n_n_ARecvReq_i1 =
  let name = "n_n_ARecvReq_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (global "CurCmd")) (const _Empty)); (neg (eqn (var (record [global "AChan1_1"; global "Cmd"])) (const _Empty)))]) in
  let statement = (parallel [(assign (global "CurCmd") (var (record [global "AChan1_1"; global "Cmd"]))); (assign (record [global "AChan1_1"; global "Cmd"]) (const _Empty)); (assign (global "CurPtr") (const (intc 1))); (assign (global "InvSet_1") (var (global "ShrSet_1"))); (assign (global "AInvSet_1") (var (global "AShrSet_1")))]) in
  rule name params formula statement

let n_n_ASendInvE_i1 =
  let name = "n_n_ASendInvE_i1" in
  let params = [] in
  let formula = (andList [(andList [(eqn (var (global "CurCmd")) (const _ReqE)); (eqn (var (global "AInvSet_1")) (const (boolc true)))]); (eqn (var (record [global "AChan2_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (record [global "AChan2_1"; global "Cmd"]) (const _Inv)); (assign (global "AInvSet_1") (const (boolc false)))]) in
  rule name params formula statement

let n_n_ASendInvS_i1 =
  let name = "n_n_ASendInvS_i1" in
  let params = [] in
  let formula = (andList [(andList [(andList [(eqn (var (global "CurCmd")) (const _ReqS)); (eqn (var (global "ExGntd")) (const (boolc true)))]); (eqn (var (global "AInvSet_1")) (const (boolc true)))]); (eqn (var (record [global "AChan2_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (record [global "AChan2_1"; global "Cmd"]) (const _Inv)); (assign (global "AInvSet_1") (const (boolc false)))]) in
  rule name params formula statement

let n_n_ASendInvAck_i1 =
  let name = "n_n_ASendInvAck_i1" in
  let params = [] in
  let formula = (andList [(eqn (var (record [global "AChan2_1"; global "Cmd"])) (const _Inv)); (eqn (var (record [global "AChan3_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (record [global "AChan2_1"; global "Cmd"]) (const _Empty)); (assign (record [global "AChan3_1"; global "Cmd"]) (const _InvAck)); (ifStatement (eqn (var (record [global "ACache_1"; global "State"])) (const _E)) (assign (record [global "AChan3_1"; global "Data"]) (var (record [global "ACache_1"; global "Data"])))); (assign (record [global "ACache_1"; global "State"]) (const _I))]) in
  rule name params formula statement

let n_n_ARecvInvAck_i1 =
  let name = "n_n_ARecvInvAck_i1" in
  let params = [] in
  let formula = (andList [(neg (eqn (var (global "CurCmd")) (const _Empty))); (eqn (var (record [global "AChan3_1"; global "Cmd"])) (const _InvAck))]) in
  let statement = (parallel [(assign (global "AShrSet_1") (const (boolc false))); (ifStatement (eqn (var (global "ExGntd")) (const (boolc true))) (parallel [(assign (global "ExGntd") (const (boolc false))); (assign (global "MemData") (var (record [global "AChan3_1"; global "Data"])))])); (assign (record [global "AChan3_1"; global "Cmd"]) (const _Empty))]) in
  rule name params formula statement

let n_n_ASendGntS_i1 =
  let name = "n_n_ASendGntS_i1" in
  let params = [] in
  let formula = (andList [(andList [(andList [(eqn (var (global "CurCmd")) (const _ReqS)); (eqn (var (global "CurPtr")) (const (intc 1)))]); (eqn (var (global "ExGntd")) (const (boolc false)))]); (eqn (var (record [global "AChan2_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (global "AShrSet_1") (const (boolc true))); (assign (global "CurCmd") (const _Empty)); (assign (record [global "AChan2_1"; global "Cmd"]) (const _GntS)); (assign (record [global "AChan2_1"; global "Data"]) (var (global "MemData")))]) in
  rule name params formula statement

let n_n_ASendGntE_i1 =
  let name = "n_n_ASendGntE_i1" in
  let params = [] in
  let formula = (andList [(andList [(andList [(andList [(andList [(eqn (var (global "CurCmd")) (const _ReqE)); (eqn (var (global "CurPtr")) (const (intc 1)))]); (eqn (var (global "ExGntd")) (const (boolc false)))]); (forallFormula [paramdef "j" "AUX_NODE"] (eqn (var (arr [("AShrSet", [paramref "j"])])) (const (boolc false))))]); (forallFormula [paramdef "j" "NODE"] (eqn (var (arr [("ShrSet", [paramref "j"])])) (const (boolc false))))]); (eqn (var (record [global "AChan2_1"; global "Cmd"])) (const _Empty))]) in
  let statement = (parallel [(assign (global "AShrSet_1") (const (boolc true))); (assign (global "CurCmd") (const _Empty)); (assign (global "ExGntd") (const (boolc true))); (assign (record [global "AChan2_1"; global "Cmd"]) (const _GntE)); (assign (record [global "AChan2_1"; global "Data"]) (var (global "MemData")))]) in
  rule name params formula statement

let n_n_ARecvGntS_i1 =
  let name = "n_n_ARecvGntS_i1" in
  let params = [] in
  let formula = (eqn (var (record [global "AChan2_1"; global "Cmd"])) (const _GntS)) in
  let statement = (parallel [(assign (record [global "ACache_1"; global "State"]) (const _S)); (assign (record [global "AChan2_1"; global "Cmd"]) (const _Empty)); (assign (record [global "ACache_1"; global "Data"]) (var (record [global "AChan2_1"; global "Data"])))]) in
  rule name params formula statement

let n_n_ARecvGntE_i1 =
  let name = "n_n_ARecvGntE_i1" in
  let params = [] in
  let formula = (eqn (var (record [global "AChan2_1"; global "Cmd"])) (const _GntE)) in
  let statement = (parallel [(assign (record [global "ACache_1"; global "State"]) (const _E)); (assign (record [global "AChan2_1"; global "Cmd"]) (const _Empty)); (assign (record [global "ACache_1"; global "Data"]) (var (record [global "AChan2_1"; global "Data"])))]) in
  rule name params formula statement

let rules = [n_n_Store_i1; n_n_AStore_i1; n_n_SendReqS_j1; n_n_SendReqEI_i1; n_n_SendReqES_i1; n_n_RecvReq_i1; n_n_SendInvE_i1; n_n_SendInvS_i1; n_n_SendInvAck_i1; n_n_RecvInvAck_i1; n_n_SendGntS_i1; n_n_SendGntE_i1; n_n_RecvGntS_i1; n_n_RecvGntE_i1; n_n_ASendReqIS_j1; n_n_ASendReqSE_j1; n_n_ASendReqEI_i1; n_n_ASendReqES_i1; n_n_SendReqEE_i1; n_n_ARecvReq_i1; n_n_ASendInvE_i1; n_n_ASendInvS_i1; n_n_ASendInvAck_i1; n_n_ARecvInvAck_i1; n_n_ASendGntS_i1; n_n_ASendGntE_i1; n_n_ARecvGntS_i1; n_n_ARecvGntE_i1]

let n_n_CntrlProp =
  let name = "n_n_CntrlProp" in
  let params = [] in
  let formula = (imply (eqn (var (record [global "Cache_1"; global "State"])) (const _E)) (neg (eqn (var (record [global "ACache_1"; global "State"])) (const _E)))) in
  prop name params formula

let n_n_DataProp =
  let name = "n_n_DataProp" in
  let params = [] in
  let formula = (andList [(imply (eqn (var (global "ExGntd")) (const (boolc false))) (eqn (var (global "MemData")) (var (global "AuxData")))); (forallFormula [paramdef "i" "NODE"] (imply (neg (eqn (var (record [global "Cache_1"; global "State"])) (const _I))) (eqn (var (record [global "Cache_1"; global "Data"])) (var (global "AuxData")))))]) in
  prop name params formula

let n_n_DataProp1 =
  let name = "n_n_DataProp1" in
  let params = [] in
  let formula = (andList [(imply (eqn (var (global "ExGntd")) (const (boolc false))) (eqn (var (global "MemData")) (var (global "AuxData")))); (forallFormula [paramdef "i" "AUX_NODE"] (imply (neg (eqn (var (record [global "ACache_1"; global "State"])) (const _I))) (eqn (var (record [global "ACache_1"; global "Data"])) (var (global "AuxData")))))]) in
  prop name params formula

let properties = [n_n_CntrlProp; n_n_DataProp; n_n_DataProp1]


let protocol = {
  name = "n_g2kAbs_after";
  types;
  vardefs;
  init;
  rules;
  properties;
}

let () = run_with_cmdline (fun () ->
  let protocol = preprocess_rule_guard ~loach:protocol in
  let cinvs_with_varnames, relations = find protocol
    ~murphi:(In_channel.read_all "n_g2kAbs_after.m")
  in
  Isabelle.protocol_act protocol cinvs_with_varnames relations ()
)

