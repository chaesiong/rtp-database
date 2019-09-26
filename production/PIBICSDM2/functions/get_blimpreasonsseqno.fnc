CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BLIMPREASONSSEQNO" (reasoncd_tmp varchar2) return varchar2 is
tmp Number(10);
begin
 begin   
   select reason_seqno into tmp from Blimpreason where reasoncd = reasoncd_tmp;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
