CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REASONBYSEQNO" (reasonseqno_tmp Number) return varchar2 is
tnm varchar2(200);
begin
 begin
   select reasonnm into tnm from CHNGVISA_REASON where reason_seqno =reasonseqno_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tnm;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_REASONBYSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_REASONBYSEQNO" TO "BIOSAADM";
