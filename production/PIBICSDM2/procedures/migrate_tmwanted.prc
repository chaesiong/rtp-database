CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_TMWANTED" IS
tmpVar NUMBER;
BEGIN
DECLARE
      V_NATION CHAR(3);
CURSOR C1 IS              
    select * from tmwanted where nationcd is null;
    REC_TM C1%ROWTYPE;
BEGIN
    OPEN C1;
    LOOP
    FETCH C1 INTO REC_TM; EXIT WHEN C1%NOTFOUND;
    
       V_NATION := NULL;
       
       IF REC_TM.NATIONALITY IS NOT NULL THEN
       
            BEGIN       
                SELECT COUNTCD INTO V_NATION FROM COUNTRY WHERE NATIONENM =  UPPER(REC_TM.NATIONALITY) and rownum = 1;        
            EXCEPTION WHEN NO_DATA_FOUND THEN
                V_NATION := 'U05';
            END;
        
        END IF;
        
        --DBMS_OUTPUT.PUT_LINE(UPPER(NAMESPLIT(1)) ||' '|| UPPER(NAMESPLIT(2)) ||' '|| UPPER(NAMESPLIT(3)) ||' '|| V_SEX ||' '|| V_NATION ||' '||V_TDTNO);
        UPDATE TMWANTED SET NATIONCD = V_NATION, EFIRSTNM = TRIM(UPPER(EFIRSTNM)), EFAMILYNM = TRIM(UPPER(EFAMILYNM)), 
        EMIDDLENM = TRIM(UPPER(EMIDDLENM)), BIRTHDTE = TRIM(UPPER(BIRTHDTE)), SEX = TRIM(UPPER(SEX)), TDTNO = REPLACE(TRIM(UPPER(TDTNO)), ' ', '')  WHERE SEQNO= REC_TM.SEQNO;
        
                              
    END LOOP;
        
    CLOSE C1;
COMMIT;

END;
END;
/