CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_EDNQ_TM22_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.16
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.EDNQ_TM22 DM
        USING (SELECT *
                 FROM PIBICS.EDNQ_TM22@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.TM22_SEQNO = P.TM22_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.TM22NO = P.TM22NO,
                 DM.TM22YEAR = P.TM22YEAR,
                 DM.DOC_DATE = P.DOC_DATE,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.EDNQPERSON_SEQNO = P.EDNQPERSON_SEQNO,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.SEX = P.SEX,
                 DM.AGE = P.AGE,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.RCISSUE_DATE = P.RCISSUE_DATE,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.RCISSUE_BY = P.RCISSUE_BY,
                 DM.TM13_SEQNO = P.TM13_SEQNO,
                 DM.TM13NO = P.TM13NO,
                 DM.TM13YEAR = P.TM13YEAR,
                 DM.EDMISSUEBY = P.EDMISSUEBY,
                 DM.EDMISSUE_DATE = P.EDMISSUE_DATE,
                 DM.EDMEXP_DATE = P.EDMEXP_DATE,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.PASSPORT_DATE = P.PASSPORT_DATE,
                 DM.PASSPORT_ISSUE = P.PASSPORT_ISSUE,
                 DM.PASSPORTEXP_DATE = P.PASSPORTEXP_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.LEAVE_DATE = P.LEAVE_DATE,
                 DM.COUNTCD = P.COUNTCD,
                 DM.COUNT_SEQNO = P.COUNT_SEQNO,
                 DM.TM22TYPE = P.TM22TYPE,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.PERMITE_DATE = P.PERMITE_DATE,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.TM22STS = P.TM22STS,
                 DM.REASONDESC = P.REASONDESC,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.OTHERNM = P.OTHERNM,
                 DM.BIRTHDATE = P.BIRTHDATE,
                 DM.TM22RUNNINGNO = P.TM22RUNNINGNO,
                 DM.RCISSUEPV_SEQNO = P.RCISSUEPV_SEQNO,
                 DM.NGISSUE_DATE = P.NGISSUE_DATE,
                 DM.OCC_DETAIL = P.OCC_DETAIL,
                 DM.TM22TYPEFLAG = P.TM22TYPEFLAG,
                 DM.TEL = P.TEL,
                 DM.IMGTM22 = P.IMGTM22,
                 DM.IMGSTS = P.IMGSTS,
                 DM.FGPTM22 = P.FGPTM22,
                 DM.FGPREMARK = P.FGPREMARK,
                 DM.FGPSTS = P.FGPSTS,
                 DM.FGPMATCHPERCENT = P.FGPMATCHPERCENT,
                 DM.CERTOFRESIDENCE_SEQNO = P.CERTOFRESIDENCE_SEQNO,
                 DM.CHKRUNNO = P.CHKRUNNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.TM22_SEQNO,
                  DM.TM22NO,
                  DM.TM22YEAR,
                  DM.DOC_DATE,
                  DM.DEPT_SEQNO,
                  DM.EDNQPERSON_SEQNO,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.NATION_SEQNO,
                  DM.SEX,
                  DM.AGE,
                  DM.OCC_SEQNO,
                  DM.RESCERTTYPE_SEQNO,
                  DM.RCISSUE_DATE,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.RCISSUE_BY,
                  DM.TM13_SEQNO,
                  DM.TM13NO,
                  DM.TM13YEAR,
                  DM.EDMISSUEBY,
                  DM.EDMISSUE_DATE,
                  DM.EDMEXP_DATE,
                  DM.PASSPORTNO,
                  DM.PASSPORT_DATE,
                  DM.PASSPORT_ISSUE,
                  DM.PASSPORTEXP_DATE,
                  DM.CONV_SEQNO,
                  DM.LEAVE_DATE,
                  DM.COUNTCD,
                  DM.COUNT_SEQNO,
                  DM.TM22TYPE,
                  DM.PERMIT_SEQNO,
                  DM.PERMITE_DATE,
                  DM.FEES_SEQNO,
                  DM.TM22STS,
                  DM.REASONDESC,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.OTHERNM,
                  DM.BIRTHDATE,
                  DM.TM22RUNNINGNO,
                  DM.RCISSUEPV_SEQNO,
                  DM.NGISSUE_DATE,
                  DM.OCC_DETAIL,
                  DM.TM22TYPEFLAG,
                  DM.TEL,
                  DM.IMGTM22,
                  DM.IMGSTS,
                  DM.FGPTM22,
                  DM.FGPREMARK,
                  DM.FGPSTS,
                  DM.FGPMATCHPERCENT,
                  DM.CERTOFRESIDENCE_SEQNO,
                  DM.CHKRUNNO)
          VALUES (P.TM22_SEQNO,
                  P.TM22NO,
                  P.TM22YEAR,
                  P.DOC_DATE,
                  P.DEPT_SEQNO,
                  P.EDNQPERSON_SEQNO,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.NATION_SEQNO,
                  P.SEX,
                  P.AGE,
                  P.OCC_SEQNO,
                  P.RESCERTTYPE_SEQNO,
                  P.RCISSUE_DATE,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.RCISSUE_BY,
                  P.TM13_SEQNO,
                  P.TM13NO,
                  P.TM13YEAR,
                  P.EDMISSUEBY,
                  P.EDMISSUE_DATE,
                  P.EDMEXP_DATE,
                  P.PASSPORTNO,
                  P.PASSPORT_DATE,
                  P.PASSPORT_ISSUE,
                  P.PASSPORTEXP_DATE,
                  P.CONV_SEQNO,
                  P.LEAVE_DATE,
                  P.COUNTCD,
                  P.COUNT_SEQNO,
                  P.TM22TYPE,
                  P.PERMIT_SEQNO,
                  P.PERMITE_DATE,
                  P.FEES_SEQNO,
                  P.TM22STS,
                  P.REASONDESC,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.OTHERNM,
                  P.BIRTHDATE,
                  P.TM22RUNNINGNO,
                  P.RCISSUEPV_SEQNO,
                  P.NGISSUE_DATE,
                  P.OCC_DETAIL,
                  P.TM22TYPEFLAG,
                  P.TEL,
                  P.IMGTM22,
                  P.IMGSTS,
                  P.FGPTM22,
                  P.FGPREMARK,
                  P.FGPSTS,
                  P.FGPMATCHPERCENT,
                  P.CERTOFRESIDENCE_SEQNO,
                  P.CHKRUNNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EDNQ_TM22_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EDNQ_TM22_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.EDNQ_TM22 DM
        USING (SELECT *
                 FROM PIBICS.EDNQ_TM22@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.TM22_SEQNO = P.TM22_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.TM22NO = P.TM22NO,
                 DM.TM22YEAR = P.TM22YEAR,
                 DM.DOC_DATE = P.DOC_DATE,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.EDNQPERSON_SEQNO = P.EDNQPERSON_SEQNO,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.SEX = P.SEX,
                 DM.AGE = P.AGE,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.RCISSUE_DATE = P.RCISSUE_DATE,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.RCISSUE_BY = P.RCISSUE_BY,
                 DM.TM13_SEQNO = P.TM13_SEQNO,
                 DM.TM13NO = P.TM13NO,
                 DM.TM13YEAR = P.TM13YEAR,
                 DM.EDMISSUEBY = P.EDMISSUEBY,
                 DM.EDMISSUE_DATE = P.EDMISSUE_DATE,
                 DM.EDMEXP_DATE = P.EDMEXP_DATE,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.PASSPORT_DATE = P.PASSPORT_DATE,
                 DM.PASSPORT_ISSUE = P.PASSPORT_ISSUE,
                 DM.PASSPORTEXP_DATE = P.PASSPORTEXP_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.LEAVE_DATE = P.LEAVE_DATE,
                 DM.COUNTCD = P.COUNTCD,
                 DM.COUNT_SEQNO = P.COUNT_SEQNO,
                 DM.TM22TYPE = P.TM22TYPE,
                 DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                 DM.PERMITE_DATE = P.PERMITE_DATE,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.TM22STS = P.TM22STS,
                 DM.REASONDESC = P.REASONDESC,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.OTHERNM = P.OTHERNM,
                 DM.BIRTHDATE = P.BIRTHDATE,
                 DM.TM22RUNNINGNO = P.TM22RUNNINGNO,
                 DM.RCISSUEPV_SEQNO = P.RCISSUEPV_SEQNO,
                 DM.NGISSUE_DATE = P.NGISSUE_DATE,
                 DM.OCC_DETAIL = P.OCC_DETAIL,
                 DM.TM22TYPEFLAG = P.TM22TYPEFLAG,
                 DM.TEL = P.TEL,
                 DM.IMGTM22 = P.IMGTM22,
                 DM.IMGSTS = P.IMGSTS,
                 DM.FGPTM22 = P.FGPTM22,
                 DM.FGPREMARK = P.FGPREMARK,
                 DM.FGPSTS = P.FGPSTS,
                 DM.FGPMATCHPERCENT = P.FGPMATCHPERCENT,
                 DM.CERTOFRESIDENCE_SEQNO = P.CERTOFRESIDENCE_SEQNO,
                 DM.CHKRUNNO = P.CHKRUNNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.TM22_SEQNO,
                  DM.TM22NO,
                  DM.TM22YEAR,
                  DM.DOC_DATE,
                  DM.DEPT_SEQNO,
                  DM.EDNQPERSON_SEQNO,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.NATION_SEQNO,
                  DM.SEX,
                  DM.AGE,
                  DM.OCC_SEQNO,
                  DM.RESCERTTYPE_SEQNO,
                  DM.RCISSUE_DATE,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.RCISSUE_BY,
                  DM.TM13_SEQNO,
                  DM.TM13NO,
                  DM.TM13YEAR,
                  DM.EDMISSUEBY,
                  DM.EDMISSUE_DATE,
                  DM.EDMEXP_DATE,
                  DM.PASSPORTNO,
                  DM.PASSPORT_DATE,
                  DM.PASSPORT_ISSUE,
                  DM.PASSPORTEXP_DATE,
                  DM.CONV_SEQNO,
                  DM.LEAVE_DATE,
                  DM.COUNTCD,
                  DM.COUNT_SEQNO,
                  DM.TM22TYPE,
                  DM.PERMIT_SEQNO,
                  DM.PERMITE_DATE,
                  DM.FEES_SEQNO,
                  DM.TM22STS,
                  DM.REASONDESC,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.OTHERNM,
                  DM.BIRTHDATE,
                  DM.TM22RUNNINGNO,
                  DM.RCISSUEPV_SEQNO,
                  DM.NGISSUE_DATE,
                  DM.OCC_DETAIL,
                  DM.TM22TYPEFLAG,
                  DM.TEL,
                  DM.IMGTM22,
                  DM.IMGSTS,
                  DM.FGPTM22,
                  DM.FGPREMARK,
                  DM.FGPSTS,
                  DM.FGPMATCHPERCENT,
                  DM.CERTOFRESIDENCE_SEQNO,
                  DM.CHKRUNNO)
          VALUES (P.TM22_SEQNO,
                  P.TM22NO,
                  P.TM22YEAR,
                  P.DOC_DATE,
                  P.DEPT_SEQNO,
                  P.EDNQPERSON_SEQNO,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.NATION_SEQNO,
                  P.SEX,
                  P.AGE,
                  P.OCC_SEQNO,
                  P.RESCERTTYPE_SEQNO,
                  P.RCISSUE_DATE,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.RCISSUE_BY,
                  P.TM13_SEQNO,
                  P.TM13NO,
                  P.TM13YEAR,
                  P.EDMISSUEBY,
                  P.EDMISSUE_DATE,
                  P.EDMEXP_DATE,
                  P.PASSPORTNO,
                  P.PASSPORT_DATE,
                  P.PASSPORT_ISSUE,
                  P.PASSPORTEXP_DATE,
                  P.CONV_SEQNO,
                  P.LEAVE_DATE,
                  P.COUNTCD,
                  P.COUNT_SEQNO,
                  P.TM22TYPE,
                  P.PERMIT_SEQNO,
                  P.PERMITE_DATE,
                  P.FEES_SEQNO,
                  P.TM22STS,
                  P.REASONDESC,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.OTHERNM,
                  P.BIRTHDATE,
                  P.TM22RUNNINGNO,
                  P.RCISSUEPV_SEQNO,
                  P.NGISSUE_DATE,
                  P.OCC_DETAIL,
                  P.TM22TYPEFLAG,
                  P.TEL,
                  P.IMGTM22,
                  P.IMGSTS,
                  P.FGPTM22,
                  P.FGPREMARK,
                  P.FGPSTS,
                  P.FGPMATCHPERCENT,
                  P.CERTOFRESIDENCE_SEQNO,
                  P.CHKRUNNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EDNQ_TM22_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EDNQ_TM22_U_M',
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
END P_EDNQ_TM22_M;
/