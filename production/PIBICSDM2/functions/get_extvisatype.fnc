CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTVISATYPE" (code_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select seqno into tmp from extvisatype_tmp  where lpad(code, 4, '0') = lpad(trim(code_tmp), 4, '0') and rownum = 1;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
