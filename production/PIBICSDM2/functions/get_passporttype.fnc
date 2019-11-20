CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PASSPORTTYPE" (seq varchar2, flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select passtnm, passenm into tnm, enm from passporttype where pass_seqno = seq;
    if flag = 'T' then
       tmp := tnm;
    elsif flag = 'E' then
       tmp := enm;
    else tmp := tnm;
    end if;    
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PASSPORTTYPE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PASSPORTTYPE" TO "BIOSAADM";
