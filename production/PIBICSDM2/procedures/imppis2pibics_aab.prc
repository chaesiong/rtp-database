CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."IMPPIS2PIBICS_AAB" IS
BEGIN
      DECLARE
      --DECLARE TYPE           
      TYPE PISCESDATA IS RECORD(
            CARDTYPE VARCHAR2(1),
            TMNO VARCHAR2(7),
            PORT VARCHAR2(8),
            DATE_IMPORT VARCHAR2(8),
            NATION VARCHAR2(3),
            MODETYPE VARCHAR2(4),
            MODEDETAIL VARCHAR2(14),
            NAME VARCHAR2(40),
            TYPEOFVISA VARCHAR2(4),
            SEX VARCHAR2(1),
            DOB VARCHAR2(10),
            PASSPORTNO VARCHAR2(12),
            USERID VARCHAR2(4),
            COUNTERNO VARCHAR(6),
            INDPP VARCHAR2(1),
            INDCWL VARCHAR2(1),
            CWLRECORDNO VARCHAR2(6),
            TIME VARCHAR2(6),
            VERIFYFLAG VARCHAR2(1)
      );
    
      PISCES PISCESDATA;

      SQLCOMMAND_TMMAIN VARCHAR2(1000);
      SQLCOMMAND_IMMIGRATION VARCHAR2(1000);

      PERMITDAYS DATE;
      CITIZENID CHAR(13);
          
      PERSONIDTEXT VARCHAR2(30);
      TMMAIN_PERSONID VARCHAR2(30);
      
      CHECKDUPTMRUNNO VARCHAR2(30);
      PERSONIDFORDUP VARCHAR2(20);
      INDEXFORGETNAME NUMBER := 0;
      BATCHLOGNOSEQ NUMBER :=0;
      BATCHLOGNO_AABSEQ NUMBER :=0;
      FILETYPE_AAB VARCHAR2(8);
      FILENAMEPISCES VARCHAR2(20);
      PORT2PIBICS VARCHAR2(30);
      
      --TYPE NAMESPLITTABLE_ IS TABLE OF NAMEDATA INDEX BY BINARY_INTEGER;
      TYPE NAMESPLITTABLE_ IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
      NAMESPLIT NAMESPLITTABLE_;
              
      --PARAMETER FOR UPDATE IMMGRATION
      UPD_PERSONID VARCHAR2(100);
      UPD_TM6NO VARCHAR2(100);
      UPD_INOUTDTE DATE;
      CHK_INOUTDTE NUMBER(20);
      UPD_CARDTYPE VARCHAR2(100);
      UPD_EFIRSTNM VARCHAR2(100);
      UPD_EMIDDLENM VARCHAR2(100);
      UPD_EFAMILYNM VARCHAR2(100);
      UPD_SEX VARCHAR2(100);
      UPD_BIRTHDTE VARCHAR2(100);
      UPD_NATIONCD VARCHAR2(100);
      UPD_TDTCD VARCHAR2(100);
      UPD_TDTNO VARCHAR2(100);
      UPD_VISATYPECD VARCHAR2(100);
      UPD_VISAEXPDTE VARCHAR2(100);
      UPD_UPDUSR VARCHAR2(100);
      UPD_UPDDTE DATE;
      UPD_UPDTERM VARCHAR2(100);
      UPD_DEPTCD VARCHAR2(100);
      UPD_STATUS VARCHAR2(100);
      UPD_CONVCD VARCHAR2(100);
      UPD_CREATE_BY VARCHAR2(100);
      UPD_CREATE_DATE DATE;
      UPD_UPDATE_BY VARCHAR2(100);
      UPD_UPDATE_DATE DATE;
      UPD_VERSION NUMBER;
      UPD_CITIZENID VARCHAR2(100);
      UPD_CONVREGNO VARCHAR2(100);
          
      --DECLARE FOR USE IN PL/SQL
      F_HANDLER_B UTL_FILE.FILE_TYPE;
      BUF VARCHAR2(1000);
      RECORD_INDEX NUMBER;
          
      --DECLARE FILE WRITE LOG
      FLOG_HANDLER_B UTL_FILE.FILE_TYPE;
          
      --DECLARE RECORD COUNTER FOR LOG
      COUNTER_INSERT_TMMAINTMP NUMBER := 0;
      COUNTER_INSERT_IMMIGRATION NUMBER := 0;
      COUNTER_UPDATE_IMMIGRATION NUMBER := 0;
      COUNTER_ERROR NUMBER := 0;
          
      --STATUS IMMIGRATION INSERT OR UPDATE
      ISUPDATE_IMMIGRATION BOOLEAN := FALSE;
      CHECK_ISERROR VARCHAR2(20);
      
      CHECK_DEPTCD_INCLUDE VARCHAR2(100);
      
      -- NAME OF TABLE INSERT AND UPDATE
      TABLE_TMMAIN_NAME CONSTANT VARCHAR2(30) := 'TMMAIN';
      TABLE_IMMIGRATION_NAME CONSTANT VARCHAR2(30) := 'IMMIGRATION';
      
      --DIRECTORY NAME
      --DIRECTORY_NAME CONSTANT VARCHAR2(20) := 'PISCES_DATA';
      DIRECTORY_NAME CONSTANT VARCHAR2(20) := 'PISCES_DIR';
      
      INCLUDEDEPTCD CONSTANT VARCHAR2(1000) := '00001,00020,00022,00032,00035,00036,00040,00067,000A1';
      

      
      --FUNCTION MANAGE BIRTHDATE
      FUNCTION MANAGEBIRTHDATE(P_BIRTHDATE IN VARCHAR2) RETURN VARCHAR2 IS
      BEGIN
          IF LENGTH(P_BIRTHDATE) = 4 THEN 
                RETURN P_BIRTHDATE;
            ELSIF LENGTH(P_BIRTHDATE) = 6 THEN
                RETURN '/' || SUBSTR(P_BIRTHDATE, 5, 2) || '/' || SUBSTR(P_BIRTHDATE, 1, 4);
            ELSIF LENGTH(P_BIRTHDATE) = 8 THEN
                IF SUBSTR(P_BIRTHDATE, 7, 2) = '00' AND SUBSTR(P_BIRTHDATE, 5, 2) = '00' THEN
                    RETURN SUBSTR(P_BIRTHDATE, 1, 4);
                ELSE
                    RETURN SUBSTR(P_BIRTHDATE, 7, 2) || '/' || SUBSTR(P_BIRTHDATE, 5, 2) || '/' || SUBSTR(P_BIRTHDATE, 1, 4);
                END IF;
            END IF;
            RETURN NULL;
      END;
      
      
