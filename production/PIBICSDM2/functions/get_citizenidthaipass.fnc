CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CITIZENIDTHAIPASS" (passnosearch varchar2) return char is
tmp char(13);
begin
    begin
    select citizenid into tmp from thaipassport where passportno=passnosearch and rownum=1 order by passportexpdte desc;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_CITIZENIDTHAIPASS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_CITIZENIDTHAIPASS" TO "BIOSAADM";
