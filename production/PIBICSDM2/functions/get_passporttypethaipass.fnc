CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PASSPORTTYPETHAIPASS" (passnosearch varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
    select get_Passporttype(PASS_SEQNO, 'T') into tmp  from thaipassport where passportno = passnosearch and rownum=1 order by passportexpdte desc;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
