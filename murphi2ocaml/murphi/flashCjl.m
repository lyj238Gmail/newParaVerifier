
const

  NODE_NUM : 3;
  DATA_NUM : 2;

type

  NODE : scalarset(NODE_NUM);
  DATA : scalarset(DATA_NUM);

  CACHE_STATE : enum {CACHE_I, CACHE_S, CACHE_E};

  NODE_CMD : enum {NODE_None, NODE_Get, NODE_GetX};

  NODE_STATE : record
    ProcCmd : NODE_CMD;
    InvMarked : boolean;
    CacheState : CACHE_STATE;
    CacheData : DATA;
  end;

  DIR_STATE : record
    Pending : boolean;
    Local : boolean;
    Dirty : boolean;
    HeadVld : boolean;
    HeadPtr : NODE;
    ShrVld : boolean;
    ShrSet : array [NODE] of boolean;
    InvSet : array [NODE] of boolean;
  end;

  UNI_CMD : enum {UNI_None, UNI_Get, UNI_GetX, UNI_Put, UNI_PutX, UNI_Nak};

  UNI_MSG : record
    Cmd : UNI_CMD;
    Proc : NODE;
    Data : DATA;
  end;

  INV_CMD : enum {INV_None, INV_Inv, INV_InvAck};

  INV_MSG : record
    Cmd : INV_CMD;
  end;

  RP_CMD : enum {RP_None, RP_Replace};

  RP_MSG : record
    Cmd : RP_CMD;
  end;

  WB_CMD : enum {WB_None, WB_Wb};

  WB_MSG : record
    Cmd : WB_CMD;
    Proc : NODE;
    Data : DATA;
  end;

  SHWB_CMD : enum {SHWB_None, SHWB_ShWb, SHWB_FAck};

  SHWB_MSG : record
    Cmd : SHWB_CMD;
    Proc : NODE;
    Data : DATA;
  end;

  NAKC_CMD : enum {NAKC_None, NAKC_Nakc};

  NAKC_MSG : record
    Cmd : NAKC_CMD;
  end;

  STATE : record
  -- Program variables:
    Proc : array [NODE] of NODE_STATE;
    Dir : DIR_STATE;
    MemData : DATA;
    UniMsg : array [NODE] of UNI_MSG;
    InvMsg : array [NODE] of INV_MSG;
    RpMsg : array [NODE] of RP_MSG;
    WbMsg : WB_MSG;
    ShWbMsg : SHWB_MSG;
    NakcMsg : NAKC_MSG;
  -- Auxiliary variables:
    CurrData : DATA;
    PrevData : DATA;
    LastWrVld : boolean;
    LastWrPtr : NODE;
    Requester : NODE;
    Collecting : boolean;
    FwdCmd : UNI_CMD;
    FwdSrc : NODE;
    LastInvAck : NODE;
    LastOtherInvAck : NODE;
  end;

var

  Home : NODE;
  Sta : STATE;

-------------------------------------------------------------------------------

ruleset h : NODE; d : DATA do
startstate "Init"
  Home := h;
  undefine Sta;
  Sta.MemData := d;
  Sta.Dir.Pending := false;
  Sta.Dir.Local := false;
  Sta.Dir.Dirty := false;
  Sta.Dir.HeadVld := false;
  Sta.Dir.ShrVld := false;
  Sta.WbMsg.Cmd := WB_None;
  Sta.ShWbMsg.Cmd := SHWB_None;
  Sta.NakcMsg.Cmd := NAKC_None;
  for p : NODE do
    Sta.Proc[p].ProcCmd := NODE_None;
    Sta.Proc[p].InvMarked := false;
    Sta.Proc[p].CacheState := CACHE_I;
    Sta.Dir.ShrSet[p] := false;
    Sta.Dir.InvSet[p] := false;
    Sta.UniMsg[p].Cmd := UNI_None;
    Sta.InvMsg[p].Cmd := INV_None;
    Sta.RpMsg[p].Cmd := RP_None;
  end;
  Sta.CurrData := d;
  Sta.PrevData := d;
  Sta.LastWrVld := false;
  Sta.Collecting := false;
  Sta.FwdCmd := UNI_None;
endstartstate;
endruleset;

-------------------------------------------------------------------------------

ruleset src : NODE; data : DATA do
rule "Store"
  Sta.Proc[src].CacheState = CACHE_E
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[src].CacheData := data;
  NxtSta.CurrData := data;
  NxtSta.LastWrVld := true;
  NxtSta.LastWrPtr := src;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE do
rule "PI_Remote_Get"
  src != Home &
  Sta.Proc[src].ProcCmd = NODE_None &
  Sta.Proc[src].CacheState = CACHE_I
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[src].ProcCmd := NODE_Get;
  NxtSta.UniMsg[src].Cmd := UNI_Get;
  NxtSta.UniMsg[src].Proc := Home;
  undefine NxtSta.UniMsg[src].Data;
--
  Sta := NxtSta;
endrule;
endruleset;

