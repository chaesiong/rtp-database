CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_POSNAME" (posSeqno_tmp Number) return varchar2 is
tmp varchar2(200);
begin
 begin
 select pos into tmp  from position where pos_code=posSeqno_tmp;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
