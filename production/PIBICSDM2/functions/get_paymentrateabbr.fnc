CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PAYMENTRATEABBR" (prateseqno_tmp Number) return varchar2 is
tmp varchar2(500);
begin
 begin
   select PRATEABBRENM into tmp from paymentrate where prate_seqno =prateseqno_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PAYMENTRATEABBR" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PAYMENTRATEABBR" TO "BIOSAADM";
