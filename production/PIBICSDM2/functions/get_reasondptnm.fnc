CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REASONDPTNM" (reasondptSeqno_tmp number) return varchar2 is
nm varchar2(200);
begin
    begin
    select reasondptnm into nm  from reasondpt where reasondpt_seqno=reasondptSeqno_tmp;
   
    Exception When No_Data_Found Then Null ;
    end;
  return nm;
end;
/
