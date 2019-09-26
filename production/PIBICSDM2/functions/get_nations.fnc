CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NATIONS" (countcd_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select countenm,counttnm into enm,tnm  from country where countcd=trim(countcd_tmp);
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
