(*  Title:      HOL/Auth/n_g2kAbsAfter_lemma_invs_on_rules.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_g2kAbsAfter Protocol Case Study*} 

theory n_g2kAbsAfter_lemma_invs_on_rules imports n_g2kAbsAfter_lemma_inv__1_on_rules n_g2kAbsAfter_lemma_inv__2_on_rules n_g2kAbsAfter_lemma_inv__3_on_rules n_g2kAbsAfter_lemma_inv__4_on_rules n_g2kAbsAfter_lemma_inv__5_on_rules n_g2kAbsAfter_lemma_inv__6_on_rules n_g2kAbsAfter_lemma_inv__7_on_rules n_g2kAbsAfter_lemma_inv__8_on_rules n_g2kAbsAfter_lemma_inv__9_on_rules n_g2kAbsAfter_lemma_inv__10_on_rules n_g2kAbsAfter_lemma_inv__11_on_rules n_g2kAbsAfter_lemma_inv__12_on_rules n_g2kAbsAfter_lemma_inv__13_on_rules n_g2kAbsAfter_lemma_inv__14_on_rules n_g2kAbsAfter_lemma_inv__15_on_rules n_g2kAbsAfter_lemma_inv__16_on_rules n_g2kAbsAfter_lemma_inv__17_on_rules n_g2kAbsAfter_lemma_inv__18_on_rules n_g2kAbsAfter_lemma_inv__19_on_rules n_g2kAbsAfter_lemma_inv__20_on_rules n_g2kAbsAfter_lemma_inv__21_on_rules n_g2kAbsAfter_lemma_inv__22_on_rules n_g2kAbsAfter_lemma_inv__23_on_rules n_g2kAbsAfter_lemma_inv__24_on_rules n_g2kAbsAfter_lemma_inv__25_on_rules n_g2kAbsAfter_lemma_inv__26_on_rules n_g2kAbsAfter_lemma_inv__27_on_rules n_g2kAbsAfter_lemma_inv__28_on_rules n_g2kAbsAfter_lemma_inv__29_on_rules n_g2kAbsAfter_lemma_inv__30_on_rules n_g2kAbsAfter_lemma_inv__31_on_rules n_g2kAbsAfter_lemma_inv__32_on_rules n_g2kAbsAfter_lemma_inv__33_on_rules n_g2kAbsAfter_lemma_inv__34_on_rules n_g2kAbsAfter_lemma_inv__35_on_rules n_g2kAbsAfter_lemma_inv__36_on_rules n_g2kAbsAfter_lemma_inv__37_on_rules n_g2kAbsAfter_lemma_inv__38_on_rules n_g2kAbsAfter_lemma_inv__39_on_rules n_g2kAbsAfter_lemma_inv__40_on_rules n_g2kAbsAfter_lemma_inv__41_on_rules n_g2kAbsAfter_lemma_inv__42_on_rules n_g2kAbsAfter_lemma_inv__43_on_rules n_g2kAbsAfter_lemma_inv__44_on_rules n_g2kAbsAfter_lemma_inv__45_on_rules n_g2kAbsAfter_lemma_inv__46_on_rules n_g2kAbsAfter_lemma_inv__47_on_rules n_g2kAbsAfter_lemma_inv__48_on_rules n_g2kAbsAfter_lemma_inv__49_on_rules n_g2kAbsAfter_lemma_inv__50_on_rules n_g2kAbsAfter_lemma_inv__51_on_rules n_g2kAbsAfter_lemma_inv__52_on_rules n_g2kAbsAfter_lemma_inv__53_on_rules n_g2kAbsAfter_lemma_inv__54_on_rules n_g2kAbsAfter_lemma_inv__55_on_rules n_g2kAbsAfter_lemma_inv__56_on_rules n_g2kAbsAfter_lemma_inv__57_on_rules n_g2kAbsAfter_lemma_inv__58_on_rules n_g2kAbsAfter_lemma_inv__59_on_rules n_g2kAbsAfter_lemma_inv__60_on_rules n_g2kAbsAfter_lemma_inv__61_on_rules n_g2kAbsAfter_lemma_inv__62_on_rules n_g2kAbsAfter_lemma_inv__63_on_rules n_g2kAbsAfter_lemma_inv__64_on_rules n_g2kAbsAfter_lemma_inv__65_on_rules n_g2kAbsAfter_lemma_inv__66_on_rules n_g2kAbsAfter_lemma_inv__67_on_rules n_g2kAbsAfter_lemma_inv__68_on_rules n_g2kAbsAfter_lemma_inv__69_on_rules n_g2kAbsAfter_lemma_inv__70_on_rules n_g2kAbsAfter_lemma_inv__71_on_rules n_g2kAbsAfter_lemma_inv__72_on_rules n_g2kAbsAfter_lemma_inv__73_on_rules n_g2kAbsAfter_lemma_inv__74_on_rules n_g2kAbsAfter_lemma_inv__75_on_rules n_g2kAbsAfter_lemma_inv__76_on_rules n_g2kAbsAfter_lemma_inv__77_on_rules n_g2kAbsAfter_lemma_inv__78_on_rules n_g2kAbsAfter_lemma_inv__79_on_rules n_g2kAbsAfter_lemma_inv__80_on_rules n_g2kAbsAfter_lemma_inv__81_on_rules n_g2kAbsAfter_lemma_inv__82_on_rules n_g2kAbsAfter_lemma_inv__83_on_rules n_g2kAbsAfter_lemma_inv__84_on_rules n_g2kAbsAfter_lemma_inv__85_on_rules n_g2kAbsAfter_lemma_inv__86_on_rules n_g2kAbsAfter_lemma_inv__87_on_rules n_g2kAbsAfter_lemma_inv__88_on_rules n_g2kAbsAfter_lemma_inv__89_on_rules n_g2kAbsAfter_lemma_inv__90_on_rules n_g2kAbsAfter_lemma_inv__91_on_rules n_g2kAbsAfter_lemma_inv__92_on_rules n_g2kAbsAfter_lemma_inv__93_on_rules n_g2kAbsAfter_lemma_inv__94_on_rules n_g2kAbsAfter_lemma_inv__95_on_rules n_g2kAbsAfter_lemma_inv__96_on_rules n_g2kAbsAfter_lemma_inv__97_on_rules n_g2kAbsAfter_lemma_inv__98_on_rules n_g2kAbsAfter_lemma_inv__99_on_rules
begin
lemma invs_on_rules:
  assumes a1: "f \<in> invariants N" and a2: "r \<in> rules N"
  shows "invHoldForRule s f r (invariants N)"
  proof -
  have b1: "(f=inv__1  )\<or>
    (f=inv__2  )\<or>
    (f=inv__3  )\<or>
    (f=inv__4  )\<or>
    (f=inv__5  )\<or>
    (f=inv__6  )\<or>
    (f=inv__7  )\<or>
    (f=inv__8  )\<or>
    (f=inv__9  )\<or>
    (f=inv__10  )\<or>
    (f=inv__11  )\<or>
    (f=inv__12  )\<or>
    (f=inv__13  )\<or>
    (f=inv__14  )\<or>
    (f=inv__15  )\<or>
    (f=inv__16  )\<or>
    (f=inv__17  )\<or>
    (f=inv__18  )\<or>
    (f=inv__19  )\<or>
    (f=inv__20  )\<or>
    (f=inv__21  )\<or>
    (f=inv__22  )\<or>
    (f=inv__23  )\<or>
    (f=inv__24  )\<or>
    (f=inv__25  )\<or>
    (f=inv__26  )\<or>
    (f=inv__27  )\<or>
    (f=inv__28  )\<or>
    (f=inv__29  )\<or>
    (f=inv__30  )\<or>
    (f=inv__31  )\<or>
    (f=inv__32  )\<or>
    (f=inv__33  )\<or>
    (f=inv__34  )\<or>
    (f=inv__35  )\<or>
    (f=inv__36  )\<or>
    (f=inv__37  )\<or>
    (f=inv__38  )\<or>
    (f=inv__39  )\<or>
    (f=inv__40  )\<or>
    (f=inv__41  )\<or>
    (f=inv__42  )\<or>
    (f=inv__43  )\<or>
    (f=inv__44  )\<or>
    (f=inv__45  )\<or>
    (f=inv__46  )\<or>
    (f=inv__47  )\<or>
    (f=inv__48  )\<or>
    (f=inv__49  )\<or>
    (f=inv__50  )\<or>
    (f=inv__51  )\<or>
    (f=inv__52  )\<or>
    (f=inv__53  )\<or>
    (f=inv__54  )\<or>
    (f=inv__55  )\<or>
    (f=inv__56  )\<or>
    (f=inv__57  )\<or>
    (f=inv__58  )\<or>
    (f=inv__59  )\<or>
    (f=inv__60  )\<or>
    (f=inv__61  )\<or>
    (f=inv__62  )\<or>
    (f=inv__63  )\<or>
    (f=inv__64  )\<or>
    (f=inv__65  )\<or>
    (f=inv__66  )\<or>
    (f=inv__67  )\<or>
    (f=inv__68  )\<or>
    (f=inv__69  )\<or>
    (f=inv__70  )\<or>
    (f=inv__71  )\<or>
    (f=inv__72  )\<or>
    (f=inv__73  )\<or>
    (f=inv__74  )\<or>
    (f=inv__75  )\<or>
    (f=inv__76  )\<or>
    (f=inv__77  )\<or>
    (f=inv__78  )\<or>
    (f=inv__79  )\<or>
    (f=inv__80  )\<or>
    (f=inv__81  )\<or>
    (f=inv__82  )\<or>
    (f=inv__83  )\<or>
    (f=inv__84  )\<or>
    (f=inv__85  )\<or>
    (f=inv__86  )\<or>
    (f=inv__87  )\<or>
    (f=inv__88  )\<or>
    (f=inv__89  )\<or>
    (f=inv__90  )\<or>
    (f=inv__91  )\<or>
    (f=inv__92  )\<or>
    (f=inv__93  )\<or>
    (f=inv__94  )\<or>
    (f=inv__95  )\<or>
    (f=inv__96  )\<or>
    (f=inv__97  )\<or>
    (f=inv__98  )\<or>
    (f=inv__99  )"
  apply (cut_tac a1, auto) done
    moreover {
      assume c1: "(f=inv__1  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__1_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__2  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__2_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__3  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__3_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__4  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__4_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__5  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__5_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__6  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__6_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__7  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__7_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__8  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__8_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__9  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__9_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__10  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__10_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__11  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__11_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__12  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__12_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__13  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__13_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__14  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__14_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__15  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__15_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__16  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__16_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__17  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__17_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__18  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__18_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__19  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__19_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__20  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__20_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__21  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__21_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__22  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__22_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__23  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__23_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__24  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__24_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__25  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__25_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__26  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__26_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__27  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__27_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__28  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__28_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__29  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__29_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__30  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__30_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__31  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__31_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__32  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__32_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__33  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__33_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__34  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__34_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__35  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__35_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__36  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__36_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__37  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__37_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__38  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__38_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__39  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__39_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__40  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__40_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__41  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__41_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__42  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__42_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__43  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__43_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__44  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__44_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__45  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__45_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__46  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__46_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__47  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__47_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__48  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__48_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__49  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__49_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__50  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__50_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__51  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__51_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__52  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__52_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__53  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__53_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__54  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__54_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__55  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__55_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__56  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__56_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__57  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__57_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__58  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__58_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__59  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__59_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__60  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__60_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__61  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__61_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__62  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__62_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__63  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__63_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__64  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__64_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__65  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__65_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__66  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__66_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__67  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__67_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__68  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__68_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__69  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__69_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__70  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__70_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__71  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__71_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__72  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__72_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__73  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__73_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__74  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__74_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__75  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__75_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__76  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__76_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__77  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__77_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__78  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__78_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__79  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__79_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__80  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__80_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__81  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__81_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__82  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__82_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__83  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__83_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__84  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__84_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__85  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__85_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__86  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__86_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__87  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__87_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__88  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__88_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__89  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__89_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__90  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__90_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__91  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__91_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__92  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__92_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__93  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__93_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__94  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__94_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__95  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__95_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__96  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__96_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__97  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__97_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__98  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__98_on_rules) done
    }

    moreover {
      assume c1: "(f=inv__99  )"
      have "invHoldForRule s f r (invariants N)"
      apply (cut_tac a2 c1, metis lemma_inv__99_on_rules) done
    }

  ultimately show "invHoldForRule s f r (invariants N)"
  by satx
qed

end
