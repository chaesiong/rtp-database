CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FEESLIPTOTALBYPREATESEQNOW" (P_FEES_SEQNO NUMBER,P_PRATE_SEQNO NUMBER) return NUMBER is
TMP NUMBER;
begin
    TMP:=0;
    begin
  select sum(feeslipamount) INTO TMP from fs_feesdetail where FEES_SEQNO = P_FEES_SEQNO AND PRATE_SEQNO =P_PRATE_SEQNO;
    Exception When No_Data_Found Then TMP:=0 ;
    end;
  return TMP;
end;
/
