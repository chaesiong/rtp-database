CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_IMGTHAIPASS" (citizenidsearch varchar2, passnosearch varchar2) return varchar2 is
tmp varchar2(20);
begin
    begin
    select (case when imgpass is null then 'NOTEXITIMAGE' else 'EXIT_IMAGE' end) into tmp from thaipassport where citizenid = citizenidsearch and  passportno=passnosearch AND rownum = 1;
    EXCEPTION WHEN NO_DATA_FOUND THEN return 'NOTEXITIMAGE'; end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_IMGTHAIPASS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_IMGTHAIPASS" TO "BIOSAADM";
