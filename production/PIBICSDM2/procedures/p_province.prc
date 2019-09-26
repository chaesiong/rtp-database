CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_PROVINCE" 
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

   MERGE INTO PIBICSDM2.PROVINCE DM
        USING (SELECT * 
                    FROM PIBICS.PROVINCE@PIBICS_PROD
                    WHERE CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND CREATE_DATE < TO_DATE(v_dend,'yyyymmdd')
                        AND UPDATE_DATE IS NULL) P
        ON (DM.PV_SEQNO = P.PV_SEQNO)
    WHEN MATCHED 
    THEN 
        UPDATE SET DM.REG_SEQNO = P.REG_SEQNO,
                    DM.PVCD = P.PVCD,
                    DM.PV_DESC = P.PV_DESC,
                    DM.CREATE_BY = P.CREATE_BY,
                    DM.CREATE_DATE = P.CREATE_DATE,
                    DM.UPDATE_BY = P.UPDATE_BY,
                    DM.UPDATE_DATE = P.UPDATE_DATE,
                    DM.VERSION = P.VERSION,
                    DM.DEPT_SEQNO = P.DEPT_SEQNO,
                    DM.NUM_HOTEL = P.NUM_HOTEL,
                    DM.PV_DESC_EN = P.PV_DESC_EN,
                    DM.ACTFLAG = P.ACTFLAG,
                    DM.PL_SEQNO = P.PL_SEQNO
    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.PV_SEQNO,
                DM.REG_SEQNO,
                DM.PVCD,
                DM.PV_DESC,
                DM.CREATE_BY,
                DM.CREATE_DATE,
                DM.UPDATE_BY,
                DM.UPDATE_DATE,
                DM.VERSION,
                DM.DEPT_SEQNO,
                DM.NUM_HOTEL,
                DM.PV_DESC_EN,
                DM.ACTFLAG,
                DM.PL_SEQNO) 
        VALUES (P.PV_SEQNO,
                P.REG_SEQNO,
                P.PVCD,
                P.PV_DESC,
                P.CREATE_BY,
                P.CREATE_DATE,
                P.UPDATE_BY,
                P.UPDATE_DATE,
                P.VERSION,
                P.DEPT_SEQNO,
                P.NUM_HOTEL,
                P.PV_DESC_EN,
                P.ACTFLAG,
                P.PL_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('PROVINCE_C', var_rows, SYSDATE);

   COMMIT;
   
   
   
   MERGE INTO PIBICSDM2.PROVINCE DM
        USING (SELECT * 
                    FROM PIBICS.PROVINCE@PIBICS_PROD
                    WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
        ON (DM.PV_SEQNO = P.PV_SEQNO)
    WHEN MATCHED 
    THEN 
        UPDATE SET DM.REG_SEQNO = P.REG_SEQNO,
                    DM.PVCD = P.PVCD,
                    DM.PV_DESC = P.PV_DESC,
                    DM.CREATE_BY = P.CREATE_BY,
                    DM.CREATE_DATE = P.CREATE_DATE,
                    DM.UPDATE_BY = P.UPDATE_BY,
                    DM.UPDATE_DATE = P.UPDATE_DATE,
                    DM.VERSION = P.VERSION,
                    DM.DEPT_SEQNO = P.DEPT_SEQNO,
                    DM.NUM_HOTEL = P.NUM_HOTEL,
                    DM.PV_DESC_EN = P.PV_DESC_EN,
                    DM.ACTFLAG = P.ACTFLAG,
                    DM.PL_SEQNO = P.PL_SEQNO
    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.PV_SEQNO,
                DM.REG_SEQNO,
                DM.PVCD,
                DM.PV_DESC,
                DM.CREATE_BY,
                DM.CREATE_DATE,
                DM.UPDATE_BY,
                DM.UPDATE_DATE,
                DM.VERSION,
                DM.DEPT_SEQNO,
                DM.NUM_HOTEL,
                DM.PV_DESC_EN,
                DM.ACTFLAG,
                DM.PL_SEQNO) 
        VALUES (P.PV_SEQNO,
                P.REG_SEQNO,
                P.PVCD,
                P.PV_DESC,
                P.CREATE_BY,
                P.CREATE_DATE,
                P.UPDATE_BY,
                P.UPDATE_DATE,
                P.VERSION,
                P.DEPT_SEQNO,
                P.NUM_HOTEL,
                P.PV_DESC_EN,
                P.ACTFLAG,
                P.PL_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('PROVINCE_U', var_rows, SYSDATE);

   COMMIT;
   
      
   
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_PROVINCE;
/
