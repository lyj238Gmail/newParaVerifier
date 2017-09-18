(*  Title:      HOL/Auth/n_g2kAbsAfter_lemma_on_inv__52.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_g2kAbsAfter Protocol Case Study*} 

theory n_g2kAbsAfter_lemma_on_inv__52 imports n_g2kAbsAfter_base
begin
section{*All lemmas on causal relation between inv__52 and some rule r*}
lemma n_n_SendInvE_i1Vsinv__52:
assumes a1: "(r=n_n_SendInvE_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_SendInvS_i1Vsinv__52:
assumes a1: "(r=n_n_SendInvS_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_SendInvAck_i1Vsinv__52:
assumes a1: "(r=n_n_SendInvAck_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_SendGntS_i1Vsinv__52:
assumes a1: "(r=n_n_SendGntS_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_SendGntE_i1Vsinv__52:
assumes a1: "(r=n_n_SendGntE_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P3 s"
  apply (cut_tac a1 a2 , simp, rule_tac x="(neg (andForm (eqn (IVar (Ident ''AShrSet_1'')) (Const false)) (eqn (IVar (Field (Ident ''AChan2_1'') ''Cmd'')) (Const GntS))))" in exI, auto) done
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_RecvGntS_i1Vsinv__52:
assumes a1: "(r=n_n_RecvGntS_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_RecvGntE_i1Vsinv__52:
assumes a1: "(r=n_n_RecvGntE_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_ASendInvE_i1Vsinv__52:
assumes a1: "(r=n_n_ASendInvE_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_ASendInvS_i1Vsinv__52:
assumes a1: "(r=n_n_ASendInvS_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_ASendInvAck_i1Vsinv__52:
assumes a1: "(r=n_n_ASendInvAck_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_ASendGntS_i1Vsinv__52:
assumes a1: "(r=n_n_ASendGntS_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P3 s"
  apply (cut_tac a1 a2 , simp, rule_tac x="(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const false)) (eqn (IVar (Field (Ident ''Chan2_1'') ''Cmd'')) (Const GntE))))" in exI, auto) done
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_ASendGntE_i1Vsinv__52:
assumes a1: "(r=n_n_ASendGntE_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_ARecvGntS_i1Vsinv__52:
assumes a1: "(r=n_n_ARecvGntS_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_ARecvGntE_i1Vsinv__52:
assumes a1: "(r=n_n_ARecvGntE_i1  )" and
a2: "(f=inv__52  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_n_RecvReq_i1Vsinv__52:
  assumes a1: "r=n_n_RecvReq_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_SendReqEI_i1Vsinv__52:
  assumes a1: "r=n_n_SendReqEI_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_ASendReqEI_i1Vsinv__52:
  assumes a1: "r=n_n_ASendReqEI_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_ASendReqIS_j1Vsinv__52:
  assumes a1: "r=n_n_ASendReqIS_j1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_ASendReqES_i1Vsinv__52:
  assumes a1: "r=n_n_ASendReqES_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_SendReqES_i1Vsinv__52:
  assumes a1: "r=n_n_SendReqES_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_ASendReqSE_j1Vsinv__52:
  assumes a1: "r=n_n_ASendReqSE_j1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_SendReqEE_i1Vsinv__52:
  assumes a1: "r=n_n_SendReqEE_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_RecvInvAck_i1Vsinv__52:
  assumes a1: "r=n_n_RecvInvAck_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_ARecvReq_i1Vsinv__52:
  assumes a1: "r=n_n_ARecvReq_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_Store_i1Vsinv__52:
  assumes a1: "\<exists> d. d\<le>N\<and>r=n_n_Store_i1  d" and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_AStore_i1Vsinv__52:
  assumes a1: "\<exists> d. d\<le>N\<and>r=n_n_AStore_i1  d" and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_SendReqS_j1Vsinv__52:
  assumes a1: "r=n_n_SendReqS_j1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_n_ARecvInvAck_i1Vsinv__52:
  assumes a1: "r=n_n_ARecvInvAck_i1  " and
  a2: "(f=inv__52  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  
end
