(*  Title:      HOL/Auth/n_germanSimp_lemma_on_inv__3.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_germanSimp Protocol Case Study*} 

theory n_germanSimp_lemma_on_inv__3 imports n_germanSimp_base
begin
section{*All lemmas on causal relation between inv__3 and some rule r*}
lemma n_StoreVsinv__3:
assumes a1: "(\<exists> i d. i\<le>N\<and>d\<le>N\<and>r=n_Store  i d)" and
a2: "(f=inv__3  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
from a1 obtain i d where a1:"i\<le>N\<and>d\<le>N\<and>r=n_Store  i d" apply fastforce done
  have "?P3 s"
  apply (cut_tac a1 a2 , simp, rule_tac x="(neg (andForm (eqn (IVar (Ident ''ExGntd'')) (Const false)) (eqn (IVar (Field (Para (Ident ''Cache'') i) ''State'')) (Const E))))" in exI, auto) done
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_RecvInvAckVsinv__3:
assumes a1: "(\<exists> i. i\<le>N\<and>r=n_RecvInvAck  i)" and
a2: "(f=inv__3  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
from a1 obtain i where a1:"i\<le>N\<and>r=n_RecvInvAck  i" apply fastforce done
have "((formEval (eqn (IVar (Ident ''ExGntd'')) (Const true)) s))\<or>((formEval (neg (eqn (IVar (Ident ''ExGntd'')) (Const true))) s))" by auto
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''ExGntd'')) (Const true)) s))"
    have "?P3 s"
    apply (cut_tac a1 a2  c1, simp, rule_tac x="(neg (andForm (andForm (neg (eqn (IVar (Field (Para (Ident ''Chan3'') i) ''Data'')) (IVar (Ident ''AuxData'')))) (eqn (IVar (Ident ''ExGntd'')) (Const true))) (eqn (IVar (Field (Para (Ident ''Chan3'') i) ''Cmd'')) (Const InvAck))))" in exI, auto) done
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''ExGntd'')) (Const true))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma n_SendGntEVsinv__3:
assumes a1: "(\<exists> i. i\<le>N\<and>r=n_SendGntE N i)" and
a2: "(f=inv__3  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
from a1 obtain i where a1:"i\<le>N\<and>r=n_SendGntE N i" apply fastforce done
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma n_RecvGntSVsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_RecvGntS  i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_SendGntSVsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_SendGntS  i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_RecvReqE__part__0Vsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_RecvReqE__part__0 N i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_RecvGntEVsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_RecvGntE  i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_SendInvAckVsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_SendInvAck  i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_SendInv__part__0Vsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_SendInv__part__0  i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_SendInv__part__1Vsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_SendInv__part__1  i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_RecvReqE__part__1Vsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_RecvReqE__part__1 N i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  

lemma n_RecvReqSVsinv__3:
  assumes a1: "\<exists> i. i\<le>N\<and>r=n_RecvReqS N i" and
  a2: "(f=inv__3  )"
  shows "invHoldForRule s f r (invariants N)"
  apply (rule noEffectOnRule, cut_tac a1 a2, auto) done
  
end
