CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_WANTED_POLIS" 
IS
 v_dstart VARCHAR2 (15);
 v_dend VARCHAR2 (15);
 var_rows NUMBER;
 vstdate DATE;
 veddate DATE;

BEGIN
 /* Create date : 10-6-2109 */
 v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
 v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.WANTED_POLIS DM
  USING (SELECT * 
     FROM PIBICS.WANTED_POLIS@PIBICS_PROD
     WHERE (KEY_DATE >= TO_DATE(v_dstart,'yyyymmdd')
      AND KEY_DATE < TO_DATE(v_dend,'yyyymmdd'))
      OR
	  (UPDDTE >= TO_DATE(v_dstart,'yyyymmdd')
      AND UPDDTE < TO_DATE(v_dend,'yyyymmdd'))
	  ) P
  ON (DM.WPSEQNO = P.WPSEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.WPCD = P.WPCD,
     DM.FIRST_NAME = P.FIRST_NAME,
     DM.NICKNAME = P.NICKNAME,
     DM.LAST_NAME = P.LAST_NAME,
     DM.ENG_FIRST_NAME = P.ENG_FIRST_NAME,
     DM.ENG_MIDDLE_NAME = P.ENG_MIDDLE_NAME,
     DM.ENG_LAST_NAME = P.ENG_LAST_NAME,
     DM.BIRTH_DATE = P.BIRTH_DATE,
     DM.SEX = P.SEX,
     DM.NATION_CODE = P.NATION_CODE,
     DM.POLIS_NAME = P.POLIS_NAME,
     DM.MOBILENO = P.MOBILENO,
     DM.WARRANTNO = P.WARRANTNO,
     DM.WARRANT_DATE = P.WARRANT_DATE,
     DM.WARRANT_DUE_DATE = P.WARRANT_DUE_DATE,
     DM.ADDR = P.ADDR,
     DM.CMAJOR_CODE = P.CMAJOR_CODE,
     DM.ID_NO = P.ID_NO,
     DM.CRIME_NO = P.CRIME_NO,
     DM.CRIME_YEAR = P.CRIME_YEAR,
     DM.ORG_CODE = P.ORG_CODE,
     DM.OFFENDER_NO = P.OFFENDER_NO,
     DM.RELEASE_FLAG = P.RELEASE_FLAG,
     DM.RELEASE_DATE = P.RELEASE_DATE,
     DM.CAUSE = P.CAUSE,
     DM.LOGIN_ID = P.LOGIN_ID,
     DM.KEY_DATE = P.KEY_DATE,
     DM.UPDUSR = P.UPDUSR,
     DM.UPDDTE = P.UPDDTE,
     DM.FLAGPROCESS = P.FLAGPROCESS,
     DM.REMARKPROCESS = P.REMARKPROCESS
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.WPSEQNO,
     DM.WPCD,
     DM.FIRST_NAME,
     DM.NICKNAME,
     DM.LAST_NAME,
     DM.ENG_FIRST_NAME,
     DM.ENG_MIDDLE_NAME,
     DM.ENG_LAST_NAME,
     DM.BIRTH_DATE,
     DM.SEX,
     DM.NATION_CODE,
     DM.POLIS_NAME,
     DM.MOBILENO,
     DM.WARRANTNO,
     DM.WARRANT_DATE,
     DM.WARRANT_DUE_DATE,
     DM.ADDR,
     DM.CMAJOR_CODE,
     DM.ID_NO,
     DM.CRIME_NO,
     DM.CRIME_YEAR,
     DM.ORG_CODE,
     DM.OFFENDER_NO,
     DM.RELEASE_FLAG,
     DM.RELEASE_DATE,
     DM.CAUSE,
     DM.LOGIN_ID,
     DM.KEY_DATE,
     DM.UPDUSR,
     DM.UPDDTE,
     DM.FLAGPROCESS,
     DM.REMARKPROCESS) 
  VALUES (     P.WPSEQNO,
     P.WPCD,
     P.FIRST_NAME,
     P.NICKNAME,
     P.LAST_NAME,
     P.ENG_FIRST_NAME,
     P.ENG_MIDDLE_NAME,
     P.ENG_LAST_NAME,
     P.BIRTH_DATE,
     P.SEX,
     P.NATION_CODE,
     P.POLIS_NAME,
     P.MOBILENO,
     P.WARRANTNO,
     P.WARRANT_DATE,
     P.WARRANT_DUE_DATE,
     P.ADDR,
     P.CMAJOR_CODE,
     P.ID_NO,
     P.CRIME_NO,
     P.CRIME_YEAR,
     P.ORG_CODE,
     P.OFFENDER_NO,
     P.RELEASE_FLAG,
     P.RELEASE_DATE,
     P.CAUSE,
     P.LOGIN_ID,
     P.KEY_DATE,
     P.UPDUSR,
     P.UPDDTE,
     P.FLAGPROCESS,
     P.REMARKPROCESS);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('WANTED_POLIS_C', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('WANTED_POLIS_C', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;
 


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_WANTED_POLIS;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_WANTED_POLIS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_WANTED_POLIS" TO "BIOSAADM";
