CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTCDLEVEL1" (deptseqno_tmp Number) return varchar2 is
tmp varchar2(200);
tmplevel Number(1);
relcd Number(4);
begin
 begin
 select deptlevel into tmplevel from department where dept_seqno=deptseqno_tmp;
 if tmplevel = 1 then
    select deptcd into tmp from department where dept_seqno=deptseqno_tmp and deptlevel=1; 
elsif tmplevel =2 then
   select deptcd into tmp from department where dept_seqno=(select rel_code from department where dept_seqno = deptseqno_tmp) and deptlevel=1;
else
   select rel_code into relcd from department where dept_seqno = deptseqno_tmp;
   select deptcd into tmp from department where dept_seqno=(select rel_code from department where dept_seqno = relcd) and deptlevel=1;
end if; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
