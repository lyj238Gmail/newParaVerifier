(*  Title:      HOL/Auth/n_g2kAbsAfter_base.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_g2kAbsAfter Protocol Case Study*} 

theory n_g2kAbsAfter_base imports paraTheory
begin

section{*Main definitions*}

subsection{* Definitions of Constants*}
definition I::"scalrValueType" where [simp]: "I\<equiv> enum ''control'' ''I''"
definition S::"scalrValueType" where [simp]: "S\<equiv> enum ''control'' ''S''"
definition E::"scalrValueType" where [simp]: "E\<equiv> enum ''control'' ''E''"
definition Empty::"scalrValueType" where [simp]: "Empty\<equiv> enum ''control'' ''Empty''"
definition ReqS::"scalrValueType" where [simp]: "ReqS\<equiv> enum ''control'' ''ReqS''"
definition ReqE::"scalrValueType" where [simp]: "ReqE\<equiv> enum ''control'' ''ReqE''"
definition Inv::"scalrValueType" where [simp]: "Inv\<equiv> enum ''control'' ''Inv''"
definition InvAck::"scalrValueType" where [simp]: "InvAck\<equiv> enum ''control'' ''InvAck''"
definition GntS::"scalrValueType" where [simp]: "GntS\<equiv> enum ''control'' ''GntS''"
definition GntE::"scalrValueType" where [simp]: "GntE\<equiv> enum ''control'' ''GntE''"
definition true::"scalrValueType" where [simp]: "true\<equiv> boolV True"
definition false::"scalrValueType" where [simp]: "false\<equiv> boolV False"



subsection{*  Definitions of Parameterized Rules *}

definition n_n_Store_i1::"nat \<Rightarrow> rule" where [simp]:
"n_n_Store_i1  d\<equiv>
let g = (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)) in
let s = (parallelList [(assign ((Field (Ident ''Cache_1'') ''Data''), (Const (index d)))), (assign ((Ident ''AuxData''), (Const (index d))))]) in
guard g s"

definition n_n_AStore_i1::"nat \<Rightarrow> rule" where [simp]:
"n_n_AStore_i1  d\<equiv>
let g = (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) in
let s = (parallelList [(assign ((Field (Ident ''ACache_1'') ''Data''), (Const (index d)))), (assign ((Ident ''AuxData''), (Const (index d))))]) in
guard g s"

definition n_n_SendReqS_j1::"rule" where [simp]:
"n_n_SendReqS_j1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const I)) (eqn (IVar (Field (Ident ''Chan1_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''Chan1_1'') ''Cmd''), (Const ReqS)))]) in
guard g s"

definition n_n_SendReqEI_i1::"rule" where [simp]:
"n_n_SendReqEI_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const I)) (eqn (IVar (Field (Ident ''Chan1_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''Chan1_1'') ''Cmd''), (Const ReqE)))]) in
guard g s"

definition n_n_SendReqES_i1::"rule" where [simp]:
"n_n_SendReqES_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const S)) (eqn (IVar (Field (Ident ''Chan1_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''Chan1_1'') ''Cmd''), (Const ReqE)))]) in
guard g s"

definition n_n_RecvReq_i1::"rule" where [simp]:
"n_n_RecvReq_i1  \<equiv>
let g = (andForm (eqn (IVar (Ident ''CurCmd'')) (Const Empty)) (neg (eqn (IVar (Field (Ident ''Chan1_1'') ''Cmd'')) (Const Empty)))) in
let s = (parallelList [(assign ((Ident ''CurCmd''), (IVar (Field (Ident ''Chan1_1'') ''Cmd'')))), (assign ((Field (Ident ''Chan1_1'') ''Cmd''), (Const Empty))), (assign ((Ident ''CurPtr''), (Const 1))), (assign ((Ident ''InvSet_1''), (IVar (Ident ''ShrSet_1'')))), (assign ((Ident ''AInvSet_1''), (IVar (Ident ''AShrSet_1''))))]) in
guard g s"

definition n_n_SendInvE_i1::"rule" where [simp]:
"n_n_SendInvE_i1  \<equiv>
let g = (andForm (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Empty)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqE))) (eqn (IVar (Ident ''InvSet_1'')) (Const true))) in
let s = (parallelList [(assign ((Field (Ident ''Chan2_1'') ''Cmd''), (Const Inv))), (assign ((Ident ''InvSet_1''), (Const false)))]) in
guard g s"

definition n_n_SendInvS_i1::"rule" where [simp]:
"n_n_SendInvS_i1  \<equiv>
let g = (andForm (andForm (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Empty)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''ExGntd'')) (Const true))) (eqn (IVar (Ident ''InvSet_1'')) (Const true))) in
let s = (parallelList [(assign ((Field (Ident ''Chan2_1'') ''Cmd''), (Const Inv))), (assign ((Ident ''InvSet_1''), (Const false)))]) in
guard g s"

