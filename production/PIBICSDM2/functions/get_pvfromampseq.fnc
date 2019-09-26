CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PVFROMAMPSEQ" (ampseq Number,flag char) return varchar2 is
tmp varchar2(200);
begin
 begin
    if flag = 'A' then
       select pv_desc into tmp from province a,ampur b where a.pv_seqno=b.pv_seqno(+) and amp_seqno = ampseq ;
    elsif flag = 'B' then
        select amp_desc into tmp from province a,ampur b where a.pv_seqno=b.pv_seqno(+) and amp_seqno = ampseq ;
     end if;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
