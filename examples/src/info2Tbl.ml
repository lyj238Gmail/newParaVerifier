open Core.Std
open Utils 


let env = Core.Std.Hashtbl.create ~hashable:Core.Std.String.hashable ()

let readLine inChan tbl=
   let lineOpt=Core.Std.In_channel.input_line  inChan in
	match lineOpt with
    None->true
   |Some(line)->
       printf "%s\n" line ;
  let matchComma=Str.string_match (Str.regexp ".+:") line 0 in
  if  not(matchComma ) then
	false
  else
	let var_Range=Str.split (Str.regexp ":") line in
	let var=Core.Std.List.hd var_Range in
   
   let  Some(var)=var in
   let var=Str.global_replace (Str.regexp "[{} ;]") ""  var in
   let Some(range)=(Core.Std.List.tl var_Range) in
	let Some(range)=Core.Std.List.hd (range ) in
    let range=Str.global_replace (Str.regexp "[{} ;]") ""  range in
    let range=Str.split (Str.regexp ",") range in
    let range=if (List.length range=1) then ["TRUE";"TRUE"] else range in
    let ()=Core.Std.Hashtbl.replace tbl ~key:var ~data:range in
           false

let rec readLines inChan tbl=
   if (readLine inChan tbl) then
      Core.Std.In_channel.close inChan
	else   	readLines inChan tbl
   
		

let info2Tbl file =
   let inChan = Core.Std.In_channel.create file in
  let line=Core.Std.In_channel.input_line  inChan in
       readLines inChan env

 let get ()=env

let reset ()=Core.Std.Hashtbl.clear env
