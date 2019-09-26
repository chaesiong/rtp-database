CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTCD" (deptseqno_tmp Number) return varchar2 is
tmp varchar(10);
begin
 begin
   select deptcd into tmp from department where dept_seqno =deptseqno_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
