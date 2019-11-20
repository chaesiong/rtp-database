CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTSEQNOL2" 
    ( P_dept_seqno NUMBER)
    RETURN NUMBER
  IS
    tnm NUMBER;
    rel NUMBER;
    lvl NUMBER;
  BEGIN
    BEGIN
      SELECT deptlevel,rel_code,dept_seqno
      INTO lvl,rel,tnm
      FROM department a
      WHERE dept_seqno = P_dept_seqno;
      if 3 = lvl then tnm:=rel;
      end if;
      EXCEPTION WHEN No_Data_Found THEN null ;
    END;
    RETURN tnm;
  END;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTSEQNOL2" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTSEQNOL2" TO "BIOSAADM";
