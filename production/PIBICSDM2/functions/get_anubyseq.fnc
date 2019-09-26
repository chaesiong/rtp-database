CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ANUBYSEQ" (anuSeqno_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select anunm into tmp from anu where anu_seqno=anuSeqno_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
