CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PASSBYUSER" (userid_tmp varchar2) return varchar2 is 
tmp varchar2(200);
begin
    begin
    select password into tmp  from fw_user where user_id=trim(userid_tmp) ;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
