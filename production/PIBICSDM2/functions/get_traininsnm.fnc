CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TRAININSNM" (seqno_tmp number) return varchar2 is
prefixnm varchar2(20);
fnm varchar2(100);
lnm varchar2(100);
snm varchar2(100);
begin
 begin
 select  ins_prefix,ins_firstname,ins_lastname into prefixnm,fnm,lnm from train_instructor where ins_seqno=seqno_tmp;
  Exception When No_Data_Found Then return null ;
 end;
  if fnm is not null and lnm is null then
            snm:= prefixnm||fnm;
    elsif fnm is null and lnm is not null then
            snm:= lnm;
    elsif fnm is not null and lnm is not null then
             snm:= prefixnm||fnm||'  '||lnm;
    end if;   
  return snm;
end;
/
