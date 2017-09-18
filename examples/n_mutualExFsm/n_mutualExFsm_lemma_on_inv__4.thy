(*  Title:      HOL/Auth/n_mutualExFsm_lemma_on_inv__4.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_mutualExFsm Protocol Case Study*} 

theory n_mutualExFsm_lemma_on_inv__4 imports n_mutualExFsm_base
begin
section{*All lemmas on causal relation between inv__4 and some rule r*}
lemma n_fsmVsinv__4:
assumes a1: "(\<exists> i. i\<le>N\<and>r=n_fsm  i)" and
a2: "(\<exists> p__Inv0. p__Inv0\<le>N\<and>f=inv__4  p__Inv0)"
shows "invHoldForRule s f r (invariants N)" (is "?P1 s \<or> ?P2 s \<or> ?P3 s")
proof -
from a1 obtain i where a1:"i\<le>N\<and>r=n_fsm  i" apply fastforce done
from a2 obtain p__Inv0 where a2:"p__Inv0\<le>N\<and>f=inv__4  p__Inv0" apply fastforce done
have "(i=p__Inv0)\<or>(i~=p__Inv0)" apply (cut_tac a1 a2, auto) done
moreover {
  assume b1: "(i=p__Inv0)"
  have "((formEval (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)) s))\<or>((formEval (andForm (andForm (eqn (IVar (Ident ''x'')) (Const true)) (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''x'')) (Const true))) (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) s))\<or>((formEval (andForm (andForm (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const C)) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const C))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) s))" by auto
  moreover {
    assume c1: "((formEval (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)) s))"
    have "?P1 s"
    proof(cut_tac a1 a2 b1 c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''x'')) (Const true)) (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2 b1 c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''x'')) (Const true))) (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2 b1 c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const C)) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) s))"
    have "?P3 s"
    apply (cut_tac a1 a2 b1 c1, simp, rule_tac x="(neg (andForm (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const C)) (eqn (IVar (Ident ''x'')) (Const true))))" in exI, auto) done
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const C))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2 b1 c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  ultimately have "invHoldForRule s f r (invariants N)" by satx
}
moreover {
  assume b1: "(i~=p__Inv0)"
  have "((formEval (eqn (IVar (Para (Ident ''n'') i)) (Const I)) s))\<or>((formEval (andForm (andForm (eqn (IVar (Ident ''x'')) (Const true)) (eqn (IVar (Para (Ident ''n'') i)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Ident ''x'')) (Const true))) (eqn (IVar (Para (Ident ''n'') i)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))) s))\<or>((formEval (andForm (andForm (eqn (IVar (Para (Ident ''n'') i)) (Const C)) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))) s))\<or>((formEval (andForm (andForm (neg (eqn (IVar (Para (Ident ''n'') i)) (Const C))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))) s))" by auto
  moreover {
    assume c1: "((formEval (eqn (IVar (Para (Ident ''n'') i)) (Const I)) s))"
    have "?P2 s"
    proof(cut_tac a1 a2 b1 c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Ident ''x'')) (Const true)) (eqn (IVar (Para (Ident ''n'') i)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))) s))"
    have "?P1 s"
    proof(cut_tac a1 a2 b1 c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Ident ''x'')) (Const true))) (eqn (IVar (Para (Ident ''n'') i)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2 b1 c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (eqn (IVar (Para (Ident ''n'') i)) (Const C)) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))) s))"
    have "?P2 s"
    proof(cut_tac a1 a2 b1 c1, auto) qed
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  moreover {
    assume c1: "((formEval (andForm (andForm (neg (eqn (IVar (Para (Ident ''n'') i)) (Const C))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))) s))"
    have "?P3 s"
    apply (cut_tac a1 a2 b1 c1, simp, rule_tac x="(neg (andForm (andForm (andForm (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const T))) (neg (eqn (IVar (Para (Ident ''n'') p__Inv0)) (Const I)))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const T)))) (neg (eqn (IVar (Para (Ident ''n'') i)) (Const I)))))" in exI, auto) done
    then have "invHoldForRule s f r (invariants N)" by auto
  }
  ultimately have "invHoldForRule s f r (invariants N)" by satx
}
ultimately show "invHoldForRule s f r (invariants N)" by satx
qed
end
