CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_POSLEVELNAME" (poslevelseqno_tmp Number) return varchar2 is
tmp varchar2(200);
begin
 begin
 select poslevelabvnm into tmp  from poslevel where poslevel_seqno=poslevelseqno_tmp;
 Exception When No_Data_Found Then 
    tmp:='-' ;
 end;
  return tmp;
end;
/
