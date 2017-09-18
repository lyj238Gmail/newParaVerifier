(*  Title:      HOL/Auth/n_g2kAbsAfter_on_inis.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The n_g2kAbsAfter Protocol Case Study*} 

theory n_g2kAbsAfter_on_inis imports n_g2kAbsAfter_on_ini
begin
lemma on_inis:
  assumes b1: "f \<in> (invariants N)" and b2: "ini \<in> {andList (allInitSpecs N)}" and b3: "formEval ini s"
  shows "formEval f s"
  proof -
  have c1: "(f=inv__1  )\<or>
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
  apply (cut_tac b1, simp) done
    moreover {
      assume d1: "(f=inv__1  )"
      have "formEval f s"
      apply (rule iniImply_inv__1)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__2  )"
      have "formEval f s"
      apply (rule iniImply_inv__2)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__3  )"
      have "formEval f s"
      apply (rule iniImply_inv__3)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__4  )"
      have "formEval f s"
      apply (rule iniImply_inv__4)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__5  )"
      have "formEval f s"
      apply (rule iniImply_inv__5)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__6  )"
      have "formEval f s"
      apply (rule iniImply_inv__6)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__7  )"
      have "formEval f s"
      apply (rule iniImply_inv__7)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__8  )"
      have "formEval f s"
      apply (rule iniImply_inv__8)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__9  )"
      have "formEval f s"
      apply (rule iniImply_inv__9)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__10  )"
      have "formEval f s"
      apply (rule iniImply_inv__10)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__11  )"
      have "formEval f s"
      apply (rule iniImply_inv__11)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__12  )"
      have "formEval f s"
      apply (rule iniImply_inv__12)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__13  )"
      have "formEval f s"
      apply (rule iniImply_inv__13)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__14  )"
      have "formEval f s"
      apply (rule iniImply_inv__14)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__15  )"
      have "formEval f s"
      apply (rule iniImply_inv__15)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__16  )"
      have "formEval f s"
      apply (rule iniImply_inv__16)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__17  )"
      have "formEval f s"
      apply (rule iniImply_inv__17)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__18  )"
      have "formEval f s"
      apply (rule iniImply_inv__18)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__19  )"
      have "formEval f s"
      apply (rule iniImply_inv__19)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__20  )"
      have "formEval f s"
      apply (rule iniImply_inv__20)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__21  )"
      have "formEval f s"
      apply (rule iniImply_inv__21)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__22  )"
      have "formEval f s"
      apply (rule iniImply_inv__22)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__23  )"
      have "formEval f s"
      apply (rule iniImply_inv__23)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__24  )"
      have "formEval f s"
      apply (rule iniImply_inv__24)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__25  )"
      have "formEval f s"
      apply (rule iniImply_inv__25)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__26  )"
      have "formEval f s"
      apply (rule iniImply_inv__26)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__27  )"
      have "formEval f s"
      apply (rule iniImply_inv__27)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__28  )"
      have "formEval f s"
      apply (rule iniImply_inv__28)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__29  )"
      have "formEval f s"
      apply (rule iniImply_inv__29)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__30  )"
      have "formEval f s"
      apply (rule iniImply_inv__30)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__31  )"
      have "formEval f s"
      apply (rule iniImply_inv__31)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__32  )"
      have "formEval f s"
      apply (rule iniImply_inv__32)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__33  )"
      have "formEval f s"
      apply (rule iniImply_inv__33)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__34  )"
      have "formEval f s"
      apply (rule iniImply_inv__34)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__35  )"
      have "formEval f s"
      apply (rule iniImply_inv__35)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__36  )"
      have "formEval f s"
      apply (rule iniImply_inv__36)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__37  )"
      have "formEval f s"
      apply (rule iniImply_inv__37)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__38  )"
      have "formEval f s"
      apply (rule iniImply_inv__38)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__39  )"
      have "formEval f s"
      apply (rule iniImply_inv__39)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__40  )"
      have "formEval f s"
      apply (rule iniImply_inv__40)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__41  )"
      have "formEval f s"
      apply (rule iniImply_inv__41)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__42  )"
      have "formEval f s"
      apply (rule iniImply_inv__42)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__43  )"
      have "formEval f s"
      apply (rule iniImply_inv__43)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__44  )"
      have "formEval f s"
      apply (rule iniImply_inv__44)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__45  )"
      have "formEval f s"
      apply (rule iniImply_inv__45)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__46  )"
      have "formEval f s"
      apply (rule iniImply_inv__46)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__47  )"
      have "formEval f s"
      apply (rule iniImply_inv__47)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__48  )"
      have "formEval f s"
      apply (rule iniImply_inv__48)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__49  )"
      have "formEval f s"
      apply (rule iniImply_inv__49)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__50  )"
      have "formEval f s"
      apply (rule iniImply_inv__50)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__51  )"
      have "formEval f s"
      apply (rule iniImply_inv__51)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__52  )"
      have "formEval f s"
      apply (rule iniImply_inv__52)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__53  )"
      have "formEval f s"
      apply (rule iniImply_inv__53)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__54  )"
      have "formEval f s"
      apply (rule iniImply_inv__54)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__55  )"
      have "formEval f s"
      apply (rule iniImply_inv__55)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__56  )"
      have "formEval f s"
      apply (rule iniImply_inv__56)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__57  )"
      have "formEval f s"
      apply (rule iniImply_inv__57)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__58  )"
      have "formEval f s"
      apply (rule iniImply_inv__58)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__59  )"
      have "formEval f s"
      apply (rule iniImply_inv__59)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__60  )"
      have "formEval f s"
      apply (rule iniImply_inv__60)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__61  )"
      have "formEval f s"
      apply (rule iniImply_inv__61)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__62  )"
      have "formEval f s"
      apply (rule iniImply_inv__62)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__63  )"
      have "formEval f s"
      apply (rule iniImply_inv__63)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__64  )"
      have "formEval f s"
      apply (rule iniImply_inv__64)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__65  )"
      have "formEval f s"
      apply (rule iniImply_inv__65)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__66  )"
      have "formEval f s"
      apply (rule iniImply_inv__66)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__67  )"
      have "formEval f s"
      apply (rule iniImply_inv__67)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__68  )"
      have "formEval f s"
      apply (rule iniImply_inv__68)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__69  )"
      have "formEval f s"
      apply (rule iniImply_inv__69)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__70  )"
      have "formEval f s"
      apply (rule iniImply_inv__70)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__71  )"
      have "formEval f s"
      apply (rule iniImply_inv__71)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__72  )"
      have "formEval f s"
      apply (rule iniImply_inv__72)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__73  )"
      have "formEval f s"
      apply (rule iniImply_inv__73)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__74  )"
      have "formEval f s"
      apply (rule iniImply_inv__74)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__75  )"
      have "formEval f s"
      apply (rule iniImply_inv__75)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__76  )"
      have "formEval f s"
      apply (rule iniImply_inv__76)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__77  )"
      have "formEval f s"
      apply (rule iniImply_inv__77)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__78  )"
      have "formEval f s"
      apply (rule iniImply_inv__78)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__79  )"
      have "formEval f s"
      apply (rule iniImply_inv__79)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__80  )"
      have "formEval f s"
      apply (rule iniImply_inv__80)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__81  )"
      have "formEval f s"
      apply (rule iniImply_inv__81)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__82  )"
      have "formEval f s"
      apply (rule iniImply_inv__82)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__83  )"
      have "formEval f s"
      apply (rule iniImply_inv__83)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__84  )"
      have "formEval f s"
      apply (rule iniImply_inv__84)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__85  )"
      have "formEval f s"
      apply (rule iniImply_inv__85)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__86  )"
      have "formEval f s"
      apply (rule iniImply_inv__86)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__87  )"
      have "formEval f s"
      apply (rule iniImply_inv__87)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__88  )"
      have "formEval f s"
      apply (rule iniImply_inv__88)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__89  )"
      have "formEval f s"
      apply (rule iniImply_inv__89)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__90  )"
      have "formEval f s"
      apply (rule iniImply_inv__90)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__91  )"
      have "formEval f s"
      apply (rule iniImply_inv__91)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__92  )"
      have "formEval f s"
      apply (rule iniImply_inv__92)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__93  )"
      have "formEval f s"
      apply (rule iniImply_inv__93)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__94  )"
      have "formEval f s"
      apply (rule iniImply_inv__94)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__95  )"
      have "formEval f s"
      apply (rule iniImply_inv__95)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__96  )"
      have "formEval f s"
      apply (rule iniImply_inv__96)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__97  )"
      have "formEval f s"
      apply (rule iniImply_inv__97)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__98  )"
      have "formEval f s"
      apply (rule iniImply_inv__98)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

    moreover {
      assume d1: "(f=inv__99  )"
      have "formEval f s"
      apply (rule iniImply_inv__99)
      apply (cut_tac d1, assumption)
      apply (cut_tac b2 b3, blast) done
    }

  ultimately show "formEval f s"
  by satx
qed

end
