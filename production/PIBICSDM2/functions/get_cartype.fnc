CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CARTYPE" (colortype_tmp varchar2) return varchar2 is 
tmp varchar2(200);
begin
    begin
    select TYPEDESC into tmp from cartype where TYPECODE = trim(colortype_tmp) and rownum =1;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CARTYPE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CARTYPE" TO "BIOSAADM";
