CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FSACCDEPT" (esyear char, esmonth varchar, profileseq Number) return Number is
tmp number;
begin
    begin
        tmp:=null;
        select B.ORGDEPT_SEQNO into tmp from fs_deptchange a, fs_deptchangeperson b, department c
         where a.fsdeptchangeseqno=b.fsdeptchangeseqno and B.ORGDEPT_SEQNO=C.DEPT_SEQNO
         and a.estimateyear=esyear and a.estimatemonth=esmonth and b.profile_seqno=profileseq;
        return tmp;
         Exception When No_Data_Found Then Null ;
          begin
            select dept_seqno into tmp from hr_profile_ot where profile_seqno = profileseq;
            return tmp;
            Exception When No_Data_Found Then Null ;            
         end;
         end;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSACCDEPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSACCDEPT" TO "BIOSAADM";
