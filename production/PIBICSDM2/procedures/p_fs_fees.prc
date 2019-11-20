CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_FS_FEES" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.FS_FEES DM
        USING (SELECT *
                 FROM PIBICS.FS_FEES@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.FEES_SEQNO = P.FEES_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FEESNO = P.FEESNO,
                 DM.FEESLIPNO = P.FEESLIPNO,
                 DM.FEESLIPBOOKNO = P.FEESLIPBOOKNO,
                 DM.FEESLIPDATE = P.FEESLIPDATE,
                 DM.FEESLIPTOTAL = P.FEESLIPTOTAL,
                 DM.PRINTFLAG = P.PRINTFLAG,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.TM6NO = P.TM6NO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.SEX = P.SEX,
                 DM.BIRTHDTE = P.BIRTHDTE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.CONVREGNO = P.CONVREGNO,
                 DM.INDTE = P.INDTE,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.FEESSTATUS = P.FEESSTATUS,
                 DM.FEESREMARK = P.FEESREMARK,
                 DM.FLAG_SYSTEM = P.FLAG_SYSTEM,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.VERSION = P.VERSION,
                 DM.SLIPTYPE = P.SLIPTYPE,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.APPROVE_BY = P.APPROVE_BY
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FEES_SEQNO,
                  DM.FEESNO,
                  DM.FEESLIPNO,
                  DM.FEESLIPBOOKNO,
                  DM.FEESLIPDATE,
                  DM.FEESLIPTOTAL,
                  DM.PRINTFLAG,
                  DM.DEPT_SEQNO,
                  DM.PASSPORTNO,
                  DM.TM6NO,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.EFAMILYNM,
                  DM.SEX,
                  DM.BIRTHDTE,
                  DM.NATION_SEQNO,
                  DM.CONV_SEQNO,
                  DM.CONVREGNO,
                  DM.INDTE,
                  DM.VISATYPE_SEQNO,
                  DM.FEESSTATUS,
                  DM.FEESREMARK,
                  DM.FLAG_SYSTEM,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.CREATE_IP,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_IP,
                  DM.VERSION,
                  DM.SLIPTYPE,
                  DM.SUFFIX_SEQNO,
                  DM.APPROVE_BY)
          VALUES (P.FEES_SEQNO,
                  P.FEESNO,
                  P.FEESLIPNO,
                  P.FEESLIPBOOKNO,
                  P.FEESLIPDATE,
                  P.FEESLIPTOTAL,
                  P.PRINTFLAG,
                  P.DEPT_SEQNO,
                  P.PASSPORTNO,
                  P.TM6NO,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.EFAMILYNM,
                  P.SEX,
                  P.BIRTHDTE,
                  P.NATION_SEQNO,
                  P.CONV_SEQNO,
                  P.CONVREGNO,
                  P.INDTE,
                  P.VISATYPE_SEQNO,
                  P.FEESSTATUS,
                  P.FEESREMARK,
                  P.FLAG_SYSTEM,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.CREATE_IP,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_IP,
                  P.VERSION,
                  P.SLIPTYPE,
                  P.SUFFIX_SEQNO,
                  P.APPROVE_BY);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FS_FEES_C', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FS_FEES_C',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.FS_FEES DM
        USING (SELECT *
                 FROM PIBICS.FS_FEES@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.FEES_SEQNO = P.FEES_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FEESNO = P.FEESNO,
                 DM.FEESLIPNO = P.FEESLIPNO,
                 DM.FEESLIPBOOKNO = P.FEESLIPBOOKNO,
                 DM.FEESLIPDATE = P.FEESLIPDATE,
                 DM.FEESLIPTOTAL = P.FEESLIPTOTAL,
                 DM.PRINTFLAG = P.PRINTFLAG,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.TM6NO = P.TM6NO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.SEX = P.SEX,
                 DM.BIRTHDTE = P.BIRTHDTE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.CONVREGNO = P.CONVREGNO,
                 DM.INDTE = P.INDTE,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.FEESSTATUS = P.FEESSTATUS,
                 DM.FEESREMARK = P.FEESREMARK,
                 DM.FLAG_SYSTEM = P.FLAG_SYSTEM,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.VERSION = P.VERSION,
                 DM.SLIPTYPE = P.SLIPTYPE,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.APPROVE_BY = P.APPROVE_BY
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FEES_SEQNO,
                  DM.FEESNO,
                  DM.FEESLIPNO,
                  DM.FEESLIPBOOKNO,
                  DM.FEESLIPDATE,
                  DM.FEESLIPTOTAL,
                  DM.PRINTFLAG,
                  DM.DEPT_SEQNO,
                  DM.PASSPORTNO,
                  DM.TM6NO,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.EFAMILYNM,
                  DM.SEX,
                  DM.BIRTHDTE,
                  DM.NATION_SEQNO,
                  DM.CONV_SEQNO,
                  DM.CONVREGNO,
                  DM.INDTE,
                  DM.VISATYPE_SEQNO,
                  DM.FEESSTATUS,
                  DM.FEESREMARK,
                  DM.FLAG_SYSTEM,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.CREATE_IP,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_IP,
                  DM.VERSION,
                  DM.SLIPTYPE,
                  DM.SUFFIX_SEQNO,
                  DM.APPROVE_BY)
          VALUES (P.FEES_SEQNO,
                  P.FEESNO,
                  P.FEESLIPNO,
                  P.FEESLIPBOOKNO,
                  P.FEESLIPDATE,
                  P.FEESLIPTOTAL,
                  P.PRINTFLAG,
                  P.DEPT_SEQNO,
                  P.PASSPORTNO,
                  P.TM6NO,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.EFAMILYNM,
                  P.SEX,
                  P.BIRTHDTE,
                  P.NATION_SEQNO,
                  P.CONV_SEQNO,
                  P.CONVREGNO,
                  P.INDTE,
                  P.VISATYPE_SEQNO,
                  P.FEESSTATUS,
                  P.FEESREMARK,
                  P.FLAG_SYSTEM,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.CREATE_IP,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_IP,
                  P.VERSION,
                  P.SLIPTYPE,
                  P.SUFFIX_SEQNO,
                  P.APPROVE_BY);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FS_FEES_U', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FS_FEES_U',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_FS_FEES;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_FS_FEES" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_FS_FEES" TO "BIOSAADM";
