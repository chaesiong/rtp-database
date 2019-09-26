CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ARSFLAG" (IDAMP_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select flag into tmp  from ars_aliencert where aliencert_seqno = IDAMP_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
