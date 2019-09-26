CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."IMMPORTPISDATA" IS
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
      F_HANDLER UTL_FILE.FILE_TYPE;
      BUF VARCHAR2(1000);
      RECORD_INDEX NUMBER;
          
      --DECLARE FILE WRITE LOG
      FLOG_HANDLER UTL_FILE.FILE_TYPE;
          
      --DECLARE RECORD COUNTER FOR LOG
      COUNTER_INSERT_TMMAINTMP NUMBER := 0;
      COUNTER_INSERT_IMMIGRATION NUMBER := 0;
      COUNTER_UPDATE_IMMIGRATION NUMBER := 0;
          
      --STATUS IMMIGRATION INSERT OR UPDATE
      ISUPDATE_IMMIGRATION BOOLEAN := FALSE;
      
      CHECK_DEPTCD_INCLUDE VARCHAR2(100);
      
      -- NAME OF TABLE INSERT AND UPDATE
      TABLE_TMMAIN_NAME CONSTANT VARCHAR2(30) := 'TMMAIN_PIS';
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
                RETURN SUBSTR(P_BIRTHDATE, 7, 2) || '/' || SUBSTR(P_BIRTHDATE, 5, 2) || '/' || SUBSTR(P_BIRTHDATE, 1, 4);
            END IF;
            RETURN NULL;
      END;
