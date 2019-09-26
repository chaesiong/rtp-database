CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CONVEYANCES" (convcd_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
 begin
 select convenm, convtnm into enm,tnm  from conveyance where convcd=trim(convcd_tmp);
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
