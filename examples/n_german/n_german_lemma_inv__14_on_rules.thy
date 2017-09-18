(*  Title:      HOL/Auth/n_german_lemma_inv__14_on_rules.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_german Protocol Case Study*} 

theory n_german_lemma_inv__14_on_rules imports n_german_lemma_on_inv__14
begin
section{*All lemmas on causal relation between inv__14*}
lemma lemma_inv__14_on_rules:
  assumes b1: "r \<in> rules N" and b2: "(\<exists> p__Inv1 p__Inv2. p__Inv1\<le>N\<and>p__Inv2\<le>N\<and>p__Inv1~=p__Inv2\<and>f=inv__14  p__Inv1 p__Inv2)"
  shows "invHoldForRule s f r (invariants N)"
  proof -
  have c1: "(\<exists> i d. i\<le>N\<and>d\<le>N\<and>r=n_Store  i d)\<or>
    (\<exists> i. i\<le>N\<and>r=n_SendReqS  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_SendReqE__part__0  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_SendReqE__part__1  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_RecvReqS N i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_RecvReqE N i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_SendInv__part__0  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_SendInv__part__1  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_SendInvAck  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_RecvInvAck  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_SendGntS  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_SendGntE N i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_RecvGntS  i)\<or>
    (\<exists> i. i\<le>N\<and>r=n_RecvGntE  i)"
  apply (cut_tac b1, auto) done
    moreover {
      assume d1: "(\<exists> i d. i\<le>N\<and>d\<le>N\<and>r=n_Store  i d)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_StoreVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_SendReqS  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_SendReqSVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_SendReqE__part__0  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_SendReqE__part__0Vsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_SendReqE__part__1  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_SendReqE__part__1Vsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_RecvReqS N i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_RecvReqSVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_RecvReqE N i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_RecvReqEVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_SendInv__part__0  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_SendInv__part__0Vsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_SendInv__part__1  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_SendInv__part__1Vsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_SendInvAck  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_SendInvAckVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_RecvInvAck  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_RecvInvAckVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_SendGntS  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_SendGntSVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_SendGntE N i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_SendGntEVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_RecvGntS  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_RecvGntSVsinv__14) done
    }

    moreover {
      assume d1: "(\<exists> i. i\<le>N\<and>r=n_RecvGntE  i)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_RecvGntEVsinv__14) done
    }

  ultimately show "invHoldForRule s f r (invariants N)"
  by satx
qed

end