BEGIN      
      -- GET FILE FROM DIRECTORY
      --FOR REC IN (SELECT COLUMN_VALUE FILENAME FROM TABLE(LISTFILES('/test')) WHERE SUBSTR(COLUMN_VALUE,1,3) = 'pis' ORDER BY COLUMN_VALUE) LOOP
      FOR REC IN (SELECT COLUMN_VALUE FILENAME FROM TABLE(LISTFILES('/orcl/pisces')) WHERE SUBSTR(COLUMN_VALUE,1,3) = 'pis' ORDER BY COLUMN_VALUE) LOOP
        --FOR REC IN (SELECT COLUMN_VALUE FILENAME FROM TABLE(LISTFILES('C:/oradblogs')) WHERE SUBSTR(COLUMN_VALUE,1,3) = 'pis' ORDER BY COLUMN_VALUE) LOOP
      --FOR REC IN (SELECT COLUMN_VALUE FILENAME FROM TABLE(SPLITSTRING('pis090101',',',1)) WHERE SUBSTR(COLUMN_VALUE,1,3) = 'pis') LOOP
      
            --CREATE LOG FILE
            FLOG_HANDLER := UTL_FILE.FOPEN(DIRECTORY_NAME, 'LOG_' || UPPER(REC.FILENAME) || '-' || TO_CHAR(SYSDATE, 'HH24MI') || '.LOG', 'W');
          
            --WRITE LOG
            UTL_FILE.PUT_LINE(FLOG_HANDLER, 'START PROCESS AT ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
      
          -- OPEN PISCES FILE
        --dbms_output.put_line(DIRECTORY_NAME||' = '|| REC.FILENAME);
        F_HANDLER := UTL_FILE.FOPEN_NCHAR(DIRECTORY_NAME, REC.FILENAME, 'R');
            
            --WRITE LOG
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    START FILENAME = ' || REC.FILENAME);
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    START FILENAME AT ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
            UTL_FILE.FFLUSH(FLOG_HANDLER);
            
            -- INSERT FILENAME TO TABLE
            INSERT INTO PISLOGFILES VALUES (REC.FILENAME, SYSDATE, SYSDATE, NULL);
            COMMIT;
        
            BEGIN
            --START READ FROM FILE
                  LOOP
                        --READ LINE
                        UTL_FILE.GET_LINE_NCHAR(F_HANDLER, BUF);

                        --CHECK START AND END FILES
                        IF SUBSTR(BUF, 0, 5) != 'START' AND SUBSTR(BUF, 0, 3) != 'END' THEN 
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
                              
                              --CHECK LENGTH
                              IF (LENGTH(BUF)!=120) THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR LENGTH NOT EQUAL 120 = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR LENGTH NOT EQUAL 120', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK CARDTYPE
                              IF (PISCES.CARDTYPE > 2) THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR CARDTYPE MORE THAN 2 = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR CARDTYPE MORE THAN 2', BUF, SYSDATE);                              
                                  CONTINUE;    
                              END IF;
                              
                              --CHECK TMNO
                              IF (PISCES.TMNO IS NULL OR PISCES.TMNO = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR TMNO = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR TMNO', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK DATE
                              IF (PISCES.DATE_IMPORT IS NULL OR PISCES.DATE_IMPORT = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR DATE = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR DATE', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK NATION
                              IF (PISCES.NATION IS NULL OR PISCES.NATION = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR NATION = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR NATION', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK NAME
                              IF (PISCES.NAME IS NULL OR PISCES.NAME = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR NAME = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR NAME', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;
                              
                              --CHECK DOB
                              IF (PISCES.DOB IS NULL OR PISCES.DOB = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR DOB = ' || BUF);    
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR DOB', BUF, SYSDATE);                          
                                  CONTINUE;
                              END IF;
                              
                              --CHECK PASSPORTNO
                              IF (PISCES.PASSPORTNO IS NULL OR PISCES.PASSPORTNO = '') THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR PASSPORTNO = ' || BUF);
                                    INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR PASSPORTNO', BUF, SYSDATE);                              
                                  CONTINUE;
                              END IF;

                              --CHECK PORT
                            BEGIN
                                  SELECT COLUMN_VALUE INTO CHECK_DEPTCD_INCLUDE FROM TABLE(SPLITSTRING(INCLUDEDEPTCD, ',', 9)) WHERE COLUMN_VALUE = PISCES.PORT;
                              EXCEPTION WHEN OTHERS THEN
                                  --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR PORT = ' || BUF);
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
                              FOR REC IN (SELECT COLUMN_VALUE AS NAME FROM TABLE(SPLITSTRING(PISCES.NAME, ' '))) LOOP
                                    INDEXFORGETNAME := 1 + NVL(INDEXFORGETNAME, 0);
                                    NAMESPLIT(INDEXFORGETNAME) := REC.NAME;
                              END LOOP;
                              
                              --GET PERSONID
                              SELECT 'PIS' || PISCESAUTONUMBER.NEXTVAL INTO PERSONIDTEXT FROM DUAL;
                                                                                                  
                              --QUERY PERMITDAY
                              BEGIN
                                  PERMITDAYS := NULL;
                                    IF (PISCES.CARDTYPE='1') AND (PISCES.NATION <> 'T03') AND (PISCES.TYPEOFVISA IS NOT NULL) THEN
                                          SELECT TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=''GREGORIAN''') + VISATYPE.PERMITTDAYS -1 INTO PERMITDAYS FROM VISATYPE
                                          WHERE VISATYPE.VISATYPECD = migrateVisatypeCd(PISCES.TYPEOFVISA);                                  
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
                              CHECKDUPTMRUNNO := NULL;
                              BEGIN
                                  IF (PISCES.CARDTYPE = '1') THEN
                                          SELECT T1.TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN_PIS T1
                                          WHERE 
                                          NVL(T1.EFAMILYNM, ' ') = NVL(NAMESPLIT(1), ' ') AND
                                          NVL(T1.EFIRSTNM, ' ') = NVL(NAMESPLIT(2), ' ')  AND
                                          NVL(T1.EMIDDLENM, ' ') = NVL(NAMESPLIT(3), ' ') AND
                                          NVL(T1.BIRTHDTE, ' ') = NVL(PISCES.DOB, ' ') AND
                                          T1.SEX = PISCES.SEX AND
                                          T1.NATIONCD = PISCES.NATION AND
                                          T1.INDEPTCDORG = PISCES.PORT AND 
                                          T1.INDTE = TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=''GREGORIAN''');
                                    ELSIF (PISCES.CARDTYPE = '2') THEN
                                        SELECT T1.TMRUNNO INTO CHECKDUPTMRUNNO FROM TMMAIN_PIS T1
                                          WHERE 
                                          NVL(T1.EFAMILYNM, ' ') = NVL(NAMESPLIT(1), ' ') AND
                                          NVL(T1.EFIRSTNM, ' ') = NVL(NAMESPLIT(2), ' ')  AND
                                          NVL(T1.EMIDDLENM, ' ') = NVL(NAMESPLIT(3), ' ') AND
                                          NVL(T1.BIRTHDTE, ' ') = NVL(PISCES.DOB, ' ') AND
                                          T1.SEX = PISCES.SEX AND
                                          T1.NATIONCD = PISCES.NATION AND
                                          T1.OUTDEPTCDORG = PISCES.PORT AND
                                          T1.OUTDTE = TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=''GREGORIAN''');
                                    END IF;
                                    
                                    IF (CHECKDUPTMRUNNO IS NOT NULL) THEN
                                        --UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR DUPLICATE RECORD = ' || BUF);
                                          INSERT INTO PISLOGDETAILS VALUES(PLDSEQNO.NEXTVAL, REC.FILENAME, 'ERROR DUPLICATE RECORD', BUF, SYSDATE);
                                        CONTINUE;
                                    END IF;
                              EXCEPTION WHEN NO_DATA_FOUND THEN
                                    CHECKDUPTMRUNNO := NULL;
                              END;
                              -------------------------------------------
                              --CHECK IMMIGRATION DUPPLICATE
                              BEGIN
                                    SELECT PERSONID INTO PERSONIDFORDUP FROM IMMIGRATION WHERE 
                                    NVL(EFAMILYNM, ' ') = NVL(NAMESPLIT(1), ' ') AND 
                                    NVL(EFIRSTNM, ' ') = NVL(NAMESPLIT(2), ' ') AND 
                                    NVL(EMIDDLENM, ' ') = NVL(NAMESPLIT(3), ' ') AND 
                                    NATIONCD = PISCES.NATION AND 
                                    SEX = PISCES.SEX AND 
                                    BIRTHDTE = PISCES.DOB AND
                                    ROWNUM = 1;
                                    TMMAIN_PERSONID := PERSONIDFORDUP;  
                              EXCEPTION WHEN NO_DATA_FOUND THEN
                                    PERSONIDFORDUP := NULL;
                                    TMMAIN_PERSONID := PERSONIDTEXT;
                              END;        
                              ----------------------------------------                                                                                   
                              -- BUILD SQL COMMAND
                              SQLCOMMAND_TMMAIN := NULL;
                              IF (PISCES.CARDTYPE='1') THEN
                                    SQLCOMMAND_TMMAIN := 'INSERT INTO ' || TABLE_TMMAIN_NAME || ' (INTM6NO, INDEPTCD, INDTE, NATIONCD, INCONVCD, INCONVREGNO, EFAMILYNM, EFIRSTNM, EMIDDLENM, INVISATYPECD, SEX, BIRTHDTE, INTDTNO, INCREUSR, INTARGETNO, ININTYPE, PERSONID, INTDTCD, INTRAVCD, INVISAEXPDTE, INCREDTE, INCREDTERM, TMRUNNO, EFSNDXNM, ELSNDXNM, EMSNDXNM, INVISATYPECDORG, INDEPTCDORG) VALUES (''';
                              ELSE
                                    SQLCOMMAND_TMMAIN := 'INSERT INTO ' || TABLE_TMMAIN_NAME || ' (OUTTM6NO, OUTDEPTCD, OUTDTE, NATIONCD, OUTCONVCD, OUTCONVREGNO, EFAMILYNM, EFIRSTNM, EMIDDLENM, OUTVISATYPECD, SEX, BIRTHDTE, OUTTDTNO, OUTCREUSR, OUTTARGETNO, OUTINTYPE, PERSONID, OUTTDTCD, OUTTRAVCD, OUTVISAEXPDTE, OUTCREDTE, OUTCREDTERM, TMRUNNO, EFSNDXNM, ELSNDXNM, EMSNDXNM, OUTVISATYPECDORG, OUTDEPTCDORG) VALUES (''';
                              END IF;
                                                                                                      
                              --CONCAT VALUE IN STATEMENT    
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || PISCES.TMNO || ''', ' || 'migrateDeptCd('''||PISCES.PORT||''')' || ', ' || 'TO_DATE(' || PISCES.DATE_IMPORT || PISCES.TIME || ', ''YYYYMMDDHH24MISS'', ''NLS_CALENDAR=''''GREGORIAN'''''')' || ', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || PISCES.NATION || ''', ''' || PISCES.MODETYPE || ''', ''' || PISCES.MODEDETAIL || ''', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || NAMESPLIT(1) || ''', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || NAMESPLIT(2) || ''', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || NAMESPLIT(3) || ''', ';        
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN ||  'migrateVisatypeCd('''||PISCES.TYPEOFVISA||''')'  || ', ''' || PISCES.SEX || ''', ''' || PISCES.DOB || ''', ''' || PISCES.PASSPORTNO || ''', ''' || 'PIS001' || ''', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || PISCES.CWLRECORDNO || ''', ''' || PISCES.VERIFYFLAG || ''', ''' || TMMAIN_PERSONID || ''', ''' || '1' || ''', ''' || '0001' || ''', '  || 'TO_DATE(' || NVL(TO_CHAR(PERMITDAYS, 'YYYYMMDD'), 'NULL')  || ', ''YYYYMMDD'', ''NLS_CALENDAR=''''GREGORIAN'''''')' || ', ' || 'SYSDATE' || ', ''' || '192.169.1.12' || ''',''' || PERSONIDTEXT  || ''', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || GETCDGSOUNDEX(NAMESPLIT(2)) || ''', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || GETCDGSOUNDEX(NAMESPLIT(1)) || ''', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || GETCDGSOUNDEX(NAMESPLIT(3)) || ''', ''';
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || PISCES.TYPEOFVISA || ''', ''';                              
                              SQLCOMMAND_TMMAIN := SQLCOMMAND_TMMAIN || PISCES.PORT  || ''')';

                              -- INSERT OR UPDATE TMMAIN_TMP
                              BEGIN
                                  IF SQLCOMMAND_TMMAIN IS NOT NULL THEN    
                                          EXECUTE IMMEDIATE(SQLCOMMAND_TMMAIN);
                                                                                                                                    
                                          --COUNT FOR INSERT TMMAIN_TMP
                                          COUNTER_INSERT_TMMAINTMP := 1 + NVL(COUNTER_INSERT_TMMAINTMP, 0);
                                    END IF;
                              EXCEPTION WHEN OTHERS THEN
--                                    UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ---------------------------------------------');
--                                    UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR IN SQL = ' || SQLCOMMAND_TMMAIN);
--                                    UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR IN TEXT = ' || BUF);
--                                    UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ---------------------------------------------');
                                    UTL_FILE.FFLUSH(FLOG_HANDLER);
                              END;                                                                   
                              --------------------------------------------------------------------------------------------------------------
                              --------------------------------------------------------------------------------------------------------------
                              --------------------------------------------------------------------------------------------------------------
                              SQLCOMMAND_IMMIGRATION := NULL;                                                                    
                              IF (PISCES.CARDTYPE IS NOT NULL) AND (PISCES.TMNO IS NOT NULL) AND (PISCES.PASSPORTNO IS NOT NULL) AND (PISCES.DATE_IMPORT IS NOT NULL) AND (PISCES.DOB IS NOT NULL) THEN
                               --dbms_output.put_line('UPDATE START ');  
                                    IF PERSONIDFORDUP IS NULL THEN     
                                          SQLCOMMAND_IMMIGRATION := 'INSERT INTO ' || TABLE_IMMIGRATION_NAME || '(PERSONID, TM6NO, INOUTDTE, CARDTYPE, EFIRSTNM, EMIDDLENM, EFAMILYNM, SEX, BIRTHDTE, NATIONCD, TDTCD, TDTNO, VISATYPECD, VISAEXPDTE, UPDUSR, UPDDTE, UPDTERM, DEPTCD, CONVCD, CONVREGNO, DEPTCDORG, VISATYPECDORG) VALUES(''';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || PERSONIDTEXT || ''', ''' || PISCES.TMNO || ''', ' || 'TO_DATE(' || PISCES.DATE_IMPORT || PISCES.TIME || ', ''YYYYMMDDHH24MISS'', ''NLS_CALENDAR=''''GREGORIAN'''''')' || ', ''' || PISCES.CARDTYPE || ''', ''';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || NAMESPLIT(2) || ''', ''' || NAMESPLIT(3) || ''', ''' || NAMESPLIT(1) || ''', ''' || PISCES.SEX || ''', ''' || PISCES.DOB || ''', ''' || PISCES.NATION || ''', ''' || '1' || ''', ''' || PISCES.PASSPORTNO || ''', ' || 'migrateVisatypeCd('''||PISCES.TYPEOFVISA||''')'  || ', ' || 'TO_DATE(' || NVL(TO_CHAR(PERMITDAYS, 'YYYYMMDD'), 'NULL')  || ', ''YYYYMMDD'', ''NLS_CALENDAR=''''GREGORIAN'''''')' || ', ''' || 'PIS001' || ''', ' || 'SYSDATE' || ', ''' || '192.169.1.12' || ''', ' || 'migrateDeptCd('''||PISCES.PORT||''')' || ', ''';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || PISCES.MODETYPE || ''', ''' || PISCES.MODEDETAIL || ''', ''' || PISCES.PORT || ''', ''' || PISCES.TYPEOFVISA ||''')';
                                                                                                                                              
                                          --SET STATUS FLAG
                                          ISUPDATE_IMMIGRATION := FALSE;
                                    ELSE
                                          --QUERY IMMIGRATION DATA FOR UPDATE
                                          /*SELECT PERSONID, TM6NO, INOUTDTE, CARDTYPE, EFIRSTNM, EMIDDLENM, EFAMILYNM, SEX, BIRTHDTE, NATIONCD, TDTCD, TDTNO, VISATYPECD, VISAEXPDTE, UPDUSR, UPDDTE, UPDTERM, DEPTCD, CONVCD, CONVREGNO
                                          INTO
                                          UPD_PERSONID, UPD_TM6NO, UPD_INOUTDTE, UPD_CARDTYPE, UPD_EFIRSTNM, UPD_EMIDDLENM, UPD_EFAMILYNM, UPD_SEX, UPD_BIRTHDTE, UPD_NATIONCD, UPD_TDTCD, UPD_TDTNO, UPD_VISATYPECD,
                                          UPD_VISAEXPDTE, UPD_UPDUSR, UPD_UPDDTE, UPD_UPDTERM, UPD_DEPTCD, UPD_CONVCD, UPD_CONVREGNO
                                          FROM IMMIGRATION WHERE PERSONID = PERSONIDFORDUP;*/
                                          
                                          SELECT PERSONID, TO_NUMBER(TO_CHAR(INOUTDTE, 'YYYYMMDDHH24MISS')) 
                                          INTO
                                          UPD_PERSONID, CHK_INOUTDTE
                                          FROM IMMIGRATION WHERE PERSONID = PERSONIDFORDUP;
                                          
                                          --dbms_output.put_line('UPDATE BEFORE '||PERSONIDTEXT);
                                          --dbms_output.put_line('DATE FILE '||TO_NUMBER(PISCES.DATE_IMPORT || PISCES.TIME)||' TYPEOFVISA '||migrateVisatypeCd(PISCES.TYPEOFVISA));
                                          --dbms_output.put_line('DATE IMMI '||CHK_INOUTDTE);
                                          
                                          --CHECK INDTE
                                         --CONTINUE WHEN (TO_NUMBER(PISCES.DATE_IMPORT || PISCES.TIME) >=CHK_INOUTDTE);
                                          --UTL_FILE.PUT_LINE(FLOG_HANDLER, 'CHK_INOUTDTE ' || CHK_INOUTDTE); 
                                          --UTL_FILE.PUT_LINE(FLOG_HANDLER, 'CHK PISCES.DATE_IMPORT || PISCES.TIME ' || PISCES.DATE_IMPORT || PISCES.TIME);  
                                         IF TO_NUMBER(PISCES.DATE_IMPORT || PISCES.TIME) > CHK_INOUTDTE THEN
                                          --dbms_output.put_line('UPDATE LINE 1 '||PERSONIDTEXT);
                                          --GENERATE SQL FOR UPDATE IMMIGRATION     
                                          UPD_TM6NO := PISCES.TMNO;
                                          UPD_INOUTDTE := TO_DATE(PISCES.DATE_IMPORT || PISCES.TIME, 'YYYYMMDDHH24MISS', 'NLS_CALENDAR=''GREGORIAN''');
                                          UPD_CARDTYPE := PISCES.CARDTYPE;
                                          UPD_EFIRSTNM := NAMESPLIT(2);
                                          UPD_EMIDDLENM := NAMESPLIT(3);
                                          UPD_EFAMILYNM := NAMESPLIT(1);
                                          UPD_SEX := PISCES.SEX;
                                          UPD_BIRTHDTE := PISCES.DOB;
                                          UPD_NATIONCD := PISCES.NATION;
                                          UPD_TDTCD := '1';
                                          UPD_TDTNO := PISCES.PASSPORTNO;
                                          UPD_VISATYPECD := PISCES.TYPEOFVISA;
                                          UPD_VISAEXPDTE := NVL(PERMITDAYS, NULL);
                                          UPD_UPDUSR := 'PIS001';
                                          UPD_UPDDTE := SYSDATE;
                                          UPD_UPDTERM := '192.169.1.12';
                                          UPD_DEPTCD := PISCES.PORT;
                                          UPD_CONVCD := PISCES.MODETYPE;
                                          UPD_CONVREGNO := PISCES.MODEDETAIL;
                                          
                                                                                                                                                        
                                          SQLCOMMAND_IMMIGRATION := 'UPDATE ' || TABLE_IMMIGRATION_NAME || ' SET PERSONID = ''' || UPD_PERSONID || ''', ' || 'TM6NO = ''' || UPD_TM6NO || ''', ' || 'INOUTDTE = TO_DATE(''' || TO_CHAR(UPD_INOUTDTE, 'YYYYMMDDHH24MISS') || ''', ''YYYYMMDDHH24MISS'', ''NLS_CALENDAR=''''GREGORIAN'')' || ', ' || 'CARDTYPE = ''' || UPD_CARDTYPE || ''', ';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || 'EFIRSTNM = ''' || UPD_EFIRSTNM || ''', ' || 'EMIDDLENM = ''' || UPD_EMIDDLENM || ''', ' || 'EFAMILYNM = ''' || UPD_EFAMILYNM || ''', ' || 'SEX = ''' || UPD_SEX || ''', ';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || 'BIRTHDTE = ''' || UPD_BIRTHDTE || ''', ' || 'NATIONCD = ''' || UPD_NATIONCD || ''', ' || 'TDTCD = ''' || UPD_TDTCD || ''', ' || 'TDTNO = ''' || UPD_TDTNO || ''', ';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || 'VISATYPECD = ' || 'migrateVisatypeCd('''||UPD_VISATYPECD||''')' || ', ' || 'VISAEXPDTE = ''' || UPD_VISAEXPDTE || ''', ' || 'UPDUSR = ''' || UPD_UPDUSR || ''', ' || 'UPDDTE = ' || 'SYSDATE' || ', ';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || 'UPDTERM = ''' || UPD_UPDTERM || ''', ' || 'DEPTCD = '  || 'migrateDeptCd('''||UPD_DEPTCD||''')' || ', ';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || 'IMGINOUT = ' || 'NULL' || ', ';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || 'CONVCD = ''' || UPD_CONVCD || ''', ' || 'CONVREGNO = ''' || UPD_CONVREGNO || '''  , '|| 'VISATYPECDORG = ''' || UPD_VISATYPECD || ''', '|| 'DEPTCDORG = ''' || UPD_DEPTCD || ''' ';
                                          SQLCOMMAND_IMMIGRATION := SQLCOMMAND_IMMIGRATION || 'WHERE PERSONID = ''' || UPD_PERSONID || '''';
                                          
                                          --dbms_output.put_line(SQLCOMMAND_IMMIGRATION);                                                                              
                                          --SET STATUS FLAG
                                          ISUPDATE_IMMIGRATION := TRUE;
                                           END IF;
                                    END IF;
                                                                                                      
                                    -- INSERT OR UPDATE IMMIGRATION
                                    BEGIN
                                        IF SQLCOMMAND_IMMIGRATION IS NOT NULL THEN    
                                                EXECUTE IMMEDIATE(SQLCOMMAND_IMMIGRATION);
                                                                                                                          
                                                --COUNT FOR INSERT OR UPDATE IMMIGRATION
                                                IF ISUPDATE_IMMIGRATION THEN
                                                      COUNTER_UPDATE_IMMIGRATION := 1 + NVL(COUNTER_UPDATE_IMMIGRATION, 0);
                                                ELSE
                                                      COUNTER_INSERT_IMMIGRATION := 1 + NVL(COUNTER_INSERT_IMMIGRATION, 0);
                                                END IF;
                                          END IF;
                                    EXCEPTION WHEN OTHERS THEN
--                                          UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ---------------------------------------------');
--                                          UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR IN SQL = ' || SQLCOMMAND_IMMIGRATION);
--                                          UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ERROR IN TEXT = ' || BUF);
--                                          UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ---------------------------------------------');
                                          UTL_FILE.FFLUSH(FLOG_HANDLER);
                                    END;
                              END IF;                                             
                              -- COMMIT RECORD WHEN INSERT OR UPDATE 1000 RECORDS
                              IF RECORD_INDEX MOD 100 = 0 THEN
                                    COMMIT;
                                    RECORD_INDEX := 0;
                              END IF;
                        END IF;  
                  END LOOP;
            EXCEPTION WHEN NO_DATA_FOUND THEN
                  UTL_FILE.FCLOSE(F_HANDLER);
                  COMMIT;
            END;
                          
            --WRITE LOG
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    INSERT ' || TABLE_TMMAIN_NAME || ' ' || COUNTER_INSERT_TMMAINTMP || ' RECORD(S)');
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    INSERT ' || TABLE_IMMIGRATION_NAME || ' ' || COUNTER_INSERT_IMMIGRATION || ' RECORD(S)');
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    UPDATE ' || TABLE_IMMIGRATION_NAME || ' ' || COUNTER_UPDATE_IMMIGRATION || ' RECORD(S)');
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    COMMIT ALL ' || (COUNTER_INSERT_TMMAINTMP + COUNTER_INSERT_IMMIGRATION + COUNTER_UPDATE_IMMIGRATION) || ' RECORD(S)');
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    END FILENAME = ' || REC.FILENAME);
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    FINNISH FILENAME AT ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
            UTL_FILE.PUT_LINE(FLOG_HANDLER, '                    ========================================================');
            UTL_FILE.FFLUSH(FLOG_HANDLER);
            COUNTER_INSERT_TMMAINTMP := 0;
            COUNTER_INSERT_IMMIGRATION := 0;
            COUNTER_UPDATE_IMMIGRATION := 0;
            
            UTL_FILE.PUT_LINE(FLOG_HANDLER, 'FINNISH PROCESS AT ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS'));
            UTL_FILE.FFLUSH(FLOG_HANDLER);
          UTL_FILE.FCLOSE(FLOG_HANDLER);
            
            -- UPDATE FILENAME TO TABLE
            UPDATE PISLOGFILES SET ENDDTE = SYSDATE WHERE PISFILENAME = REC.FILENAME;
            COMMIT;
      END LOOP;
END;
END IMMPORTPISDATA;
/
