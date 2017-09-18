open Core.Std
open Utils
open Paramecium
open Loach
open Formula
open InvFinder
open Cmdline

let _CACHE_I = strc "CACHE_I"
let _CACHE_S = strc "CACHE_S"
let _CACHE_E = strc "CACHE_E"
let _NODE_None = strc "NODE_None"
let _NODE_Get = strc "NODE_Get"
let _NODE_GetX = strc "NODE_GetX"
let _UNI_None = strc "UNI_None"
let _UNI_Get = strc "UNI_Get"
let _UNI_GetX = strc "UNI_GetX"
let _UNI_Put = strc "UNI_Put"
let _UNI_PutX = strc "UNI_PutX"
let _UNI_Nak = strc "UNI_Nak"
let _INV_None = strc "INV_None"
let _INV_Inv = strc "INV_Inv"
let _INV_InvAck = strc "INV_InvAck"
let _RP_None = strc "RP_None"
let _RP_Replace = strc "RP_Replace"
let _WB_None = strc "WB_None"
let _WB_Wb = strc "WB_Wb"
let _SHWB_None = strc "SHWB_None"
let _SHWB_ShWb = strc "SHWB_ShWb"
let _SHWB_FAck = strc "SHWB_FAck"
let _NAKC_None = strc "NAKC_None"
let _NAKC_Nakc = strc "NAKC_Nakc"
let _true = boolc true
let _false = boolc false

let types = [
  enum "NODE" (int_consts [0;1;2;3]);
  enum "DATA" (int_consts [1;2]);
  enum "CACHE_STATE" [_CACHE_I;_CACHE_S;_CACHE_E];
  enum "NODE_CMD" [_NODE_None;_NODE_Get;_NODE_GetX];
  enum "UNI_CMD" [_UNI_None;_UNI_Get;_UNI_GetX;_UNI_Put;_UNI_PutX;_UNI_Nak];
  enum "INV_CMD" [_INV_None;_INV_Inv;_INV_InvAck];
  enum "RP_CMD" [_RP_None;_RP_Replace];
  enum "WB_CMD" [_WB_None;_WB_Wb];
  enum "SHWB_CMD" [_SHWB_None;_SHWB_ShWb;_SHWB_FAck];
  enum "NAKC_CMD" [_NAKC_None;_NAKC_Nakc];
  enum "boolean" [_true; _false];
] 

let _NODE_STATE = List.concat  [
  [arrdef [("ProcCmd",[])] "NODE_CMD"];
  [arrdef [("InvMarked",[])] "boolean"];
  [arrdef [("CacheState",[])] "CACHE_STATE"];
  [arrdef [("CacheData",[])] "DATA"]
]
let _DIR_STATE = List.concat  [
  [arrdef [("Pending",[])] "boolean"];
  [arrdef [("Local",[])] "boolean"];
  [arrdef [("Dirty",[])] "boolean"];
  [arrdef [("HeadVld",[])] "boolean"];
  [arrdef [("HeadPtr",[])] "NODE"];
  [arrdef [("ShrVld",[])] "boolean"];
  [arrdef [("ShrSet", [paramdef "i0" "NODE"])] "boolean"];
  [arrdef [("InvSet", [paramdef "i1" "NODE"])] "boolean"]
]
let _UNI_MSG = List.concat  [
  [arrdef [("Cmd",[])] "UNI_CMD"];
  [arrdef [("Proc",[])] "NODE"];
  [arrdef [("Data",[])] "DATA"]
]
let _INV_MSG = List.concat  [
  [arrdef [("Cmd",[])] "INV_CMD"]
]
let _RP_MSG = List.concat  [
  [arrdef [("Cmd",[])] "RP_CMD"]
]
let _WB_MSG = List.concat  [
  [arrdef [("Cmd",[])] "WB_CMD"];
  [arrdef [("Proc",[])] "NODE"];
  [arrdef [("Data",[])] "DATA"]
]
let _SHWB_MSG = List.concat  [
  [arrdef [("Cmd",[])] "SHWB_CMD"];
  [arrdef [("Proc",[])] "NODE"];
  [arrdef [("Data",[])] "DATA"]
]
let _NAKC_MSG = List.concat  [
  [arrdef [("Cmd",[])] "NAKC_CMD"]
]
let _STATE = List.concat  [
  record_def "Proc" [paramdef "2" "NODE"] _NODE_STATE;
  record_def "Dir" []  _DIR_STATE;
  [arrdef [("MemData",[])] "DATA"];
  record_def "UniMsg" [paramdef "3" "NODE"] _UNI_MSG;
  record_def "InvMsg" [paramdef "4" "NODE"] _INV_MSG;
  record_def "RpMsg" [paramdef "5" "NODE"] _RP_MSG;
  record_def "WbMsg" []  _WB_MSG;
  record_def "ShWbMsg" []  _SHWB_MSG;
  record_def "NakcMsg" []  _NAKC_MSG;
  [arrdef [("CurrData",[])] "DATA"];
  [arrdef [("PrevData",[])] "DATA"];
  [arrdef [("LastWrVld",[])] "boolean"];
  [arrdef [("LastWrPtr",[])] "NODE"];
  [arrdef [("Requester",[])] "NODE"];
  [arrdef [("Collecting",[])] "boolean"];
  [arrdef [("FwdCmd",[])] "UNI_CMD"];
  [arrdef [("FwdSrc",[])] "NODE"];
  [arrdef [("LastInvAck",[])] "NODE"];
  [arrdef [("LastOtherInvAck",[])] "NODE"]
]
let vardefs = List.concat[
  [arrdef [("Home",[])] "NODE"];
  record_def "Sta" []  _STATE;
] 


