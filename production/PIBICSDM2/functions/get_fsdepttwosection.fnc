CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FSDEPTTWOSECTION" (pdept_seqno number) RETURN varchar2 IS
    tmp varchar2(1);
    begin
       select twosection into tmp from department where dept_seqno = pdept_seqno;
       return tmp;
      exception when no_data_found then
      return null; 
END get_FSDeptTwoSection;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSDEPTTWOSECTION" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSDEPTTWOSECTION" TO "BIOSAADM";
