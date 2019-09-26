CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FEESAMOUNT" (seqno_tmp number) return varchar2 is
tnm number;
begin
 begin
 select feesliptotal into tnm from fs_fees where fees_seqno=seqno_tmp and  feesstatus = 'ACTIVE' and feeslipno is not null;
  Exception When No_Data_Found Then return null ;
 end;
  return tnm;
end;
/
