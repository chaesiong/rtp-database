CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_SEQBYADDRESS" (tmb_descTMP varchar2,amp_descTMP varchar2, flag char) return varchar2 is
tmb varchar2(200);
amp varchar2(200);
prv varchar2(200);
tmp Number(4);
begin
    begin
    IF tmb_descTMP is not null THEN
        select a.tmb_seqno,b.amp_seqno,B.PV_SEQNO into tmb,amp,prv from tambon a,AMPUR b where  tmb_desc like '%'||tmb_descTMP||'%' and A.AMP_SEQNO=B.AMP_SEQNO and rownum=1 ;
    ELSE
        select '',b.amp_seqno,B.PV_SEQNO into tmb,amp,prv from AMPUR b where  amp_desc like '%'||amp_descTMP||'%'  and rownum=1;
    END IF;
    if flag = 'T' then
       tmp := tmb;
    elsif flag = 'A' then
       tmp := amp;
    elsif flag = 'P' then
        tmp := prv;
    else tmp := null;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_SEQBYADDRESS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_SEQBYADDRESS" TO "BIOSAADM";
