(*  Title:      HOL/Auth/fifo_on_ini.thy
    Author:     Yongjian Li and Kaiqiang Duan, State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
    Copyright    2016 State Key Lab of Computer Science, Institute of Software, Chinese Academy of Sciences
*)

header{*The fifo Protocol Case Study*} 

theory fifo_on_ini imports fifo_base
begin
lemma iniImply_inv__1:
assumes a1: "(f=inv__1  )"
and a2: "formEval (andList (allInitSpecs N)) s"
shows "formEval f s"
using a1 a2 by auto
end
