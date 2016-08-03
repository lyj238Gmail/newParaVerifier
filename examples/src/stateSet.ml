open Core.Std
open Utils
open Paramecium
open InvFinder
open ToStr
exception State_env_error

type sign =
  | Positive
  | Negative
with sexp

let oneState=Hashtbl.create ~hashable:Core.Std.String.hashable ()
let states=Hashtbl.create ~hashable:Core.Std.String.hashable ()


let form2State form env=
  match form with
  | Eqn(Var(v), e) -> 
	let ()=Hashtbl.replace env ~key:(ToStr.Smv.var_act v) ~data:(Positive, v, e) in
             env
  | Neg(Eqn(Var(v), e)) -> 
	let ()=Hashtbl.replace env ~key:(ToStr.Smv.var_act v) ~data:(Negative, v, e) in
             env           
  | AndList eqs ->
    begin
      match eqs with
      | [] -> env
      | eq'::eqs' ->  
         let ()= (List.fold eqs ~init:() ~f:(fun remainded eq ->
         	match eq with
          |Eqn(Var(v), e) ->
         	 Hashtbl.replace env ~key:(ToStr.Smv.var_act v) ~data:(Positive,v, e) 
         	 
         	|Neg(Eqn(Var(v), e)) -> 
					 Hashtbl.replace env ~key:(ToStr.Smv.var_act v) ~data:(Negative, v, e)  
					 
    			| _ -> Prt.error (sprintf "Can't find %s in env" (ToStr.Smv.form_act ~lower:false form));
      		 raise State_env_error )) in
      		 env
      		         
    end

let assoc  sign key value l = (sign, key, value) :: l

let mark sign=
	match sign with
	|Positive -> 1
	|Negative-> 0

let hashtbl2assoc_list h = Hashtbl.fold h ~init:[] ~f:(fun ~key ~data res ->
  let (sign, v, e) = data in
  assoc sign v e res
)

let cmp (sign,v,e) (sign',v',e')=
	String.compare (ToStr.Smv.form_act ~lower:false (Eqn(Var(v), e))) (ToStr.Smv.form_act ~lower:false (Eqn(Var(v'), e')))
  
  
let state2Form env =
  andList (List.map (hashtbl2assoc_list env) ~f:(fun (v, e) -> eqn (var v) e))
  
let state2OrderedForm env=  
	andList (List.map (List.sort cmp (hashtbl2assoc_list env)) ~f:(fun (v, e) -> eqn (var v) e))
	
let state2ValStr env fields=
   let strs=List.map fields 
	~f:(fun v -> 
		match Hashtbl.find  env (ToStr.Smv.var_act v) with
		Some((v,e))-> ToStr.Smv.exp_act e
		|None -> "X")   in
 String.concat ~sep:"," strs

let addOneState fields form=
	let formEnv=form2State form oneState in	
	let stateStr=state2ValStr formEnv fields in
	let found=Hashtbl.find states stateStr in
		match found with
			Some(p)->None|
			None ->
			let ()=	Hashtbl.clear oneState in	
			let ()= Hashtbl.replace states ~key:stateStr ~data:(stateStr,form) 	 in
			Some(())
			
let addOneOrderedState   form=
	let formEnv=form2State form oneState in	
	let stateStr=ToStr.Smv.form_act (state2OrderedForm formEnv)  in
	let found=Hashtbl.find states stateStr in
		match found with
			Some(p)->None|
			None ->
			let ()=	Hashtbl.clear oneState in	
			let ()= Hashtbl.replace states ~key:stateStr ~data:(stateStr,form) 	 in
			Some(())			

