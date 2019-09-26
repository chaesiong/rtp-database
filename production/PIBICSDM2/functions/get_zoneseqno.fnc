CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ZONESEQNO" (zoneSeqno_tmp varchar2) return varchar2 is
tmp varchar(400);
begin
 begin   
   select zonenm into tmp from zone where zone_seqno = zoneSeqno_tmp;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
