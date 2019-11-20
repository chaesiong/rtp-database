CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FWUSERPID" (pid varchar2,flag char) return varchar2 is
tmp varchar2(200);
begin
 begin
 if flag = 'A' then
   select  user_id into tmp  from fw_user where person_id =  pid;
 elsif flag = 'B' then
   select person_id into tmp from fw_user where user_id = pid;
 end if;   
 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FWUSERPID" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FWUSERPID" TO "BIOSAADM";