rule "PI_Local_Get_Get"
  Sta.Proc[Home].ProcCmd = NODE_None &
  Sta.Proc[Home].CacheState = CACHE_I &
  !Sta.Dir.Pending & Sta.Dir.Dirty
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[Home].ProcCmd := NODE_Get;
  NxtSta.Dir.Pending := true;
  NxtSta.UniMsg[Home].Cmd := UNI_Get;
  NxtSta.UniMsg[Home].Proc := Sta.Dir.HeadPtr;
  undefine NxtSta.UniMsg[Home].Data;
  if (Sta.Dir.HeadPtr != Home) then
    NxtSta.FwdCmd := UNI_Get;
  end;
  NxtSta.Requester := Home;
  NxtSta.Collecting := false;
--
  Sta := NxtSta;
endrule;

rule "PI_Local_Get_Put"
  Sta.Proc[Home].ProcCmd = NODE_None &
  Sta.Proc[Home].CacheState = CACHE_I &
  !Sta.Dir.Pending & !Sta.Dir.Dirty
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Dir.Local := true;
  NxtSta.Proc[Home].ProcCmd := NODE_None;
  if (Sta.Proc[Home].InvMarked) then
    NxtSta.Proc[Home].InvMarked := false;
    NxtSta.Proc[Home].CacheState := CACHE_I;
    undefine NxtSta.Proc[Home].CacheData;
  else
    NxtSta.Proc[Home].CacheState := CACHE_S;
    NxtSta.Proc[Home].CacheData := Sta.MemData;
  end;
--
  Sta := NxtSta;
endrule;

ruleset src : NODE do
rule "PI_Remote_GetX"
  src != Home &
  Sta.Proc[src].ProcCmd = NODE_None &
  Sta.Proc[src].CacheState = CACHE_I
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[src].ProcCmd := NODE_GetX;
  NxtSta.UniMsg[src].Cmd := UNI_GetX;
  NxtSta.UniMsg[src].Proc := Home;
  undefine NxtSta.UniMsg[src].Data;
--
  Sta := NxtSta;
endrule;
endruleset;

rule "PI_Local_GetX_GetX"
  Sta.Proc[Home].ProcCmd = NODE_None &
  ( Sta.Proc[Home].CacheState = CACHE_I |
    Sta.Proc[Home].CacheState = CACHE_S ) &
  !Sta.Dir.Pending & Sta.Dir.Dirty
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[Home].ProcCmd := NODE_GetX;
  NxtSta.Dir.Pending := true;
  NxtSta.UniMsg[Home].Cmd := UNI_GetX;
  NxtSta.UniMsg[Home].Proc := Sta.Dir.HeadPtr;
  undefine NxtSta.UniMsg[Home].Data;
  if (Sta.Dir.HeadPtr != Home) then
    NxtSta.FwdCmd := UNI_GetX;
  end;
  NxtSta.Requester := Home;
  NxtSta.Collecting := false;
--
  Sta := NxtSta;
endrule;

rule "PI_Local_GetX_PutX"
  Sta.Proc[Home].ProcCmd = NODE_None &
  ( Sta.Proc[Home].CacheState = CACHE_I |
    Sta.Proc[Home].CacheState = CACHE_S ) &
  !Sta.Dir.Pending & !Sta.Dir.Dirty
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Dir.Local := true;
  NxtSta.Dir.Dirty := true;
  if (Sta.Dir.HeadVld) then
    NxtSta.Dir.Pending := true;
    NxtSta.Dir.HeadVld := false;
    undefine NxtSta.Dir.HeadPtr;
    NxtSta.Dir.ShrVld := false;
    for p : NODE do
      NxtSta.Dir.ShrSet[p] := false;
      if ( p != Home &
           ( Sta.Dir.ShrVld & Sta.Dir.ShrSet[p] |
             Sta.Dir.HeadVld & Sta.Dir.HeadPtr = p ) ) then
        NxtSta.Dir.InvSet[p] := true;
        NxtSta.InvMsg[p].Cmd := INV_Inv;
      else
        NxtSta.Dir.InvSet[p] := false;
        NxtSta.InvMsg[p].Cmd := INV_None;
      end;
    end;
    NxtSta.Collecting := true;
    NxtSta.PrevData := Sta.CurrData;
    NxtSta.LastOtherInvAck := Sta.Dir.HeadPtr;
  end;
  NxtSta.Proc[Home].ProcCmd := NODE_None;
  NxtSta.Proc[Home].InvMarked := false;
  NxtSta.Proc[Home].CacheState := CACHE_E;
  NxtSta.Proc[Home].CacheData := Sta.MemData;
--
  Sta := NxtSta;
endrule;

ruleset dst : NODE do
rule "PI_Remote_PutX"
  dst != Home &
  Sta.Proc[dst].ProcCmd = NODE_None &
  Sta.Proc[dst].CacheState = CACHE_E
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[dst].CacheState := CACHE_I;
  undefine NxtSta.Proc[dst].CacheData;
  NxtSta.WbMsg.Cmd := WB_Wb;
  NxtSta.WbMsg.Proc := dst;
  NxtSta.WbMsg.Data := Sta.Proc[dst].CacheData;
--
  Sta := NxtSta;
endrule;
endruleset;

rule "PI_Local_PutX"
  Sta.Proc[Home].ProcCmd = NODE_None &
  Sta.Proc[Home].CacheState = CACHE_E
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  if (Sta.Dir.Pending) then
    NxtSta.Proc[Home].CacheState := CACHE_I;
    undefine NxtSta.Proc[Home].CacheData;
    NxtSta.Dir.Dirty := false;
    NxtSta.MemData := Sta.Proc[Home].CacheData;
  else
    NxtSta.Proc[Home].CacheState := CACHE_I;
    undefine NxtSta.Proc[Home].CacheData;
    NxtSta.Dir.Local := false;
    NxtSta.Dir.Dirty := false;
    NxtSta.MemData := Sta.Proc[Home].CacheData;
  end;
