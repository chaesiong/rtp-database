CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FEESLIPTOTALBYFLAG_SYSTEM" (P_FEES_SEQNO NUMBER,P_FLAG_SYSTEM VARCHAR2) return NUMBER is
TMP NUMBER;
begin
    TMP:=0;
    begin
   select sum(feeslipamount) INTO TMP from fs_feesdetail where FEES_SEQNO = P_FEES_SEQNO AND prate_seqno in 
   (select PRATE_SEQNO from paymentrate where flag_system=P_FLAG_SYSTEM) group by fees_seqno;
    Exception When No_Data_Found Then Null ;
    end;
  return TMP;
end;
/