definition n_n_SendInvAck_i1::"rule" where [simp]:
"n_n_SendInvAck_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''Chan2_1'') ''Cmd''), (Const Empty))), (assign ((Field (Ident ''Chan3_1'') ''Cmd''), (Const InvAck))), (assign ((Field (Ident ''Chan3_1'') ''Data''), (iteForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)) (IVar (Field (Ident ''Cache_1'') ''Data'')) (IVar (Field (Ident ''Chan3_1'') ''Data''))))), (assign ((Field (Ident ''Cache_1'') ''State''), (Const I)))]) in
guard g s"

definition n_n_RecvInvAck_i1::"rule" where [simp]:
"n_n_RecvInvAck_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (neg (eqn (IVar (Ident ''CurCmd'')) (Const Empty)))) in
let s = (parallelList [(assign ((Ident ''ShrSet_1''), (Const false))), (assign ((Ident ''MemData''), (iteForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (IVar (Field (Ident ''Chan3_1'') ''Data'')) (IVar (Ident ''MemData''))))), (assign ((Ident ''ExGntd''), (iteForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (Const false) (IVar (Ident ''ExGntd''))))), (assign ((Field (Ident ''Chan3_1'') ''Cmd''), (Const Empty)))]) in
guard g s"

definition n_n_SendGntS_i1::"rule" where [simp]:
"n_n_SendGntS_i1  \<equiv>
let g = (andForm (andForm (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Empty)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''CurPtr'')) (Const 1))) (eqn (IVar (Ident ''ExGntd'')) (Const false))) in
let s = (parallelList [(assign ((Ident ''ShrSet_1''), (Const true))), (assign ((Ident ''CurCmd''), (Const Empty))), (assign ((Field (Ident ''Chan2_1'') ''Cmd''), (Const GntS))), (assign ((Field (Ident ''Chan2_1'') ''Data''), (IVar (Ident ''MemData''))))]) in
guard g s"

definition n_n_SendGntE_i1::"rule" where [simp]:
"n_n_SendGntE_i1  \<equiv>
let g = (andForm (andForm (andForm (andForm (andForm (eqn (IVar (Ident ''AShrSet_1'')) (Const false)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Empty))) (eqn (IVar (Ident ''CurCmd'')) (Const ReqE))) (eqn (IVar (Ident ''CurPtr'')) (Const 1))) (eqn (IVar (Ident ''ExGntd'')) (Const false))) (eqn (IVar (Ident ''ShrSet_1'')) (Const false))) in
let s = (parallelList [(assign ((Ident ''ShrSet_1''), (Const true))), (assign ((Ident ''CurCmd''), (Const Empty))), (assign ((Ident ''ExGntd''), (Const true))), (assign ((Field (Ident ''Chan2_1'') ''Cmd''), (Const GntE))), (assign ((Field (Ident ''Chan2_1'') ''Data''), (IVar (Ident ''MemData''))))]) in
guard g s"

definition n_n_RecvGntS_i1::"rule" where [simp]:
"n_n_RecvGntS_i1  \<equiv>
let g = (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntS)) in
let s = (parallelList [(assign ((Field (Ident ''Cache_1'') ''State''), (Const S))), (assign ((Field (Ident ''Chan2_1'') ''Cmd''), (Const Empty))), (assign ((Field (Ident ''Cache_1'') ''Data''), (IVar (Field (Ident ''Chan2_1'') ''Data''))))]) in
guard g s"

definition n_n_RecvGntE_i1::"rule" where [simp]:
"n_n_RecvGntE_i1  \<equiv>
let g = (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE)) in
let s = (parallelList [(assign ((Field (Ident ''Cache_1'') ''State''), (Const E))), (assign ((Field (Ident ''Chan2_1'') ''Cmd''), (Const Empty))), (assign ((Field (Ident ''Cache_1'') ''Data''), (IVar (Field (Ident ''Chan2_1'') ''Data''))))]) in
guard g s"

definition n_n_ASendReqIS_j1::"rule" where [simp]:
"n_n_ASendReqIS_j1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const I)) (eqn (IVar (Field (Ident ''AChan1_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''AChan1_1'') ''Cmd''), (Const ReqS)))]) in
guard g s"

definition n_n_ASendReqSE_j1::"rule" where [simp]:
"n_n_ASendReqSE_j1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''AChan1_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''AChan1_1'') ''Cmd''), (Const ReqS)))]) in
guard g s"

definition n_n_ASendReqEI_i1::"rule" where [simp]:
"n_n_ASendReqEI_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const I)) (eqn (IVar (Field (Ident ''AChan1_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''AChan1_1'') ''Cmd''), (Const ReqE)))]) in
guard g s"

definition n_n_ASendReqES_i1::"rule" where [simp]:
"n_n_ASendReqES_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const S)) (eqn (IVar (Field (Ident ''AChan1_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''AChan1_1'') ''Cmd''), (Const ReqE)))]) in
guard g s"