--
  Sta := NxtSta;
endrule;

ruleset src : NODE do
rule "PI_Remote_Replace"
  src != Home &
  Sta.Proc[src].ProcCmd = NODE_None &
  Sta.Proc[src].CacheState = CACHE_S
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[src].CacheState := CACHE_I;
  undefine NxtSta.Proc[src].CacheData;
  NxtSta.RpMsg[src].Cmd := RP_Replace;
--
  Sta := NxtSta;
endrule;
endruleset;

rule "PI_Local_Replace"
  Sta.Proc[Home].ProcCmd = NODE_None &
  Sta.Proc[Home].CacheState = CACHE_S
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Dir.Local := false;
  NxtSta.Proc[Home].CacheState := CACHE_I;
  undefine NxtSta.Proc[Home].CacheData;
--
  Sta := NxtSta;
endrule;

ruleset dst : NODE do
rule "NI_Nak"
  Sta.UniMsg[dst].Cmd = UNI_Nak
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[dst].Cmd := UNI_None;
  undefine NxtSta.UniMsg[dst].Proc;
  undefine NxtSta.UniMsg[dst].Data;
  NxtSta.Proc[dst].ProcCmd := NODE_None;
  NxtSta.Proc[dst].InvMarked := false;
--
  Sta := NxtSta;
endrule;
endruleset;

rule "NI_Nak_Clear"
  Sta.NakcMsg.Cmd = NAKC_Nakc
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.NakcMsg.Cmd := NAKC_None;
  NxtSta.Dir.Pending := false;
--
  Sta := NxtSta;
endrule;

ruleset src : NODE do
rule "NI_Local_Get_Nak"
  src != Home &
  Sta.UniMsg[src].Cmd = UNI_Get &
  Sta.UniMsg[src].Proc = Home &
  Sta.RpMsg[src].Cmd != RP_Replace &
  ( Sta.Dir.Pending |
    Sta.Dir.Dirty & Sta.Dir.Local & Sta.Proc[Home].CacheState != CACHE_E |
    Sta.Dir.Dirty & !Sta.Dir.Local & Sta.Dir.HeadPtr = src )
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[src].Cmd := UNI_Nak;
  NxtSta.UniMsg[src].Proc := Home;
  undefine NxtSta.UniMsg[src].Data;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE do
rule "NI_Local_Get_Get"
  src != Home &
  Sta.UniMsg[src].Cmd = UNI_Get &
  Sta.UniMsg[src].Proc = Home &
  Sta.RpMsg[src].Cmd != RP_Replace &
  !Sta.Dir.Pending & Sta.Dir.Dirty & !Sta.Dir.Local & Sta.Dir.HeadPtr != src
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Dir.Pending := true;
  NxtSta.UniMsg[src].Cmd := UNI_Get;
  NxtSta.UniMsg[src].Proc := Sta.Dir.HeadPtr;
  undefine NxtSta.UniMsg[src].Data;
  if (Sta.Dir.HeadPtr != Home) then
    NxtSta.FwdCmd := UNI_Get;
  end;
  NxtSta.Requester := src;
  NxtSta.Collecting := false;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE do
rule "NI_Local_Get_Put"
  src != Home &
  Sta.UniMsg[src].Cmd = UNI_Get &
  Sta.UniMsg[src].Proc = Home &
  Sta.RpMsg[src].Cmd != RP_Replace &
  !Sta.Dir.Pending &
  (Sta.Dir.Dirty -> Sta.Dir.Local & Sta.Proc[Home].CacheState = CACHE_E)
--  !Sta.Proc[src].InvMarked
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  if (Sta.Dir.Dirty) then
    NxtSta.Dir.Dirty := false;
    NxtSta.Dir.HeadVld := true;
    NxtSta.Dir.HeadPtr := src;
    NxtSta.MemData := Sta.Proc[Home].CacheData;
    NxtSta.Proc[Home].CacheState := CACHE_S;
    NxtSta.UniMsg[src].Cmd := UNI_Put;
    NxtSta.UniMsg[src].Proc := Home;
    NxtSta.UniMsg[src].Data := Sta.Proc[Home].CacheData;
  else
    if (Sta.Dir.HeadVld) then
      NxtSta.Dir.ShrVld := true;
      NxtSta.Dir.ShrSet[src] := true;
      for p : NODE do
        NxtSta.Dir.InvSet[p] := (p = src) | Sta.Dir.ShrSet[p];
      end;
    else
      NxtSta.Dir.HeadVld := true;
      NxtSta.Dir.HeadPtr := src;
    end;
    NxtSta.UniMsg[src].Cmd := UNI_Put;
    NxtSta.UniMsg[src].Proc := Home;
    NxtSta.UniMsg[src].Data := Sta.MemData;
  end;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE; dst : NODE do
