CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_STATUSUPDATEEDNQ" (doctype char, permit_date number) return varchar2 is

tmp varchar2(200);
begin
 begin
 tmp := '';
 if doctype = 'S' then
    tmp := 'UPDATESTATUS'; 
 elsif doctype = 'M' then
    if permit_date <= to_number( to_char(sysdate, 'yyyymmdd')) then
        tmp := 'UPDATESTATUS';
   end if; 
  end if; 
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
