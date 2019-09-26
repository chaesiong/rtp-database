CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REPSCOUNTRY" (idtmp varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
    SELECT seqno into tmp from EXTNATION_TMP where code=idtmp and rownum=1 ;
    Exception When No_Data_Found Then Null ;
    end;
    return tmp;
end;
/
