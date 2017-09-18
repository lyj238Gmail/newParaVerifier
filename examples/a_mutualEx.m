const clientNUMS : 2;
type state : enum{I, T, C, E};

     client: 1..clientNUMS;

var n_a : array [client] of state;

    x : boolean; 
    
ruleset i : client do
rule "Try" n_a[i] = I ==> begin
      n_a[i] := T;endrule; 

rule "Crit"
      n_a[i] = T& x = true ==>begin
      n_a[i] := C; x := false; endrule;

rule "Exit"
      n_a[i] = C ==>begin
      n_a[i] := E;endrule;
      
 
rule "Idle"
      n_a[i] = E ==> begin n_a[i] := I;
      x := true;endrule;
endruleset;

startstate
begin
 for i: client do
    n_a[i] := I; 
  endfor;
  x := true;
endstartstate;

ruleset i:client; j: client do
invariant "coherence"
  i != j -> (n_a[i] = C -> n_a[j] != C);
endruleset;
