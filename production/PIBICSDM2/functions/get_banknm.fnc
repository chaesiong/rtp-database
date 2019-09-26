CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BANKNM" (bankseq number,flag char) return varchar2 is
co varchar2(200);
tnm varchar2(200);
tmp varchar2(200);
begin
 begin
 select bank_code,bank_name into co,tnm from bank where bank_seqno=bankseq;
 if flag = 'T' then
    tmp := tnm;
 elsif flag = 'E' then
    tmp := co;
 else tmp := tnm;
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
