CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTISSUEDRCNAME" (deptIssueDrcCode_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select deptissuedrc_name into tnm  from crs_deptissuedrc where deptissuedrc_code=trim(deptIssueDrcCode_tmp) ;
    tmp := tnm;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTISSUEDRCNAME" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTISSUEDRCNAME" TO "BIOSAADM";