BEGIN     

  BEGIN
    SELECT PISFILE, FILE_TYPE INTO FILENAMEPISCES, FILETYPE_AAB FROM PISCESBATCHTMP WHERE TYPE = 'B';
    
    BATCHLOGNO_AABSEQ := BATCHLOG_SEQ.NEXTVAL;
    
    INSERT INTO BATCHLOG
    (BATCHLOGNO, BATCH_SRC, FILE_TYPE, FILE_NAME, FILE_SIZE, 
    TOTALROW, PRROW, ERRROW, STARTPROCESS, ENDPROCESS, STATUS, 
    CREUSR, CREDTE, TFSTATUS, TOTALINS, TOTALUPD, TOTALDEL, TRANSFERDTE)
    VALUES
    (BATCHLOGNO_AABSEQ, 'PISCES', FILETYPE_AAB, FILENAMEPISCES, NULL, 
    0, 0, 0, SYSDATE, NULL, 
    '1', 'PISCESAUTO', SYSDATE, 'N', 0, 
    0, 0, NULL);
        
  EXCEPTION WHEN NO_DATA_FOUND THEN
    FILENAMEPISCES := 'XXX';
  END;

      -- GET FILE FROM DIRECTORY
      --FOR REC IN (SELECT COLUMN_VALUE FILENAME FROM TABLE(LISTFILES('/test')) WHERE SUBSTR(COLUMN_VALUE,1,3) = 'pis' ORDER BY COLUMN_VALUE) LOOP
      FOR REC IN (SELECT COLUMN_VALUE FILENAME FROM TABLE(LISTFILES('/orcl/pisces')) WHERE COLUMN_VALUE = FILENAMEPISCES ORDER BY COLUMN_VALUE) LOOP
      --FOR REC IN (SELECT COLUMN_VALUE FILENAME FROM TABLE(LISTFILES('C:/oradblogs')) WHERE COLUMN_VALUE = FILENAMEPISCES ORDER BY COLUMN_VALUE) LOOP
      --FOR REC IN (SELECT COLUMN_VALUE FILENAME FROM TABLE(SPLITSTRING('pis090101',',',1)) WHERE SUBSTR(COLUMN_VALUE,1,3) = 'pis') LOOP
      
            --CREATE LOG FILE
            FLOG_HANDLER_B := UTL_FILE.FOPEN(DIRECTORY_NAME, 'LOG_' || UPPER(REC.FILENAME) || '-' || TO_CHAR(SYSDATE, 'HH24MI') || '.LOG', 'W');
          
            --WRITE LOG
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START PROCESS AT ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
            
      
          -- OPEN PISCES FILE
        --dbms_output.put_line(DIRECTORY_NAME||' = '|| REC.FILENAME);
        F_HANDLER_B := UTL_FILE.FOPEN_NCHAR(DIRECTORY_NAME, REC.FILENAME, 'R');
            
            --WRITE LOG
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    START FILENAME = ' || REC.FILENAME);
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    START FILENAME AT ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
            UTL_FILE.FFLUSH(FLOG_HANDLER_B);
            
            -- INSERT FILENAME TO TABLE
            INSERT INTO PISLOGFILES VALUES (REC.FILENAME, SYSDATE, SYSDATE, NULL);
            COMMIT;
        
            BEGIN
            --START READ FROM FILE
                  LOOP
                        --READ LINE
                        UTL_FILE.GET_LINE_NCHAR(F_HANDLER_B, BUF);

                        --CHECK START AND END FILES
                        IF SUBSTR(BUF, 0, 5) != 'START' AND SUBSTR(BUF, 0, 3) != 'END' THEN 
                             --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START SUBSTRING ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
                              --COUNT INDEX RECORD
                              RECORD_INDEX := 1 + NVL(RECORD_INDEX, 0);
                                                                                                  
                              --INPUT TO TABLE OF PISCESDATA TYPE
                              PISCES.CARDTYPE := TRIM(SUBSTR(BUF, 1, 1));
                              PISCES.TMNO := UPPER(TRIM(SUBSTR(BUF, 2, 7)));
                              PISCES.PORT := '000' || TRIM(SUBSTR(BUF, 9, 2));
                              PISCES.DATE_IMPORT := TRIM(SUBSTR(BUF, 11, 8));
                              PISCES.NATION := TRIM(SUBSTR(BUF, 19, 3));
                              PISCES.MODETYPE := '000' || TRIM(SUBSTR(BUF, 22, 1));
                              PISCES.MODEDETAIL := UPPER(TRIM(SUBSTR(BUF, 23, 14)));
                              PISCES.NAME := TRIM(SUBSTR(BUF, 37, 40));
                              PISCES.TYPEOFVISA := '00' || TRIM(SUBSTR(BUF, 77, 2));
                              PISCES.SEX := TRIM(SUBSTR(BUF, 79, 1));
                              PISCES.DOB := MANAGEBIRTHDATE(TRIM(SUBSTR(BUF, 80, 8)));
                              PISCES.PASSPORTNO := UPPER(TRIM(SUBSTR(BUF, 88, 12)));
                              PISCES.USERID := TRIM(SUBSTR(BUF, 100, 4));
                              PISCES.COUNTERNO := TRIM(SUBSTR(BUF, 104, 2));
                              PISCES.INDPP := TRIM(SUBSTR(BUF, 106, 1));
                              PISCES.INDCWL := TRIM(SUBSTR(BUF, 107, 1));
                              PISCES.CWLRECORDNO := TRIM(SUBSTR(BUF, 108, 6));
                              PISCES.TIME := TRIM(SUBSTR(BUF, 114, 6));
                              PISCES.VERIFYFLAG := TRIM(SUBSTR(BUF, 120, 1));
                                                                                                  
                              IF (PISCES.COUNTERNO = '') OR (PISCES.COUNTERNO IS NULL) THEN 
                                    PISCES.COUNTERNO := NULL;
                              END IF;
                              
                              -- SEX
                              IF (PISCES.SEX = '1') THEN
                                  PISCES.SEX := 'M';
                            ELSIF (PISCES.SEX = '2') THEN
                                  PISCES.SEX := 'F';
                              END IF;
                              
                              --VISATYPE
                              IF (PISCES.NATION = 'T03') THEN
                                  PISCES.TYPEOFVISA := '0010';
                              END IF;
                              
                              IF (PISCES.TYPEOFVISA = '00') THEN 
                                  PISCES.TYPEOFVISA := NULL;
                              END IF;
                             --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'END SUBSTRING ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
                              --CHECK LENGTH
                              IF (LENGTH(BUF)!=120) THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR LENGTH NOT EQUAL 120 = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR LENGTH NOT EQUAL 120', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK CARDTYPE
                              IF (PISCES.CARDTYPE > 2) THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR CARDTYPE MORE THAN 2 = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR CARDTYPE MORE THAN 2', BUF, SYSDATE);                              
                                  CONTINUE;    
                              END IF;
                              
                              --CHECK TMNO
                              IF (PISCES.TMNO IS NULL OR PISCES.TMNO = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR TMNO = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR TMNO', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK DATE
                              IF (PISCES.DATE_IMPORT IS NULL OR PISCES.DATE_IMPORT = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR DATE = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR DATE', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK NATION
                              IF (PISCES.NATION IS NULL OR PISCES.NATION = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR NATION = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR NATION', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK NAME
                              IF (PISCES.NAME IS NULL OR PISCES.NAME = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR NAME = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR NAME', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK DOB
                              IF (PISCES.DOB IS NULL OR PISCES.DOB = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR DOB = ' || BUF);    
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR DOB', BUF, SYSDATE);                          
                                  CONTINUE;
                              END IF;
                              
                              --CHECK PASSPORTNO
                              IF (PISCES.PASSPORTNO IS NULL OR PISCES.PASSPORTNO = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR PASSPORTNO = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR PASSPORTNO', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;

                              --CHECK PORT
                            BEGIN
                                  SELECT COLUMN_VALUE INTO CHECK_DEPTCD_INCLUDE FROM TABLE(SPLITSTRING(INCLUDEDEPTCD, ',', 9)) WHERE COLUMN_VALUE = PISCES.PORT;
                              EXCEPTION WHEN OTHERS THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR PORT = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR PORT', BUF, SYSDATE);
                                  CHECK_DEPTCD_INCLUDE := NULL;
                                  CONTINUE;
                              END;
                              
                              --------------------------------------------------------------------------------------------------------------
                              --------------------------------------------------------------------------------------------------------------
                              --------------------------------------------------------------------------------------------------------------
                     -- START IMPORT DATA
                    --SPLIT NAME
                              INDEXFORGETNAME := 0;
                              FOR REC IN (SELECT COLUMN_VALUE AS NAME FROM TABLE(SPLITSTRINGPISCES(PISCES.NAME, ' '))) LOOP
                                    INDEXFORGETNAME := 1 + NVL(INDEXFORGETNAME, 0);
                                    NAMESPLIT(INDEXFORGETNAME) := REC.NAME;
                              END LOOP;
                              
                              --GET PERSONID
                              SELECT 'PIS' || PISCESAUTONUMBER.NEXTVAL INTO PERSONIDTEXT FROM DUAL;
                                                                                                  
                              --QUERY PERMITDAY
                              BEGIN
                                  PERMITDAYS := NULL;
                                    IF (PISCES.CARDTYPE='1') AND (PISCES.NATION <> 'T03') AND (PISCES.TYPEOFVISA IS NOT NULL) THEN
                                         SELECT TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=''GREGORIAN''') + VISATYPE.PERMITTDAYS -1  INTO PERMITDAYS FROM VISATYPE
                                        WHERE VISATYPE.VISATYPECD = MIGRATEVISATYPECD(PISCES.TYPEOFVISA) AND VISATYPE.PERMITTDAYS > 0;                                  
                                    END IF;
                              EXCEPTION WHEN NO_DATA_FOUND THEN
                                    PERMITDAYS := NULL;
                              END;
                                                                                                                         
                              --QUERY THAIPASSPORT
                              BEGIN
                                    IF PISCES.NATION = 'T03' THEN
                                          SELECT THAIPASSPORT.CITIZENID INTO CITIZENID FROM THAIPASSPORT WHERE 
                                          THAIPASSPORT.PASSPORTNO = PISCES.PASSPORTNO AND ROWNUM = 1;
                                    ELSE
                                          CITIZENID := NULL;
                                    END IF;
                              EXCEPTION WHEN NO_DATA_FOUND THEN
                                    CITIZENID := NULL;
                              END;
                              
                              --------------------------------------------------------------------------------------------------------------
                              --------------------------------------------------------------------------------------------------------------
                              --------------------------------------------------------------------------------------------------------------
                              
                              --CHECK TMMAIN DUPLICATE
                              --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHK DUPLICATE TMMAIN ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
                              PORT2PIBICS := NULL;
                              PORT2PIBICS := migrateDeptCd(PISCES.PORT);
                              CHECKDUPTMRUNNO := NULL;
                              
                            BEGIN
                                  IF (PISCES.CARDTYPE = '1') THEN                                        
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER, 'START CHECKDUP  CASE NAME 1 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)||' '||PISCES.DATE_IMPORT || PISCES.TIME);
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            T1.INTDTNO = PISCES.PASSPORTNO AND 
                                            T1.NATIONCD = PISCES.NATION AND T1.INDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.INDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;                                                                                               
                                   END IF; 
                                   IF (PISCES.CARDTYPE = '2') THEN
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            T1.OUTTDTNO = PISCES.PASSPORTNO  AND 
                                            T1.NATIONCD = PISCES.NATION AND T1.OUTDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.OUTDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;                
                                    END IF;
                                    --UTL_FILE.PUT_LINE(FLOG_HANDLER, '   CHECKDUPTMRUNNO = ' || CHECKDUPTMRUNNO);
                                    IF (CHECKDUPTMRUNNO IS NOT NULL) THEN                                    
                                        --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR DUPLICATE RECORD = ' || BUF);                                        
                                          INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR DUPLICATE RECORD', BUF, SYSDATE);
                                        CONTINUE;
                                    END IF;
                              EXCEPTION WHEN NO_DATA_FOUND THEN
                                    CHECKDUPTMRUNNO := NULL;
                              END;                                        
                              /*
                              BEGIN
                                  IF (PISCES.CARDTYPE = '1') THEN
                                        IF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NOT NULL) THEN
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 1 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)||' '||PISCES.DATE_IMPORT || PISCES.TIME);
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM =  NAMESPLIT(2) AND EMIDDLENM =  NAMESPLIT(3) AND 
                                            T1.BIRTHDTE = PISCES.DOB AND T1.SEX = PISCES.SEX AND T1.NATIONCD = PISCES.NATION AND T1.INDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.INDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;                                            
                                        ELSIF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NULL) THEN
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 2 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)||' '||PISCES.DATE_IMPORT || PISCES.TIME);
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM = NAMESPLIT(2) AND EMIDDLENM IS NULL AND 
                                            T1.BIRTHDTE = PISCES.DOB AND T1.SEX = PISCES.SEX AND T1.NATIONCD = PISCES.NATION AND T1.INDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.INDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;  
                                            
                                        ELSIF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NULL) AND (NAMESPLIT(3) IS NULL) THEN
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 3 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)||' '||PISCES.DATE_IMPORT || PISCES.TIME); 
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM IS NULL AND EMIDDLENM IS NULL AND 
                                            T1.BIRTHDTE = PISCES.DOB AND T1.SEX = PISCES.SEX AND T1.NATIONCD = PISCES.NATION AND T1.INDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.INDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1; 
                                            
                                        ELSIF (NAMESPLIT(1) IS  NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NULL)   THEN                                        
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 4 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3));
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            EFAMILYNM IS NULL AND EFIRSTNM = NAMESPLIT(2) AND EMIDDLENM IS NULL AND 
                                            T1.BIRTHDTE = PISCES.DOB AND T1.SEX = PISCES.SEX AND T1.NATIONCD = PISCES.NATION AND T1.INDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.INDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;
                                            
                                        END IF;     
                                    ELSIF (PISCES.CARDTYPE = '2') THEN
                                        IF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NOT NULL) THEN
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 1 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3) ||' '||PISCES.DATE_IMPORT || PISCES.TIME);
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM =  NAMESPLIT(2) AND EMIDDLENM =  NAMESPLIT(3) AND 
                                            T1.BIRTHDTE = PISCES.DOB AND T1.SEX = PISCES.SEX AND T1.NATIONCD = PISCES.NATION AND T1.OUTDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.OUTDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;
                                            
                                        ELSIF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NULL) THEN
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 2 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)||' '||PISCES.DATE_IMPORT || PISCES.TIME);
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM = NAMESPLIT(2) AND EMIDDLENM IS NULL AND 
                                            T1.BIRTHDTE = PISCES.DOB AND T1.SEX = PISCES.SEX AND T1.NATIONCD = PISCES.NATION AND T1.OUTDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.OUTDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;
                                            
                                        ELSIF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NULL) AND (NAMESPLIT(3) IS NULL) THEN
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 3 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)||' '||PISCES.DATE_IMPORT || PISCES.TIME);
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM IS NULL AND EMIDDLENM IS NULL AND 
                                            T1.BIRTHDTE = PISCES.DOB AND T1.SEX = PISCES.SEX AND T1.NATIONCD = PISCES.NATION AND T1.OUTDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.OUTDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;
                                            
                                        ELSIF (NAMESPLIT(1) IS  NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NULL) THEN
                                            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 4 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3));
                                            SELECT TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN T1 WHERE 
                                            EFAMILYNM IS NULL AND EFIRSTNM = NAMESPLIT(2) AND EMIDDLENM IS NULL AND 
                                            T1.BIRTHDTE = PISCES.DOB AND T1.SEX = PISCES.SEX AND T1.NATIONCD = PISCES.NATION AND T1.OUTDEPTCD = PORT2PIBICS AND 
                                            TO_CHAR(T1.OUTDTE, 'YYYYMMDDHH24MISS') = PISCES.DATE_IMPORT || PISCES.TIME AND ROWNUM=1;
                                           
                                        END IF; 
                                    END IF;
                                    --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '   CHECKDUPTMRUNNO = ' || CHECKDUPTMRUNNO);
                                    IF (CHECKDUPTMRUNNO IS NOT NULL) THEN                                    
                                        --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR DUPLICATE RECORD = ' || BUF);
                                          INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR DUPLICATE RECORD', BUF, SYSDATE);
                                        CONTINUE;
                                    END IF;
                              EXCEPTION WHEN NO_DATA_FOUND THEN
                                    CHECKDUPTMRUNNO := NULL;
                              END;
                           
                              */
                      
                                  
                              --UTL_FILE.PUT_LINE(FLOG_HANDLER, 'END CHK DUPLICATE TMMAIN ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
                              -------------------------------------------
                     
                              --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHK MASTER IMM ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
                              --CHECK IMMIGRATION DUPPLICATE
                              BEGIN
                                    IF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NOT NULL) THEN
                                        --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 1 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)
                                        --||' SEX '||PISCES.SEX||' NATION '||PISCES.NATION||' DOB '||PISCES.DOB );
                                        SELECT PERSONID INTO PERSONIDFORDUP FROM IMMIGRATION WHERE 
                                        EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM =  NAMESPLIT(2) AND EMIDDLENM =  NAMESPLIT(3)  AND 
                                        NATIONCD = PISCES.NATION AND SEX = PISCES.SEX AND BIRTHDTE = PISCES.DOB AND ROWNUM = 1;
                                        
                                    ELSIF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NULL) THEN
                                        --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 2 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)
                                        --||' SEX '||PISCES.SEX||' NATION '||PISCES.NATION||' DOB '||PISCES.DOB);
                                        SELECT PERSONID INTO PERSONIDFORDUP FROM IMMIGRATION WHERE 
                                        EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM = NAMESPLIT(2) AND EMIDDLENM IS NULL AND 
                                        NATIONCD = PISCES.NATION AND SEX = PISCES.SEX AND BIRTHDTE = PISCES.DOB AND ROWNUM = 1;  
                                        
                                    ELSIF (NAMESPLIT(1) IS NOT NULL) AND (NAMESPLIT(2) IS NULL) AND (NAMESPLIT(3) IS NULL) THEN
                                        --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 3 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)
                                        --||' SEX '||PISCES.SEX||' NATION '||PISCES.NATION||' DOB '||PISCES.DOB);
                                        SELECT PERSONID INTO PERSONIDFORDUP FROM IMMIGRATION WHERE 
                                        EFAMILYNM = NAMESPLIT(1) AND EFIRSTNM IS NULL AND EMIDDLENM IS NULL AND 
                                        NATIONCD = PISCES.NATION AND SEX = PISCES.SEX AND BIRTHDTE = PISCES.DOB AND ROWNUM = 1;  
                                        
                                    ELSIF (NAMESPLIT(1) IS  NULL) AND (NAMESPLIT(2) IS NOT NULL) AND (NAMESPLIT(3) IS NULL)   THEN
                                        --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'START CHECKDUP  CASE NAME 4 ' || NAMESPLIT(1)|| ' ' ||NAMESPLIT(2) || ' ' ||NAMESPLIT(3)
                                        --||' SEX '||PISCES.SEX||' NATION '||PISCES.NATION||' DOB '||PISCES.DOB);
                                        SELECT PERSONID INTO PERSONIDFORDUP FROM IMMIGRATION WHERE 
                                        EFAMILYNM IS NULL AND EFIRSTNM = NAMESPLIT(2) AND EMIDDLENM IS NULL AND 
                                        NATIONCD = PISCES.NATION AND SEX = PISCES.SEX AND BIRTHDTE = PISCES.DOB AND ROWNUM = 1; 
                                         
                                    END IF;                                    
                                    TMMAIN_PERSONID := PERSONIDFORDUP;  
                              EXCEPTION WHEN NO_DATA_FOUND THEN
                                    PERSONIDFORDUP := NULL;
                                    TMMAIN_PERSONID := PERSONIDTEXT;
                              END;
                              --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'END CHK MASTER IMM ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));       
                              ----------------------------------------                                                                                   
                              -- BUILD SQL COMMAND
                              SQLCOMMAND_TMMAIN := NULL;
                              IF (PISCES.CARDTYPE='1') THEN                                   
                                    INSERT INTO TMMAIN (INTM6NO, INDEPTCD, INDTE, NATIONCD, INCONVCD, INCONVREGNO, EFAMILYNM, EFIRSTNM, EMIDDLENM, INVISATYPECD, SEX, BIRTHDTE, 
                                    INTDTNO, INCREUSR, INTARGETNO, ININTYPE, PERSONID, INTDTCD, INTRAVCD, INVISAEXPDTE, INCREDTE, INCREDTERM, TMRUNNO, EFSNDXNM, ELSNDXNM, EMSNDXNM, 
                                    INVISATYPECDORG, INDEPTCDORG, TYPEDATA) 
                                    VALUES (PISCES.TMNO, PORT2PIBICS,TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=GREGORIAN'),PISCES.NATION,
                                    PISCES.MODETYPE, PISCES.MODEDETAIL, NAMESPLIT(1), NAMESPLIT(2), NAMESPLIT(3), migrateVisatypeCd(PISCES.TYPEOFVISA), PISCES.SEX, PISCES.DOB, PISCES.PASSPORTNO,
                                    'PIS002', PISCES.CWLRECORDNO, PISCES.VERIFYFLAG, TMMAIN_PERSONID, '1', '0001', TO_DATE(NVL(TO_CHAR(PERMITDAYS, 'YYYYMMDD'), NULL), 'YYYYMMDD', 'NLS_CALENDAR=GREGORIAN'),
                                    SYSDATE, '192.169.1.12', PERSONIDTEXT, GETCDGSOUNDEX(NAMESPLIT(2)), GETCDGSOUNDEX(NAMESPLIT(1)), GETCDGSOUNDEX(NAMESPLIT(3)), PISCES.TYPEOFVISA, PISCES.PORT, 'PISCES');
                                    SQLCOMMAND_TMMAIN := 'OKTMMAIN';                                    
                              ELSE
                                    INSERT INTO TMMAIN (OUTTM6NO, OUTDEPTCD, OUTDTE, NATIONCD, OUTCONVCD, OUTCONVREGNO, EFAMILYNM, EFIRSTNM, EMIDDLENM, OUTVISATYPECD, SEX, BIRTHDTE, 
                                    OUTTDTNO, OUTCREUSR, OUTTARGETNO, OUTINTYPE, PERSONID, OUTTDTCD, OUTTRAVCD, OUTVISAEXPDTE, OUTCREDTE, OUTCREDTERM, TMRUNNO, EFSNDXNM, ELSNDXNM, EMSNDXNM, 
                                    OUTVISATYPECDORG, OUTDEPTCDORG, TYPEDATA) 
                                    VALUES (PISCES.TMNO, PORT2PIBICS,TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=GREGORIAN'),PISCES.NATION,
                                    PISCES.MODETYPE, PISCES.MODEDETAIL, NAMESPLIT(1), NAMESPLIT(2), NAMESPLIT(3), migrateVisatypeCd(PISCES.TYPEOFVISA), PISCES.SEX, PISCES.DOB, PISCES.PASSPORTNO,
                                    'PIS002', PISCES.CWLRECORDNO, PISCES.VERIFYFLAG, TMMAIN_PERSONID, '1', '0001', TO_DATE(NVL(TO_CHAR(PERMITDAYS, 'YYYYMMDD'), NULL), 'YYYYMMDD', 'NLS_CALENDAR=GREGORIAN'),
                                    SYSDATE, '192.169.1.12', PERSONIDTEXT, GETCDGSOUNDEX(NAMESPLIT(2)), GETCDGSOUNDEX(NAMESPLIT(1)), GETCDGSOUNDEX(NAMESPLIT(3)), PISCES.TYPEOFVISA, PISCES.PORT, 'PISCES');
                                    SQLCOMMAND_TMMAIN := 'OKTMMAIN';                     
                              END IF;
                                                                                                      
                              -- INSERT OR UPDATE TMMAIN_TMP
                              BEGIN
                                  IF SQLCOMMAND_TMMAIN IS NOT NULL THEN    
                                         -- EXECUTE IMMEDIATE(SQLCOMMAND_TMMAIN);
                                                                                                                                    
                                          --COUNT FOR INSERT TMMAIN_TMP
                                          COUNTER_INSERT_TMMAINTMP := 1 + NVL(COUNTER_INSERT_TMMAINTMP, 0);
                                    END IF;
                              --EXCEPTION WHEN OTHERS THEN
--                                    UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ---------------------------------------------');
--                                    UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR IN SQL = ' || SQLCOMMAND_TMMAIN);
--                                    UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR IN TEXT = ' || BUF);
--                                    UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ---------------------------------------------');
                                    UTL_FILE.FFLUSH(FLOG_HANDLER_B);
                              END;                                                                   
                              --------------------------------------------------------------------------------------------------------------
                              --------------------------------------------------------------------------------------------------------------
                              --------------------------------------------------------------------------------------------------------------
                              SQLCOMMAND_IMMIGRATION := NULL;                                                                    
                              IF (PISCES.CARDTYPE IS NOT NULL) AND (PISCES.TMNO IS NOT NULL) AND (PISCES.PASSPORTNO IS NOT NULL) AND (PISCES.DATE_IMPORT IS NOT NULL) AND (PISCES.DOB IS NOT NULL) THEN
                               --dbms_output.put_line('UPDATE START ');  
                                    IF PERSONIDFORDUP IS NULL THEN     
                                          INSERT INTO IMMIGRATION (PERSONID, TM6NO, INOUTDTE, CARDTYPE, EFIRSTNM, EMIDDLENM, EFAMILYNM, SEX, BIRTHDTE, NATIONCD, TDTCD, TDTNO, 
                                          VISATYPECD, VISAEXPDTE, UPDUSR, UPDDTE, UPDTERM, DEPTCD, CONVCD, CONVREGNO, DEPTCDORG, VISATYPECDORG) 
                                          VALUES(PERSONIDTEXT, PISCES.TMNO, TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=GREGORIAN'), PISCES.CARDTYPE , 
                                          NAMESPLIT(2), NAMESPLIT(3), NAMESPLIT(1), PISCES.SEX, PISCES.DOB, PISCES.NATION, '1', PISCES.PASSPORTNO, migrateVisatypeCd(PISCES.TYPEOFVISA), 
                                          TO_DATE(NVL(TO_CHAR(PERMITDAYS, 'YYYYMMDD'), NULL), 'YYYYMMDD', 'NLS_CALENDAR=GREGORIAN'), 'PIS002', SYSDATE, '192.169.1.12', PORT2PIBICS,
                                          PISCES.MODETYPE, PISCES.MODEDETAIL, PISCES.PORT, PISCES.TYPEOFVISA);                                                                                                     
                                          --SET STATUS FLAG
                                          ISUPDATE_IMMIGRATION := FALSE;
                                          SQLCOMMAND_IMMIGRATION := 'OK'; 
                                    ELSE
                                          SELECT PERSONID, TO_NUMBER(TO_CHAR(INOUTDTE, 'YYYYMMDDHH24MISS')) 
                                          INTO
                                          UPD_PERSONID, CHK_INOUTDTE
                                          FROM IMMIGRATION WHERE PERSONID = PERSONIDFORDUP;

                                          --CHECK INDTE
                                         --CONTINUE WHEN (TO_NUMBER(PISCES.DATE_IMPORT || PISCES.TIME) >=CHK_INOUTDTE);
                                          --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'CHK_INOUTDTE ' || CHK_INOUTDTE); 
                                          --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'CHK PISCES.DATE_IMPORT || PISCES.TIME ' || PISCES.DATE_IMPORT || PISCES.TIME);  
                                         IF TO_NUMBER(PISCES.DATE_IMPORT || PISCES.TIME) > CHK_INOUTDTE THEN
                                          --dbms_output.put_line('UPDATE LINE 1 '||PERSONIDTEXT);
                                          --GENERATE SQL FOR UPDATE IMMIGRATION                                                                                                                                                            
                                            UPDATE IMMIGRATION SET PERSONID =  UPD_PERSONID, TM6NO = PISCES.TMNO, INOUTDTE = TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=''GREGORIAN'),
                                            CARDTYPE = PISCES.CARDTYPE, EFIRSTNM = NAMESPLIT(2), EMIDDLENM = NAMESPLIT(3), EFAMILYNM = NAMESPLIT(1), SEX = PISCES.SEX, BIRTHDTE = PISCES.DOB, 
                                            NATIONCD=PISCES.NATION, TDTCD = '1', TDTNO = PISCES.PASSPORTNO, VISATYPECD = migrateVisatypeCd(PISCES.TYPEOFVISA), 
                                            VISAEXPDTE = NVL(PERMITDAYS, NULL), UPDUSR = 'PIS002', UPDDTE = SYSDATE, UPDTERM =  '192.169.1.12', DEPTCD = PORT2PIBICS, 
                                            IMGINOUT = NULL, CONVCD = PISCES.MODETYPE, CONVREGNO = PISCES.MODEDETAIL, VISATYPECDORG = PISCES.TYPEOFVISA, 
                                            DEPTCDORG = PISCES.PORT WHERE PERSONID = UPD_PERSONID ;    
    
                                            ISUPDATE_IMMIGRATION := TRUE;
                                            SQLCOMMAND_IMMIGRATION := 'OK'; 
                                           END IF;
                                    END IF;
                                                                                                      
                                    -- INSERT OR UPDATE IMMIGRATION
                                    BEGIN
                                        IF SQLCOMMAND_IMMIGRATION IS NOT NULL THEN    
                                                --EXECUTE IMMEDIATE(SQLCOMMAND_IMMIGRATION);
                                                                                                                          
                                                --COUNT FOR INSERT OR UPDATE IMMIGRATION
                                                IF ISUPDATE_IMMIGRATION THEN
                                                      COUNTER_UPDATE_IMMIGRATION := 1 + NVL(COUNTER_UPDATE_IMMIGRATION, 0);
                                                ELSE
                                                      COUNTER_INSERT_IMMIGRATION := 1 + NVL(COUNTER_INSERT_IMMIGRATION, 0);
                                                END IF;
                                          END IF;
                                    --EXCEPTION WHEN OTHERS THEN
--                                          UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ---------------------------------------------');
--                                          UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR IN SQL = ' || SQLCOMMAND_IMMIGRATION);
--                                          UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ERROR IN TEXT = ' || BUF);
--                                          UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ---------------------------------------------');
                                          UTL_FILE.FFLUSH(FLOG_HANDLER_B);
                                    END;
                              END IF;
                             --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'COMMIT RECORD WHEN INSERT OR UPDATE ');            
                              -- COMMIT RECORD WHEN INSERT OR UPDATE 1000 RECORDS
                              IF RECORD_INDEX MOD 100 = 0 THEN
                                    COMMIT;
                                    RECORD_INDEX := 0;
                              END IF;
                        END IF;  
                  END LOOP;
            EXCEPTION WHEN NO_DATA_FOUND THEN
                  UTL_FILE.FCLOSE(F_HANDLER_B);
                  COMMIT;
            END;
                          
            --WRITE LOG
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    INSERT ' || TABLE_TMMAIN_NAME || ' ' || COUNTER_INSERT_TMMAINTMP || ' RECORD(S)');
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    INSERT ' || TABLE_IMMIGRATION_NAME || ' ' || COUNTER_INSERT_IMMIGRATION || ' RECORD(S)');
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    UPDATE ' || TABLE_IMMIGRATION_NAME || ' ' || COUNTER_UPDATE_IMMIGRATION || ' RECORD(S)');
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    COMMIT ALL ' || (COUNTER_INSERT_TMMAINTMP + COUNTER_INSERT_IMMIGRATION + COUNTER_UPDATE_IMMIGRATION) || ' RECORD(S)');
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    END FILENAME = ' || REC.FILENAME);
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    FINNISH FILENAME AT ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, '                    ========================================================');
            UTL_FILE.FFLUSH(FLOG_HANDLER_B);
    
            
            BEGIN
                SELECT BATCHLOGNO INTO BATCHLOGNOSEQ FROM PISCESBATCHTMP WHERE TYPE = 'O';
            EXCEPTION WHEN NO_DATA_FOUND THEN
                BATCHLOGNOSEQ := 0;
            END;
            


            BEGIN
                SELECT COUNT(*)  INTO COUNTER_ERROR FROM PISLOGDETAILS WHERE FILENAME = REC.FILENAME;            
            END;
            
            --UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'CHECK_ISERROR: ' || COUNTER_ERROR);
            IF  COUNTER_ERROR > 0 THEN
                --UTL_FILE.PUT_LINE(FLOG_HANDLER, 'CHECK_ISERROR CASE ERROR: ' || COUNTER_INSERT_TMMAINTMP);
                UPDATE BATCHLOG SET TOTALROW = (TOTALROW +(COUNTER_INSERT_TMMAINTMP+COUNTER_ERROR)), PRROW = (PRROW+COUNTER_INSERT_TMMAINTMP),
                ERRROW=(ERRROW+COUNTER_ERROR), TOTALINS = (TOTALINS +COUNTER_INSERT_TMMAINTMP), STATUS='1', ENDPROCESS = SYSDATE
                WHERE BATCHLOGNO = BATCHLOGNOSEQ;   
                
                UPDATE BATCHLOG SET TOTALROW = (COUNTER_INSERT_TMMAINTMP+COUNTER_ERROR), PRROW = COUNTER_INSERT_TMMAINTMP,
                ERRROW= COUNTER_ERROR, TOTALINS = COUNTER_INSERT_TMMAINTMP, STATUS='1', ENDPROCESS = SYSDATE,
                NOTE = 'ERROR DETAIL PISLOGDETAILS' , DATAFILEERROR = 'FILED FILE NAME: '|| REC.FILENAME, TFSTATUS = 'Y'
                WHERE BATCHLOGNO = BATCHLOGNO_AABSEQ;   
                
            ELSE     
                --UTL_FILE.PUT_LINE(FLOG_HANDLER, 'CHECK_ISERROR CASE NO ERROR: ' || COUNTER_INSERT_TMMAINTMP);              
                UPDATE BATCHLOG SET TOTALROW = (TOTALROW +(COUNTER_INSERT_TMMAINTMP+COUNTER_ERROR)), PRROW = (PRROW+COUNTER_INSERT_TMMAINTMP),
                ERRROW=(ERRROW+COUNTER_ERROR), TOTALINS = (TOTALINS +COUNTER_INSERT_TMMAINTMP), STATUS='1', ENDPROCESS = SYSDATE,
                NOTE = NULL, DATAFILEERROR = NULL
                WHERE BATCHLOGNO = BATCHLOGNOSEQ;      
                
                UPDATE BATCHLOG SET TOTALROW = (COUNTER_INSERT_TMMAINTMP+COUNTER_ERROR), PRROW = COUNTER_INSERT_TMMAINTMP,
                ERRROW= COUNTER_ERROR, TOTALINS = COUNTER_INSERT_TMMAINTMP, STATUS='1', ENDPROCESS = SYSDATE, 
                NOTE = NULL, DATAFILEERROR = NULL, TFSTATUS = 'Y'
                WHERE BATCHLOGNO = BATCHLOGNO_AABSEQ;    
                                    
            END IF;
            
            --DELETE PISCESBATCHTMP;
            
            COUNTER_INSERT_TMMAINTMP := 0;
            COUNTER_INSERT_IMMIGRATION := 0;
            COUNTER_UPDATE_IMMIGRATION := 0;
            
            UTL_FILE.FREMOVE('PISCES_DIR', REC.FILENAME);
            --UTL_FILE.FREMOVE('PISCES_DIR', SUBSTR(REC.FILENAME, 1,9));
            
            UTL_FILE.PUT_LINE(FLOG_HANDLER_B, 'FINNISH PROCESS AT ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
            UTL_FILE.FFLUSH(FLOG_HANDLER_B);
            UTL_FILE.FCLOSE(FLOG_HANDLER_B);
            
            -- UPDATE FILENAME TO TABLE
            UPDATE PISLOGFILES SET ENDDTE = SYSDATE WHERE PISFILENAME = REC.FILENAME;
            COMMIT;
      END LOOP;
END;

END IMPPIS2PIBICS_AAB;
/
  GRANT EXECUTE ON "PIBICSDM2"."IMPPIS2PIBICS_AAB" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."IMPPIS2PIBICS_AAB" TO "BIOSAADM";