rule "NI_Remote_Get_Nak"
  src != dst & dst != Home &
  Sta.UniMsg[src].Cmd = UNI_Get &
  Sta.UniMsg[src].Proc = dst &
  Sta.Proc[dst].CacheState != CACHE_E
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[src].Cmd := UNI_Nak;
  NxtSta.UniMsg[src].Proc := dst;
  undefine NxtSta.UniMsg[src].Data;
  NxtSta.NakcMsg.Cmd := NAKC_Nakc;
  NxtSta.FwdCmd := UNI_None;
  NxtSta.FwdSrc := src;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE; dst : NODE do
rule "NI_Remote_Get_Put"
  src != dst & dst != Home &
  Sta.UniMsg[src].Cmd = UNI_Get &
  Sta.UniMsg[src].Proc = dst &
  Sta.Proc[dst].CacheState = CACHE_E
--  !Sta.Proc[src].InvMarked
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[dst].CacheState := CACHE_S;
  NxtSta.UniMsg[src].Cmd := UNI_Put;
  NxtSta.UniMsg[src].Proc := dst;
  NxtSta.UniMsg[src].Data := Sta.Proc[dst].CacheData;
  if (src != Home) then
    NxtSta.ShWbMsg.Cmd := SHWB_ShWb;
    NxtSta.ShWbMsg.Proc := src;
    NxtSta.ShWbMsg.Data := Sta.Proc[dst].CacheData;
  end;
  NxtSta.FwdCmd := UNI_None;
  NxtSta.FwdSrc := src;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE do
rule "NI_Local_GetX_Nak"
  src != Home &
  Sta.UniMsg[src].Cmd = UNI_GetX &
  Sta.UniMsg[src].Proc = Home &
  ( Sta.Dir.Pending |
    Sta.Dir.Dirty & Sta.Dir.Local & Sta.Proc[Home].CacheState != CACHE_E |
    Sta.Dir.Dirty & !Sta.Dir.Local & Sta.Dir.HeadPtr = src )
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[src].Cmd := UNI_Nak;
  NxtSta.UniMsg[src].Proc := Home;
  undefine NxtSta.UniMsg[src].Data;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE do
rule "NI_Local_GetX_GetX"
  src != Home &
  Sta.UniMsg[src].Cmd = UNI_GetX &
  Sta.UniMsg[src].Proc = Home &
  !Sta.Dir.Pending & Sta.Dir.Dirty & !Sta.Dir.Local & Sta.Dir.HeadPtr != src
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Dir.Pending := true;
  NxtSta.UniMsg[src].Cmd := UNI_GetX;
  NxtSta.UniMsg[src].Proc := Sta.Dir.HeadPtr;
  undefine NxtSta.UniMsg[src].Data;
  if (Sta.Dir.HeadPtr != Home) then
    NxtSta.FwdCmd := UNI_GetX;
  end;
  NxtSta.Requester := src;
  NxtSta.Collecting := false;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE do
rule "NI_Local_GetX_PutX"
  src != Home &
  Sta.UniMsg[src].Cmd = UNI_GetX &
  Sta.UniMsg[src].Proc = Home &
  !Sta.Dir.Pending &
  (Sta.Dir.Dirty -> Sta.Dir.Local & Sta.Proc[Home].CacheState = CACHE_E)
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  if (Sta.Dir.Dirty) then
    NxtSta.Dir.Local := false;
    NxtSta.Dir.Dirty := true;
    NxtSta.Dir.HeadVld := true;
    NxtSta.Dir.HeadPtr := src;
    NxtSta.Dir.ShrVld := false;
    for p : NODE do
      NxtSta.Dir.ShrSet[p] := false;
      NxtSta.Dir.InvSet[p] := false;
    end;
    NxtSta.UniMsg[src].Cmd := UNI_PutX;
    NxtSta.UniMsg[src].Proc := Home;
    NxtSta.UniMsg[src].Data := Sta.Proc[Home].CacheData;
    NxtSta.Proc[Home].CacheState := CACHE_I;
    undefine NxtSta.Proc[Home].CacheData;
  elsif (Sta.Dir.HeadVld ->
         Sta.Dir.HeadPtr = src  &
         forall p : NODE do p != src -> !Sta.Dir.ShrSet[p] end) then
    NxtSta.Dir.Local := false;
    NxtSta.Dir.Dirty := true;
    NxtSta.Dir.HeadVld := true;
    NxtSta.Dir.HeadPtr := src;
    NxtSta.Dir.ShrVld := false;
    for p : NODE do
      NxtSta.Dir.ShrSet[p] := false;
      NxtSta.Dir.InvSet[p] := false;
    end;
    NxtSta.UniMsg[src].Cmd := UNI_PutX;
    NxtSta.UniMsg[src].Proc := Home;
    NxtSta.UniMsg[src].Data := Sta.MemData;
    NxtSta.Proc[Home].CacheState := CACHE_I;
    undefine NxtSta.Proc[Home].CacheData;
    if (Sta.Dir.Local) then
      NxtSta.Proc[Home].CacheState := CACHE_I;
      undefine NxtSta.Proc[Home].CacheData;
      if (Sta.Proc[Home].ProcCmd = NODE_Get) then
        NxtSta.Proc[Home].InvMarked := true;
      end;
    end;
  else
    NxtSta.Dir.Pending := true;
    NxtSta.Dir.Local := false;
    NxtSta.Dir.Dirty := true;
    NxtSta.Dir.HeadVld := true;
    NxtSta.Dir.HeadPtr := src;
    NxtSta.Dir.ShrVld := false;
    for p : NODE do
      NxtSta.Dir.ShrSet[p] := false;
      if ( p != Home & p != src &
           ( Sta.Dir.ShrVld & Sta.Dir.ShrSet[p] |
             Sta.Dir.HeadVld & Sta.Dir.HeadPtr = p ) ) then
        NxtSta.Dir.InvSet[p] := true;
        NxtSta.InvMsg[p].Cmd := INV_Inv;
      else
        NxtSta.Dir.InvSet[p] := false;
        NxtSta.InvMsg[p].Cmd := INV_None;
      end;
    end;
    NxtSta.UniMsg[src].Cmd := UNI_PutX;
    NxtSta.UniMsg[src].Proc := Home;
    NxtSta.UniMsg[src].Data := Sta.MemData;
    if (Sta.Dir.Local) then
      NxtSta.Proc[Home].CacheState := CACHE_I;
      undefine NxtSta.Proc[Home].CacheData;
      if (Sta.Proc[Home].ProcCmd = NODE_Get) then
        NxtSta.Proc[Home].InvMarked := true;
      end;
    end;
    NxtSta.Requester := src;
    NxtSta.Collecting := true;
    NxtSta.PrevData := Sta.CurrData;
    if (Sta.Dir.HeadPtr != src) then
      NxtSta.LastOtherInvAck := Sta.Dir.HeadPtr;
    else
      for p : NODE do
        if (p != src & Sta.Dir.ShrSet[p]) then NxtSta.LastOtherInvAck := p end;
      end;
    end;
  end;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE; dst : NODE do
