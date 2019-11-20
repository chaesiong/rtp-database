CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COUNTERNAME" (IP_TMP varchar) return varchar2 is
tmp varchar2(200);
begin
    begin
    select CHECKPOINTNO into tmp from mappingip where ipaddress=IP_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_COUNTERNAME" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_COUNTERNAME" TO "BIOSAADM";
