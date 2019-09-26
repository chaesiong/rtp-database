CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTRATEFORMLEVLE" (levelseqno number) return number is
tmp number;
begin
 begin
   select otrate into tmp  from ot_rate where poslevel_seqno =  levelseqno;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
