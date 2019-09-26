CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PERMITSEQNO" (permitCd_tmp varchar2) return Number is 
tmp Number;
begin
    begin
    select permit_seqno into tmp from permittype where permitcd=trim(permitCd_tmp) ;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
