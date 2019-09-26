CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_WATCHLISTREASON" (cdtmp varchar2,flag char) return varchar2 is
tmp varchar2(200);
begin
    begin
    if flag = 'A' then
       select reasontnm into tmp from blimpreason where reasoncd=cdtmp and actflag='Y';
    elsif flag = 'B' then
       select reasonenm into tmp from blimpreason where reasoncd=cdtmp and actflag='Y';
    elsif flag = 'C' then
       select REASON_TYPENM into tmp from BLIMREASON_TYPE  where REASON_TYPE_SEQNO=cdtmp and actflag='Y';  
    else  select reason_seqno into tmp from blimpreason where reasoncd=cdtmp and actflag='Y';
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
