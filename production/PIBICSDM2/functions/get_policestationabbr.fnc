CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_POLICESTATIONABBR" (plsSeqno_tmp Number) return varchar2 is
tmp varchar2(200);
begin
 begin
 select org_abbr into tmp  from policestation where pls_seqno=plsSeqno_tmp;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
