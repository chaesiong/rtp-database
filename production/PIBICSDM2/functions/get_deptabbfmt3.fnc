CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTABBFMT3" (v_deptseqno number) return varchar2 is
nm varchar2(200);
begin
    begin
    select DEPTABBFMT3 into nm  from department where dept_seqno = v_deptseqno;   
    Exception When No_Data_Found Then Null ;
    end;
  return nm;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTABBFMT3" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTABBFMT3" TO "BIOSAADM";
