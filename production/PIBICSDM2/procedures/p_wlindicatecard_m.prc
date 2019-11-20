CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_WLINDICATECARD_M" (v_dstart varchar2,v_dend varchar2)
IS
 var_rows NUMBER;
 vstdate date;
 veddate date; 
 
BEGIN
 /* Create date : 6-12-2108 */
-- v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
-- v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');
 
  vstdate :=sysdate;

 MERGE INTO PIBICSDM2.WLINDICATECARD DM
  USING (SELECT A.*
     FROM PIBICS.WLINDICATECARD@PIBICS_PROD A
     INNER JOIN PIBICS.WATCHLIST@PIBICS_PROD B
     ON (A.WLCD = B.WLCD)
     WHERE TO_CHAR(B.CREDTE,'yyyymmdd') >= v_dstart
      AND TO_CHAR(B.CREDTE,'yyyymmdd') <= v_dend
      AND B.UPDDTE IS NULL) P
  ON (DM.WLCD = P.WLCD AND DM.SEQNO = P.SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      
     DM.IDCCD = P.IDCCD,
     DM.DOCNO = P.DOCNO,
     DM.ISUDTE = P.ISUDTE,
     DM.ISUPLACE = P.ISUPLACE
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.WLCD,
     DM.SEQNO,
     DM.IDCCD,
     DM.DOCNO,
     DM.ISUDTE,
     DM.ISUPLACE) 
  VALUES (     P.WLCD,
     P.SEQNO,
     P.IDCCD,
     P.DOCNO,
     P.ISUDTE,
     P.ISUPLACE);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG   VALUES ('WLINDICATECARD_C_M', var_rows, SYSDATE);

  veddate :=sysdate;
  INSERT INTO IMPORT_LOG_DETAIL VALUES ('WLINDICATECARD_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);
  COMMIT;
  
  vstdate :=sysdate;

 MERGE INTO PIBICSDM2.WLINDICATECARD DM
  USING (SELECT A.*
     FROM PIBICS.WLINDICATECARD@PIBICS_PROD A
     INNER JOIN PIBICS.WATCHLIST@PIBICS_PROD B
     ON (A.WLCD = B.WLCD)
     WHERE TO_CHAR(B.UPDDTE,'yyyymmdd') >= v_dstart
      AND TO_CHAR(B.UPDDTE,'yyyymmdd') <= v_dend) P
  ON (DM.WLCD = P.WLCD AND DM.SEQNO = P.SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      
     DM.IDCCD = P.IDCCD,
     DM.DOCNO = P.DOCNO,
     DM.ISUDTE = P.ISUDTE,
     DM.ISUPLACE = P.ISUPLACE
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.WLCD,
     DM.SEQNO,
     DM.IDCCD,
     DM.DOCNO,
     DM.ISUDTE,
     DM.ISUPLACE) 
VALUES (     P.WLCD,
     P.SEQNO,
     P.IDCCD,
     P.DOCNO,
     P.ISUDTE,
     P.ISUPLACE);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG   VALUES ('WLINDICATECARD_U_M', var_rows, SYSDATE);

  veddate :=sysdate;
  INSERT INTO IMPORT_LOG_DETAIL VALUES ('WLINDICATECARD_U_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);
  COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_WLINDICATECARD_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_WLINDICATECARD_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_WLINDICATECARD_M" TO "BIOSAADM";
