CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_USEREJB2DEPT" (useridtmp varchar2) return varchar2 is
tmp varchar2(400);
begin
    begin
    select get_Departments(deptcd,'T') into tmp  from sysuser where userid=useridtmp;
      
    Exception When No_Data_Found Then Null ;
       select get_Policorganizes(orgcd) into tmp  from sysuser where userid=useridtmp;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_USEREJB2DEPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_USEREJB2DEPT" TO "BIOSAADM";
