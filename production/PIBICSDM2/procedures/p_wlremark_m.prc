CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_WLREMARK_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;

BEGIN

 /* Create date : 6-12-2108 */

  vstdate := SYSDATE;

 MERGE INTO PIBICSDM2.WLREMARK DM
  USING (SELECT A.*
     FROM PIBICS.WLREMARK@PIBICS_PROD A
     INNER JOIN PIBICS.WATCHLIST@PIBICS_PROD B
     ON (A.WLCD = B.WLCD)
     WHERE TO_CHAR(B.CREDTE,'yyyymmdd') >= v_dstart
      AND TO_CHAR(B.CREDTE,'yyyymmdd') <= v_dend
      AND B.UPDDTE IS NULL) P
  ON (DM.WLCD = P.WLCD AND DM.SEQNO = P.SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      
     DM.REMK = P.REMK
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.WLCD,
     DM.SEQNO,
     DM.REMK) 
  VALUES (     P.WLCD,
     P.SEQNO,
     P.REMK);


 var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('WLREMARK_C_M', var_rows, SYSDATE);

  veddate := SYSDATE;

INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('WLREMARK_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;

 MERGE INTO PIBICSDM2.WLREMARK DM
  USING (SELECT A.*
     FROM PIBICS.WLREMARK@PIBICS_PROD A
     INNER JOIN PIBICS.WATCHLIST@PIBICS_PROD B
     ON (A.WLCD = B.WLCD)
     WHERE TO_CHAR(B.UPDDTE,'yyyymmdd') >= v_dstart
      AND TO_CHAR(B.UPDDTE,'yyyymmdd') <= v_dend) P
  ON (DM.WLCD = P.WLCD AND DM.SEQNO = P.SEQNO)
 WHEN MATCHED 
 THEN 
  UPDATE SET      
     DM.REMK = P.REMK
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.WLCD,
     DM.SEQNO,
     DM.REMK) 
VALUES (     P.WLCD,
     P.SEQNO,
     P.REMK);

   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG    VALUES ('WLREMARK_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL 
        VALUES ('WLREMARK_U_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

commit;

EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_WLREMARK_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_WLREMARK_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_WLREMARK_M" TO "BIOSAADM";
