
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
  enum "NODE" (int_consts [1; 2; 3; 4; 5]);
  enum "DATA" (int_consts [1; 2]);
  enum "boolean" [_True; _False];
]


let check_with_murphi form =
          let form_str = ToStr.Smv.form_act ~lower:false (Paramecium.Neg form) in
          let res = Murphi.is_inv form_str in
          print_endline (sprintf "Check by mu: %s, %b" form_str res); res

let startServer   ?(smv_escape=(fun inv_str -> inv_str))
    ?(smv="") ?(smv_ord="")   ?(murphi="")  murphiName smvName
    muServer smvServer= 
    
  let _mu_context = Murphi.set_context murphiName murphi in
   
  let _smv_context =
     Smv.set_context ~escape:smv_escape smvName smv ~smv_ord  in
     
  let ()=Client.Smv.host := UnixLabels.inet_addr_of_string smvServer in
  
  let ()=Client.Murphi.host := UnixLabels.inet_addr_of_string muServer in   
     
     _smv_context
     
let check types prop=
	let Prop( name, params, inv)=prop in
	let inv=Trans.trans_formula  types inv in
	try Smv.is_inv (ToStr.Smv.form_act inv ) with
          | Client.Smv.Cannot_check -> check_with_murphi inv
          | _ -> raise Utils.Empty_exception     

let checkProps types props=
	List.filter ~f:(fun x ->  check types x)  props
	
let types = [
  enum "CACHE_STATE" [_CACHE_I; _CACHE_S; _CACHE_E];
  enum "NODE_CMD" [_NODE_None; _NODE_Get; _NODE_GetX];
  enum "UNI_CMD" [_UNI_None; _UNI_Get; _UNI_GetX; _UNI_Put; _UNI_PutX; _UNI_Nak];
  enum "INV_CMD" [_INV_None; _INV_Inv; _INV_InvAck];
  enum "RP_CMD" [_RP_None; _RP_Replace];
  enum "WB_CMD" [_WB_None; _WB_Wb];
  enum "SHWB_CMD" [_SHWB_None; _SHWB_ShWb; _SHWB_FAck];
  enum "NAKC_CMD" [_NAKC_None; _NAKC_Nakc];
  enum "NODE" (int_consts [1; 2; 3; 4; 5]);
  enum "DATA" (int_consts [1; 2]);
  enum "boolean" [_True; _False];
]

let n_MemDataProp =
  let name = "n_MemDataProp" in
  let params = [] in
  let formula = (imply (eqn (var (record [global "Sta"; global "Dir"; global "Dirty"])) (const _False)) (eqn (var (record [global "Sta"; global "MemData"])) (var (record [global "Sta"; global "CurrData"])))) in
  prop name params formula

let n_test1 =
  let name = "n_test1" in
  let params = [] in
  let formula = (imply (eqn (var (record [global "Sta"; arr [("Proc", [paramref "1"])]; global "CacheState"])) (const _CACHE_E)) (neg (eqn (var (record [global "Sta"; arr [("Proc", [paramref "2"])]; global "CacheState"])) (const _CACHE_E)))) in
  prop name params formula

let properties = [ n_MemDataProp; n_test1]
	
	
let () =	
  let a=startServer ~murphi:(In_channel.read_all "flashChou.m")
    ~smv:(In_channel.read_all "flash_nodata.smv") "flashChou.m"  "flash_nodata.smv" 
    "192.168.1.37" "192.168.1.37" in
  let b=checkProps types  properties in
  ()
    