(*let init=
let params=[paramdef "d" "DATA"; paramdef "i" "NODE"] in
(parallel [(assign (global "Home") (param (paramref "i")) );(assign (record [(global "Sta");  global "MemData"]) (param (paramref "d")) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"]) (param (paramref "i")) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]) (const _false) );(assign (record [(record [(global "Sta");  global "WbMsg"]);  global "Cmd"]) (const _WB_None) );(assign (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Cmd"]) (const _SHWB_None) );(assign (record [(record [(global "Sta");  global "NakcMsg"]);  global "Cmd"]) (const _NAKC_None) );(forStatement (parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "ProcCmd"]) (const _NODE_None) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "InvMarked"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "CacheState"]) (const _CACHE_I) );(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])]) (const _false) );(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "p"])]);  global "Cmd"]) (const _UNI_None) );(assign (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "p"])]);  global "Cmd"]) (const _INV_None) );(assign (record [(arr [((record [(global "Sta");  global "RpMsg"]),[paramref "p"])]);  global "Cmd"]) (const _RP_None) )])[paramdef "p" "NODE"]);(assign (record [(global "Sta");  global "CurrData"]) (param (paramref "d")) );(assign (record [(global "Sta");  global "PrevData"]) (param (paramref "d")) );(assign (record [(global "Sta");  global "LastWrVld"]) (const _false) );(assign (record [(global "Sta");  global "Collecting"]) (const _false) );(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_None) )])*)

let n_NI_Replace=
  let name="NI_Replace" in
  let params=[paramdef "src" "NODE"] in
  let formula=(eqn (var (record [(arr [((record [(global "Sta");  global "RpMsg"]),[paramref "src"])]);  global "Cmd"])) (const _RP_Replace)) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "RpMsg"]),[paramref "src"])]);  global "Cmd"]) (const _RP_None) );(ifStatement (record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"])(parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "src"])]) (const _false) );(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "src"])]) (const _false) )]))]) in
  rule name params formula statement

let n_NI_ShWb=
  let name="NI_ShWb" in
  let params=[] in
  let formula=(eqn (var (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Cmd"])) (const _SHWB_ShWb)) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Cmd"]) (const _SHWB_None) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]) (const _true) );(forStatement (parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])]) (orList [(eqn (param (paramref "p")) (var (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Proc"]))); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])])]) );(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (orList [(eqn (param (paramref "p")) (var (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Proc"]))); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])])]) )])[paramdef "p" "NODE"]);(assign (record [(global "Sta");  global "MemData"]) (var (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Data"])))]) in
  rule name params formula statement

let n_NI_FAck=
  let name="NI_FAck" in
  let params=[] in
  let formula=(eqn (var (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Cmd"])) (const _SHWB_FAck)) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Cmd"]) (const _SHWB_None) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false) );(ifStatement (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"]) (var (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Proc"])))]))]) in
  rule name params formula statement

