const clientNUMS : 2;
type state : enum{I, T, C, E};

     client: 1..clientNUMS;

var n : array [client] of state;

    x : boolean; 
    
ruleset i : client do
/*rule "Try" n[i] = I ==> begin
      n[i] := T;endrule; 

rule "Crit"
      n[i] = T& x = true ==>begin
      n[i] := C; x := false; endrule;

rule "Exit"
      n[i] = C ==>begin
      n[i] := E;endrule;
      
 
rule "Idle"
      n[i] = E ==> begin n[i] := I;
      x := true;endrule;*/
      
rule "fsm" true ==> begin
	switch n[i]      
	case I: n[i]:=T;
	case T: if x=true then   n[i] := C; x := false;  endif; 
	case C: n[i]:=E;
	case E: n[i]:=I; x:=true;
	endswitch
	endrule
	
endruleset;

startstate
begin
 for i: client do
    n[i] := I; 
  endfor;
  x := true;
endstartstate;

ruleset i:client; j: client do
invariant "coherence"
  i != j -> (n[i] = C -> n[j] != C);
endruleset;
