CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TESTOTTM2ALL" return Number is
tmp Number;
begin
    begin
           select count(b.profile_seqno) into tmp from department a,hr_profile b
     where  a.dept_seqno=b.dept_seqno  and  (A.dept_seqno=3 or A.rel_code=3 or A.rel_code in ( select dept_seqno from department where rel_code=3 )) AND b.LEVEL_SEQNO!=4;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_TESTOTTM2ALL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_TESTOTTM2ALL" TO "BIOSAADM";
