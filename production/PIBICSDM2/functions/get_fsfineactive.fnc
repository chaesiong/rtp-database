CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FSFINEACTIVE" (fineseqno_tmp Number)  return varchar2 is
finesSeqno Number;
begin
    begin
    select fines_seqno into finesSeqno  from fs_fines where printflag = 'Y'  and finestatus = 'ACTIVE' and  fines_seqno=trim(fineseqno_tmp);
    Exception When No_Data_Found Then Null ;
    end;
  return finesSeqno;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSFINEACTIVE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSFINEACTIVE" TO "BIOSAADM";
