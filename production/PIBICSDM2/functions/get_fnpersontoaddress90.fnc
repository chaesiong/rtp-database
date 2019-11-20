CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FNPERSONTOADDRESS90" (FNPERSONSEQNO_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select GET_DEPTABBNM(dept_seqno,'T') DEPTTNM  into tmp from fn_address90 where andd_seqno= (select max(andd_seqno) from fn_address90 where fnperson_seqno = FNPERSONSEQNO_TMP);
    Exception When No_Data_Found Then Null ;         
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FNPERSONTOADDRESS90" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FNPERSONTOADDRESS90" TO "BIOSAADM";
