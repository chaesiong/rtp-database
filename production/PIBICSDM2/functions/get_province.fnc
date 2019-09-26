CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PROVINCE" (ID_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select pv_desc into tmp from province where pv_seqno=ID_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
