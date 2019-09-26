CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TODOLISTSEQNO" (tdcd_tmp varchar2) return varchar2 is
tmp Number(10);
begin
 begin   
   select td_seqno into tmp from todolist where tdcd = tdcd_tmp;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
