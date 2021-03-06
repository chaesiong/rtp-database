CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CHNG_CHANGEVISA_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.11
  -- v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
  -- v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.CHNG_CHANGEVISA DM
        USING (SELECT *
                 FROM PIBICS.CHNG_CHANGEVISA@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.CHANGEVISA_SEQNO = P.CHANGEVISA_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.CHANGEVISA_DOCNO = P.CHANGEVISA_DOCNO,
                 DM.EXTLIST_SEQNO = P.EXTLIST_SEQNO,
                 DM.EXT_DOCNO = P.EXT_DOCNO,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.VISA_DATE = P.VISA_DATE,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.CHANGEVISA_DATE = P.CHANGEVISA_DATE,
                 DM.CHANGEVISA_FOR = P.CHANGEVISA_FOR,
                 DM.BUSINESS_TYPE = P.BUSINESS_TYPE,
                 DM.COMPANY_SEQNO = P.COMPANY_SEQNO,
                 DM.COMPANYNM = P.COMPANYNM,
                 DM.CAPITAL = P.CAPITAL,
                 DM.CAPITALPAY = P.CAPITALPAY,
                 DM.ASSET = P.ASSET,
                 DM.SUMOFFICER = P.SUMOFFICER,
                 DM.THAIOFFICER = P.THAIOFFICER,
                 DM.PERMANANCE = P.PERMANANCE,
                 DM.ALIENOFFICER = P.ALIENOFFICER,
                 DM.ALIENINCOMEM = P.ALIENINCOMEM,
                 DM.FACT1 = P.FACT1,
                 DM.DAILY = P.DAILY,
                 DM.FACT2 = P.FACT2,
                 DM.FACT3 = P.FACT3,
                 DM.FACT4 = P.FACT4,
                 DM.FACT5 = P.FACT5,
                 DM.FACT6 = P.FACT6,
                 DM.FACT7 = P.FACT7,
                 DM.FACT8 = P.FACT8,
                 DM.FACT9 = P.FACT9,
                 DM.FACT10 = P.FACT10,
                 DM.FACT11 = P.FACT11,
                 DM.FACT12 = P.FACT12,
                 DM.FACT13 = P.FACT13,
                 DM.FACT14 = P.FACT14,
                 DM.FACT15 = P.FACT15,
                 DM.WPERMIT_DATE = P.WPERMIT_DATE,
                 DM.WEPERMIT_DATE = P.WEPERMIT_DATE,
                 DM.REMARK1 = P.REMARK1,
                 DM.REMARK2 = P.REMARK2,
                 DM.REMARK4 = P.REMARK4,
                 DM.PRESENT_ID = P.PRESENT_ID,
                 DM.PRESENTRANK_SEQNO = P.PRESENTRANK_SEQNO,
                 DM.APPROVE_ID = P.APPROVE_ID,
                 DM.APPROVERANK_SEQNO = P.APPROVERANK_SEQNO,
                 DM.CHANGEVISA_STS = P.CHANGEVISA_STS,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.DOC_TO = P.DOC_TO,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.REASON_SEQNO = P.REASON_SEQNO,
                 DM.REMARK2_1 = P.REMARK2_1,
                 DM.VISABEF_SEQNO = P.VISABEF_SEQNO,
                 DM.VISABEFSUB_SEQNO = P.VISABEFSUB_SEQNO,
                 DM.VISAAFT_SEQNO = P.VISAAFT_SEQNO,
                 DM.VISAAFTSUB_SEQNO = P.VISAAFTSUB_SEQNO,
                 DM.NONIMM_CODE = P.NONIMM_CODE,
                 DM.CHGPERMITS_DATE = P.CHGPERMITS_DATE,
                 DM.CHGPERMITE_DATE = P.CHGPERMITE_DATE,
                 DM.STATUS = P.STATUS,
                 DM.CHKLAW_SEQNO = P.CHKLAW_SEQNO,
                 DM.CHKDOC_SEQNO = P.CHKDOC_SEQNO,
                 DM.IPADDRESS = P.IPADDRESS,
                 DM.CHANGVISA_TYPE = P.CHANGVISA_TYPE,
                 DM.CONTROL_ID = P.CONTROL_ID,
                 DM.CHECK_ID = P.CHECK_ID,
                 DM.CHECKRANK_SEQNO = P.CHECKRANK_SEQNO,
                 DM.CONTROLRANK_SEQNO = P.CONTROLRANK_SEQNO,
                 DM.PRINTFLAG = P.PRINTFLAG,
                 DM.ADDFORBUSINESS = P.ADDFORBUSINESS
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CHANGEVISA_SEQNO,
                  DM.CHANGEVISA_DOCNO,
                  DM.EXTLIST_SEQNO,
                  DM.EXT_DOCNO,
                  DM.VISATYPE_SEQNO,
                  DM.VISATYPESUB_SEQNO,
                  DM.VISA_DATE,
                  DM.PERMIT_DATE,
                  DM.CHANGEVISA_DATE,
                  DM.CHANGEVISA_FOR,
                  DM.BUSINESS_TYPE,
                  DM.COMPANY_SEQNO,
                  DM.COMPANYNM,
                  DM.CAPITAL,
                  DM.CAPITALPAY,
                  DM.ASSET,
                  DM.SUMOFFICER,
                  DM.THAIOFFICER,
                  DM.PERMANANCE,
                  DM.ALIENOFFICER,
                  DM.ALIENINCOMEM,
                  DM.FACT1,
                  DM.DAILY,
                  DM.FACT2,
                  DM.FACT3,
                  DM.FACT4,
                  DM.FACT5,
                  DM.FACT6,
                  DM.FACT7,
                  DM.FACT8,
                  DM.FACT9,
                  DM.FACT10,
                  DM.FACT11,
                  DM.FACT12,
                  DM.FACT13,
                  DM.FACT14,
                  DM.FACT15,
                  DM.WPERMIT_DATE,
                  DM.WEPERMIT_DATE,
                  DM.REMARK1,
                  DM.REMARK2,
                  DM.REMARK4,
                  DM.PRESENT_ID,
                  DM.PRESENTRANK_SEQNO,
                  DM.APPROVE_ID,
                  DM.APPROVERANK_SEQNO,
                  DM.CHANGEVISA_STS,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.DOC_TO,
                  DM.UDEPT_SEQNO,
                  DM.ACTFLAG,
                  DM.REASON_SEQNO,
                  DM.REMARK2_1,
                  DM.VISABEF_SEQNO,
                  DM.VISABEFSUB_SEQNO,
                  DM.VISAAFT_SEQNO,
                  DM.VISAAFTSUB_SEQNO,
                  DM.NONIMM_CODE,
                  DM.CHGPERMITS_DATE,
                  DM.CHGPERMITE_DATE,
                  DM.STATUS,
                  DM.CHKLAW_SEQNO,
                  DM.CHKDOC_SEQNO,
                  DM.IPADDRESS,
                  DM.CHANGVISA_TYPE,
                  DM.CONTROL_ID,
                  DM.CHECK_ID,
                  DM.CHECKRANK_SEQNO,
                  DM.CONTROLRANK_SEQNO,
                  DM.PRINTFLAG,
                  DM.ADDFORBUSINESS)
          VALUES (P.CHANGEVISA_SEQNO,
                  P.CHANGEVISA_DOCNO,
                  P.EXTLIST_SEQNO,
                  P.EXT_DOCNO,
                  P.VISATYPE_SEQNO,
                  P.VISATYPESUB_SEQNO,
                  P.VISA_DATE,
                  P.PERMIT_DATE,
                  P.CHANGEVISA_DATE,
                  P.CHANGEVISA_FOR,
                  P.BUSINESS_TYPE,
                  P.COMPANY_SEQNO,
                  P.COMPANYNM,
                  P.CAPITAL,
                  P.CAPITALPAY,
                  P.ASSET,
                  P.SUMOFFICER,
                  P.THAIOFFICER,
                  P.PERMANANCE,
                  P.ALIENOFFICER,
                  P.ALIENINCOMEM,
                  P.FACT1,
                  P.DAILY,
                  P.FACT2,
                  P.FACT3,
                  P.FACT4,
                  P.FACT5,
                  P.FACT6,
                  P.FACT7,
                  P.FACT8,
                  P.FACT9,
                  P.FACT10,
                  P.FACT11,
                  P.FACT12,
                  P.FACT13,
                  P.FACT14,
                  P.FACT15,
                  P.WPERMIT_DATE,
                  P.WEPERMIT_DATE,
                  P.REMARK1,
                  P.REMARK2,
                  P.REMARK4,
                  P.PRESENT_ID,
                  P.PRESENTRANK_SEQNO,
                  P.APPROVE_ID,
                  P.APPROVERANK_SEQNO,
                  P.CHANGEVISA_STS,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.DOC_TO,
                  P.UDEPT_SEQNO,
                  P.ACTFLAG,
                  P.REASON_SEQNO,
                  P.REMARK2_1,
                  P.VISABEF_SEQNO,
                  P.VISABEFSUB_SEQNO,
                  P.VISAAFT_SEQNO,
                  P.VISAAFTSUB_SEQNO,
                  P.NONIMM_CODE,
                  P.CHGPERMITS_DATE,
                  P.CHGPERMITE_DATE,
                  P.STATUS,
                  P.CHKLAW_SEQNO,
                  P.CHKDOC_SEQNO,
                  P.IPADDRESS,
                  P.CHANGVISA_TYPE,
                  P.CONTROL_ID,
                  P.CHECK_ID,
                  P.CHECKRANK_SEQNO,
                  P.CONTROLRANK_SEQNO,
                  P.PRINTFLAG,
                  P.ADDFORBUSINESS);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CHNG_CHANGEVISA_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CHNG_CHANGEVISA_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.CHNG_CHANGEVISA DM
        USING (SELECT *
                 FROM PIBICS.CHNG_CHANGEVISA@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.CHANGEVISA_SEQNO = P.CHANGEVISA_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.CHANGEVISA_DOCNO = P.CHANGEVISA_DOCNO,
                 DM.EXTLIST_SEQNO = P.EXTLIST_SEQNO,
                 DM.EXT_DOCNO = P.EXT_DOCNO,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.VISA_DATE = P.VISA_DATE,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.CHANGEVISA_DATE = P.CHANGEVISA_DATE,
                 DM.CHANGEVISA_FOR = P.CHANGEVISA_FOR,
                 DM.BUSINESS_TYPE = P.BUSINESS_TYPE,
                 DM.COMPANY_SEQNO = P.COMPANY_SEQNO,
                 DM.COMPANYNM = P.COMPANYNM,
                 DM.CAPITAL = P.CAPITAL,
                 DM.CAPITALPAY = P.CAPITALPAY,
                 DM.ASSET = P.ASSET,
                 DM.SUMOFFICER = P.SUMOFFICER,
                 DM.THAIOFFICER = P.THAIOFFICER,
                 DM.PERMANANCE = P.PERMANANCE,
                 DM.ALIENOFFICER = P.ALIENOFFICER,
                 DM.ALIENINCOMEM = P.ALIENINCOMEM,
                 DM.FACT1 = P.FACT1,
                 DM.DAILY = P.DAILY,
                 DM.FACT2 = P.FACT2,
                 DM.FACT3 = P.FACT3,
                 DM.FACT4 = P.FACT4,
                 DM.FACT5 = P.FACT5,
                 DM.FACT6 = P.FACT6,
                 DM.FACT7 = P.FACT7,
                 DM.FACT8 = P.FACT8,
                 DM.FACT9 = P.FACT9,
                 DM.FACT10 = P.FACT10,
                 DM.FACT11 = P.FACT11,
                 DM.FACT12 = P.FACT12,
                 DM.FACT13 = P.FACT13,
                 DM.FACT14 = P.FACT14,
                 DM.FACT15 = P.FACT15,
                 DM.WPERMIT_DATE = P.WPERMIT_DATE,
                 DM.WEPERMIT_DATE = P.WEPERMIT_DATE,
                 DM.REMARK1 = P.REMARK1,
                 DM.REMARK2 = P.REMARK2,
                 DM.REMARK4 = P.REMARK4,
                 DM.PRESENT_ID = P.PRESENT_ID,
                 DM.PRESENTRANK_SEQNO = P.PRESENTRANK_SEQNO,
                 DM.APPROVE_ID = P.APPROVE_ID,
                 DM.APPROVERANK_SEQNO = P.APPROVERANK_SEQNO,
                 DM.CHANGEVISA_STS = P.CHANGEVISA_STS,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.DOC_TO = P.DOC_TO,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.REASON_SEQNO = P.REASON_SEQNO,
                 DM.REMARK2_1 = P.REMARK2_1,
                 DM.VISABEF_SEQNO = P.VISABEF_SEQNO,
                 DM.VISABEFSUB_SEQNO = P.VISABEFSUB_SEQNO,
                 DM.VISAAFT_SEQNO = P.VISAAFT_SEQNO,
                 DM.VISAAFTSUB_SEQNO = P.VISAAFTSUB_SEQNO,
                 DM.NONIMM_CODE = P.NONIMM_CODE,
                 DM.CHGPERMITS_DATE = P.CHGPERMITS_DATE,
                 DM.CHGPERMITE_DATE = P.CHGPERMITE_DATE,
                 DM.STATUS = P.STATUS,
                 DM.CHKLAW_SEQNO = P.CHKLAW_SEQNO,
                 DM.CHKDOC_SEQNO = P.CHKDOC_SEQNO,
                 DM.IPADDRESS = P.IPADDRESS,
                 DM.CHANGVISA_TYPE = P.CHANGVISA_TYPE,
                 DM.CONTROL_ID = P.CONTROL_ID,
                 DM.CHECK_ID = P.CHECK_ID,
                 DM.CHECKRANK_SEQNO = P.CHECKRANK_SEQNO,
                 DM.CONTROLRANK_SEQNO = P.CONTROLRANK_SEQNO,
                 DM.PRINTFLAG = P.PRINTFLAG,
                 DM.ADDFORBUSINESS = P.ADDFORBUSINESS
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CHANGEVISA_SEQNO,
                  DM.CHANGEVISA_DOCNO,
                  DM.EXTLIST_SEQNO,
                  DM.EXT_DOCNO,
                  DM.VISATYPE_SEQNO,
                  DM.VISATYPESUB_SEQNO,
                  DM.VISA_DATE,
                  DM.PERMIT_DATE,
                  DM.CHANGEVISA_DATE,
                  DM.CHANGEVISA_FOR,
                  DM.BUSINESS_TYPE,
                  DM.COMPANY_SEQNO,
                  DM.COMPANYNM,
                  DM.CAPITAL,
                  DM.CAPITALPAY,
                  DM.ASSET,
                  DM.SUMOFFICER,
                  DM.THAIOFFICER,
                  DM.PERMANANCE,
                  DM.ALIENOFFICER,
                  DM.ALIENINCOMEM,
                  DM.FACT1,
                  DM.DAILY,
                  DM.FACT2,
                  DM.FACT3,
                  DM.FACT4,
                  DM.FACT5,
                  DM.FACT6,
                  DM.FACT7,
                  DM.FACT8,
                  DM.FACT9,
                  DM.FACT10,
                  DM.FACT11,
                  DM.FACT12,
                  DM.FACT13,
                  DM.FACT14,
                  DM.FACT15,
                  DM.WPERMIT_DATE,
                  DM.WEPERMIT_DATE,
                  DM.REMARK1,
                  DM.REMARK2,
                  DM.REMARK4,
                  DM.PRESENT_ID,
                  DM.PRESENTRANK_SEQNO,
                  DM.APPROVE_ID,
                  DM.APPROVERANK_SEQNO,
                  DM.CHANGEVISA_STS,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.DOC_TO,
                  DM.UDEPT_SEQNO,
                  DM.ACTFLAG,
                  DM.REASON_SEQNO,
                  DM.REMARK2_1,
                  DM.VISABEF_SEQNO,
                  DM.VISABEFSUB_SEQNO,
                  DM.VISAAFT_SEQNO,
                  DM.VISAAFTSUB_SEQNO,
                  DM.NONIMM_CODE,
                  DM.CHGPERMITS_DATE,
                  DM.CHGPERMITE_DATE,
                  DM.STATUS,
                  DM.CHKLAW_SEQNO,
                  DM.CHKDOC_SEQNO,
                  DM.IPADDRESS,
                  DM.CHANGVISA_TYPE,
                  DM.CONTROL_ID,
                  DM.CHECK_ID,
                  DM.CHECKRANK_SEQNO,
                  DM.CONTROLRANK_SEQNO,
                  DM.PRINTFLAG,
                  DM.ADDFORBUSINESS)
          VALUES (P.CHANGEVISA_SEQNO,
                  P.CHANGEVISA_DOCNO,
                  P.EXTLIST_SEQNO,
                  P.EXT_DOCNO,
                  P.VISATYPE_SEQNO,
                  P.VISATYPESUB_SEQNO,
                  P.VISA_DATE,
                  P.PERMIT_DATE,
                  P.CHANGEVISA_DATE,
                  P.CHANGEVISA_FOR,
                  P.BUSINESS_TYPE,
                  P.COMPANY_SEQNO,
                  P.COMPANYNM,
                  P.CAPITAL,
                  P.CAPITALPAY,
                  P.ASSET,
                  P.SUMOFFICER,
                  P.THAIOFFICER,
                  P.PERMANANCE,
                  P.ALIENOFFICER,
                  P.ALIENINCOMEM,
                  P.FACT1,
                  P.DAILY,
                  P.FACT2,
                  P.FACT3,
                  P.FACT4,
                  P.FACT5,
                  P.FACT6,
                  P.FACT7,
                  P.FACT8,
                  P.FACT9,
                  P.FACT10,
                  P.FACT11,
                  P.FACT12,
                  P.FACT13,
                  P.FACT14,
                  P.FACT15,
                  P.WPERMIT_DATE,
                  P.WEPERMIT_DATE,
                  P.REMARK1,
                  P.REMARK2,
                  P.REMARK4,
                  P.PRESENT_ID,
                  P.PRESENTRANK_SEQNO,
                  P.APPROVE_ID,
                  P.APPROVERANK_SEQNO,
                  P.CHANGEVISA_STS,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.DOC_TO,
                  P.UDEPT_SEQNO,
                  P.ACTFLAG,
                  P.REASON_SEQNO,
                  P.REMARK2_1,
                  P.VISABEF_SEQNO,
                  P.VISABEFSUB_SEQNO,
                  P.VISAAFT_SEQNO,
                  P.VISAAFTSUB_SEQNO,
                  P.NONIMM_CODE,
                  P.CHGPERMITS_DATE,
                  P.CHGPERMITE_DATE,
                  P.STATUS,
                  P.CHKLAW_SEQNO,
                  P.CHKDOC_SEQNO,
                  P.IPADDRESS,
                  P.CHANGVISA_TYPE,
                  P.CONTROL_ID,
                  P.CHECK_ID,
                  P.CHECKRANK_SEQNO,
                  P.CONTROLRANK_SEQNO,
                  P.PRINTFLAG,
                  P.ADDFORBUSINESS);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CHNG_CHANGEVISA_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CHNG_CHANGEVISA_U_M',
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
END P_CHNG_CHANGEVISA_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_CHNG_CHANGEVISA_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_CHNG_CHANGEVISA_M" TO "BIOSAADM";
