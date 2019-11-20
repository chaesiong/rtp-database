CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."CHECKIPZONE" 
    (
      ipaddress1 CHAR,
      ipaddress2 CHAR)
    RETURN varchar2
  IS
    tnm VARCHAR2(10);
  BEGIN
    BEGIN
      SELECT 'true'
      INTO tnm
      FROM mappingip a,
        mappingip b
      WHERE a.ipaddress = ipaddress1
      AND b.ipaddress   =ipaddress2
      AND decode(a.zone_seqno,4,4,2,2,13,13,0)  = decode(b.zone_seqno,4,4,2,2,13,13,0)
      AND a.dept_seqno  = b.dept_seqno;
      Exception When No_Data_Found Then tnm:='false' ;
    END;
    RETURN tnm;
  END;
/
  GRANT EXECUTE ON "PIBICSDM2"."CHECKIPZONE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CHECKIPZONE" TO "BIOSAADM";