let n_NI_Wb=
  let name="NI_Wb" in
  let params=[] in
  let formula=(eqn (var (record [(record [(global "Sta");  global "WbMsg"]);  global "Cmd"])) (const _WB_Wb)) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "WbMsg"]);  global "Cmd"]) (const _WB_None) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _false) );(assign (record [(global "Sta");  global "MemData"]) (var (record [(record [(global "Sta");  global "WbMsg"]);  global "Data"])))]) in
  rule name params formula statement

let n_NI_InvAck=
  let name="NI_InvAck" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "src"])]);  global "Cmd"])) (const _INV_InvAck))]); (record [(record [(global "Sta");  global "Dir"]);  global "Pending"])]); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "src"])])]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "src"])]);  global "Cmd"]) (const _INV_None) );(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "src"])]) (const _false) );(ifelseStatement (forallFormula [paramdef "p" "NODE"](andList [(neg (eqn (param (paramref "p")) (param (paramref "src")))); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])])]))(parallel [(assign (record [(global "Sta");  global "LastInvAck"]) (param (paramref "src")) );(forStatement (parallel [(ifStatement (andList [(neg (eqn (param (paramref "p")) (param (paramref "src")))); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])])])(parallel [(assign (record [(global "Sta");  global "LastOtherInvAck"]) (param (paramref "p")) )]))])[paramdef "p" "NODE"])])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false) );(ifStatement (andList [(record [(record [(global "Sta");  global "Dir"]);  global "Local"]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false))])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false) )]));(assign (record [(global "Sta");  global "Collecting"]) (const _false) );(assign (record [(global "Sta");  global "LastInvAck"]) (param (paramref "src")) )]))]) in
  rule name params formula statement

let n_NI_Inv=
  let name="NI_Inv" in
  let params=[paramdef "dst" "NODE"] in
  let formula=(andList [(neg (eqn (param (paramref "dst")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "dst"])]);  global "Cmd"])) (const _INV_Inv))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "dst"])]);  global "Cmd"]) (const _INV_InvAck) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"]) (const _CACHE_I) );(ifStatement (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "ProcCmd"])) (const _NODE_Get))(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "InvMarked"]) (const _true) )]))]) in
  rule name params formula statement

let n_NI_Remote_PutX=
  let name="NI_Remote_PutX" in
  let params=[paramdef "dst" "NODE"] in
  let formula=(andList [(andList [(neg (eqn (param (paramref "dst")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "dst"])]);  global "Cmd"])) (const _UNI_PutX))]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "ProcCmd"])) (const _NODE_GetX))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "dst"])]);  global "Cmd"]) (const _UNI_None) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "ProcCmd"]) (const _NODE_None) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "InvMarked"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"]) (const _CACHE_E) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheData"]) (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "dst"])]);  global "Data"])))]) in
  rule name params formula statement

let n_NI_Local_PutXAcksDone=
  let name="NI_Local_PutXAcksDone" in
  let params=[] in
  let formula=(eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Cmd"])) (const _UNI_PutX)) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Cmd"]) (const _UNI_None) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"]) (const _NODE_None) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "InvMarked"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_E) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"]) (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Data"])))]) in
  rule name params formula statement

let n_NI_Remote_Put=
  let name="NI_Remote_Put" in
  let params=[paramdef "dst" "NODE"] in
  let formula=(andList [(neg (eqn dst (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "dst"])]);  global "Cmd"])) (const _UNI_Put))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "dst"])]);  global "Cmd"]) (const _UNI_None) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "ProcCmd"]) (const _NODE_None) );(ifelseStatement (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "InvMarked"])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "InvMarked"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"]) (const _CACHE_I) )])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"]) (const _CACHE_S) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheData"]) (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "dst"])]);  global "Data"])))]))]) in
  rule name params formula statement

