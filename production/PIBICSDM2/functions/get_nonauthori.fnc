CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NONAUTHORI" (DETSENQ Number,ESYEAR varchar2, ESMOUNT varchar2) return NUMBER is
tmp NUMBER;
begin
    begin
        select  b.profile_seqno into tmp  from OT_NONAUTHORIZED a, OT_NONAUTHPERSON b
        where A.OTNONAUTHSEQNO=B.OTNONAUTHSEQNO and a.estimateyear=esyear and A.ESTIMATEMONTH  =esmount and a.dept_seqno=detsenq;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NONAUTHORI" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NONAUTHORI" TO "BIOSAADM";
