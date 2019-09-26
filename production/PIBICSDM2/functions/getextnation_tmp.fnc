CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETEXTNATION_TMP" (nationtmp varchar2) RETURN NUMBER IS
    tmp Number;
    begin
       select seqno into tmp from extnation_tmp where code = nationtmp and rownum=1;
       return tmp;
      exception when no_data_found then
      return null; 
END getExtNation_tmp;
/
