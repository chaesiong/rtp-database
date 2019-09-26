CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REGIONFROVPV" (pvseqno Number,flag char) return varchar2 is
tmp varchar2(30);
begin
 begin
    if flag = 'A' then
        select to_char(a.reg_seqno) into tmp from PROVINCE A,REGION B WHERE A.REG_SEQNO(+)=B.REG_SEQNO AND PV_SEQNO=pvseqno;
    elsif flag = 'B' then
        select regtnm into tmp from PROVINCE A,REGION B WHERE A.REG_SEQNO(+)=B.REG_SEQNO AND PV_SEQNO=pvseqno;
     end if;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
