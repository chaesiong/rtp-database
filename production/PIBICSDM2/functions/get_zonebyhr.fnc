CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ZONEBYHR" (credterm_tmp varchar2) return varchar2 is 
tmp number;
begin
    begin
    select INOUTZONE_SEQNO  into tmp  from  MAPPINGIP where IPADDRESS = credterm_tmp ;

    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_ZONEBYHR" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_ZONEBYHR" TO "BIOSAADM";
