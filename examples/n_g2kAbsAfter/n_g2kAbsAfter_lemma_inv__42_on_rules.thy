(*  Title:      HOL/Auth/n_g2kAbsAfter_lemma_inv__42_on_rules.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_g2kAbsAfter Protocol Case Study*} 

theory n_g2kAbsAfter_lemma_inv__42_on_rules imports n_g2kAbsAfter_lemma_on_inv__42
begin
section{*All lemmas on causal relation between inv__42*}
lemma lemma_inv__42_on_rules:
  assumes b1: "r \<in> rules N" and b2: "(f=inv__42  )"
  shows "invHoldForRule s f r (invariants N)"
  proof -
  have c1: "(\<exists> d. d\<le>N\<and>r=n_n_Store_i1  d)\<or>
    (\<exists> d. d\<le>N\<and>r=n_n_AStore_i1  d)\<or>
    (r=n_n_SendReqS_j1  )\<or>
    (r=n_n_SendReqEI_i1  )\<or>
    (r=n_n_SendReqES_i1  )\<or>
    (r=n_n_RecvReq_i1  )\<or>
    (r=n_n_SendInvE_i1  )\<or>
    (r=n_n_SendInvS_i1  )\<or>
    (r=n_n_SendInvAck_i1  )\<or>
    (r=n_n_RecvInvAck_i1  )\<or>
    (r=n_n_SendGntS_i1  )\<or>
    (r=n_n_SendGntE_i1  )\<or>
    (r=n_n_RecvGntS_i1  )\<or>
    (r=n_n_RecvGntE_i1  )\<or>
    (r=n_n_ASendReqIS_j1  )\<or>
    (r=n_n_ASendReqSE_j1  )\<or>
    (r=n_n_ASendReqEI_i1  )\<or>
    (r=n_n_ASendReqES_i1  )\<or>
    (r=n_n_SendReqEE_i1  )\<or>
    (r=n_n_ARecvReq_i1  )\<or>
    (r=n_n_ASendInvE_i1  )\<or>
    (r=n_n_ASendInvS_i1  )\<or>
    (r=n_n_ASendInvAck_i1  )\<or>
    (r=n_n_ARecvInvAck_i1  )\<or>
    (r=n_n_ASendGntS_i1  )\<or>
    (r=n_n_ASendGntE_i1  )\<or>
    (r=n_n_ARecvGntS_i1  )\<or>
    (r=n_n_ARecvGntE_i1  )"
  apply (cut_tac b1, auto) done
    moreover {
      assume d1: "(\<exists> d. d\<le>N\<and>r=n_n_Store_i1  d)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_Store_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(\<exists> d. d\<le>N\<and>r=n_n_AStore_i1  d)"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_AStore_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendReqS_j1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendReqS_j1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendReqEI_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendReqEI_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendReqES_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendReqES_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_RecvReq_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_RecvReq_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendInvE_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendInvE_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendInvS_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendInvS_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendInvAck_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendInvAck_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_RecvInvAck_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_RecvInvAck_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendGntS_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendGntS_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendGntE_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendGntE_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_RecvGntS_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_RecvGntS_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_RecvGntE_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_RecvGntE_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendReqIS_j1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendReqIS_j1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendReqSE_j1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendReqSE_j1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendReqEI_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendReqEI_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendReqES_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendReqES_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_SendReqEE_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_SendReqEE_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ARecvReq_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ARecvReq_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendInvE_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendInvE_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendInvS_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendInvS_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendInvAck_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendInvAck_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ARecvInvAck_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ARecvInvAck_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendGntS_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendGntS_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ASendGntE_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ASendGntE_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ARecvGntS_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ARecvGntS_i1Vsinv__42) done
    }

    moreover {
      assume d1: "(r=n_n_ARecvGntE_i1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis n_n_ARecvGntE_i1Vsinv__42) done
    }

  ultimately show "invHoldForRule s f r (invariants N)"
  by satx
qed

end