rule "NI_Remote_GetX_Nak"
  src != dst & dst != Home &
  Sta.UniMsg[src].Cmd = UNI_GetX &
  Sta.UniMsg[src].Proc = dst &
  Sta.Proc[dst].CacheState != CACHE_E
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[src].Cmd := UNI_Nak;
  NxtSta.UniMsg[src].Proc := dst;
  undefine NxtSta.UniMsg[src].Data;
  NxtSta.NakcMsg.Cmd := NAKC_Nakc;
  NxtSta.FwdCmd := UNI_None;
  NxtSta.FwdSrc := src;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE; dst : NODE do
rule "NI_Remote_GetX_PutX"
  src != dst & dst != Home &
  Sta.UniMsg[src].Cmd = UNI_GetX &
  Sta.UniMsg[src].Proc = dst &
  Sta.Proc[dst].CacheState = CACHE_E
--  !Sta.Proc[src].InvMarked
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.Proc[dst].CacheState := CACHE_I;
  undefine NxtSta.Proc[dst].CacheData;
  NxtSta.UniMsg[src].Cmd := UNI_PutX;
  NxtSta.UniMsg[src].Proc := dst;
  NxtSta.UniMsg[src].Data := Sta.Proc[dst].CacheData;
  if (src != Home) then
    NxtSta.ShWbMsg.Cmd := SHWB_FAck;
    NxtSta.ShWbMsg.Proc := src;
    undefine NxtSta.ShWbMsg.Data;
  end;
  NxtSta.FwdCmd := UNI_None;
  NxtSta.FwdSrc := src;
--
  Sta := NxtSta;
endrule;
endruleset;

rule "NI_Local_Put"
  Sta.UniMsg[Home].Cmd = UNI_Put
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[Home].Cmd := UNI_None;
  undefine NxtSta.UniMsg[Home].Proc;
  undefine NxtSta.UniMsg[Home].Data;
  NxtSta.Dir.Pending := false;
  NxtSta.Dir.Dirty := false;
  NxtSta.Dir.Local := true;
  NxtSta.MemData := Sta.UniMsg[Home].Data;
  NxtSta.Proc[Home].ProcCmd := NODE_None;
  if (Sta.Proc[Home].InvMarked) then
    NxtSta.Proc[Home].InvMarked := false;
    NxtSta.Proc[Home].CacheState := CACHE_I;
    undefine NxtSta.Proc[Home].CacheData;
  else
    NxtSta.Proc[Home].CacheState := CACHE_S;
    NxtSta.Proc[Home].CacheData := Sta.UniMsg[Home].Data;
  end;
--
  Sta := NxtSta;
endrule;

ruleset dst : NODE do
rule "NI_Remote_Put"
  dst != Home &
  Sta.UniMsg[dst].Cmd = UNI_Put
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[dst].Cmd := UNI_None;
  undefine NxtSta.UniMsg[dst].Proc;
  undefine NxtSta.UniMsg[dst].Data;
  NxtSta.Proc[dst].ProcCmd := NODE_None;
  if (Sta.Proc[dst].InvMarked) then
    NxtSta.Proc[dst].InvMarked := false;
    NxtSta.Proc[dst].CacheState := CACHE_I;
    undefine NxtSta.Proc[dst].CacheData;
  else
    NxtSta.Proc[dst].CacheState := CACHE_S;
    NxtSta.Proc[dst].CacheData := Sta.UniMsg[dst].Data;
  end;
--
  Sta := NxtSta;
endrule;
endruleset;

