type
  CACHE_STATE : enum{I, S, E};
  MSG_CMD : enum{Empty, ReqS, ReqE, Inv, InvAck, GntS, GntE};
  NODE : 1..1;
  AUX_NODE : 1..1;
  ALL_NODE : 1..1;
  DATA : 1..2;



record_0 : record
Data :  DATA;
Cmd :  MSG_CMD;
end;


record_1 : record
Data :  DATA;
State :  CACHE_STATE;
end;


var
AuxData :  DATA;
MemData :  DATA;
CurPtr :  ALL_NODE;
CurCmd :  MSG_CMD;
ExGntd :  boolean;
AInvSet_1 :  boolean;
AShrSet_1 :  boolean;
AChan3_1 :  record_0;
AChan2_1 :  record_0;
AChan1_1 :  record_0;
ACache_1 :  record_1;
InvSet_1 :  boolean;
ShrSet_1 :  boolean;
Chan3_1 :  record_0;
Chan2_1 :  record_0;
Chan1_1 :  record_0;
Cache_1 :  record_1;


startstate
begin
  Chan1_1.Cmd := Empty;
  Chan2_1.Cmd := Empty;
  Chan3_1.Cmd := Empty;
  Chan1_1.Data := 1;
  Chan2_1.Data := 1;
  Chan3_1.Data := 1;
  Cache_1.State := I;
  Cache_1.Data := 1;
  ShrSet_1 := false;
  InvSet_1 := false;
  AChan1_1.Cmd := Empty;
  AChan2_1.Cmd := Empty;
  AChan3_1.Cmd := Empty;
  AChan1_1.Data := 1;
  AChan2_1.Data := 1;
  AChan3_1.Data := 1;
  ACache_1.State := I;
  ACache_1.Data := 1;
  AShrSet_1 := false;
  AInvSet_1 := false;
  CurCmd := Empty;
  ExGntd := false;
  MemData := 1;
  AuxData := 1;
endstartstate;


rule "n_SendReqS_j1"
  ((Cache_1.State = I) & (Chan1_1.Cmd = Empty)) ==>
begin
  Chan1_1.Cmd := ReqS;
endrule;


rule "n_SendReqEI_i1"
  ((Cache_1.State = I) & (Chan1_1.Cmd = Empty)) ==>
begin
  Chan1_1.Cmd := ReqE;
endrule;


rule "n_SendReqES_i1"
  ((Cache_1.State = S) & (Chan1_1.Cmd = Empty)) ==>
begin
  Chan1_1.Cmd := ReqE;
endrule;


rule "n_RecvReq_i1"
  ((CurCmd = Empty) & (!(Chan1_1.Cmd = Empty))) ==>
begin
  CurCmd := Chan1_1.Cmd;
  Chan1_1.Cmd := Empty;
  CurPtr := 1;
  InvSet_1 := ShrSet_1;
  AInvSet_1 := AShrSet_1;
endrule;


rule "n_SendInvE_i1"
  (((CurCmd = ReqE) & (InvSet_1 = true)) & (Chan2_1.Cmd = Empty)) ==>
begin
  Chan2_1.Cmd := Inv;
  InvSet_1 := false;
endrule;


rule "n_SendInvS_i1"
  ((((CurCmd = ReqS) & (ExGntd = true)) & (InvSet_1 = true)) & (Chan2_1.Cmd = Empty)) ==>
begin
  Chan2_1.Cmd := Inv;
  InvSet_1 := false;
endrule;


rule "n_SendInvAck_i1"
  ((Chan2_1.Cmd = Inv) & (Chan3_1.Cmd = Empty)) ==>
begin
  Chan2_1.Cmd := Empty;
  Chan3_1.Cmd := InvAck;
  if (Cache_1.State = E) then
    Chan3_1.Data := Cache_1.Data;
  endif;
  Cache_1.State := I;
endrule;


rule "n_RecvInvAck_i1"
  ((!(CurCmd = Empty)) & (Chan3_1.Cmd = InvAck)) ==>
begin
  ShrSet_1 := false;
  if (ExGntd = true) then
    ExGntd := false;
    MemData := Chan3_1.Data;
  endif;
  Chan3_1.Cmd := Empty;
endrule;


rule "n_SendGntS_i1"
  ((((CurCmd = ReqS) & (CurPtr = 1)) & (ExGntd = false)) & (Chan2_1.Cmd = Empty)) ==>
begin
  ShrSet_1 := true;
  CurCmd := Empty;
  Chan2_1.Cmd := GntS;
  Chan2_1.Data := MemData;
endrule;


rule "n_SendGntE_i1"
  ((((((CurCmd = ReqE) & (CurPtr = 1)) & (ExGntd = false)) &
   (  (ShrSet_1 = false)  )) & (   (AShrSet_1 = false)  )) & (Chan2_1.Cmd = Empty)) ==>
begin
  ShrSet_1 := true;
  CurCmd := Empty;
  ExGntd := true;
  Chan2_1.Cmd := GntE;
  Chan2_1.Data := MemData;
endrule;


rule "n_RecvGntS_i1"
  (Chan2_1.Cmd = GntS) ==>
begin
  Cache_1.State := S;
  Chan2_1.Cmd := Empty;
  Cache_1.Data := Chan2_1.Data;