let n_NI_Local_Put=
  let name="NI_Local_Put" in
  let params=[] in
  let formula=(eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Cmd"])) (const _UNI_Put)) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Cmd"]) (const _UNI_None) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _true) );(assign (record [(global "Sta");  global "MemData"]) (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Data"])));(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"]) (const _NODE_None) );(ifelseStatement (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "InvMarked"])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "InvMarked"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) )])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_S) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"]) (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Data"])))]))]) in
  rule name params formula statement

let n_NI_Remote_GetX_PutX=
  let name="NI_Remote_GetX_PutX" in
  let params=[paramdef "dst" "NODE"; paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(neg (eqn src (param (paramref "dst")))); (neg (eqn (param (paramref "dst")) (var (global "Home"))))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_GetX))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (param (paramref "dst")))]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"])) (const _CACHE_E))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"]) (const _CACHE_I) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_PutX) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (param (paramref "dst")) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Data"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheData"])));(ifStatement (neg (eqn (param (paramref "src")) (var (global "Home"))))(parallel [(assign (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Cmd"]) (const _SHWB_FAck) );(assign (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Proc"]) (param (paramref "src")) )]));(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_None) );(assign (record [(global "Sta");  global "FwdSrc"]) (param (paramref "src")) )]) in
  rule name params formula statement

let n_NI_Remote_GetX_Nak=
  let name="NI_Remote_GetX_Nak" in
  let params=[paramdef "dst" "NODE"; paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (param (paramref "dst")))); (neg (eqn (param (paramref "dst")) (var (global "Home"))))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_GetX))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (param (paramref "dst")))]); (neg (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"])) (const _CACHE_E)))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Nak) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (param (paramref "dst")) );(assign (record [(record [(global "Sta");  global "NakcMsg"]);  global "Cmd"]) (const _NAKC_Nakc) );(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_None) );(assign (record [(global "Sta");  global "FwdSrc"]) (param (paramref "src")) )]) in
  rule name params formula statement

let n_NI_Local_GetX_PutX=
  let name="NI_Local_GetX_PutX" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_GetX))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (var (global "Home")))]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false))]); (imply (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (andList [(record [(record [(global "Sta");  global "Dir"]);  global "Local"]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_E))]))]) in
  let statement=(parallel [(ifelseStatement (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"]) src );(assign (record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]) (const _false) );(forStatement (parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])]) (const _false) );(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _false) )])[paramdef "p" "NODE"]);(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_PutX) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")));(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Data"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"])));(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) )])(parallel [(ifelseStatement (imply (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (andList [(eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) src); (forallFormula [paramdef "p" "NODE"](imply (neg (eqn (param (paramref "p")) (param (paramref "src")))) (eqn (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])]) (const _false))))]))(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"]) (param (paramref "src")) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]) (const _false) );(forStatement (parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])]) (const _false) );(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _false) )])[paramdef "p" "NODE"]);(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_PutX) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")));(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Data"]) (var (record [(global "Sta");  global "MemData"])));(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) );(ifStatement (record [(record [(global "Sta");  global "Dir"]);  global "Local"])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) );(ifStatement (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"])) (const _NODE_Get))(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "InvMarked"]) (const _true) )]))]))])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"]) src );(assign (record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]) (const _false) );(forStatement (parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])]) (const _false) );(ifelseStatement (andList [(andList [(neg (eqn (param (paramref "p")) (var (global "Home")))); (neg (eqn (param (paramref "p")) (param (paramref "src"))))]); (orList [(andList [(record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])])]); (andList [(record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]); (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (param (paramref "p")))])])])(parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _true) );(assign (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "p"])]);  global "Cmd"]) (const _INV_Inv) )])(parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "p"])]);  global "Cmd"]) (const _INV_None) )]))])[paramdef "p" "NODE"]);(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_PutX) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")));(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Data"]) (var (record [(global "Sta");  global "MemData"])));(ifStatement (record [(record [(global "Sta");  global "Dir"]);  global "Local"])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) );(ifStatement (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"])) (const _NODE_Get))(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "InvMarked"]) (const _true) )]))]));(assign (record [(global "Sta");  global "Requester"]) src );(assign (record [(global "Sta");  global "Collecting"]) (const _true) );(assign (record [(global "Sta");  global "PrevData"]) (var (record [(global "Sta");  global "CurrData"])));(ifelseStatement (neg (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (param (paramref "src"))))(parallel [(assign (record [(global "Sta");  global "LastOtherInvAck"]) (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])))])(parallel [(forStatement (parallel [(ifStatement (andList [(neg (eqn (param (paramref "p")) (param (paramref "src")))); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])])])(parallel [(assign (record [(global "Sta");  global "LastOtherInvAck"]) (param (paramref "p")) )]))])[paramdef "p" "NODE"])]))]))]))]) in
  rule name params formula statement

