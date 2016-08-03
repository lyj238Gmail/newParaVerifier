
open Core.Std
open Utils
open Paramecium
open InvFinder

let env = Hashtbl.create ~hashable:String.hashable ()

(*f is a special formula, which is a conjunction of eqs, e.g.,
v1=c1 & v2=c2 ..., where v1 v2 are values, and c1  c2 are values*)
let form2State form=
  match form with
  | Eqn(Var(v), e) -> Hashtbl.replace env ~key:(ToStr.Smv.var_act v) ~data:(v, e)
  | AndList eqs ->
    begin
      match eqs with
      | [] -> ()
      | eq'::eqs' ->  
         List.fold eqs ~init:() ~f:(fun remainded eq ->
          let  Eqn(Var(v), e) = eq in
          Hashtbl.replace env ~key:(ToStr.Smv.var_act v) ~data:(v, e)
        ) 
    end

let assoc key value l = (key, value) :: l

let hashtbl2assoc_list h = Hashtbl.fold h ~init:[] ~f:(fun ~key ~data res ->
  let (v, e) = data in
  assoc v e res
)
  
let state2Form env =
  andList (List.map (hashtbl2assoc_list env) ~f:(fun (v, e) -> eqn (var v) e))




