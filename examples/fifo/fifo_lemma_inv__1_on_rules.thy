(*  Title:      HOL/Auth/fifo_lemma_inv__1_on_rules.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The fifo Protocol Case Study*} 

theory fifo_lemma_inv__1_on_rules imports fifo_lemma_on_inv__1
begin
section{*All lemmas on causal relation between inv__1*}
lemma lemma_inv__1_on_rules:
  assumes b1: "r \<in> rules N" and b2: "(f=inv__1  )"
  shows "invHoldForRule s f r (invariants N)"
  proof -
  have c1: "(r=always_dataIn0_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn1_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn2_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn3_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn4_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn5_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn6_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn7_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn8_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn9_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn10_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn11_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn12_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn13_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn14_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn15_rstTRUE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn0_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn1_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn2_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn3_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn4_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn5_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn6_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn7_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn8_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn9_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn10_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn11_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn12_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn13_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn14_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn15_rstFALSE_pushTRUE_popTRUE  )\<or>
    (r=always_dataIn0_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn1_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn2_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn3_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn4_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn5_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn6_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn7_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn8_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn9_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn10_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn11_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn12_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn13_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn14_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn15_rstTRUE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn0_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn1_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn2_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn3_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn4_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn5_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn6_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn7_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn8_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn9_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn10_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn11_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn12_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn13_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn14_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn15_rstFALSE_pushFALSE_popTRUE  )\<or>
    (r=always_dataIn0_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn1_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn2_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn3_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn4_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn5_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn6_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn7_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn8_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn9_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn10_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn11_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn12_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn13_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn14_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn15_rstTRUE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn0_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn1_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn2_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn3_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn4_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn5_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn6_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn7_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn8_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn9_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn10_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn11_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn12_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn13_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn14_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn15_rstFALSE_pushTRUE_popFALSE  )\<or>
    (r=always_dataIn0_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn1_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn2_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn3_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn4_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn5_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn6_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn7_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn8_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn9_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn10_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn11_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn12_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn13_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn14_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn15_rstTRUE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn0_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn1_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn2_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn3_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn4_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn5_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn6_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn7_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn8_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn9_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn10_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn11_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn12_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn13_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn14_rstFALSE_pushFALSE_popFALSE  )\<or>
    (r=always_dataIn15_rstFALSE_pushFALSE_popFALSE  )"
  apply (cut_tac b1, auto) done
    moreover {
      assume d1: "(r=always_dataIn0_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn0_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn1_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn1_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn2_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn2_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn3_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn3_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn4_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn4_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn5_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn5_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn6_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn6_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn7_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn7_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn8_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn8_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn9_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn9_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn10_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn10_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn11_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn11_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn12_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn12_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn13_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn13_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn14_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn14_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn15_rstTRUE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn15_rstTRUE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn0_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn0_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn1_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn1_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn2_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn2_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn3_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn3_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn4_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn4_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn5_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn5_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn6_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn6_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn7_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn7_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn8_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn8_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn9_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn9_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn10_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn10_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn11_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn11_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn12_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn12_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn13_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn13_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn14_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn14_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn15_rstFALSE_pushTRUE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn15_rstFALSE_pushTRUE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn0_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn0_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn1_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn1_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn2_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn2_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn3_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn3_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn4_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn4_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn5_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn5_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn6_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn6_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn7_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn7_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn8_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn8_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn9_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn9_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn10_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn10_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn11_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn11_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn12_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn12_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn13_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn13_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn14_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn14_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn15_rstTRUE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn15_rstTRUE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn0_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn0_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn1_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn1_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn2_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn2_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn3_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn3_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn4_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn4_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn5_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn5_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn6_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn6_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn7_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn7_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn8_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn8_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn9_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn9_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn10_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn10_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn11_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn11_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn12_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn12_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn13_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn13_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn14_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn14_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn15_rstFALSE_pushFALSE_popTRUE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn15_rstFALSE_pushFALSE_popTRUEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn0_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn0_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn1_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn1_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn2_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn2_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn3_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn3_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn4_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn4_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn5_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn5_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn6_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn6_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn7_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn7_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn8_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn8_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn9_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn9_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn10_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn10_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn11_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn11_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn12_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn12_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn13_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn13_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn14_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn14_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn15_rstTRUE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn15_rstTRUE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn0_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn0_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn1_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn1_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn2_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn2_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn3_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn3_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn4_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn4_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn5_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn5_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn6_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn6_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn7_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn7_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn8_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn8_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn9_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn9_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn10_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn10_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn11_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn11_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn12_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn12_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn13_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn13_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn14_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn14_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn15_rstFALSE_pushTRUE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn15_rstFALSE_pushTRUE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn0_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn0_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn1_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn1_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn2_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn2_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn3_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn3_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn4_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn4_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn5_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn5_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn6_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn6_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn7_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn7_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn8_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn8_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn9_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn9_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn10_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn10_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn11_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn11_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn12_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn12_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn13_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn13_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn14_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn14_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn15_rstTRUE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn15_rstTRUE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn0_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn0_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn1_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn1_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn2_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn2_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn3_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn3_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn4_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn4_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn5_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn5_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn6_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn6_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn7_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn7_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn8_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn8_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn9_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn9_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn10_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn10_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn11_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn11_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn12_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn12_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn13_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn13_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn14_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn14_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

    moreover {
      assume d1: "(r=always_dataIn15_rstFALSE_pushFALSE_popFALSE  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac b2 d1, metis always_dataIn15_rstFALSE_pushFALSE_popFALSEVsinv__1) done
    }

  ultimately show "invHoldForRule s f r (invariants N)"
  by satx
qed

end
