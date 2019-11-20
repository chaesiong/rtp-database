CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TRAVELDOCTYPE" (objcd_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select tdtenm,tdttnm into enm,tnm  from traveldoctype where tdtcd=trim(objcd_tmp);
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
  GRANT EXECUTE ON "PIBICSDM2"."GET_TRAVELDOCTYPE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_TRAVELDOCTYPE" TO "BIOSAADM";
