CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_THAILANDELITE" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATE_THAILANDELITE
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        21/04/2014   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATE_THAILANDELITE
      Sysdate:         21/04/2014
      Date and Time:   21/04/2014, 16:54:42, and 21/04/2014 16:54:42
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
DECLARE
      INDEXFORGETNAME NUMBER := 0;
      TYPE NAMESPLITTABLE_ IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
      NAMESPLIT NAMESPLITTABLE_;
      V_SEX CHAR(1);
      V_NATION CHAR(3);
      V_TDTNO VARCHAR(30);
CURSOR C1 IS              
    SELECT * FROM THAILANDELITE_TMP;
    REC_TM C1%ROWTYPE;
BEGIN
    OPEN C1;
    LOOP
    FETCH C1 INTO REC_TM; EXIT WHEN C1%NOTFOUND;
       
        INDEXFORGETNAME := 0;
        FOR REC IN (SELECT COLUMN_VALUE AS NAME FROM TABLE(SPLITSTRINGPISCES(REC_TM.NAME, ' '))) LOOP
            INDEXFORGETNAME := 1 + NVL(INDEXFORGETNAME, 0);
            NAMESPLIT(INDEXFORGETNAME) := REC.NAME;
        END LOOP;
        
        V_SEX := 'M';
        IF REC_TM.SEXNM = 'Female' THEN
            V_SEX := 'F';
        END IF;        
       
       V_NATION := NULL;
       BEGIN       
            SELECT COUNTCD INTO V_NATION FROM COUNTRY WHERE NATIONENM =  UPPER(REC_TM.NATION);        
        EXCEPTION WHEN NO_DATA_FOUND THEN
            V_NATION := 'U05';
        END;
        
        V_TDTNO := NULL;
        V_TDTNO := REPLACE(REPLACE(REPLACE(REC_TM.TDTNO, 'No.',''), 'no.',''), ' ','');
        
        --DBMS_OUTPUT.PUT_LINE(UPPER(NAMESPLIT(1)) ||' '|| UPPER(NAMESPLIT(2)) ||' '|| UPPER(NAMESPLIT(3)) ||' '|| V_SEX ||' '|| V_NATION ||' '||V_TDTNO);
        UPDATE THAILANDELITE_TMP SET EFAMILYNM = UPPER(NAMESPLIT(1)), EFIRSTNM = UPPER(NAMESPLIT(2)), EMIDDLENM = UPPER(NAMESPLIT(3)), SEX = V_SEX, NATIONCD = V_NATION,
        PASSPORTNO = V_TDTNO WHERE NO = REC_TM.NO;
        
                              
    END LOOP;
        
    CLOSE C1;
COMMIT;

END;
END;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_THAILANDELITE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_THAILANDELITE" TO "BIOSAADM";
