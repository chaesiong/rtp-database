CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTSEQNOLEVEL3" (deptseqno_tmp Number) return varchar2 is
tmp varchar2(200);
tmplevel Number(1);
relcd Number(4);
begin
 begin
   select dept_seqno into tmp from department where dept_seqno=deptseqno_tmp and deptlevel=3; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