let n_NI_Local_GetX_GetX=
  let name="NI_Local_GetX_GetX" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_GetX))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (var (global "Home")))]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false))]); (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"])]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false))]); (neg (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (param (paramref "src"))))]) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _true) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_GetX) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])));(ifStatement (neg (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (var (global "Home"))))(parallel [(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_GetX) )]));(assign (record [(global "Sta");  global "Requester"]) (param (paramref "src")) );(assign (record [(global "Sta");  global "Collecting"]) (const _false) )]) in
  rule name params formula statement

let n_NI_Local_GetX_Nak=
  let name="NI_Local_GetX_Nak" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_GetX))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (var (global "Home")))]); (orList [(orList [(record [(record [(global "Sta");  global "Dir"]);  global "Pending"]); (andList [(andList [(record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]); (record [(record [(global "Sta");  global "Dir"]);  global "Local"])]); (neg (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_E)))])]); (andList [(andList [(record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false))]); (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) src)])])]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Nak) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")))]) in
  rule name params formula statement

let n_NI_Remote_Get_Put=
  let name="NI_Remote_Get_Put" in
  let params=[paramdef "dst" "NODE"; paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (param (paramref "dst")))); (neg (eqn (param (paramref "dst")) (var (global "Home"))))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_Get))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (param (paramref "dst")))]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"])) (const _CACHE_E))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"]) (const _CACHE_S) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Put) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (param (paramref "dst")) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Data"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheData"])));(ifStatement (neg (eqn (param (paramref "src")) (var (global "Home"))))(parallel [(assign (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Cmd"]) (const _SHWB_ShWb) );(assign (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Proc"]) (param (paramref "src")) );(assign (record [(record [(global "Sta");  global "ShWbMsg"]);  global "Data"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheData"])))]));(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_None) );(assign (record [(global "Sta");  global "FwdSrc"]) (param (paramref "src")) )]) in
  rule name params formula statement

let n_NI_Remote_Get_Nak=
  let name="NI_Remote_Get_Nak" in
  let params=[paramdef "dst" "NODE"; paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (param (paramref "dst")))); (neg (eqn (param (paramref "dst")) (var (global "Home"))))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_Get))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (param (paramref "dst")))]); (neg (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"])) (const _CACHE_E)))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Nak) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (param (paramref "dst")) );(assign (record [(record [(global "Sta");  global "NakcMsg"]);  global "Cmd"]) (const _NAKC_Nakc) );(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_None) );(assign (record [(global "Sta");  global "FwdSrc"]) (param (paramref "src")) )]) in
  rule name params formula statement

let n_NI_Local_Get_Put=
  let name="NI_Local_Get_Put" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_Get))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (var (global "Home")))]); (neg (eqn (var (record [(arr [((record [(global "Sta");  global "RpMsg"]),[paramref "src"])]);  global "Cmd"])) (const _RP_Replace)))]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false))]); (imply (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (andList [(record [(record [(global "Sta");  global "Dir"]);  global "Local"]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_E))]))]) in
  let statement=(parallel [(ifelseStatement (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"]) src );(assign (record [(global "Sta");  global "MemData"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"])));(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_S) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Put) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")));(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Data"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"])))])(parallel [(ifelseStatement (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]) (const _true) );(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "src"])]) (const _true) );(forStatement (parallel [(ifelseStatement (orList [(eqn (param (paramref "p")) (param (paramref "src"))); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])])])(parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _true) )])(parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _false) )]))])[paramdef "p" "NODE"])])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"]) (param (paramref "src")) )]));(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Put) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")));(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Data"]) (var (record [(global "Sta");  global "MemData"])))]))]) in
  rule name params formula statement