endrule;


rule "n_RecvGntE_i1"
  (Chan2_1.Cmd = GntE) ==>
begin
  Cache_1.State := E;
  Chan2_1.Cmd := Empty;
  Cache_1.Data := Chan2_1.Data;
endrule;


ruleset d : DATA do
  rule "n_Store_i1"
    (Cache_1.State = E) ==>
  begin
    Cache_1.Data := d;
    AuxData := d;
  endrule;
endruleset;


rule "n_ASendReqIS_j1"
  ((ACache_1.State = I) & (AChan1_1.Cmd = Empty)) ==>
begin
  AChan1_1.Cmd := ReqS;
endrule;


rule "n_ASendReqSE_j1"
  ((ACache_1.State = E) & (AChan1_1.Cmd = Empty)) ==>
begin
  AChan1_1.Cmd := ReqS;
endrule;


rule "n_ASendReqEI_i1"
  ((ACache_1.State = I) & (AChan1_1.Cmd = Empty)) ==>
begin
  AChan1_1.Cmd := ReqE;
endrule;


rule "n_ASendReqES_i1"
  ((ACache_1.State = S) & (AChan1_1.Cmd = Empty)) ==>
begin
  AChan1_1.Cmd := ReqE;
endrule;


rule "n_SendReqEE_i1"
  ((ACache_1.State = E) & (AChan1_1.Cmd = Empty)) ==>
begin
  AChan1_1.Cmd := ReqE;
endrule;


rule "n_ARecvReq_i1"
  ((CurCmd = Empty) & (!(AChan1_1.Cmd = Empty))) ==>
begin
  CurCmd := AChan1_1.Cmd;
  AChan1_1.Cmd := Empty;
  CurPtr := 1;
  InvSet_1 := ShrSet_1;
  AInvSet_1 := AShrSet_1;
endrule;


rule "n_ASendInvE_i1"
  (((CurCmd = ReqE) & (AInvSet_1 = true)) & (AChan2_1.Cmd = Empty)) ==>
begin
  AChan2_1.Cmd := Inv;
  AInvSet_1 := false;
endrule;


rule "n_ASendInvS_i1"
  ((((CurCmd = ReqS) & (ExGntd = true)) & (AInvSet_1 = true)) & (AChan2_1.Cmd = Empty)) ==>
begin
  AChan2_1.Cmd := Inv;
  AInvSet_1 := false;
endrule;


rule "n_ASendInvAck_i1"
  ((AChan2_1.Cmd = Inv) & (AChan3_1.Cmd = Empty)) ==>
begin
  AChan2_1.Cmd := Empty;
  AChan3_1.Cmd := InvAck;
  if (ACache_1.State = E) then
    AChan3_1.Data := ACache_1.Data;
  endif;
  ACache_1.State := I;
endrule;


rule "n_ARecvInvAck_i1"
  ((!(CurCmd = Empty)) & (AChan3_1.Cmd = InvAck)) ==>
begin
  AShrSet_1 := false;
  if (ExGntd = true) then
    ExGntd := false;
    MemData := AChan3_1.Data;
  endif;
  AChan3_1.Cmd := Empty;
endrule;


rule "n_ASendGntS_i1"
  ((((CurCmd = ReqS) & (CurPtr = 1)) & (ExGntd = false)) & (AChan2_1.Cmd = Empty)) ==>
begin
  AShrSet_1 := true;
  CurCmd := Empty;
  AChan2_1.Cmd := GntS;
  AChan2_1.Data := MemData;
endrule;


rule "n_ASendGntE_i1"
  ((((((CurCmd = ReqE) & (CurPtr = 1)) & (ExGntd = false)) & 
  (  (ShrSet_1 = false)  )) & (   (AShrSet_1 = false)  )) &
   (AChan2_1.Cmd = Empty)) ==>
begin
  AShrSet_1 := true;
  CurCmd := Empty;
  ExGntd := true;
  AChan2_1.Cmd := GntE;
  AChan2_1.Data := MemData;
endrule;


rule "n_ARecvGntS_i1"
  (AChan2_1.Cmd = GntS) ==>
begin
  ACache_1.State := S;
  AChan2_1.Cmd := Empty;
  ACache_1.Data := AChan2_1.Data;
endrule;


rule "n_ARecvGntE_i1"
  (AChan2_1.Cmd = GntE) ==>
begin
  ACache_1.State := E;
  AChan2_1.Cmd := Empty;
  ACache_1.Data := AChan2_1.Data;
endrule;


ruleset d : DATA do
  rule "n_AStore_i1"
    (ACache_1.State = E) ==>
  begin
    ACache_1.Data := d;
    AuxData := d;
  endrule;
endruleset;


invariant "n_CntrlProp"
  ((Cache_1.State = E) -> (!(ACache_1.State = E)));


invariant "n_DataProp"
  (((ExGntd = false) -> (MemData = AuxData)) & (  ((!(Cache_1.State = I)) -> (Cache_1.Data = AuxData))  ));


invariant "n_DataProp1"
  (((ExGntd = false) -> (MemData = AuxData)) & (  ((!(ACache_1.State = I)) -> (ACache_1.Data = AuxData))  ));


