CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CARBRAND" (colorbrand_tmp varchar2) return varchar2 is 
tmp varchar2(200);
begin
    begin
    select BRANDDESC into tmp from carbrand where BRANDCODE = trim(colorbrand_tmp) and rownum =1;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CARBRAND" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CARBRAND" TO "BIOSAADM";