let n_NI_Local_Get_Get=
  let name="NI_Local_Get_Get" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_Get))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (var (global "Home")))]); (neg (eqn (var (record [(arr [((record [(global "Sta");  global "RpMsg"]),[paramref "src"])]);  global "Cmd"])) (const _RP_Replace)))]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false))]); (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"])]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false))]); (neg (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (param (paramref "src"))))]) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _true) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Get) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])));(ifStatement (neg (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (var (global "Home"))))(parallel [(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_Get) )]));(assign (record [(global "Sta");  global "Requester"]) (param (paramref "src")) );(assign (record [(global "Sta");  global "Collecting"]) (const _false) )]) in
  rule name params formula statement

let n_NI_Local_Get_Nak=
  let name="NI_Local_Get_Nak" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(andList [(andList [(neg (eqn (param (paramref "src")) (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"])) (const _UNI_Get))]); (eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"])) (var (global "Home")))]); (neg (eqn (var (record [(arr [((record [(global "Sta");  global "RpMsg"]),[paramref "src"])]);  global "Cmd"])) (const _RP_Replace)))]); (orList [(orList [(record [(record [(global "Sta");  global "Dir"]);  global "Pending"]); (andList [(andList [(record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]); (record [(record [(global "Sta");  global "Dir"]);  global "Local"])]); (neg (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_E)))])]); (andList [(andList [(record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false))]); (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) src)])])]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Nak) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")))]) in
  rule name params formula statement

let n_NI_Nak_Clear=
  let name="NI_Nak_Clear" in
  let params=[] in
  let formula=(eqn (var (record [(record [(global "Sta");  global "NakcMsg"]);  global "Cmd"])) (const _NAKC_Nakc)) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "NakcMsg"]);  global "Cmd"]) (const _NAKC_None) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false) )]) in
  rule name params formula statement

let n_NI_Nak=
  let name="NI_Nak" in
  let params=[paramdef "dst" "NODE"] in
  let formula=(eqn (var (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "dst"])]);  global "Cmd"])) (const _UNI_Nak)) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "dst"])]);  global "Cmd"]) (const _UNI_None) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "ProcCmd"]) (const _NODE_None) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "InvMarked"]) (const _false) )]) in
  rule name params formula statement

let n_PI_Local_Replace=
  let name="PI_Local_Replace" in
  let params=[] in
  let formula=(andList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"])) (const _NODE_None)); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_S))]) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) )]) in
  rule name params formula statement

let n_PI_Remote_Replace=
  let name="PI_Remote_Replace" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(neg (eqn src (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "ProcCmd"])) (const _NODE_None))]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "CacheState"])) (const _CACHE_S))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "CacheState"]) (const _CACHE_I) );(assign (record [(arr [((record [(global "Sta");  global "RpMsg"]),[paramref "src"])]);  global "Cmd"]) (const _RP_Replace) )]) in
  rule name params formula statement

let n_PI_Local_PutX=
  let name="PI_Local_PutX" in
  let params=[] in
  let formula=(andList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"])) (const _NODE_None)); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_E))]) in
  let statement=(parallel [(ifelseStatement (record [(record [(global "Sta");  global "Dir"]);  global "Pending"])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false) );(assign (record [(global "Sta");  global "MemData"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"])))])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false) );(assign (record [(global "Sta");  global "MemData"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"])))]))]) in
  rule name params formula statement

let n_PI_Remote_PutX=
  let name="PI_Remote_PutX" in
  let params=[paramdef "dst" "NODE"] in
  let formula=(andList [(andList [(neg (eqn dst (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "ProcCmd"])) (const _NODE_None))]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"])) (const _CACHE_E))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheState"]) (const _CACHE_I) );(assign (record [(record [(global "Sta");  global "WbMsg"]);  global "Cmd"]) (const _WB_Wb) );(assign (record [(record [(global "Sta");  global "WbMsg"]);  global "Proc"]) (param (paramref "dst")) );(assign (record [(record [(global "Sta");  global "WbMsg"]);  global "Data"]) (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "dst"])]);  global "CacheData"])))]) in
  rule name params formula statement

