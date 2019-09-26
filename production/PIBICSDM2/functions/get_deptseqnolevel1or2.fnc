CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTSEQNOLEVEL1OR2" (deptseqno_tmp Number) return Number is
tmp number(10);
tmplevel Number(1);
relcd Number(4);
begin
 begin
 select deptlevel into tmplevel from department where dept_seqno=deptseqno_tmp;
 if  tmplevel = 1 then
      select dept_seqno into tmp from department where dept_seqno=deptseqno_tmp and deptlevel=1; 
 elsif tmplevel = 2 then
   select dept_seqno into tmp from department where dept_seqno=deptseqno_tmp and deptlevel=2; 
else
   select rel_code into relcd from department where dept_seqno = deptseqno_tmp;
   select dept_seqno into tmp from department where dept_seqno=relcd and deptlevel=2;
end if; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
