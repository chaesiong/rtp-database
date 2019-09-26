CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_TAMBON" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
BEGIN
   /*   Create date : 27-01-2018    */
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');
   v_dstart :='20181101';
   v_dend :='20181130';

   MERGE INTO PIBICSDM2.TAMBON DM
        USING (SELECT * 
                    FROM PIBICS.TAMBON@PIBICS_PROD
                    WHERE CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND CREATE_DATE < TO_DATE(v_dend,'yyyymmdd')
                        AND UPDATE_DATE IS NULL) P
        ON (DM.TMB_SEQNO = P.TMB_SEQNO)
    WHEN MATCHED 
    THEN 
        UPDATE SET DM.TMBCD = P.TMBCD,
                    DM.AMP_SEQNO = P.AMP_SEQNO,
                    DM.TMB_DESC = P.TMB_DESC,
                    DM.CREATE_BY = P.CREATE_BY,
                    DM.CREATE_DATE = P.CREATE_DATE,
                    DM.UPDATE_BY = P.UPDATE_BY,
                    DM.UPDATE_DATE = P.UPDATE_DATE,
                    DM.VERSION = P.VERSION,
                    DM.ACTFLAG = P.ACTFLAG,
                    DM.TMB_DESC_EN = P.TMB_DESC_EN,
                    DM.DEPT_SEQNO = P.DEPT_SEQNO
    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.TMB_SEQNO,
                DM.TMBCD,
                DM.AMP_SEQNO,
                DM.TMB_DESC,
                DM.CREATE_BY,
                DM.CREATE_DATE,
                DM.UPDATE_BY,
                DM.UPDATE_DATE,
                DM.VERSION,
                DM.ACTFLAG,
                DM.TMB_DESC_EN,
                DM.DEPT_SEQNO) 
        VALUES (P.TMB_SEQNO,
                P.TMBCD,
                P.AMP_SEQNO,
                P.TMB_DESC,
                P.CREATE_BY,
                P.CREATE_DATE,
                P.UPDATE_BY,
                P.UPDATE_DATE,
                P.VERSION,
                P.ACTFLAG,
                P.TMB_DESC_EN,
                P.DEPT_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('TAMBON_C', var_rows, SYSDATE);

   COMMIT;
   
   
   
   MERGE INTO PIBICSDM2.TAMBON DM
        USING (SELECT * 
                    FROM PIBICS.TAMBON@PIBICS_PROD
                    WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
        ON (DM.TMB_SEQNO = P.TMB_SEQNO)
    WHEN MATCHED 
    THEN 
        UPDATE SET DM.TMBCD = P.TMBCD,
                    DM.AMP_SEQNO = P.AMP_SEQNO,
                    DM.TMB_DESC = P.TMB_DESC,
                    DM.CREATE_BY = P.CREATE_BY,
                    DM.CREATE_DATE = P.CREATE_DATE,
                    DM.UPDATE_BY = P.UPDATE_BY,
                    DM.UPDATE_DATE = P.UPDATE_DATE,
                    DM.VERSION = P.VERSION,
                    DM.ACTFLAG = P.ACTFLAG,
                    DM.TMB_DESC_EN = P.TMB_DESC_EN,
                    DM.DEPT_SEQNO = P.DEPT_SEQNO
    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.TMB_SEQNO,
                DM.TMBCD,
                DM.AMP_SEQNO,
                DM.TMB_DESC,
                DM.CREATE_BY,
                DM.CREATE_DATE,
                DM.UPDATE_BY,
                DM.UPDATE_DATE,
                DM.VERSION,
                DM.ACTFLAG,
                DM.TMB_DESC_EN,
                DM.DEPT_SEQNO) 
        VALUES (P.TMB_SEQNO,
                P.TMBCD,
                P.AMP_SEQNO,
                P.TMB_DESC,
                P.CREATE_BY,
                P.CREATE_DATE,
                P.UPDATE_BY,
                P.UPDATE_DATE,
                P.VERSION,
                P.ACTFLAG,
                P.TMB_DESC_EN,
                P.DEPT_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('TAMBON_U', var_rows, SYSDATE);

   COMMIT;
      
   
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_TAMBON;
/
