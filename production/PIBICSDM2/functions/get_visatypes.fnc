CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_VISATYPES" (visatypecd_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
cnm varchar2(4);
tmp varchar2(200);
begin
 begin
 select visatypeenm,visatypetnm,visatypecd into enm,tnm,cnm  from visatype where visatypecd=trim(visatypecd_tmp);
 if flag = 'T' then
    tmp := tnm;
 elsif flag = 'E' then
    tmp := enm;
 elsif flag = 'C' then
    tmp := cnm;
 else tmp := tnm;
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_VISATYPES" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_VISATYPES" TO "BIOSAADM";
