CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CHECKPOINTDEPARTMENT" (deptseqno_tmp varchar2) return varchar2 is
tmp varchar2(1);
begin
 begin
   select checkpoint into tmp from department where dept_seqno=deptseqno_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
