CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OPERREFSEQNO" (opercd_tmp varchar2) return varchar2 is
tmp Number(10);
begin
 begin   
   select oper_seqno into tmp from operationref where opercd = opercd_tmp;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_OPERREFSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_OPERREFSEQNO" TO "BIOSAADM";
