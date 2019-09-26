CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."REFORMATDATE" (date_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
    if length(trim(date_tmp)) = 8 then
        tmp := '00'||date_tmp;
     elsif length(trim(date_tmp)) = 4 then
        tmp := '00/00/'||date_tmp;
     else tmp := date_tmp;
    end if;   
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