let n_PI_Local_GetX_PutX=
  let name="PI_Local_GetX_PutX" in
  let params=[] in
  let formula=(andList [(andList [(andList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"])) (const _NODE_None)); (orList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_I)); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_S))])]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false))]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false))]) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _true) );(ifStatement (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"])(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _true) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]) (const _false) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]) (const _false) );(forStatement (parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])]) (const _false) );(ifelseStatement (andList [(neg (eqn (param (paramref "p")) (var (global "Home")))); (orList [(andList [(record [(record [(global "Sta");  global "Dir"]);  global "ShrVld"]); (arr [((record [(record [(global "Sta");  global "Dir"]);  global "ShrSet"]),[paramref "p"])])]); (andList [(record [(record [(global "Sta");  global "Dir"]);  global "HeadVld"]); (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (param (paramref "p")))])])])(parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _true) );(assign (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "p"])]);  global "Cmd"]) (const _INV_Inv) )])(parallel [(assign (arr [((record [(record [(global "Sta");  global "Dir"]);  global "InvSet"]),[paramref "p"])]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "InvMsg"]),[paramref "p"])]);  global "Cmd"]) (const _INV_None) )]))])[paramdef "p" "NODE"]);(assign (record [(global "Sta");  global "Collecting"]) (const _true) );(assign (record [(global "Sta");  global "PrevData"]) (var (record [(global "Sta");  global "CurrData"])));(assign (record [(global "Sta");  global "LastOtherInvAck"]) (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])))]));(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"]) (const _NODE_None) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "InvMarked"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_E) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"]) (var (record [(global "Sta");  global "MemData"])))]) in
  rule name params formula statement

let n_PI_Local_GetX_GetX=
  let name="PI_Local_GetX_GetX" in
  let params=[] in
  let formula=(andList [(andList [(andList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"])) (const _NODE_None)); (orList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_I)); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_S))])]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false))]); (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"])]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"]) (const _NODE_GetX) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _true) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Cmd"]) (const _UNI_GetX) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Proc"]) (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])));(ifStatement (neg (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (var (global "Home"))))(parallel [(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_GetX) )]));(assign (record [(global "Sta");  global "Requester"]) (var (global "Home")));(assign (record [(global "Sta");  global "Collecting"]) (const _false) )]) in
  rule name params formula statement

let n_PI_Remote_GetX=
  let name="PI_Remote_GetX" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(neg (eqn src (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "ProcCmd"])) (const _NODE_None))]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "CacheState"])) (const _CACHE_I))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "ProcCmd"]) (const _NODE_GetX) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_GetX) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")))]) in
  rule name params formula statement

let n_PI_Local_Get_Put=
  let name="PI_Local_Get_Put" in
  let params=[] in
  let formula=(andList [(andList [(andList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"])) (const _NODE_None)); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_I))]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false))]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false))]) in
  let statement=(parallel [(assign (record [(record [(global "Sta");  global "Dir"]);  global "Local"]) (const _true) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"]) (const _NODE_None) );(ifelseStatement (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "InvMarked"])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "InvMarked"]) (const _false) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_I) )])(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"]) (const _CACHE_S) );(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheData"]) (var (record [(global "Sta");  global "MemData"])))]))]) in
  rule name params formula statement

let n_PI_Local_Get_Get=
  let name="PI_Local_Get_Get" in
  let params=[] in
  let formula=(andList [(andList [(andList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"])) (const _NODE_None)); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "CacheState"])) (const _CACHE_I))]); (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _false))]); (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"])]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "(global "Home")"])]);  global "ProcCmd"]) (const _NODE_Get) );(assign (record [(record [(global "Sta");  global "Dir"]);  global "Pending"]) (const _true) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Cmd"]) (const _UNI_Get) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "(global "Home")"])]);  global "Proc"]) (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])));(ifStatement (neg (eqn (var (record [(record [(global "Sta");  global "Dir"]);  global "HeadPtr"])) (var (global "Home"))))(parallel [(assign (record [(global "Sta");  global "FwdCmd"]) (const _UNI_Get) )]));(assign (record [(global "Sta");  global "Requester"]) (var (global "Home")));(assign (record [(global "Sta");  global "Collecting"]) (const _false) )]) in
  rule name params formula statement

let n_PI_Remote_Get=
  let name="PI_Remote_Get" in
  let params=[paramdef "src" "NODE"] in
  let formula=(andList [(andList [(neg (eqn src (var (global "Home")))); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "ProcCmd"])) (const _NODE_None))]); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "CacheState"])) (const _CACHE_I))]) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "ProcCmd"]) (const _NODE_Get) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Cmd"]) (const _UNI_Get) );(assign (record [(arr [((record [(global "Sta");  global "UniMsg"]),[paramref "src"])]);  global "Proc"]) (var (global "Home")))]) in
  rule name params formula statement

