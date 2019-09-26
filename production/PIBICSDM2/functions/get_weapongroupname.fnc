CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_WEAPONGROUPNAME" (wgseqno_tmp Number) return varchar2 is
tmp varchar2(200);
begin
 begin
 select wg_weapongroup into tmp  from weapongroup where wg_seqno=wgseqno_tmp;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
