
(* This program is translated from its corresponding murphi version *)

open Core.Std
open Utils
open Paramecium
open Loach
open Formula
open InvFinder
open Cmdline
open CheckInv

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
let _True = boolc true
let _False = boolc false

let types = [
  enum "CACHE_STATE" [_CACHE_I; _CACHE_S; _CACHE_E];
  enum "NODE_CMD" [_NODE_None; _NODE_Get; _NODE_GetX];
  enum "UNI_CMD" [_UNI_None; _UNI_Get; _UNI_GetX; _UNI_Put; _UNI_PutX; _UNI_Nak];
  enum "INV_CMD" [_INV_None; _INV_Inv; _INV_InvAck];
  enum "RP_CMD" [_RP_None; _RP_Replace];
  enum "WB_CMD" [_WB_None; _WB_Wb];
  enum "SHWB_CMD" [_SHWB_None; _SHWB_ShWb; _SHWB_FAck];
  enum "NAKC_CMD" [_NAKC_None; _NAKC_Nakc];
  enum "NODE" (int_consts [0; 1; 2; 3]);
  enum "DATA" (int_consts [1; 2]);
  enum "boolean" [_True; _False];
]

let n_CacheStateProp =
  let name = "n_CacheStateProp" in
  let params = [] in
  let formula = (forallFormula [paramdef "p" "NODE"] (forallFormula [paramdef "q" "NODE"] (imply (neg (eqn (param (paramref "p")) (param (paramref "q")))) (neg (andList [(eqn (var (record [global "Sta"; arr [("Proc", [paramref "p"])]; global "CacheState"])) (const _CACHE_E)); (eqn (var (record [global "Sta"; arr [("Proc", [paramref "q"])]; global "CacheState"])) (const _CACHE_E))]))))) in
  prop name params formula

let n_CacheDataProp =
  let name = "n_CacheDataProp" in
  let params = [] in
  let formula = (forallFormula [paramdef "p" "NODE"] (andList [(imply (eqn (var (record [global "Sta"; arr [("Proc", [paramref "p"])]; global "CacheState"])) (const _CACHE_E)) (eqn (var (record [global "Sta"; arr [("Proc", [paramref "p"])]; global "CacheData"])) (var (record [global "Sta"; global "CurrData"])))); (imply (eqn (var (record [global "Sta"; arr [("Proc", [paramref "p"])]; global "CacheState"])) (const _CACHE_S)) (andList [(imply (eqn (var (record [global "Sta"; global "Collecting"])) (const _True)) (eqn (var (record [global "Sta"; arr [("Proc", [paramref "p"])]; global "CacheData"])) (var (record [global "Sta"; global "PrevData"])))); (imply (eqn (var (record [global "Sta"; global "Collecting"])) (const _False)) (eqn (var (record [global "Sta"; arr [("Proc", [paramref "p"])]; global "CacheData"])) (var (record [global "Sta"; global "CurrData"]))))]))])) in
  prop name params formula

let n_MemDataProp =
  let name = "n_MemDataProp" in
  let params = [] in
  let formula = (imply (eqn (var (record [global "Sta"; global "Dir"; global "Dirty"])) (const _False)) (eqn (var (record [global "Sta"; global "MemData"])) (var (record [global "Sta"; global "CurrData"])))) in
  prop name params formula

let n_test1 =
  let name = "n_test1" in
  let params = [] in
  let formula = (imply (eqn (var (record [global "Sta"; arr [("UniMsg", [paramref "0"])]; global "Cmd"])) (const _UNI_None)) (neg (eqn (var (record [global "Sta"; arr [("UniMsg", [paramref "0"])]; global "Cmd"])) (const _UNI_Put)))) in
  prop name params formula

let n_test2 =
  let name = "n_test2" in
  let params = [] in
  let formula = (imply (eqn (var (record [global "Sta"; arr [("InvMsg", [paramref "1"])]; global "Cmd"])) (const _INV_InvAck)) (eqn (var (record [global "Sta"; global "Dir"; global "Pending"])) (const (boolc true)))) in
  prop name params formula

let n_test3 =
  let name = "n_test3" in
  let params = [] in
  let formula = (imply (neg (eqn (var (record [global "Sta"; global "ShWbMsg"; global "Cmd"])) (const _SHWB_None))) (eqn (var (record [global "Sta"; arr [("InvMsg", [paramref "0"])]; global "Cmd"])) (const _INV_None))) in
  prop name params formula
 
(* let properties = [n_CacheStateProp; n_CacheDataProp; n_MemDataProp; n_test1; n_test2;n_test3] *)

let properties = [  n_test1; n_test2;n_test3] 	
let prog ()=	
	let localhost="192.168.1.37" in
	let a=CheckInv.startServer ~murphi:(In_channel.read_all "flashChou.m")
    ~smv:(In_channel.read_all "flash_nodata.smv") "flashChou.m"  "flash_nodata.smv" 
    "192.168.1.37" "192.168.1.37" in
  (*let a=CheckInv.startServer ~murphi:(In_channel.read_all "n_mutualEx.m")
    ~smv:(In_channel.read_all "mutualEx.smv") "n_mutualEx.m"  "mutualEx.smv" 
    localhost localhost in*)
  let b=CheckInv.checkProps types  properties in
  ()
  
let ()= run_with_cmdline  prog
