CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETWF_CREMATION" (card_id_tmp varchar2) return char is
tmp char(1);
begin
 begin
    select cm_cremationsts into tmp from wf_cremation a, hr_profile b where a.profile_seqno=b.profile_seqno and b.card_id = card_id_tmp;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
