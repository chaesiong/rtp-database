CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_FS_FINES" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2019    */

   --No.3
   v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.FS_FINES DM
        USING (SELECT *
                 FROM PIBICS.FS_FINES@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.FINES_SEQNO = P.FINES_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FINESNO = P.FINESNO,
                 DM.FINESLIPNO = P.FINESLIPNO,
                 DM.FINESLIPBOOKNO = P.FINESLIPBOOKNO,
                 DM.FINESLIPDATE = P.FINESLIPDATE,
                 DM.PRINTFLAG = P.PRINTFLAG,
                 DM.FINESLIPAMOUNT = P.FINESLIPAMOUNT,
                 DM.CHARGEDOF = P.CHARGEDOF,
                 DM.CHARGENO = P.CHARGENO,
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
                 DM.VISAEXPDTE = P.VISAEXPDTE,
                 DM.OUTDTE = P.OUTDTE,
                 DM.FINESTATUS = P.FINESTATUS,
                 DM.FINESREMARK = P.FINESREMARK,
                 DM.FLAG_SYSTEM = P.FLAG_SYSTEM,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.VERSION = P.VERSION,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.SLIPTYPE = P.SLIPTYPE,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.STAFF_SEQNO = P.STAFF_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FINES_SEQNO,
                  DM.FINESNO,
                  DM.FINESLIPNO,
                  DM.FINESLIPBOOKNO,
                  DM.FINESLIPDATE,
                  DM.PRINTFLAG,
                  DM.FINESLIPAMOUNT,
                  DM.CHARGEDOF,
                  DM.CHARGENO,
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
                  DM.VISAEXPDTE,
                  DM.OUTDTE,
                  DM.FINESTATUS,
                  DM.FINESREMARK,
                  DM.FLAG_SYSTEM,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.CREATE_IP,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_IP,
                  DM.VERSION,
                  DM.PERMIT_SEQNO,
                  DM.PERMIT_DATE,
                  DM.SLIPTYPE,
                  DM.SUFFIX_SEQNO,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.STAFF_SEQNO)
          VALUES (P.FINES_SEQNO,
                  P.FINESNO,
                  P.FINESLIPNO,
                  P.FINESLIPBOOKNO,
                  P.FINESLIPDATE,
                  P.PRINTFLAG,
                  P.FINESLIPAMOUNT,
                  P.CHARGEDOF,
                  P.CHARGENO,
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
                  P.VISAEXPDTE,
                  P.OUTDTE,
                  P.FINESTATUS,
                  P.FINESREMARK,
                  P.FLAG_SYSTEM,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.CREATE_IP,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_IP,
                  P.VERSION,
                  P.PERMIT_SEQNO,
                  P.PERMIT_DATE,
                  P.SLIPTYPE,
                  P.SUFFIX_SEQNO,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.STAFF_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FS_FINES_C', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FS_FINES_C',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.FS_FINES DM
        USING (SELECT *
                 FROM PIBICS.FS_FINES@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.FINES_SEQNO = P.FINES_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.FINESNO = P.FINESNO,
                 DM.FINESLIPNO = P.FINESLIPNO,
                 DM.FINESLIPBOOKNO = P.FINESLIPBOOKNO,
                 DM.FINESLIPDATE = P.FINESLIPDATE,
                 DM.PRINTFLAG = P.PRINTFLAG,
                 DM.FINESLIPAMOUNT = P.FINESLIPAMOUNT,
                 DM.CHARGEDOF = P.CHARGEDOF,
                 DM.CHARGENO = P.CHARGENO,
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
                 DM.VISAEXPDTE = P.VISAEXPDTE,
                 DM.OUTDTE = P.OUTDTE,
                 DM.FINESTATUS = P.FINESTATUS,
                 DM.FINESREMARK = P.FINESREMARK,
                 DM.FLAG_SYSTEM = P.FLAG_SYSTEM,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.VERSION = P.VERSION,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.SLIPTYPE = P.SLIPTYPE,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.STAFF_SEQNO = P.STAFF_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.FINES_SEQNO,
                  DM.FINESNO,
                  DM.FINESLIPNO,
                  DM.FINESLIPBOOKNO,
                  DM.FINESLIPDATE,
                  DM.PRINTFLAG,
                  DM.FINESLIPAMOUNT,
                  DM.CHARGEDOF,
                  DM.CHARGENO,
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
                  DM.VISAEXPDTE,
                  DM.OUTDTE,
                  DM.FINESTATUS,
                  DM.FINESREMARK,
                  DM.FLAG_SYSTEM,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.CREATE_IP,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_IP,
                  DM.VERSION,
                  DM.PERMIT_SEQNO,
                  DM.PERMIT_DATE,
                  DM.SLIPTYPE,
                  DM.SUFFIX_SEQNO,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.STAFF_SEQNO)
          VALUES (P.FINES_SEQNO,
                  P.FINESNO,
                  P.FINESLIPNO,
                  P.FINESLIPBOOKNO,
                  P.FINESLIPDATE,
                  P.PRINTFLAG,
                  P.FINESLIPAMOUNT,
                  P.CHARGEDOF,
                  P.CHARGENO,
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
                  P.VISAEXPDTE,
                  P.OUTDTE,
                  P.FINESTATUS,
                  P.FINESREMARK,
                  P.FLAG_SYSTEM,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.CREATE_IP,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_IP,
                  P.VERSION,
                  P.PERMIT_SEQNO,
                  P.PERMIT_DATE,
                  P.SLIPTYPE,
                  P.SUFFIX_SEQNO,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.STAFF_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('FS_FINES_U', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('FS_FINES_U',
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
END P_FS_FINES;
/
