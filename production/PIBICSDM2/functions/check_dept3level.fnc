CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."CHECK_DEPT3LEVEL" (param_seqno Number,source_seqno Number) return varchar2 is
tmp char(1);
begin
    begin
      select 'y' into tmp from (
      SELECT d.dept_seqno
      FROM Department d
      WHERE d.dept_seqno = source_seqno
      OR d.rel_code      = source_seqno
      OR d.rel_code     IN
      (SELECT A.DEPT_SEQNO FROM DEPARTMENT A WHERE A.REL_CODE= source_seqno)) a where a.dept_seqno = param_seqno;
    Exception When No_Data_Found Then return 'n';
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."CHECK_DEPT3LEVEL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CHECK_DEPT3LEVEL" TO "BIOSAADM";
