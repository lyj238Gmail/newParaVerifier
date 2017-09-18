(*  Title:      HOL/Auth/n_mutualExFsm_lemma_inv__4_on_rules.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_mutualExFsm Protocol Case Study*} 

theory n_mutualExFsm_lemma_inv__4_on_rules imports n_mutualExFsm_lemma_on_inv__4
begin
section{*All lemmas on causal relation between inv__4*}
lemma lemma_inv__4_on_rules:
  assumes b1: "r \<in> rules N" and b2: "(\<exists> p__Inv0. p__Inv0\<le>N\<and>f=inv__4  p__Inv0)"
  shows "invHoldForRule s f r (invariants N)"
  proof -
  have c1: "(\<exists> i. i\<le>N\<and>r=n_fsm  i)"
  apply (cut_tac b1, auto) done
    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_fsm  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_fsmVsinv__4) done
    }

  ultimately show "invHoldForRule s f r (invariants N)"
  by satx
qed

end
