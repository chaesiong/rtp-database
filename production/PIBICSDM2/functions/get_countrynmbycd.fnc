CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COUNTRYNMBYCD" (countcd_tmp varchar2, flag char) return varchar2 is
tnm varchar2(200);
enm varchar2(200);
tmp varchar2(200);
begin
    begin    
        select counttnm, countenm into tnm, enm  from country where countcd = countcd_tmp;
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
