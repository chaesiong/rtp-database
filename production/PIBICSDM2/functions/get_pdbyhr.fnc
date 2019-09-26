CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PDBYHR" (creusr_tmp varchar2) return varchar2 is 
tmp number;
begin
    begin
    select pd_seqno into tmp  from  hr_profile a, fw_user b where a.profile_seqno = b.person_id and b.user_id =creusr_tmp ;

    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
