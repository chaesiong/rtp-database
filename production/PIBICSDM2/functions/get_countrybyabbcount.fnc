CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COUNTRYBYABBCOUNT" (param varchar2,flag char) return varchar2 is
vcountcd varchar2(5);
tmp varchar2(200);
begin
    begin    
    select countcd  into vcountcd from country  where abbcount=param;
    if flag = 'CD' then
       tmp := vcountcd;      
    else tmp := '';
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
