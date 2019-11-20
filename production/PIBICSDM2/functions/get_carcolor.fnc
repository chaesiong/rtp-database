CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CARCOLOR" (colorcode_tmp varchar2) return varchar2 is 
tmp varchar2(200);
begin
    begin
    select COLORDESC into tmp from carcolor where COLORCODE = trim(colorcode_tmp) and rownum =1 ;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CARCOLOR" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CARCOLOR" TO "BIOSAADM";
