CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RESULTSTATUS" (flag char) return varchar2 is
tmp varchar2(200);
begin
 begin
 if flag = 'A' then
    tmp := 'APPROVE';
 elsif flag = 'W' then
    tmp := 'WAITING';
 elsif flag = 'R' then
    tmp := 'REJECT'; 
 else tmp := '-';
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_RESULTSTATUS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_RESULTSTATUS" TO "BIOSAADM";