definition n_n_SendReqEE_i1::"rule" where [simp]:
"n_n_SendReqEE_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''AChan1_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''AChan1_1'') ''Cmd''), (Const ReqE)))]) in
guard g s"

definition n_n_ARecvReq_i1::"rule" where [simp]:
"n_n_ARecvReq_i1  \<equiv>
let g = (andForm (eqn (IVar (Ident ''CurCmd'')) (Const Empty)) (neg (eqn (IVar (Field (Ident ''AChan1_1'') ''Cmd'')) (Const Empty)))) in
let s = (parallelList [(assign ((Ident ''CurCmd''), (IVar (Field (Ident ''AChan1_1'') ''Cmd'')))), (assign ((Field (Ident ''AChan1_1'') ''Cmd''), (Const Empty))), (assign ((Ident ''CurPtr''), (Const 1))), (assign ((Ident ''InvSet_1''), (IVar (Ident ''ShrSet_1'')))), (assign ((Ident ''AInvSet_1''), (IVar (Ident ''AShrSet_1''))))]) in
guard g s"

definition n_n_ASendInvE_i1::"rule" where [simp]:
"n_n_ASendInvE_i1  \<equiv>
let g = (andForm (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Empty)) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))) (eqn (IVar (Ident ''CurCmd'')) (Const ReqE))) in
let s = (parallelList [(assign ((Field (Ident ''AChan2_1'') ''Cmd''), (Const Inv))), (assign ((Ident ''AInvSet_1''), (Const false)))]) in
guard g s"

definition n_n_ASendInvS_i1::"rule" where [simp]:
"n_n_ASendInvS_i1  \<equiv>
let g = (andForm (andForm (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Empty)) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''ExGntd'')) (Const true))) in
let s = (parallelList [(assign ((Field (Ident ''AChan2_1'') ''Cmd''), (Const Inv))), (assign ((Ident ''AInvSet_1''), (Const false)))]) in
guard g s"

definition n_n_ASendInvAck_i1::"rule" where [simp]:
"n_n_ASendInvAck_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const Empty))) in
let s = (parallelList [(assign ((Field (Ident ''AChan2_1'') ''Cmd''), (Const Empty))), (assign ((Field (Ident ''AChan3_1'') ''Cmd''), (Const InvAck))), (assign ((Field (Ident ''AChan3_1'') ''Data''), (iteForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (IVar (Field (Ident ''ACache_1'') ''Data'')) (IVar (Field (Ident ''AChan3_1'') ''Data''))))), (assign ((Field (Ident ''ACache_1'') ''State''), (Const I)))]) in
guard g s"

definition n_n_ARecvInvAck_i1::"rule" where [simp]:
"n_n_ARecvInvAck_i1  \<equiv>
let g = (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (neg (eqn (IVar (Ident ''CurCmd'')) (Const Empty)))) in
let s = (parallelList [(assign ((Ident ''AShrSet_1''), (Const false))), (assign ((Ident ''MemData''), (iteForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (IVar (Field (Ident ''AChan3_1'') ''Data'')) (IVar (Ident ''MemData''))))), (assign ((Ident ''ExGntd''), (iteForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (Const false) (IVar (Ident ''ExGntd''))))), (assign ((Field (Ident ''AChan3_1'') ''Cmd''), (Const Empty)))]) in
guard g s"

definition n_n_ASendGntS_i1::"rule" where [simp]:
"n_n_ASendGntS_i1  \<equiv>
let g = (andForm (andForm (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Empty)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''CurPtr'')) (Const 1))) (eqn (IVar (Ident ''ExGntd'')) (Const false))) in
let s = (parallelList [(assign ((Ident ''AShrSet_1''), (Const true))), (assign ((Ident ''CurCmd''), (Const Empty))), (assign ((Field (Ident ''AChan2_1'') ''Cmd''), (Const GntS))), (assign ((Field (Ident ''AChan2_1'') ''Data''), (IVar (Ident ''MemData''))))]) in
guard g s"

definition n_n_ASendGntE_i1::"rule" where [simp]:
"n_n_ASendGntE_i1  \<equiv>
let g = (andForm (andForm (andForm (andForm (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Empty)) (eqn (IVar (Ident ''AShrSet_1'')) (Const false))) (eqn (IVar (Ident ''CurCmd'')) (Const ReqE))) (eqn (IVar (Ident ''CurPtr'')) (Const 1))) (eqn (IVar (Ident ''ExGntd'')) (Const false))) (eqn (IVar (Ident ''ShrSet_1'')) (Const false))) in
let s = (parallelList [(assign ((Ident ''AShrSet_1''), (Const true))), (assign ((Ident ''CurCmd''), (Const Empty))), (assign ((Ident ''ExGntd''), (Const true))), (assign ((Field (Ident ''AChan2_1'') ''Cmd''), (Const GntE))), (assign ((Field (Ident ''AChan2_1'') ''Data''), (IVar (Ident ''MemData''))))]) in
guard g s"

