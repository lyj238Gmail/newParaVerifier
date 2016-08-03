(*  Title:      HOL/Auth/fifo_lemma_invs_on_rules.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The fifo Protocol Case Study*} 

theory fifo_lemma_invs_on_rules imports fifo_lemma_inv__1_on_rules
begin
lemma invs_on_rules:
  assumes a1: "f \<in> invariants N" and a2: "r \<in> rules N"
  shows "invHoldForRule s f r (invariants N)"
  proof -
  have b1: "(f=inv__1  )"
  apply (cut_tac a1, auto) done
    moreover {
      assume c1: "(f=inv__1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__1_on_rules) done
    }

  ultimately show "invHoldForRule s f r (invariants N)"
  by satx
qed

end
