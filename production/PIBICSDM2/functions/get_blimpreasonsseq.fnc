CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BLIMPREASONSSEQ" (reasoncd_tmp varchar2) return varchar2 is
seq varchar2(200);
begin
 begin
 select reason_seqno into seq from Blimpreason where reasoncd=trim(reasoncd_tmp);
 Exception When No_Data_Found Then Null ;
 end;
  return seq;
end;
/
