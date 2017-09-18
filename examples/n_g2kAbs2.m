const
    NODE_NUM : 2;
    AUX_NODE_NUM: 2;
    DATA_NUM : 2;

type
     NODE : 1..NODE_NUM;
     AUX_NODE : 1..AUX_NODE_NUM;
     ALL_NODE : 1..AUX_NODE_NUM;
     DATA : 1..DATA_NUM;
     
     CACHE_STATE : enum{I, S, E};
     CACHE : record State : CACHE_STATE; Data : DATA; end;
     
     MSG_CMD : enum{Empty, ReqS, ReqE, Inv, InvAck, GntS, GntE};
     MSG : record Cmd : MSG_CMD; Data : DATA; end;

var
    Cache: array [NODE] of CACHE;
    Chan1: array [NODE] of MSG;
    Chan2: array [NODE] of MSG;
    Chan3: array [NODE] of MSG;
    ShrSet: array [NODE] of boolean;
    InvSet: array [NODE] of boolean;
    ACache: array [AUX_NODE] of CACHE;
    AChan1: array [AUX_NODE] of MSG;
    AChan2: array [AUX_NODE] of MSG;
    AChan3: array [AUX_NODE] of MSG;
    AShrSet: array [AUX_NODE] of boolean;
    AInvSet: array [AUX_NODE] of boolean;
    ExGntd: boolean;
    CurCmd: MSG_CMD;
    CurPtr: ALL_NODE;
    MemData: DATA;
    AuxData: DATA;
    

ruleset d: DATA do startstate "Init"
 for i: NODE do
   Chan1[i].Cmd := Empty;
   Chan2[i].Cmd := Empty; 
   Chan3[i].Cmd := Empty;   
   Chan1[i].Data := d;
   Chan2[i].Data := d; 
   Chan3[i].Data := d;   
   Cache[i].State := I;
   Cache[i].Data := d;
   ShrSet[i] := false;
   InvSet[i] := false;
  end;
  for i: AUX_NODE do
   AChan1[i].Cmd := Empty;
   AChan2[i].Cmd := Empty; 
   AChan3[i].Cmd := Empty;   
   AChan1[i].Data := d;
   AChan2[i].Data := d; 
   AChan3[i].Data := d;   
   ACache[i].State := I;
   ACache[i].Data := d;
   AShrSet[i] := false;
   AInvSet[i] := false;
  end;
  CurCmd := Empty;
  ExGntd := false;
  MemData := d;
  AuxData := d;
endstartstate; endruleset;

ruleset j: NODE do
 rule "SendReqS"
      Cache[j].State = I & Chan1[j].Cmd = Empty ==> 
        begin Chan1[j].Cmd := ReqS;
endrule; endruleset;

ruleset i: NODE do
 rule "SendReqEI"
      (Cache[i].State = I) & Chan1[i].Cmd = Empty ==> 
        begin Chan1[i].Cmd := ReqE;
endrule; endruleset;

ruleset i: NODE do
 rule "SendReqES"
      (Cache[i].State = S) & Chan1[i].Cmd = Empty ==> 
        begin Chan1[i].Cmd := ReqE;
endrule; endruleset;

ruleset i: NODE do
 rule "RecvReq"
       CurCmd = Empty & Chan1[i].Cmd != Empty ==>
        begin CurCmd := Chan1[i].Cmd; 
              Chan1[i].Cmd := Empty;
              CurPtr := i;
              for j: NODE do
               InvSet[j] := ShrSet[j];
              endfor;
              for j: AUX_NODE do
               AInvSet[j] := AShrSet[j];
              endfor;
endrule; endruleset;
  
ruleset i: NODE do
 rule "SendInvE"
      (CurCmd = ReqE)
      & InvSet[i] & Chan2[i].Cmd = Empty ==>
       begin
        Chan2[i].Cmd := Inv;
        InvSet[i] := false;
endrule; endruleset;
  
