CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTSEQNOBYIP" 
    ( p_ipaddress CHAR)
    RETURN NUMBER
  IS
    tnm NUMBER;
  BEGIN
    BEGIN
      SELECT dept_seqno
      INTO tnm
      FROM mappingip a
      WHERE a.ipaddress                = p_ipaddress;
      EXCEPTION WHEN No_Data_Found THEN null ;
    END;
    RETURN tnm;
  END;
/