definition n_n_ARecvGntS_i1::"rule" where [simp]:
"n_n_ARecvGntS_i1  \<equiv>
let g = (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS)) in
let s = (parallelList [(assign ((Field (Ident ''ACache_1'') ''State''), (Const S))), (assign ((Field (Ident ''AChan2_1'') ''Cmd''), (Const Empty))), (assign ((Field (Ident ''ACache_1'') ''Data''), (IVar (Field (Ident ''AChan2_1'') ''Data''))))]) in
guard g s"

definition n_n_ARecvGntE_i1::"rule" where [simp]:
"n_n_ARecvGntE_i1  \<equiv>
let g = (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE)) in
let s = (parallelList [(assign ((Field (Ident ''ACache_1'') ''State''), (Const E))), (assign ((Field (Ident ''AChan2_1'') ''Cmd''), (Const Empty))), (assign ((Field (Ident ''ACache_1'') ''Data''), (IVar (Field (Ident ''AChan2_1'') ''Data''))))]) in
guard g s"

subsection{*The set of All actual Rules w.r.t. a Protocol Instance with Size $N$*}
definition rules::"nat \<Rightarrow> rule set" where [simp]:
"rules N \<equiv> {r.
(\<exists> d. d\<le>N\<and>r=n_n_Store_i1  d) \<or>
(\<exists> d. d\<le>N\<and>r=n_n_AStore_i1  d) \<or>
(r=n_n_SendReqS_j1  ) \<or>
(r=n_n_SendReqEI_i1  ) \<or>
(r=n_n_SendReqES_i1  ) \<or>
(r=n_n_RecvReq_i1  ) \<or>
(r=n_n_SendInvE_i1  ) \<or>
(r=n_n_SendInvS_i1  ) \<or>
(r=n_n_SendInvAck_i1  ) \<or>
(r=n_n_RecvInvAck_i1  ) \<or>
(r=n_n_SendGntS_i1  ) \<or>
(r=n_n_SendGntE_i1  ) \<or>
(r=n_n_RecvGntS_i1  ) \<or>
(r=n_n_RecvGntE_i1  ) \<or>
(r=n_n_ASendReqIS_j1  ) \<or>
(r=n_n_ASendReqSE_j1  ) \<or>
(r=n_n_ASendReqEI_i1  ) \<or>
(r=n_n_ASendReqES_i1  ) \<or>
(r=n_n_SendReqEE_i1  ) \<or>
(r=n_n_ARecvReq_i1  ) \<or>
(r=n_n_ASendInvE_i1  ) \<or>
(r=n_n_ASendInvS_i1  ) \<or>
(r=n_n_ASendInvAck_i1  ) \<or>
(r=n_n_ARecvInvAck_i1  ) \<or>
(r=n_n_ASendGntS_i1  ) \<or>
(r=n_n_ASendGntE_i1  ) \<or>
(r=n_n_ARecvGntS_i1  ) \<or>
(r=n_n_ARecvGntE_i1  )
}"



subsection{*Definitions of a Formally Parameterized Invariant Formulas*}

definition inv__1::"formula" where [simp]:
"inv__1  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E))))"

definition inv__2::"formula" where [simp]:
"inv__2  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const false)) (neg (eqn (IVar (Ident ''MemData'')) (IVar (Ident ''AuxData''))))))"

definition inv__3::"formula" where [simp]:
"inv__3  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const I))) (neg (eqn (IVar (Field (Ident ''Cache_1'') ''Data'')) (IVar (Ident ''AuxData''))))))"

definition inv__4::"formula" where [simp]:
"inv__4  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const false)) (neg (eqn (IVar (Ident ''MemData'')) (IVar (Ident ''AuxData''))))))"

definition inv__5::"formula" where [simp]:
"inv__5  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const I))) (neg (eqn (IVar (Field (Ident ''ACache_1'') ''Data'')) (IVar (Ident ''AuxData''))))))"

definition inv__6::"formula" where [simp]:
"inv__6  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__7::"formula" where [simp]:
"inv__7  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__8::"formula" where [simp]:
"inv__8  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const false)) (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E))))"

definition inv__9::"formula" where [simp]:
"inv__9  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const false)) (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E))))"

