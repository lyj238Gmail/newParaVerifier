const clientNUMS : 2;
type state : enum{I, T, C, E};

     client: 1..clientNUMS;
     client1: 1.. 1;

var n : array [client] of state;

    x : boolean; 
    
    
    

rule "Try" n[1] = I ==> begin
      n[1] := T;endrule; 

rule "Crit"
      n[1] = T& x = true ==>begin
      n[1] := C; x := false; endrule;

rule "Exit"
      n[1] = C ==>begin
      n[1] := E;endrule;
      
 
rule "Idle"
      n[1] = E ==> begin n[1] := I;
      x := true;endrule;


 

rule "Crit2"
      n[1] != C & n[1] !=E & x = true ==>begin
        x := false; n[2]:=C; endrule;

rule "Exit2"
      n[1] != C & n[1] !=E & x = false ==>begin
      n[2] := E;endrule; 
 
rule "Idle2"
       n[1] != C & n[1] !=E & x=false==> begin  
      x := true; n[2]:=I; endrule;
      
startstate
begin
 for i: client do
    n[i] := I; 
  endfor;
  x := true;
endstartstate;  


invariant "coherence"
   (n[1] = C -> n[2] != C);
 

invariant "coherence"
  ! (n[1] = C & x = true )
