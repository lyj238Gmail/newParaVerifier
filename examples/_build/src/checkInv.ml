
open Core.Std
open Utils
open Paramecium
open Loach
open Formula
open InvFinder
open Cmdline

module CheckInv=struct

let check_with_murphi form =
          let form_str = ToStr.Smv.form_act ~lower:false ( form) in
          let res = Murphi.is_inv form_str in
          print_endline (sprintf "Check by mu: %s, %b" form_str res); res

let startServer   ?(smv_escape=(fun inv_str -> inv_str))
    ?(smv="") ?(smv_ord="")   ?(murphi="")  murphiName smvName
    muServer smvServer=      
    
  let _mu_context = Murphi.set_context murphiName murphi in
   
  let _smv_context =
     Smv.set_context ~escape:smv_escape smvName smv ~smv_ord  in
     ()
     
let check types prop=
	let Prop( name, params, inv)=prop in
	let inv=Trans.trans_formula  types inv in
	let b=try Smv.is_inv (ToStr.Smv.form_act ( inv) ) &&  ((not !Cmdline.confirm_with_mu) || check_with_murphi inv) with
          | Client.Smv.Cannot_check -> check_with_murphi inv
          | _ -> raise Utils.Empty_exception    in
  if b 
	then let ()=print_endline ((ToStr.Smv.form_act  inv)^"ok/n") in true
	else let ()=print_endline "failure" in false       
	

let checkProps types props=
	List.filter ~f:(fun x ->  check types x)  props
	
end