rule "NI_Local_PutXAcksDone"
  Sta.UniMsg[Home].Cmd = UNI_PutX
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[Home].Cmd := UNI_None;
  undefine NxtSta.UniMsg[Home].Proc;
  undefine NxtSta.UniMsg[Home].Data;
  NxtSta.Dir.Pending := false;
  NxtSta.Dir.Local := true;
  NxtSta.Dir.HeadVld := false;
  undefine NxtSta.Dir.HeadPtr;
  NxtSta.Proc[Home].ProcCmd := NODE_None;
  NxtSta.Proc[Home].InvMarked := false;
  NxtSta.Proc[Home].CacheState := CACHE_E;
  NxtSta.Proc[Home].CacheData := Sta.UniMsg[Home].Data;
--
  Sta := NxtSta;
endrule;

ruleset dst : NODE do
rule "NI_Remote_PutX"
  dst != Home &
  Sta.UniMsg[dst].Cmd = UNI_PutX &
  Sta.Proc[dst].ProcCmd = NODE_GetX
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.UniMsg[dst].Cmd := UNI_None;
  undefine NxtSta.UniMsg[dst].Proc;
  undefine NxtSta.UniMsg[dst].Data;
  NxtSta.Proc[dst].ProcCmd := NODE_None;
  NxtSta.Proc[dst].InvMarked := false;
  NxtSta.Proc[dst].CacheState := CACHE_E;
  NxtSta.Proc[dst].CacheData := Sta.UniMsg[dst].Data;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset dst : NODE do
rule "NI_Inv"
  dst != Home &
  Sta.InvMsg[dst].Cmd = INV_Inv
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.InvMsg[dst].Cmd := INV_InvAck;
  NxtSta.Proc[dst].CacheState := CACHE_I;
  undefine NxtSta.Proc[dst].CacheData;
  if (Sta.Proc[dst].ProcCmd = NODE_Get) then
    NxtSta.Proc[dst].InvMarked := true;
  end;
--
  Sta := NxtSta;
endrule;
endruleset;

ruleset src : NODE do
rule "NI_InvAck"
  src != Home &
  Sta.InvMsg[src].Cmd = INV_InvAck &
  Sta.Dir.Pending & Sta.Dir.InvSet[src]  
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.InvMsg[src].Cmd := INV_None;
  NxtSta.Dir.InvSet[src] := false;
  if (exists p : NODE do p != src & Sta.Dir.InvSet[p] end) then
    NxtSta.LastInvAck := src;
    for p : NODE do
      if (p != src & Sta.Dir.InvSet[p]) then
        NxtSta.LastOtherInvAck := p;
      end;
    end;
  else
    NxtSta.Dir.Pending := false;
    if (Sta.Dir.Local & !Sta.Dir.Dirty) then
      NxtSta.Dir.Local := false;
    end;
    NxtSta.Collecting := false;
    NxtSta.LastInvAck := src;
  end;
--
  Sta := NxtSta;
endrule;
endruleset;

rule "NI_Wb"
  Sta.WbMsg.Cmd = WB_Wb
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.WbMsg.Cmd := WB_None;
  undefine NxtSta.WbMsg.Proc;
  undefine NxtSta.WbMsg.Data;
  NxtSta.Dir.Dirty := false;
  NxtSta.Dir.HeadVld := false;
  undefine NxtSta.Dir.HeadPtr;
  NxtSta.MemData := Sta.WbMsg.Data;
--
  Sta := NxtSta;
endrule;

rule "NI_FAck"
  Sta.ShWbMsg.Cmd = SHWB_FAck
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.ShWbMsg.Cmd := SHWB_None;
  undefine NxtSta.ShWbMsg.Proc;
  undefine NxtSta.ShWbMsg.Data;
  NxtSta.Dir.Pending := false;
  if (Sta.Dir.Dirty) then
    NxtSta.Dir.HeadPtr := Sta.ShWbMsg.Proc;
  end;
--
  Sta := NxtSta;
endrule;

rule "NI_ShWb"
  Sta.ShWbMsg.Cmd = SHWB_ShWb
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.ShWbMsg.Cmd := SHWB_None;
  undefine NxtSta.ShWbMsg.Proc;
  undefine NxtSta.ShWbMsg.Data;
  NxtSta.Dir.Pending := false;
  NxtSta.Dir.Dirty := false;
  NxtSta.Dir.ShrVld := true;
--  NxtSta.Dir.ShrSet[Sta.ShWbMsg.Proc] := true;
  for p : NODE do
    NxtSta.Dir.ShrSet[p] := (p = Sta.ShWbMsg.Proc) | Sta.Dir.ShrSet[p];
    NxtSta.Dir.InvSet[p] := (p = Sta.ShWbMsg.Proc) | Sta.Dir.ShrSet[p];
  end;
  NxtSta.MemData := Sta.ShWbMsg.Data;
--
  Sta := NxtSta;
endrule;

ruleset src : NODE do
rule "NI_Replace"
  Sta.RpMsg[src].Cmd = RP_Replace
==>
var NxtSta : STATE;
begin
  NxtSta := Sta;
--
  NxtSta.RpMsg[src].Cmd := RP_None;
  if (Sta.Dir.ShrVld) then
    NxtSta.Dir.ShrSet[src] := false;
    NxtSta.Dir.InvSet[src] := false;
  end;
--
  Sta := NxtSta;
endrule;
endruleset;

-------------------------------------------------------------------------------

