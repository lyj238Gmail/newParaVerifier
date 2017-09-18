const clientNUMS : 2;
type state : enum{I, T, C, E};

     client: 1..clientNUMS;

var n : array [client] of state;

    x : boolean; 
    
ruleset i : client do

      
rule "fsm" true ==> begin
	      
	if (n[i]= I) then n[i]:=T;
	elsif (n[i]= T) then if x=true then   n[i] := C; x := false;  endif; 
	elsif (n[i]= C) then n[i]:=E;
	else  n[i]:=I; x:=true;
	endif;
	endrule;
	
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
