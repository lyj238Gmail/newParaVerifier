open Core.Std
open Utils 

let ()=Random.self_init()

let getSome (Some(x))=x

let fldNumTab = Core.Std.Hashtbl.create ~hashable:Core.Std.String.hashable ()

let rec upto n=
	if n=0 then
	    []
	else   (upto (n - 1))@[n - 1]

 

let rec listExCopy xs ys=
	match xs with
	[] -> ys|
	(x::xs') ->
	match List.find ~f:(fun y->y=x) ys with
	None -> listExCopy xs' (ys@[x]) |
	Some(y)->listExCopy xs' ys

let delDuplicate xs=listExCopy xs []

 let transX2List fldNameTbl fieldName =
	let Some(vals)=Hashtbl.find  fldNameTbl fieldName in
	vals



let readLine line fieldNames fldNameTbl=
    
	let containX=Str.string_match (Str.regexp ".*X") line 0 in
   if (not containX) then
	[[line]]
   else  
	let fields=Str.split (Str.regexp ",") line in
	let fieldsS=List.map2_exn fieldNames fields
      ~f:(fun x y-> if y="X" then  
							let vals=(transX2List fldNameTbl x) in
							let el=List.nth vals (Random.int(List.length vals)) in
							let Some(el)=el in	[el]
                     else [y]) in
    cartesian_product fieldsS


let postProcess  fldNames line lineSymb=
	if (List.exists  ~f:(fun x-> x=lineSymb) fldNames ) then
		let Some(symb)=List.nth line (let Some(n)=(Hashtbl.find fldNumTab  lineSymb)	 in n) in
	  	 symb
	else lineSymb

let postProcessLine fldNames line =
	List.map ~f:(postProcess  fldNames line) line 

let line2Str line=String.concat ~sep:"," line

let lines2Str lines=
  String.concat ~sep:"\n" (List.map ~f:line2Str lines)

let readWriteLine line   fldNames fldNameTbl=
	let lines=readLine line fldNames fldNameTbl in
	let lines=List.map ~f:(postProcessLine fldNames) lines in 
	(List.map ~f:line2Str lines)
	

let rec readWriteLines lines  fieldNames fldNameTbl=
   match lines with
   (line::lines') ->
	   (readWriteLine line  fieldNames fldNameTbl@
	   	readWriteLines lines'   fieldNames fldNameTbl)
      | [] ->[]
		
let line2FldNumTbl fldNames=    
	List.fold ~f:(fun () p -> Hashtbl.replace fldNumTab ~key:(fst p) ~data:(snd p))
	 (getSome (List.zip fldNames (upto (List.length fldNames)))) ~init:()
	
	

let csvXTransProc file fldNameTbl =
   let inChan = Core.Std.In_channel.create (file^".csv") in
   let outChan = Core.Std.Out_channel.create (file^"exd.csv") in
   let lines=Core.Std.In_channel.input_lines  inChan in
   let Some(hdLine)=(List.hd lines) in
   let fldNames=Str.split (Str.regexp ",") hdLine in
	let ()=line2FldNumTbl fldNames in
   let Some(tlLines)=(List.tl lines) in
   let outLines=readWriteLines tlLines  fldNames fldNameTbl  in
	let outLines=delDuplicate outLines in 
	let ()=Core.Std.Out_channel.output_lines outChan outLines  in
	let ()= Core.Std.Out_channel.close outChan in
	Core.Std.In_channel.close inChan 

let transCsvWithX file =
	let infoFile=file^".info" in
	Info2Tbl.info2Tbl infoFile ;
	csvXTransProc file (Info2Tbl.get ());
	Info2Tbl.reset()
