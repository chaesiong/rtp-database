CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CRSRESCERTTYPEBYCD" (rescerttype_cd_tmp varchar2) return number is 
tmp number;
begin
    begin
    select RESCERTTYPE_SEQNO into tmp  from crs_rescerttype where RESCERTTYPECD=trim(rescerttype_cd_tmp);
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CRSRESCERTTYPEBYCD" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CRSRESCERTTYPEBYCD" TO "BIOSAADM";