invariant "CacheStateProp"
  forall p : NODE do forall q : NODE do
    p != q ->
    !(Sta.Proc[p].CacheState = CACHE_E & Sta.Proc[q].CacheState = CACHE_E)
  end end;

invariant "CacheDataProp"
  forall p : NODE do
    ( Sta.Proc[p].CacheState = CACHE_E ->
      Sta.Proc[p].CacheData = Sta.CurrData ) &
    ( Sta.Proc[p].CacheState = CACHE_S ->
      ( Sta.Collecting -> Sta.Proc[p].CacheData = Sta.PrevData ) &
      (!Sta.Collecting -> Sta.Proc[p].CacheData = Sta.CurrData ) )
  end;

invariant "MemDataProp"
  !Sta.Dir.Dirty -> Sta.MemData = Sta.CurrData;



invariant "lemma1"
  forall h: NODE do forall i: NODE do
    h = Home & Sta.Proc[i].CacheState = CACHE_E ->
    Sta.Dir.Dirty & Sta.WbMsg.Cmd != WB_Wb & Sta.ShWbMsg.Cmd != SHWB_ShWb 
    & Sta.UniMsg[h].Cmd != UNI_Put & 
    forall j: NODE do Sta.UniMsg[j].Cmd != UNI_PutX end &
    forall j: NODE do j != i -> Sta.Proc[j].CacheState != CACHE_E end
  end end; 

invariant "lemma2"
  forall h: NODE do forall i: NODE do forall j: NODE do
    h = Home & i != j & j != h & Sta.UniMsg[i].Cmd = UNI_Get 
    & Sta.UniMsg[i].Proc = j
    -> Sta.Dir.Pending & !Sta.Dir.Local & Sta.Requester = i 
    & Sta.FwdCmd = UNI_Get
  end end end;

invariant "lemma3"
  forall h: NODE do forall i: NODE do forall j: NODE do
    h = Home & i != j & j != h & Sta.UniMsg[i].Cmd = UNI_GetX 
    & Sta.UniMsg[i].Proc = j
    -> Sta.Dir.Pending & !Sta.Dir.Local & Sta.Requester = i 
    & Sta.FwdCmd = UNI_GetX
  end end end;

invariant "lemma4"
  forall h: NODE do forall i: NODE do
    h = Home & i != h & Sta.InvMsg[i].Cmd = INV_InvAck ->
    Sta.Dir.Pending & Sta.Collecting & Sta.NakcMsg.Cmd = NAKC_None 
    & Sta.ShWbMsg.Cmd = SHWB_None
    & forall j: NODE do
      (Sta.UniMsg[j].Cmd = UNI_Get | Sta.UniMsg[j].Cmd = UNI_GetX 
      -> Sta.UniMsg[j].Proc = h)
      & (Sta.UniMsg[j].Cmd = UNI_PutX -> Sta.UniMsg[j].Proc = h 
        & Sta.Requester = j)
  end end end;

invariant "lemma5"
  forall i: NODE do 
    Sta.Proc[i].CacheState = CACHE_E -> Sta.Proc[i].CacheData = Sta.CurrData end;
-------------------------------------------------------------------------------

--   /* refinement relations */

--   forall(i : NODE){
--     observable[i] : boolean;
--     observable[i] :=
--       !(Sta.Dir.Pending & Collecting) | Sta.Proc[i].CacheState = CACHE_E | LastWrPtr = i;

--     m_last_obs[i], m_last_obs_prev[i] :  DATA;

--     next(m_last_obs_prev[i]) := m_last_obs[i];

--     m_last_obs[i] := observable[i] ? CurrData : m_last_obs_prev[i];

--     layer L1:
--       if (Sta.Proc[i].CacheState = CACHE_E | Sta.Proc[i].CacheState = CACHE_S)
-- 	Sta.Proc[i].CacheData := m_last_obs[i];

--     forall(j : NODE){
--       subcase L1[j] of Sta.Proc[i].CacheData//L1 for LastWrPtr = j;

--       forall(k : NODE){
-- 	subcase L1[j][k] of Sta.Proc[i].CacheData//L1[j] for Home = k;
--       }
--     }
--   }

--   layer L2:
--     if (!Sta.Dir.Dirty)Sta.MemData := CurrData;

--   L3: assert G ((Sta.Proc[dst].CacheState = CACHE_E -> Sta.Proc[dst].CacheData = CurrData));