definition inv__10::"formula" where [simp]:
"inv__10  \<equiv>
(neg (andForm (andForm (neg (eqn (IVar (Field (Ident ''Chan3_1'') ''Data'')) (IVar (Ident ''AuxData'')))) (eqn (IVar (Ident ''ExGntd'')) (Const true))) (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__11::"formula" where [simp]:
"inv__11  \<equiv>
(neg (andForm (andForm (neg (eqn (IVar (Field (Ident ''AChan3_1'') ''Data'')) (IVar (Ident ''AuxData'')))) (eqn (IVar (Ident ''ExGntd'')) (Const true))) (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__12::"formula" where [simp]:
"inv__12  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const I))) (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E))))"

definition inv__13::"formula" where [simp]:
"inv__13  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''Chan2_1'') ''Data'')) (IVar (Ident ''AuxData'')))) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__14::"formula" where [simp]:
"inv__14  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''Chan2_1'') ''Data'')) (IVar (Ident ''AuxData'')))) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__15::"formula" where [simp]:
"inv__15  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const I))) (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E))))"

definition inv__16::"formula" where [simp]:
"inv__16  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''AChan2_1'') ''Data'')) (IVar (Ident ''AuxData'')))) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__17::"formula" where [simp]:
"inv__17  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''AChan2_1'') ''Data'')) (IVar (Ident ''AuxData'')))) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__18::"formula" where [simp]:
"inv__18  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (eqn (IVar (Ident ''AShrSet_1'')) (Const false))))"

definition inv__19::"formula" where [simp]:
"inv__19  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__20::"formula" where [simp]:
"inv__20  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E))))"

definition inv__21::"formula" where [simp]:
"inv__21  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E))))"

definition inv__22::"formula" where [simp]:
"inv__22  \<equiv>
(neg (andForm (andForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (neg (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)))) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__23::"formula" where [simp]:
"inv__23  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Ident ''ShrSet_1'')) (Const false))))"

definition inv__24::"formula" where [simp]:
"inv__24  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E))))"

definition inv__25::"formula" where [simp]:
"inv__25  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E))))"

definition inv__26::"formula" where [simp]:
"inv__26  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Ident ''AShrSet_1'')) (Const false))))"

definition inv__27::"formula" where [simp]:
"inv__27  \<equiv>
(neg (andForm (andForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (neg (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)))) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__28::"formula" where [simp]:
"inv__28  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const false)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__29::"formula" where [simp]:
"inv__29  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const false)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__30::"formula" where [simp]:
"inv__30  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__31::"formula" where [simp]:
"inv__31  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const I))) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__32::"formula" where [simp]:
"inv__32  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntS)) (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E))))"

definition inv__33::"formula" where [simp]:
"inv__33  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE)) (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E))))"

definition inv__34::"formula" where [simp]:
"inv__34  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const I))) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__35::"formula" where [simp]:
"inv__35  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__36::"formula" where [simp]:
"inv__36  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS)) (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E))))"

definition inv__37::"formula" where [simp]:
"inv__37  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE)) (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E))))"

definition inv__38::"formula" where [simp]:
"inv__38  \<equiv>
(neg (andForm (eqn (IVar (Ident ''AShrSet_1'')) (Const false)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__39::"formula" where [simp]:
"inv__39  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__40::"formula" where [simp]:
"inv__40  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__41::"formula" where [simp]:
"inv__41  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__42::"formula" where [simp]:
"inv__42  \<equiv>
(neg (andForm (andForm (andForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (neg (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)))) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Empty))) (eqn (IVar (Ident ''InvSet_1'')) (Const true))))"

definition inv__43::"formula" where [simp]:
"inv__43  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Ident ''ShrSet_1'')) (Const false))))"

definition inv__44::"formula" where [simp]:
"inv__44  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__45::"formula" where [simp]:
"inv__45  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__46::"formula" where [simp]:
"inv__46  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__47::"formula" where [simp]:
"inv__47  \<equiv>
(neg (andForm (eqn (IVar (Ident ''AShrSet_1'')) (Const false)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__48::"formula" where [simp]:
"inv__48  \<equiv>
(neg (andForm (andForm (andForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (neg (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)))) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Empty))) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))))"

definition inv__49::"formula" where [simp]:
"inv__49  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntS)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__50::"formula" where [simp]:
"inv__50  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const I))) (eqn (IVar (Ident ''ShrSet_1'')) (Const false))))"

definition inv__51::"formula" where [simp]:
"inv__51  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const I))) (eqn (IVar (Ident ''AShrSet_1'')) (Const false))))"

definition inv__52::"formula" where [simp]:
"inv__52  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__53::"formula" where [simp]:
"inv__53  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (eqn (IVar (Ident ''InvSet_1'')) (Const true))))"

definition inv__54::"formula" where [simp]:
"inv__54  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__55::"formula" where [simp]:
"inv__55  \<equiv>
(neg (andForm (andForm (andForm (andForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (neg (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)))) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Empty))) (eqn (IVar (Ident ''ShrSet_1'')) (Const true))) (eqn (IVar (Ident ''CurCmd'')) (Const Empty))))"

definition inv__56::"formula" where [simp]:
"inv__56  \<equiv>
(neg (andForm (eqn (IVar (Ident ''InvSet_1'')) (Const true)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__57::"formula" where [simp]:
"inv__57  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__58::"formula" where [simp]:
"inv__58  \<equiv>
(neg (andForm (eqn (IVar (Ident ''InvSet_1'')) (Const true)) (eqn (IVar (Ident ''ShrSet_1'')) (Const false))))"

definition inv__59::"formula" where [simp]:
"inv__59  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__60::"formula" where [simp]:
"inv__60  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__61::"formula" where [simp]:
"inv__61  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))))"

definition inv__62::"formula" where [simp]:
"inv__62  \<equiv>
(neg (andForm (eqn (IVar (Ident ''AShrSet_1'')) (Const false)) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))))"

definition inv__63::"formula" where [simp]:
"inv__63  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__64::"formula" where [simp]:
"inv__64  \<equiv>
(neg (andForm (andForm (andForm (andForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (neg (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)))) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Empty))) (eqn (IVar (Ident ''AShrSet_1'')) (Const true))) (eqn (IVar (Ident ''CurCmd'')) (Const Empty))))"

definition inv__65::"formula" where [simp]:
"inv__65  \<equiv>
(neg (andForm (eqn (IVar (Ident ''AInvSet_1'')) (Const true)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__66::"formula" where [simp]:
"inv__66  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const true)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__67::"formula" where [simp]:
"inv__67  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntS)) (eqn (IVar (Ident ''ShrSet_1'')) (Const false))))"

definition inv__68::"formula" where [simp]:
"inv__68  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const I))) (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__69::"formula" where [simp]:
"inv__69  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ShrSet_1'')) (Const false)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__70::"formula" where [simp]:
"inv__70  \<equiv>
(neg (andForm (neg (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const I))) (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__71::"formula" where [simp]:
"inv__71  \<equiv>
(neg (andForm (eqn (IVar (Ident ''AShrSet_1'')) (Const false)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__72::"formula" where [simp]:
"inv__72  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const E)) (eqn (IVar (Ident ''ShrSet_1'')) (Const true))))"

definition inv__73::"formula" where [simp]:
"inv__73  \<equiv>
(neg (andForm (eqn (IVar (Ident ''InvSet_1'')) (Const true)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__74::"formula" where [simp]:
"inv__74  \<equiv>
(neg (andForm (eqn (IVar (Ident ''CurCmd'')) (Const Empty)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__75::"formula" where [simp]:
"inv__75  \<equiv>
(neg (andForm (eqn (IVar (Ident ''InvSet_1'')) (Const true)) (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__76::"formula" where [simp]:
"inv__76  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE)) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))))"

definition inv__77::"formula" where [simp]:
"inv__77  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const E)) (eqn (IVar (Ident ''AShrSet_1'')) (Const true))))"

definition inv__78::"formula" where [simp]:
"inv__78  \<equiv>
(neg (andForm (eqn (IVar (Ident ''AInvSet_1'')) (Const true)) (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__79::"formula" where [simp]:
"inv__79  \<equiv>
(neg (andForm (eqn (IVar (Ident ''CurCmd'')) (Const Empty)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__80::"formula" where [simp]:
"inv__80  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntS)) (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__81::"formula" where [simp]:
"inv__81  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS))))"

definition inv__82::"formula" where [simp]:
"inv__82  \<equiv>
(neg (andForm (eqn (IVar (Ident ''ShrSet_1'')) (Const true)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntE))))"

definition inv__83::"formula" where [simp]:
"inv__83  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''ExGntd'')) (Const false))))"

definition inv__84::"formula" where [simp]:
"inv__84  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Ident ''CurCmd'')) (Const Empty))))"

definition inv__85::"formula" where [simp]:
"inv__85  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE)) (eqn (IVar (Ident ''AShrSet_1'')) (Const true))))"

definition inv__86::"formula" where [simp]:
"inv__86  \<equiv>
(neg (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Ident ''CurCmd'')) (Const Empty))))"

definition inv__87::"formula" where [simp]:
"inv__87  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''ExGntd'')) (Const false))))"

definition inv__88::"formula" where [simp]:
"inv__88  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''ExGntd'')) (Const false))))"

definition inv__89::"formula" where [simp]:
"inv__89  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''ExGntd'')) (Const false))))"

definition inv__90::"formula" where [simp]:
"inv__90  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__91::"formula" where [simp]:
"inv__91  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__92::"formula" where [simp]:
"inv__92  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck))))"

definition inv__93::"formula" where [simp]:
"inv__93  \<equiv>
(neg (andForm (andForm (eqn (IVar (Ident ''CurCmd'')) (Const ReqS)) (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const InvAck))) (eqn (IVar (Ident ''InvSet_1'')) (Const true))))"

definition inv__94::"formula" where [simp]:
"inv__94  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__95::"formula" where [simp]:
"inv__95  \<equiv>
(neg (andForm (andForm (eqn (IVar (Ident ''CurCmd'')) (Const ReqS)) (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const InvAck))) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))))"

definition inv__96::"formula" where [simp]:
"inv__96  \<equiv>
(neg (andForm (andForm (eqn (IVar (Ident ''CurCmd'')) (Const ReqS)) (eqn (IVar (Ident ''InvSet_1'')) (Const true))) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Inv))))"

definition inv__97::"formula" where [simp]:
"inv__97  \<equiv>
(neg (andForm (andForm (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Inv)) (eqn (IVar (Ident ''CurCmd'')) (Const ReqS))) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))))"

definition inv__98::"formula" where [simp]:
"inv__98  \<equiv>
(neg (andForm (andForm (eqn (IVar (Ident ''InvSet_1'')) (Const true)) (eqn (IVar (Ident ''AInvSet_1'')) (Const true))) (eqn (IVar (Ident ''ExGntd'')) (Const true))))"

definition inv__99::"formula" where [simp]:
"inv__99  \<equiv>
(neg (andForm (andForm (eqn (IVar (Ident ''ShrSet_1'')) (Const true)) (eqn (IVar (Ident ''AShrSet_1'')) (Const true))) (eqn (IVar (Ident ''ExGntd'')) (Const true))))"

subsection{*Definitions of  the Set of Invariant Formula Instances in a $N$-protocol Instance*}
definition invariants::"nat \<Rightarrow> formula set" where [simp]:
"invariants N \<equiv> {f.
(f=inv__1  ) \<or>
(f=inv__2  ) \<or>
(f=inv__3  ) \<or>
(f=inv__4  ) \<or>
(f=inv__5  ) \<or>
(f=inv__6  ) \<or>
(f=inv__7  ) \<or>
(f=inv__8  ) \<or>
(f=inv__9  ) \<or>
(f=inv__10  ) \<or>
(f=inv__11  ) \<or>
(f=inv__12  ) \<or>
(f=inv__13  ) \<or>
(f=inv__14  ) \<or>
(f=inv__15  ) \<or>
(f=inv__16  ) \<or>
(f=inv__17  ) \<or>
(f=inv__18  ) \<or>
(f=inv__19  ) \<or>
(f=inv__20  ) \<or>
(f=inv__21  ) \<or>
(f=inv__22  ) \<or>
(f=inv__23  ) \<or>
(f=inv__24  ) \<or>
(f=inv__25  ) \<or>
(f=inv__26  ) \<or>
(f=inv__27  ) \<or>
(f=inv__28  ) \<or>
(f=inv__29  ) \<or>
(f=inv__30  ) \<or>
(f=inv__31  ) \<or>
(f=inv__32  ) \<or>
(f=inv__33  ) \<or>
(f=inv__34  ) \<or>
(f=inv__35  ) \<or>
(f=inv__36  ) \<or>
(f=inv__37  ) \<or>
(f=inv__38  ) \<or>
(f=inv__39  ) \<or>
(f=inv__40  ) \<or>
(f=inv__41  ) \<or>
(f=inv__42  ) \<or>
(f=inv__43  ) \<or>
(f=inv__44  ) \<or>
(f=inv__45  ) \<or>
(f=inv__46  ) \<or>
(f=inv__47  ) \<or>
(f=inv__48  ) \<or>
(f=inv__49  ) \<or>
(f=inv__50  ) \<or>
(f=inv__51  ) \<or>
(f=inv__52  ) \<or>
(f=inv__53  ) \<or>
(f=inv__54  ) \<or>
(f=inv__55  ) \<or>
(f=inv__56  ) \<or>
(f=inv__57  ) \<or>
(f=inv__58  ) \<or>
(f=inv__59  ) \<or>
(f=inv__60  ) \<or>
(f=inv__61  ) \<or>
(f=inv__62  ) \<or>
(f=inv__63  ) \<or>
(f=inv__64  ) \<or>
(f=inv__65  ) \<or>
(f=inv__66  ) \<or>
(f=inv__67  ) \<or>
(f=inv__68  ) \<or>
(f=inv__69  ) \<or>
(f=inv__70  ) \<or>
(f=inv__71  ) \<or>
(f=inv__72  ) \<or>
(f=inv__73  ) \<or>
(f=inv__74  ) \<or>
(f=inv__75  ) \<or>
(f=inv__76  ) \<or>
(f=inv__77  ) \<or>
(f=inv__78  ) \<or>
(f=inv__79  ) \<or>
(f=inv__80  ) \<or>
(f=inv__81  ) \<or>
(f=inv__82  ) \<or>
(f=inv__83  ) \<or>
(f=inv__84  ) \<or>
(f=inv__85  ) \<or>
(f=inv__86  ) \<or>
(f=inv__87  ) \<or>
(f=inv__88  ) \<or>
(f=inv__89  ) \<or>
(f=inv__90  ) \<or>
(f=inv__91  ) \<or>
(f=inv__92  ) \<or>
(f=inv__93  ) \<or>
(f=inv__94  ) \<or>
(f=inv__95  ) \<or>
(f=inv__96  ) \<or>
(f=inv__97  ) \<or>
(f=inv__98  ) \<or>
(f=inv__99  )
}"



subsection{*Definitions of initial states*}

definition initSpec0::"formula" where [simp]:
"initSpec0  \<equiv> (eqn (IVar (Field (Ident ''Chan1_1'') ''Cmd'')) (Const Empty))"

definition initSpec1::"formula" where [simp]:
"initSpec1  \<equiv> (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const Empty))"

definition initSpec2::"formula" where [simp]:
"initSpec2  \<equiv> (eqn (IVar (Field (Ident ''Chan3_1'') ''Cmd'')) (Const Empty))"

definition initSpec3::"formula" where [simp]:
"initSpec3  \<equiv> (eqn (IVar (Field (Ident ''Chan1_1'') ''Data'')) (Const 1))"

definition initSpec4::"formula" where [simp]:
"initSpec4  \<equiv> (eqn (IVar (Field (Ident ''Chan2_1'') ''Data'')) (Const 1))"

definition initSpec5::"formula" where [simp]:
"initSpec5  \<equiv> (eqn (IVar (Field (Ident ''Chan3_1'') ''Data'')) (Const 1))"

definition initSpec6::"formula" where [simp]:
"initSpec6  \<equiv> (eqn (IVar (Field (Ident ''Cache_1'') ''State'')) (Const I))"

definition initSpec7::"formula" where [simp]:
"initSpec7  \<equiv> (eqn (IVar (Field (Ident ''Cache_1'') ''Data'')) (Const 1))"

definition initSpec8::"formula" where [simp]:
"initSpec8  \<equiv> (eqn (IVar (Ident ''ShrSet_1'')) (Const false))"

definition initSpec9::"formula" where [simp]:
"initSpec9  \<equiv> (eqn (IVar (Ident ''InvSet_1'')) (Const false))"

definition initSpec10::"formula" where [simp]:
"initSpec10  \<equiv> (eqn (IVar (Field (Ident ''AChan1_1'') ''Cmd'')) (Const Empty))"

definition initSpec11::"formula" where [simp]:
"initSpec11  \<equiv> (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const Empty))"

definition initSpec12::"formula" where [simp]:
"initSpec12  \<equiv> (eqn (IVar (Field (Ident ''AChan3_1'') ''Cmd'')) (Const Empty))"

definition initSpec13::"formula" where [simp]:
"initSpec13  \<equiv> (eqn (IVar (Field (Ident ''AChan1_1'') ''Data'')) (Const 1))"

definition initSpec14::"formula" where [simp]:
"initSpec14  \<equiv> (eqn (IVar (Field (Ident ''AChan2_1'') ''Data'')) (Const 1))"

definition initSpec15::"formula" where [simp]:
"initSpec15  \<equiv> (eqn (IVar (Field (Ident ''AChan3_1'') ''Data'')) (Const 1))"

definition initSpec16::"formula" where [simp]:
"initSpec16  \<equiv> (eqn (IVar (Field (Ident ''ACache_1'') ''State'')) (Const I))"

definition initSpec17::"formula" where [simp]:
"initSpec17  \<equiv> (eqn (IVar (Field (Ident ''ACache_1'') ''Data'')) (Const 1))"

definition initSpec18::"formula" where [simp]:
"initSpec18  \<equiv> (eqn (IVar (Ident ''AShrSet_1'')) (Const false))"

definition initSpec19::"formula" where [simp]:
"initSpec19  \<equiv> (eqn (IVar (Ident ''AInvSet_1'')) (Const false))"

definition initSpec20::"formula" where [simp]:
"initSpec20  \<equiv> (eqn (IVar (Ident ''CurCmd'')) (Const Empty))"

definition initSpec21::"formula" where [simp]:
"initSpec21  \<equiv> (eqn (IVar (Ident ''ExGntd'')) (Const false))"

definition initSpec22::"formula" where [simp]:
"initSpec22  \<equiv> (eqn (IVar (Ident ''MemData'')) (Const 1))"

definition initSpec23::"formula" where [simp]:
"initSpec23  \<equiv> (eqn (IVar (Ident ''AuxData'')) (Const 1))"

definition allInitSpecs::"nat \<Rightarrow> formula list" where [simp]:
"allInitSpecs N \<equiv> [
(initSpec0 ),
(initSpec1 ),
(initSpec2 ),
(initSpec3 ),
(initSpec4 ),
(initSpec5 ),
(initSpec6 ),
(initSpec7 ),
(initSpec8 ),
(initSpec9 ),
(initSpec10 ),
(initSpec11 ),
(initSpec12 ),
(initSpec13 ),
(initSpec14 ),
(initSpec15 ),
(initSpec16 ),
(initSpec17 ),
(initSpec18 ),
(initSpec19 ),
(initSpec20 ),
(initSpec21 ),
(initSpec22 ),
(initSpec23 )
]"

end