ruleset i: NODE do
 rule "SendInvS"
      (CurCmd = ReqS & ExGntd)
      & InvSet[i] & Chan2[i].Cmd = Empty ==>
       begin
        Chan2[i].Cmd := Inv;
        InvSet[i] := false;
endrule; endruleset;
 
ruleset i: NODE do
 rule "SendInvAck"
      Chan2[i].Cmd = Inv & Chan3[i].Cmd = Empty ==>
      begin
       Chan2[i].Cmd := Empty;
       Chan3[i].Cmd := InvAck;
       if (Cache[i].State = E) then Chan3[i].Data := Cache[i].Data; end;
       Cache[i].State := I;
endrule; endruleset;

ruleset i: NODE do
 rule "RecvInvAck"
      CurCmd != Empty & Chan3[i].Cmd = InvAck ==>
      begin 
       ShrSet[i] := false;
       if (ExGntd = true)
       then ExGntd := false; MemData := Chan3[i].Data; end;
       Chan3[i].Cmd := Empty;
endrule; endruleset;

ruleset i: NODE do
 rule "SendGntS"
      CurCmd = ReqS & CurPtr = i
      & !ExGntd & Chan2[i].Cmd = Empty ==>
      begin
       ShrSet[i] := true;
       CurCmd := Empty;
       Chan2[i].Cmd := GntS;
       Chan2[i].Data := MemData;
endrule; endruleset;

ruleset i: NODE do
 rule "SendGntE"
      CurCmd = ReqE & CurPtr = i & !ExGntd 
      & forall j: NODE do ShrSet[j] = false endforall
      & forall j: AUX_NODE do AShrSet[j] = false endforall
      & Chan2[i].Cmd = Empty ==>
      begin
       ShrSet[i] := true;
       CurCmd := Empty;
       ExGntd := true;
       Chan2[i].Cmd := GntE;
       Chan2[i].Data := MemData;
endrule; endruleset;

ruleset i: NODE do
 rule "RecvGntS"
      Chan2[i].Cmd = GntS ==>
      begin
       Cache[i].State := S;
       Chan2[i].Cmd := Empty;
       Cache[i].Data := Chan2[i].Data;
endrule; endruleset;

ruleset i: NODE do
 rule "RecvGntE"
      Chan2[i].Cmd = GntE ==>
      begin
       Cache[i].State := E;
       Chan2[i].Cmd := Empty;
       Cache[i].Data := Chan2[i].Data;
endrule; endruleset;

ruleset i: NODE; d: DATA do
 rule "Store"
      Cache[i].State = E ==>
      begin
       Cache[i].Data := d;
       AuxData := d;
endrule; endruleset;



ruleset j: AUX_NODE do
 rule "SendReqIS"
      ACache[j].State = I & AChan1[j].Cmd = Empty ==> 
        begin AChan1[j].Cmd := ReqS;
endrule; endruleset;

ruleset j: AUX_NODE do
 rule "SendReqSE"
      ACache[j].State = E & AChan1[j].Cmd = Empty ==> 
        begin AChan1[j].Cmd := ReqS;
endrule; endruleset;

ruleset i: AUX_NODE do
 rule "SendReqEI"
      (ACache[i].State = I) & AChan1[i].Cmd = Empty ==> 
        begin AChan1[i].Cmd := ReqE;
endrule; endruleset;

ruleset i: AUX_NODE do
 rule "SendReqES"
      (ACache[i].State = S) & AChan1[i].Cmd = Empty ==> 
        begin AChan1[i].Cmd := ReqE;
endrule; endruleset;

/*new rule*/
ruleset i: AUX_NODE do
 rule "SendReqEE"
      (ACache[i].State = E) & AChan1[i].Cmd = Empty ==> 
        begin AChan1[i].Cmd := ReqE;
endrule; endruleset;

