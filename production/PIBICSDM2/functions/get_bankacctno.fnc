CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BANKACCTNO" (HRSEQ Number) return varchar2 is
tmp varchar2(200);
begin
 begin
   SELECT BANKACCTNO INTO tmp FROM OT_BANKACCOUNT WHERE PROFILE_SEQNO=HRSEQ and rownum = 1;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
