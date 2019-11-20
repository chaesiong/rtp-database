CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETEXTREASON_TMP" (reasontmp varchar2) RETURN NUMBER IS
    tmp Number;
    begin
       select seqno into tmp from extreason_tmp where code = reasontmp and rownum=1;
       return tmp;
      exception when no_data_found then
      return null; 
END getExtReason_tmp;
/
  GRANT EXECUTE ON "PIBICSDM2"."GETEXTREASON_TMP" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GETEXTREASON_TMP" TO "BIOSAADM";