--   forall(i : NODE){
--     L4[i]: assert G (Sta.Proc[dst].CacheState = CACHE_E -> Sta.Dir.Dirty & WbMsg.Cmd = None & ShWbMsg.Cmd != ShWB
-- 	 & UniMsg[Home].Cmd != Put
-- 	 & ((Sta.Proc[i].CacheState in CACHE_E | UniMsg[i].Cmd = PutX) -> dst = i));
--     L5[i]: assert G (UniMsg[i].Cmd in {Get,GetX} & UniMsg[i].Proc != Home
--                -> (UniMsg[i].Cmd = FwdCmd));
--     L5a: assert G(rule in {NI_Remote_Get,NI_Remote_GetX} & Sta.UniMsg[src].Cmd in {Get,GetX} & Sta.UniMsg[src].Proc = dst & dst != Home -> (Sta.UniMsg[src].Cmd = FwdCmd));
--     L6: assert G (Sta.InvMsg[src].Cmd = INV_InvAck & Sta.Dir.InvSet[src] -> Sta.Dir.Pending & Collecting);
--     forall(j : NODE) forall(k : NODE){
--       subcase L4[i][j][k] of L4[i] for dst = j & Home = k;
--       subcase L5[i][j][k] of L5[i] for FwdSrc = j & Home = k;
--       subcase L6[i][k] of L6 for src = i & Home = k;
--       subcase L2[j][k] of Sta.MemData//L2 for LastWrPtr = j & Home = k;
--       subcase L3[i] of L3 for dst = i;
--       subcase L5a[i][k] of L5a for src = i & Home = k;
--       using (L4), (L5), (L5a), (L6),
-- 	Sta.Proc[k].ProcCmd//free if k != i & k != j,
-- 	Sta.Dir.InvSet//undefined, Sta.Dir.ShrSet//undefined, rp//undefined, InvMsg//undefined
--       prove L3[i], L4[i][j][k], L5[i][j][k], L5a[i][k], L6[i][k], Sta.Proc[i].CacheData//L1[j][k], Sta.MemData//L2[j][k];
--       using Sta.Dir.InvSet[i], Sta.Dir.ShrSet[i], rp[i], InvMsg[i] prove L6[i][k], Sta.Proc[i].CacheData//L1[j][k];
--       using (L3), UniMsg[j].Data//undefined if j != i, UniMsg[k].Data//undefined if k != i,
--             m_last_obs_prev//undefined, m_last_obs_prev[i] prove Sta.Proc[i].CacheData//L1[j][k];
--       using (L3) prove Sta.MemData//L2[j][k];
--       using L5[i] prove L5a[i][k];
--     }
--   }

--   /* liveness proof */

--   P1 : assert G (Sta.Dir.Pending -> F !Sta.Dir.Pending);

--   forall(i : NODE) {
--      F1[i] : assert G F (rule = NI_Inv & dst = i);
--      F2[i] : assert G F (rule = NI_InvAck & src = i);
--      F3[i] : assert G F (rule = NI_Remote_Get & src = i & Sta.UniMsg[src].Proc = dst);
--      F4[i] : assert G F (rule = NI_Remote_GetX & src = i & Sta.UniMsg[src].Proc = dst);
--      F5[i] : assert G F (ShWbMsg.Cmd != None -> (rule = NI_FAck & ShWbMsg.Cmd = FAck | rule = NI_ShWB & ShWbMsg.Cmd = ShWB));
--      F7[i] : assert G F (rule = NI_Nak_Clear);
--      F8 : assert G F (rule = NI_Local_PutXAcksDone & dst = Home);
--      F9 : assert G F (rule = NI_Local_Put & dst = Home);
--      assume F1[i], F2[i], F3[i], F4[i], F5[i], F7[i], F8, F9;
--   }

--   subcase P1a of P1 for Collecting = 1;
--   subcase P1b of P1 for Collecting = 0;

--   some_Pending_invalidate : NODE;
--   some_Pending_invalidate := {i : i : NODE, Sta.Dir.InvSet[i]};

--   forall(i : NODE) forall(j : NODE) forall(k : NODE){
--     P2[i] : assert G (Sta.Dir.Pending & Collecting -> F (!Sta.Dir.InvSet[i] | !Sta.Dir.Pending));
--     P3 : assert G (Sta.Dir.Pending & Collecting -> F (&[!Sta.Dir.InvSet[i] : i : NODE] | !Sta.Dir.Pending));
--     P4 : assert G (Sta.Dir.Pending & Collecting -> Sta.Dir.InvSet[LastOtherInvAck]);
--     subcase P3[i] of P3 for G F (some_Pending_invalidate = i);
--     subcase P1a[i][j] of P1a for (LastInvAck = i) when &[!Sta.Dir.InvSet[i] : i : NODE]
-- 	& (LastOtherInvAck = j) when &[!Sta.Dir.InvSet[i] : i : NODE];
--     subcase P4[i][j] of P4 for LastOtherInvAck = i & Home = j;
--     using P3, P4 prove  P1a[i][j];
--     using InvMsg//free, UniMsg//undefined, cache//undefined, ShWbMsg//free, WbMsg//free, rp//free, nakc//free
--     prove  P1a[i][j], P4[i][j], P3[i];
--     using (P4), mi//free, Sta.RpMsg[src].Cmd = RP_Replace//free, Sta.Proc[src].InvMarked//free, Sta.InvMsg[src].Cmd = INV_InvAck & Sta.Dir.InvSet[src]//free, ShWbMsg prove P4[i][j];
--     using P2 prove P3[i];
--     using cache//undefined, UniMsg//undefined, ShWbMsg//free, WbMsg//free, nakc//free, F1, F2 prove P2[i];

--     subcase P1b[i][j] of P1b for Requester = i & Home = j;
--     using F3,F4,F5,F7,F8,F9 prove P1b[i][j];
--     using cache//undefined, InvMsg//undefined, rp//undefined, Sta.Dir.InvSet//undefined, Sta.Dir.ShrSet//undefined,
--       UniMsg//undefined, UniMsg[i], Sta.Proc[i], Sta.Proc[j].CacheState /* if i = j */ prove P1b[i][j];
--   }

--   min : NODE;
--   mi : msg; /* the incoming message */
--   mi := UniMsg[min];
