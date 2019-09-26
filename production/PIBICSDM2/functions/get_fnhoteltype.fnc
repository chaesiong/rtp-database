CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FNHOTELTYPE" (htypeSeqno_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select typename into tmp from fn_hoteltype where htype_seqno=htypeSeqno_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