let n_Store=
  let name="Store" in
  let params=[paramdef "data" "DATA"; paramdef "src" "NODE"] in
  let formula=(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "CacheState"])) (const _CACHE_E)) in
  let statement=(parallel [(assign (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "src"])]);  global "CacheData"]) (param (paramref "data")) );(assign (record [(global "Sta");  global "CurrData"]) (param (paramref "data")) );(assign (record [(global "Sta");  global "LastWrVld"]) (const _true) );(assign (record [(global "Sta");  global "LastWrPtr"]) (param (paramref "src")) )]) in
  rule name params formula statement

let rules = [n_NI_Replace; n_NI_ShWb; n_NI_FAck; n_NI_Wb; n_NI_InvAck; n_NI_Inv; n_NI_Remote_PutX; n_NI_Local_PutXAcksDone; n_NI_Remote_Put; n_NI_Local_Put; n_NI_Remote_GetX_PutX; n_NI_Remote_GetX_Nak; n_NI_Local_GetX_PutX; n_NI_Local_GetX_GetX; n_NI_Local_GetX_Nak; n_NI_Remote_Get_Put; n_NI_Remote_Get_Nak; n_NI_Local_Get_Put; n_NI_Local_Get_Get; n_NI_Local_Get_Nak; n_NI_Nak_Clear; n_NI_Nak; n_PI_Local_Replace; n_PI_Remote_Replace; n_PI_Local_PutX; n_PI_Remote_PutX; n_PI_Local_GetX_PutX; n_PI_Local_GetX_GetX; n_PI_Remote_GetX; n_PI_Local_Get_Put; n_PI_Local_Get_Get; n_PI_Remote_Get; n_Store]

let n_MemDataProp=
  let name="MemDataProp" in
  let params=[] in
  let formula=(imply (eqn (record [(record [(global "Sta");  global "Dir"]);  global "Dirty"]) (const _false)) (eqn (var (record [(global "Sta");  global "MemData"])) (var (record [(global "Sta");  global "CurrData"])))) in
  prop name params formula

let n_CacheDataProp=
  let name="CacheDataProp" in
  let params=[] in
  let formula=(forallFormula [paramdef "p" "NODE"](andList [(imply (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "CacheState"])) (const _CACHE_E)) (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "CacheData"])) (var (record [(global "Sta");  global "CurrData"])))); (imply (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "CacheState"])) (const _CACHE_S)) (andList [(imply (record [(global "Sta");  global "Collecting"]) (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "CacheData"])) (var (record [(global "Sta");  global "PrevData"])))); (imply (eqn (record [(global "Sta");  global "Collecting"]) (const _false)) (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "CacheData"])) (var (record [(global "Sta");  global "CurrData"]))))]))])) in
  prop name params formula

let n_CacheStateProp=
  let name="CacheStateProp" in
  let params=[] in
  let formula=(forallFormula [paramdef "p" "NODE"](forallFormula [paramdef "q" "NODE"](imply (neg (eqn (param (paramref "p")) (param (paramref "q")))) (eqn (andList [(eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "p"])]);  global "CacheState"])) (const _CACHE_E)); (eqn (var (record [(arr [((record [(global "Sta");  global "Proc"]),[paramref "q"])]);  global "CacheState"])) (const _CACHE_E))]) (const _false))))) in
  prop name params formula

let properties = [n_MemDataProp; n_CacheDataProp; n_CacheStateProp]

let protocol = {
  name = "n_flash";
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
