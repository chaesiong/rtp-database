CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTABBLEVEL1OR2" (deptseqno_tmp Number, flag varchar2) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
tmplevel Number(1);
relcd Number(4);
begin
 begin
 select deptlevel into tmplevel from department where dept_seqno=deptseqno_tmp;
 if  tmplevel = 1 then
      select abbrnm, DEPTTNM into enm, tnm from department where dept_seqno=deptseqno_tmp and deptlevel=1; 
 elsif tmplevel = 2 then
   select abbrnm, DEPTTNM into enm, tnm from department where dept_seqno=deptseqno_tmp and deptlevel=2; 
else
   select rel_code into relcd from department where dept_seqno = deptseqno_tmp;
   select abbrnm, DEPTTNM into enm, tnm from department where dept_seqno=relcd and deptlevel=2;
end if; 
 if flag = 'T' then
    tmp := tnm;
 elsif flag = 'E' then
    tmp := enm;
 else tmp := tnm;
 end if;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
