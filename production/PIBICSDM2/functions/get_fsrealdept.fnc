CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FSREALDEPT" (esyear char,esmonth varchar,profileseq Number, flag varchar) return Number is
tmp number;
dpt number;
dptreal number;
begin
    begin
        select a.dept_seqno, b.rel_code into tmp, dptreal from hr_profile a, department b where a.dept_seqno=b.dept_seqno and profile_seqno=profileseq;     
        select dept_seqno into dpt
        from fs_nonauthorized a, fs_nonauthperson b
        where a.fsnonauthseqno=b.fsnonauthseqno
        and a.estimateyear=esyear and a.estimatemonth=esmonth and B.PROFILE_SEQNO=profileseq;
        tmp := null;
        dptreal := null;
         Exception When No_Data_Found Then Null ;
          begin
         select B.ORGDEPT_SEQNO, C.REL_CODE into dpt, dptreal from fs_deptchange a, fs_deptchangeperson b, department c
         where a.fsdeptchangeseqno=b.fsdeptchangeseqno and B.ORGDEPT_SEQNO=C.DEPT_SEQNO
         and a.estimateyear=esyear and a.estimatemonth=esmonth and b.profile_seqno=profileseq;
         tmp :=dpt;
            Exception When No_Data_Found Then Null ;
            
         end;
         end;
         
         if flag = 'D' then
            return tmp;
         else
            return dptreal;
         end if;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSREALDEPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSREALDEPT" TO "BIOSAADM";
