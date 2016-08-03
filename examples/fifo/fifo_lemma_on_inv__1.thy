(*  Title:      HOL/Auth/fifo_lemma_on_inv__1.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The fifo Protocol Case Study*} 

theory fifo_lemma_on_inv__1 imports fifo_base
begin
section{*All lemmas on causal relation between inv__1 and some rule r*}
lemma always_dataIn0_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn0_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn1_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn1_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn2_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn2_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn3_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn3_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn4_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn4_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn5_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn5_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn6_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn6_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn7_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn7_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn8_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn8_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn9_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn9_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn10_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn10_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn11_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn11_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn12_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn12_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn13_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn13_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn14_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn14_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn15_rstTRUE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn15_rstTRUE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn0_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn0_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn1_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn1_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn2_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn2_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn3_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn3_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn4_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn4_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn5_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn5_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn6_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn6_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn7_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn7_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn8_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn8_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn9_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn9_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn10_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn10_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn11_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn11_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn12_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn12_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn13_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn13_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn14_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn14_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn15_rstFALSE_pushTRUE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn15_rstFALSE_pushTRUE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''empty'')) (Const false))) (eqn (IVar (Ident ''tail'')) (Const 15))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn0_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn0_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn1_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn1_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn2_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn2_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn3_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn3_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn4_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn4_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn5_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn5_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn6_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn6_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn7_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn7_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn8_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn8_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn9_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn9_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn10_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn10_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn11_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn11_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn12_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn12_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn13_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn13_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn14_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn14_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn15_rstTRUE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn15_rstTRUE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn0_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn0_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn1_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn1_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn2_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn2_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn3_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn3_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn4_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn4_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn5_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn5_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn6_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn6_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn7_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn7_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn8_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn8_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn9_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn9_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn10_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn10_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn11_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn11_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn12_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn12_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn13_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn13_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn14_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn14_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn15_rstFALSE_pushFALSE_popTRUEVsinv__1:
assumes a1: "(r=always_dataIn15_rstFALSE_pushFALSE_popTRUE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))\<or>((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (eqn (IVar (Ident ''tail'')) (Const 0)) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (neg (eqn (IVar (Ident ''tail'')) (Const 0))) (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (neg (eqn (IVar (Ident ''empty'')) (Const false))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn0_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn0_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn1_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn1_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn2_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn2_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn3_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn3_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn4_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn4_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn5_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn5_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn6_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn6_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn7_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn7_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn8_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn8_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn9_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn9_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn10_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn10_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn11_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn11_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn12_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn12_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn13_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn13_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn14_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn14_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn15_rstTRUE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn15_rstTRUE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn0_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn0_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn1_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn1_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn2_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn2_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn3_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn3_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn4_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn4_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn5_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn5_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn6_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn6_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn7_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn7_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn8_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn8_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn9_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn9_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn10_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn10_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn11_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn11_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn12_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn12_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn13_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn13_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn14_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn14_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn15_rstFALSE_pushTRUE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn15_rstFALSE_pushTRUE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
have "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))\<or>((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))" by auto
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''empty'')) (Const true)) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''empty'')) (Const true))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) (neg (eqn (IVar (Ident ''tail'')) (Const 15)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (eqn (IVar (Ident ''tail'')) (Const 15)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2  c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed

lemma always_dataIn0_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn0_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn1_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn1_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn2_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn2_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn3_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn3_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn4_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn4_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn5_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn5_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn6_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn6_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn7_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn7_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn8_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn8_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn9_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn9_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn10_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn10_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn11_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn11_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn12_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn12_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn13_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn13_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn14_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn14_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn15_rstTRUE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn15_rstTRUE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P1 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn0_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn0_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn1_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn1_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn2_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn2_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn3_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn3_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn4_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn4_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn5_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn5_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn6_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn6_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn7_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn7_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn8_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn8_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn9_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn9_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn10_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn10_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn11_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn11_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn12_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn12_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn13_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn13_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn14_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn14_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed

lemma always_dataIn15_rstFALSE_pushFALSE_popFALSEVsinv__1:
assumes a1: "(r=always_dataIn15_rstFALSE_pushFALSE_popFALSE  )" and
a2: "(f=inv__1  )"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
  have "?P2 s"
  proof(cut_tac a1 a2 , auto) qed
  then show "invHoldForRule s f r (invariants N)" by auto
qed
end
