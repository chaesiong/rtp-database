CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."CHECKDEPTZONEIP" 
        (p_zoneseqno NUMBER,
      p_deptseqno NUMBER,
      p_ipaddress1 CHAR,
      p_ipaddress2 CHAR)
    RETURN VARCHAR2
  IS
    tnm VARCHAR2(10);
  BEGIN
    BEGIN
    IF p_deptseqno=12 THEN
      IF p_zoneseqno  IS NULL THEN
        SELECT 'true'
        INTO tnm
        FROM mappingip a
        WHERE a.ipaddress                = p_ipaddress2
        AND a.dept_seqno=p_deptseqno;
       ELSE 
        SELECT 'true'
        INTO tnm
        FROM mappingip a
        WHERE a.ipaddress                = p_ipaddress2
        AND a.zone_seqno=p_zoneseqno;
      END IF;
    ELSIF  p_deptseqno = 237 THEN
     SELECT 'true'
      INTO tnm
      FROM mappingip a
      WHERE a.ipaddress                = p_ipaddress2
      AND  p_deptseqno = a.dept_seqno; 
    ELSE
     SELECT 'true'
      INTO tnm
      FROM mappingip a
      WHERE a.ipaddress                = p_ipaddress2
      AND p_deptseqno = get_deptseqnoL2( a.dept_seqno); 
    END IF;
    EXCEPTION WHEN No_Data_Found THEN tnm:='false' ;
    END;
    RETURN tnm;
  END;
/
  GRANT EXECUTE ON "PIBICSDM2"."CHECKDEPTZONEIP" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CHECKDEPTZONEIP" TO "BIOSAADM";