ruleset i: AUX_NODE do
 rule "RecvReq"
       CurCmd = Empty & AChan1[i].Cmd != Empty ==>
        begin CurCmd := AChan1[i].Cmd; 
              AChan1[i].Cmd := Empty;
              CurPtr := i;
              for j: NODE do
               InvSet[j] := ShrSet[j];
              endfor;
              for j: AUX_NODE do
               AInvSet[j] := AShrSet[j];
              endfor;
endrule; endruleset;
  
ruleset i: AUX_NODE do
 rule "SendInvE"
      (CurCmd = ReqE)
      & AInvSet[i] & AChan2[i].Cmd = Empty ==>
       begin
        AChan2[i].Cmd := Inv;
        AInvSet[i] := false;
endrule; endruleset;
  
ruleset i: AUX_NODE do
 rule "SendInvS"
      (CurCmd = ReqS & ExGntd)
      & AInvSet[i] & AChan2[i].Cmd = Empty ==>
       begin
        AChan2[i].Cmd := Inv;
        AInvSet[i] := false;
endrule; endruleset;
 
ruleset i: AUX_NODE do
 rule "SendInvAck"
      AChan2[i].Cmd = Inv & AChan3[i].Cmd = Empty ==>
      begin
       AChan2[i].Cmd := Empty;
       AChan3[i].Cmd := InvAck;
       if (ACache[i].State = E) then AChan3[i].Data := ACache[i].Data; end;
       ACache[i].State := I;
endrule; endruleset;

ruleset i: AUX_NODE do
 rule "RecvInvAck"
      CurCmd != Empty & AChan3[i].Cmd = InvAck ==>
      begin 
       AShrSet[i] := false;
       if (ExGntd = true)
       then ExGntd := false; MemData := AChan3[i].Data; end;
       AChan3[i].Cmd := Empty;
endrule; endruleset;

ruleset i: AUX_NODE do
 rule "SendGntS"
      CurCmd = ReqS & CurPtr = i
      & !ExGntd & AChan2[i].Cmd = Empty ==>
      begin
       AShrSet[i] := true;
       CurCmd := Empty;
       AChan2[i].Cmd := GntS;
       AChan2[i].Data := MemData;
endrule; endruleset;

ruleset i: AUX_NODE do
 rule "SendGntE"
      CurCmd = ReqE & CurPtr = i & !ExGntd 
      & forall j: AUX_NODE do AShrSet[j] = false endforall
      & forall j: NODE do ShrSet[j] = false endforall
      & AChan2[i].Cmd = Empty ==>
      begin
       AShrSet[i] := true;
       CurCmd := Empty;
       ExGntd := true;
       AChan2[i].Cmd := GntE;
       AChan2[i].Data := MemData;
endrule; endruleset;

ruleset i: AUX_NODE do
 rule "RecvGntS"
      AChan2[i].Cmd = GntS ==>
      begin
       ACache[i].State := S;
       AChan2[i].Cmd := Empty;
       ACache[i].Data := AChan2[i].Data;
endrule; endruleset;

ruleset i: AUX_NODE do
 rule "RecvGntE"
      AChan2[i].Cmd = GntE ==>
      begin
       ACache[i].State := E;
       AChan2[i].Cmd := Empty;
       ACache[i].Data := AChan2[i].Data;
endrule; endruleset;

ruleset i: AUX_NODE; d: DATA do
 rule "Store"
      ACache[i].State = E ==>
      begin
       ACache[i].Data := d;
       AuxData := d;
endrule; endruleset;



invariant "DataProp"
  ( ExGntd = false -> MemData = AuxData ) &
  forall i : NODE do Cache[i].State != I -> Cache[i].Data = AuxData end;
  
invariant "DataProp1"
  ( ExGntd = false -> MemData = AuxData ) &
  forall i : AUX_NODE do ACache[i].State != I -> ACache[i].Data = AuxData end;  
  
ruleset i: NODE; j: AUX_NODE do
invariant "CntrlProp"
      (Cache[i].State = E -> ACache[j].State != E);
endruleset;  

