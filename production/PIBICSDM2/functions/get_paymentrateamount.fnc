CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PAYMENTRATEAMOUNT" (prateseqno_tmp Number) return varchar2 is
amount varchar2(200);
begin
 begin
   select prateamount into amount from paymentrate where prate_seqno =prateseqno_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return amount;
end;
/
