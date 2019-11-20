CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CRS_CERTOFRESIDENCE" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   -- No.13
   v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.CRS_CERTOFRESIDENCE DM
        USING (SELECT *
                 FROM PIBICS.CRS_CERTOFRESIDENCE@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.CERTOFRESIDENCE_SEQNO = P.CERTOFRESIDENCE_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.PAIDBOOK_DATE = P.PAIDBOOK_DATE,
                 DM.CONTROLBOOK_NO = P.CONTROLBOOK_NO,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.RCISSUE_BY = P.RCISSUE_BY,
                 DM.RCISSUE_DATE = P.RCISSUE_DATE,
                 DM.RCISSUEPV_SEQNO = P.RCISSUEPV_SEQNO,
                 DM.RCISSUEAMP_SEQNO = P.RCISSUEAMP_SEQNO,
                 DM.QUOTATYPE = P.QUOTATYPE,
                 DM.QUOTANO = P.QUOTANO,
                 DM.QUOTA_DATE = P.QUOTA_DATE,
                 DM.ISSUETIME = P.ISSUETIME,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.OTHERNM = P.OTHERNM,
                 DM.NATIONCD = P.NATIONCD,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.BIRTH_COUNTRY = P.BIRTH_COUNTRY,
                 DM.SEX = P.SEX,
                 DM.AGE = P.AGE,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.HEIGHT = P.HEIGHT,
                 DM.MARK = P.MARK,
                 DM.ADDR = P.ADDR,
                 DM.ROAD = P.ROAD,
                 DM.TMB_SEQNO = P.TMB_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.ZIPCODE = P.ZIPCODE,
                 DM.REMARK = P.REMARK,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.CRS_STS = P.CRS_STS,
                 DM.CRS_SCAN = P.CRS_SCAN,
                 DM.RACE = P.RACE,
                 DM.REVOKE_DEPT_SEQNO = P.REVOKE_DEPT_SEQNO,
                 DM.REMARK_TYPE = P.REMARK_TYPE,
                 DM.OCC_DETAIL = P.OCC_DETAIL,
                 DM.T_IDICONCEPT = P.T_IDICONCEPT,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.IMGCRS = P.IMGCRS,
                 DM.IMGSTS = P.IMGSTS,
                 DM.FGPCRS = P.FGPCRS,
                 DM.FGPREMARK = P.FGPREMARK,
                 DM.FGPSTS = P.FGPSTS,
                 DM.FGPMATCHPERCENT = P.FGPMATCHPERCENT,
                 DM.TM18_SEQNO = P.TM18_SEQNO,
                 DM.TM20_SEQNO = P.TM20_SEQNO,
                 DM.TEL = P.TEL
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CERTOFRESIDENCE_SEQNO,
                  DM.PAIDBOOK_DATE,
                  DM.CONTROLBOOK_NO,
                  DM.FEES_SEQNO,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.RESCERTTYPE_SEQNO,
                  DM.RCISSUE_BY,
                  DM.RCISSUE_DATE,
                  DM.RCISSUEPV_SEQNO,
                  DM.RCISSUEAMP_SEQNO,
                  DM.QUOTATYPE,
                  DM.QUOTANO,
                  DM.QUOTA_DATE,
                  DM.ISSUETIME,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.OTHERNM,
                  DM.NATIONCD,
                  DM.BIRTH_DATE,
                  DM.BIRTH_PLACE,
                  DM.BIRTH_COUNTRY,
                  DM.SEX,
                  DM.AGE,
                  DM.OCC_SEQNO,
                  DM.NATION_SEQNO,
                  DM.HEIGHT,
                  DM.MARK,
                  DM.ADDR,
                  DM.ROAD,
                  DM.TMB_SEQNO,
                  DM.AMP_SEQNO,
                  DM.PV_SEQNO,
                  DM.ZIPCODE,
                  DM.REMARK,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.CRS_STS,
                  DM.CRS_SCAN,
                  DM.RACE,
                  DM.REVOKE_DEPT_SEQNO,
                  DM.REMARK_TYPE,
                  DM.OCC_DETAIL,
                  DM.T_IDICONCEPT,
                  DM.DEPT_SEQNO,
                  DM.SUFFIX_SEQNO,
                  DM.IMGCRS,
                  DM.IMGSTS,
                  DM.FGPCRS,
                  DM.FGPREMARK,
                  DM.FGPSTS,
                  DM.FGPMATCHPERCENT,
                  DM.TM18_SEQNO,
                  DM.TM20_SEQNO,
                  DM.TEL)
          VALUES (P.CERTOFRESIDENCE_SEQNO,
                  P.PAIDBOOK_DATE,
                  P.CONTROLBOOK_NO,
                  P.FEES_SEQNO,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.RESCERTTYPE_SEQNO,
                  P.RCISSUE_BY,
                  P.RCISSUE_DATE,
                  P.RCISSUEPV_SEQNO,
                  P.RCISSUEAMP_SEQNO,
                  P.QUOTATYPE,
                  P.QUOTANO,
                  P.QUOTA_DATE,
                  P.ISSUETIME,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.OTHERNM,
                  P.NATIONCD,
                  P.BIRTH_DATE,
                  P.BIRTH_PLACE,
                  P.BIRTH_COUNTRY,
                  P.SEX,
                  P.AGE,
                  P.OCC_SEQNO,
                  P.NATION_SEQNO,
                  P.HEIGHT,
                  P.MARK,
                  P.ADDR,
                  P.ROAD,
                  P.TMB_SEQNO,
                  P.AMP_SEQNO,
                  P.PV_SEQNO,
                  P.ZIPCODE,
                  P.REMARK,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.CRS_STS,
                  P.CRS_SCAN,
                  P.RACE,
                  P.REVOKE_DEPT_SEQNO,
                  P.REMARK_TYPE,
                  P.OCC_DETAIL,
                  P.T_IDICONCEPT,
                  P.DEPT_SEQNO,
                  P.SUFFIX_SEQNO,
                  P.IMGCRS,
                  P.IMGSTS,
                  P.FGPCRS,
                  P.FGPREMARK,
                  P.FGPSTS,
                  P.FGPMATCHPERCENT,
                  P.TM18_SEQNO,
                  P.TM20_SEQNO,
                  P.TEL);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CRS_CERTOFRESIDENCE_C', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CRS_CERTOFRESIDENCE_C',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.CRS_CERTOFRESIDENCE DM
        USING (SELECT *
                 FROM PIBICS.CRS_CERTOFRESIDENCE@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.CERTOFRESIDENCE_SEQNO = P.CERTOFRESIDENCE_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.PAIDBOOK_DATE = P.PAIDBOOK_DATE,
                 DM.CONTROLBOOK_NO = P.CONTROLBOOK_NO,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.RCNO_PVCD = P.RCNO_PVCD,
                 DM.RCNO_RUNNINGNO = P.RCNO_RUNNINGNO,
                 DM.RCNO_YEAR = P.RCNO_YEAR,
                 DM.RESCERTTYPE_SEQNO = P.RESCERTTYPE_SEQNO,
                 DM.RCISSUE_BY = P.RCISSUE_BY,
                 DM.RCISSUE_DATE = P.RCISSUE_DATE,
                 DM.RCISSUEPV_SEQNO = P.RCISSUEPV_SEQNO,
                 DM.RCISSUEAMP_SEQNO = P.RCISSUEAMP_SEQNO,
                 DM.QUOTATYPE = P.QUOTATYPE,
                 DM.QUOTANO = P.QUOTANO,
                 DM.QUOTA_DATE = P.QUOTA_DATE,
                 DM.ISSUETIME = P.ISSUETIME,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.TFAMILYNM = P.TFAMILYNM,
                 DM.TFIRSTNM = P.TFIRSTNM,
                 DM.TMIDDLENM = P.TMIDDLENM,
                 DM.OTHERNM = P.OTHERNM,
                 DM.NATIONCD = P.NATIONCD,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.BIRTH_COUNTRY = P.BIRTH_COUNTRY,
                 DM.SEX = P.SEX,
                 DM.AGE = P.AGE,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.HEIGHT = P.HEIGHT,
                 DM.MARK = P.MARK,
                 DM.ADDR = P.ADDR,
                 DM.ROAD = P.ROAD,
                 DM.TMB_SEQNO = P.TMB_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.ZIPCODE = P.ZIPCODE,
                 DM.REMARK = P.REMARK,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.CRS_STS = P.CRS_STS,
                 DM.CRS_SCAN = P.CRS_SCAN,
                 DM.RACE = P.RACE,
                 DM.REVOKE_DEPT_SEQNO = P.REVOKE_DEPT_SEQNO,
                 DM.REMARK_TYPE = P.REMARK_TYPE,
                 DM.OCC_DETAIL = P.OCC_DETAIL,
                 DM.T_IDICONCEPT = P.T_IDICONCEPT,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.IMGCRS = P.IMGCRS,
                 DM.IMGSTS = P.IMGSTS,
                 DM.FGPCRS = P.FGPCRS,
                 DM.FGPREMARK = P.FGPREMARK,
                 DM.FGPSTS = P.FGPSTS,
                 DM.FGPMATCHPERCENT = P.FGPMATCHPERCENT,
                 DM.TM18_SEQNO = P.TM18_SEQNO,
                 DM.TM20_SEQNO = P.TM20_SEQNO,
                 DM.TEL = P.TEL
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CERTOFRESIDENCE_SEQNO,
                  DM.PAIDBOOK_DATE,
                  DM.CONTROLBOOK_NO,
                  DM.FEES_SEQNO,
                  DM.RCNO_PVCD,
                  DM.RCNO_RUNNINGNO,
                  DM.RCNO_YEAR,
                  DM.RESCERTTYPE_SEQNO,
                  DM.RCISSUE_BY,
                  DM.RCISSUE_DATE,
                  DM.RCISSUEPV_SEQNO,
                  DM.RCISSUEAMP_SEQNO,
                  DM.QUOTATYPE,
                  DM.QUOTANO,
                  DM.QUOTA_DATE,
                  DM.ISSUETIME,
                  DM.EFAMILYNM,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.TFAMILYNM,
                  DM.TFIRSTNM,
                  DM.TMIDDLENM,
                  DM.OTHERNM,
                  DM.NATIONCD,
                  DM.BIRTH_DATE,
                  DM.BIRTH_PLACE,
                  DM.BIRTH_COUNTRY,
                  DM.SEX,
                  DM.AGE,
                  DM.OCC_SEQNO,
                  DM.NATION_SEQNO,
                  DM.HEIGHT,
                  DM.MARK,
                  DM.ADDR,
                  DM.ROAD,
                  DM.TMB_SEQNO,
                  DM.AMP_SEQNO,
                  DM.PV_SEQNO,
                  DM.ZIPCODE,
                  DM.REMARK,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.CRS_STS,
                  DM.CRS_SCAN,
                  DM.RACE,
                  DM.REVOKE_DEPT_SEQNO,
                  DM.REMARK_TYPE,
                  DM.OCC_DETAIL,
                  DM.T_IDICONCEPT,
                  DM.DEPT_SEQNO,
                  DM.SUFFIX_SEQNO,
                  DM.IMGCRS,
                  DM.IMGSTS,
                  DM.FGPCRS,
                  DM.FGPREMARK,
                  DM.FGPSTS,
                  DM.FGPMATCHPERCENT,
                  DM.TM18_SEQNO,
                  DM.TM20_SEQNO,
                  DM.TEL)
          VALUES (P.CERTOFRESIDENCE_SEQNO,
                  P.PAIDBOOK_DATE,
                  P.CONTROLBOOK_NO,
                  P.FEES_SEQNO,
                  P.RCNO_PVCD,
                  P.RCNO_RUNNINGNO,
                  P.RCNO_YEAR,
                  P.RESCERTTYPE_SEQNO,
                  P.RCISSUE_BY,
                  P.RCISSUE_DATE,
                  P.RCISSUEPV_SEQNO,
                  P.RCISSUEAMP_SEQNO,
                  P.QUOTATYPE,
                  P.QUOTANO,
                  P.QUOTA_DATE,
                  P.ISSUETIME,
                  P.EFAMILYNM,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.TFAMILYNM,
                  P.TFIRSTNM,
                  P.TMIDDLENM,
                  P.OTHERNM,
                  P.NATIONCD,
                  P.BIRTH_DATE,
                  P.BIRTH_PLACE,
                  P.BIRTH_COUNTRY,
                  P.SEX,
                  P.AGE,
                  P.OCC_SEQNO,
                  P.NATION_SEQNO,
                  P.HEIGHT,
                  P.MARK,
                  P.ADDR,
                  P.ROAD,
                  P.TMB_SEQNO,
                  P.AMP_SEQNO,
                  P.PV_SEQNO,
                  P.ZIPCODE,
                  P.REMARK,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.CRS_STS,
                  P.CRS_SCAN,
                  P.RACE,
                  P.REVOKE_DEPT_SEQNO,
                  P.REMARK_TYPE,
                  P.OCC_DETAIL,
                  P.T_IDICONCEPT,
                  P.DEPT_SEQNO,
                  P.SUFFIX_SEQNO,
                  P.IMGCRS,
                  P.IMGSTS,
                  P.FGPCRS,
                  P.FGPREMARK,
                  P.FGPSTS,
                  P.FGPMATCHPERCENT,
                  P.TM18_SEQNO,
                  P.TM20_SEQNO,
                  P.TEL);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CRS_CERTOFRESIDENCE_U', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CRS_CERTOFRESIDENCE_U',
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
END P_CRS_CERTOFRESIDENCE;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_CRS_CERTOFRESIDENCE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_CRS_CERTOFRESIDENCE" TO "BIOSAADM";
