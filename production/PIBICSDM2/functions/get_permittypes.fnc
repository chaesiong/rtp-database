CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PERMITTYPES" (petmit_tmp varchar2,flag char) return varchar2 is
enm varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
 begin
 select permitnm, permitnm into enm,tnm  from PERMITTYPE where permitcd=trim(petmit_tmp);
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
