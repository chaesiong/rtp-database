CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_TM5_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate date;
   veddate date;
   
BEGIN
   /*   Create date : 27-01-2018    */
   --No.24
  -- v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
  -- v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate :=sysdate;

   MERGE INTO PIBICSDM2.TM5 DM
        USING (SELECT * 
                    FROM PIBICS.TM5@PIBICS_PROD
                    WHERE CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND CREATE_DATE <= TO_DATE(v_dend,'yyyymmdd')
                        AND UPDATE_DATE IS NULL) P
        ON (DM.TM5_SEQNO = P.TM5_SEQNO)

    WHEN MATCHED 
    THEN 
        UPDATE SET DM.INDEPT_SEQNO = P.INDEPT_SEQNO,
                    DM.INSTYPE = P.INSTYPE,
                    DM.INSSTATUS = P.INSSTATUS,
                    DM.FLAG = P.FLAG,
                    DM.AMOUNT = P.AMOUNT,
                    DM.TM2_SEQNO = P.TM2_SEQNO,
                    DM.CREATE_BY = P.CREATE_BY,
                    DM.CREATE_DATE = P.CREATE_DATE,
                    DM.UPDATE_BY = P.UPDATE_BY,
                    DM.UPDATE_DATE = P.UPDATE_DATE,
                    DM.VERSION = P.VERSION,
                    DM.ACTFLAG = P.ACTFLAG,
                    DM.CHKDEPT_SEQNO = P.CHKDEPT_SEQNO,
                    DM.NOTE = P.NOTE,
                    DM.GUARANTOR = P.GUARANTOR
    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.TM5_SEQNO,
                DM.INDEPT_SEQNO,
                DM.INSTYPE,
                DM.INSSTATUS,
                DM.FLAG,
                DM.AMOUNT,
                DM.TM2_SEQNO,
                DM.CREATE_BY,
                DM.CREATE_DATE,
                DM.UPDATE_BY,
                DM.UPDATE_DATE,
                DM.VERSION,
                DM.ACTFLAG,
                DM.CHKDEPT_SEQNO,
                DM.NOTE,
                DM.GUARANTOR) 
        VALUES (P.TM5_SEQNO,
                P.INDEPT_SEQNO,
                P.INSTYPE,
                P.INSSTATUS,
                P.FLAG,
                P.AMOUNT,
                P.TM2_SEQNO,
                P.CREATE_BY,
                P.CREATE_DATE,
                P.UPDATE_BY,
                P.UPDATE_DATE,
                P.VERSION,
                P.ACTFLAG,
                P.CHKDEPT_SEQNO,
                P.NOTE,
                P.GUARANTOR);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG VALUES ('TM5_C_M', var_rows, SYSDATE);
   
   veddate :=sysdate;
   INSERT INTO IMPORT_LOG_DETAIL VALUES ('TM5_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);


   COMMIT;
   
   vstdate :=sysdate;
   
   MERGE INTO PIBICSDM2.TM5 DM
        USING (SELECT * 
                    FROM PIBICS.TM5@PIBICS_PROD
                    WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
        ON (DM.TM5_SEQNO = P.TM5_SEQNO)

    WHEN MATCHED 
    THEN 
        UPDATE SET DM.INDEPT_SEQNO = P.INDEPT_SEQNO,
                    DM.INSTYPE = P.INSTYPE,
                    DM.INSSTATUS = P.INSSTATUS,
                    DM.FLAG = P.FLAG,
                    DM.AMOUNT = P.AMOUNT,
                    DM.TM2_SEQNO = P.TM2_SEQNO,
                    DM.CREATE_BY = P.CREATE_BY,
                    DM.CREATE_DATE = P.CREATE_DATE,
                    DM.UPDATE_BY = P.UPDATE_BY,
                    DM.UPDATE_DATE = P.UPDATE_DATE,
                    DM.VERSION = P.VERSION,
                    DM.ACTFLAG = P.ACTFLAG,
                    DM.CHKDEPT_SEQNO = P.CHKDEPT_SEQNO,
                    DM.NOTE = P.NOTE,
                    DM.GUARANTOR = P.GUARANTOR

    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.TM5_SEQNO,
                DM.INDEPT_SEQNO,
                DM.INSTYPE,
                DM.INSSTATUS,
                DM.FLAG,
                DM.AMOUNT,
                DM.TM2_SEQNO,
                DM.CREATE_BY,
                DM.CREATE_DATE,
                DM.UPDATE_BY,
                DM.UPDATE_DATE,
                DM.VERSION,
                DM.ACTFLAG,
                DM.CHKDEPT_SEQNO,
                DM.NOTE,
                DM.GUARANTOR) 
        VALUES (P.TM5_SEQNO,
                P.INDEPT_SEQNO,
                P.INSTYPE,
                P.INSSTATUS,
                P.FLAG,
                P.AMOUNT,
                P.TM2_SEQNO,
                P.CREATE_BY,
                P.CREATE_DATE,
                P.UPDATE_BY,
                P.UPDATE_DATE,
                P.VERSION,
                P.ACTFLAG,
                P.CHKDEPT_SEQNO,
                P.NOTE,
                P.GUARANTOR);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG VALUES ('TM5_U_M', var_rows, SYSDATE);
   
   veddate := sysdate;
   INSERT INTO IMPORT_LOG_DETAIL VALUES ('TM5_U_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

   COMMIT;
   
   
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_TM5_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_TM5_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_TM5_M" TO "BIOSAADM";
