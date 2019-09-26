CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TUMBON" (IDTMB_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select tmb_desc into tmp from tambon where tmb_seqno=IDTMB_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
