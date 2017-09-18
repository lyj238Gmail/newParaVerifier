open Core.Std
open Utils
open Paramecium
module CheckInv=sig	
val startServer: 
  ?smv_escape:(string -> string) ->
  ?smv:string -> ?smv_ord:string ->
  ?murphi:string -> 
  string->string->string->string->unit 
  
val checkPos:	Paramecium.typedef list ->prop list-> prop list
end
