CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RELCODEBYDEPTCD" (deptcd_tmp varchar2) return varchar2 is
tmp Number(4);
begin
 begin
   select rel_code into tmp from department where deptcd=deptcd_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_RELCODEBYDEPTCD" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_RELCODEBYDEPTCD" TO "BIOSAADM";
