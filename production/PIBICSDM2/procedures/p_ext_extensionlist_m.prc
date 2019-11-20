CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_EXT_EXTENSIONLIST_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --7
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.EXT_EXTENSIONLIST DM
        USING (SELECT *
                 FROM PIBICS.EXT_EXTENSIONLIST@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.EXTLIST_SEQNO = P.EXTLIST_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EXT_SEQNO = P.EXT_SEQNO,
                 DM.EXTPERSON_SEQNO = P.EXTPERSON_SEQNO,
                 DM.DOC_NO = P.DOC_NO,
                 DM.REASON_SEQNO = P.REASON_SEQNO,
                 DM.EXT_DAY = P.EXT_DAY,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.EXT_DATE = P.EXT_DATE,
                 DM.TM6NO = P.TM6NO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.PASSPORT_PLACE = P.PASSPORT_PLACE,
                 DM.PASSPORT_DATE = P.PASSPORT_DATE,
                 DM.PASSPORT_EXPDATE = P.PASSPORT_EXPDATE,
                 DM.IN_DATE = P.IN_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.CONVREGNO = P.CONVREGNO,
                 DM.FROMCOUNT_SEQNO = P.FROMCOUNT_SEQNO,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISA_EXPDATE = P.VISA_EXPDATE,
                 DM.BUILDING = P.BUILDING,
                 DM.ADDR = P.ADDR,
                 DM.ROAD = P.ROAD,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.TMB_SEQNO = P.TMB_SEQNO,
                 DM.POSTCODE = P.POSTCODE,
                 DM.TEL = P.TEL,
                 DM.PERSON_STS = P.PERSON_STS,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.FINE_SEQNO1 = P.FINE_SEQNO1,
                 DM.FINE_SEQNO2 = P.FINE_SEQNO2,
                 DM.FINE_SEQNO3 = P.FINE_SEQNO3,
                 DM.FINE_SEQNO4 = P.FINE_SEQNO4,
                 DM.FEESLIP_SEQNO = P.FEESLIP_SEQNO,
                 DM.APPROVE_STS = P.APPROVE_STS,
                 DM.COMMAND_SEQNO = P.COMMAND_SEQNO,
                 DM.COMMAND_OTH = P.COMMAND_OTH,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.APPROVE_REM = P.APPROVE_REM,
                 DM.WAITCOMMENT_SEQNO = P.WAITCOMMENT_SEQNO,
                 DM.WAITCOMMENT_OTH = P.WAITCOMMENT_OTH,
                 DM.WAIT_DATE = P.WAIT_DATE,
                 DM.NO_DATE = P.NO_DATE,
                 DM.NO_REM = P.NO_REM,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.COUNT_SEQNO = P.COUNT_SEQNO,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.EXTIMG = P.EXTIMG,
                 DM.PASSPORT_PIC = P.PASSPORT_PIC,
                 DM.VISA_DATE = P.VISA_DATE,
                 DM.OLD_PERMIT_DATE = P.OLD_PERMIT_DATE,
                 DM.COM_SEQNO = P.COM_SEQNO,
                 DM.FACTTYPE = P.FACTTYPE,
                 DM.RELATIONSHIP = P.RELATIONSHIP,
                 DM.REASON_VISA = P.REASON_VISA,
                 DM.REF_PERSON = P.REF_PERSON,
                 DM.REF_TEL = P.REF_TEL,
                 DM.REMARK_BL = P.REMARK_BL,
                 DM.FINE_NUMBER1 = P.FINE_NUMBER1,
                 DM.FINE_NUMBER2 = P.FINE_NUMBER2,
                 DM.FINE_NUMBER3 = P.FINE_NUMBER3,
                 DM.FINE_NUMBER4 = P.FINE_NUMBER4,
                 DM.FINE_NUMBER5 = P.FINE_NUMBER5,
                 DM.FINE_DAY1 = P.FINE_DAY1,
                 DM.FINE_DAY2 = P.FINE_DAY2,
                 DM.FINE_DAY3 = P.FINE_DAY3,
                 DM.FINE_DAY4 = P.FINE_DAY4,
                 DM.FINE_DAY5 = P.FINE_DAY5,
                 DM.FINE_REMARK1 = P.FINE_REMARK1,
                 DM.FINE_REMARK2 = P.FINE_REMARK2,
                 DM.FINE_REMARK3 = P.FINE_REMARK3,
                 DM.FINE_REMARK4 = P.FINE_REMARK4,
                 DM.FINE_REMARK5 = P.FINE_REMARK5,
                 DM.FINE_STS1 = P.FINE_STS1,
                 DM.FINE_STS2 = P.FINE_STS2,
                 DM.FINE_STS3 = P.FINE_STS3,
                 DM.FINE_STS4 = P.FINE_STS4,
                 DM.FINE_STS5 = P.FINE_STS5,
                 DM.FLAGSYSTEM = P.FLAGSYSTEM,
                 DM.EXTPERSONQ_SEQNO = P.EXTPERSONQ_SEQNO,
                 DM.IPADDRESS = P.IPADDRESS,
                 DM.UIPADDRESS = P.UIPADDRESS,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.FEE_STS = P.FEE_STS,
                 DM.FINE_DATE1 = P.FINE_DATE1,
                 DM.FINE_DATE2 = P.FINE_DATE2,
                 DM.NOTROLE_REM = P.NOTROLE_REM,
                 DM.CANCEL_REM = P.CANCEL_REM,
                 DM.PROVE_BY = P.PROVE_BY,
                 DM.PROVE_ID = P.PROVE_ID,
                 DM.T_IDICONCEPT = P.T_IDICONCEPT,
                 DM.REMARK = P.REMARK,
                 DM.ITEMNO = P.ITEMNO,
                 DM.FLAG_QUEONLINE = P.FLAG_QUEONLINE,
                 DM.STATUS_OFFLINE = P.STATUS_OFFLINE
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EXTLIST_SEQNO,
                  DM.EXT_SEQNO,
                  DM.EXTPERSON_SEQNO,
                  DM.DOC_NO,
                  DM.REASON_SEQNO,
                  DM.EXT_DAY,
                  DM.PASSPORTNO,
                  DM.EXT_DATE,
                  DM.TM6NO,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.EFAMILYNM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.BIRTH_PLACE,
                  DM.NATION_SEQNO,
                  DM.PASSPORT_PLACE,
                  DM.PASSPORT_DATE,
                  DM.PASSPORT_EXPDATE,
                  DM.IN_DATE,
                  DM.CONV_SEQNO,
                  DM.CONVREGNO,
                  DM.FROMCOUNT_SEQNO,
                  DM.DEPT_SEQNO,
                  DM.VISATYPE_SEQNO,
                  DM.VISA_EXPDATE,
                  DM.BUILDING,
                  DM.ADDR,
                  DM.ROAD,
                  DM.PV_SEQNO,
                  DM.AMP_SEQNO,
                  DM.TMB_SEQNO,
                  DM.POSTCODE,
                  DM.TEL,
                  DM.PERSON_STS,
                  DM.ACTFLAG,
                  DM.FINE_SEQNO1,
                  DM.FINE_SEQNO2,
                  DM.FINE_SEQNO3,
                  DM.FINE_SEQNO4,
                  DM.FEESLIP_SEQNO,
                  DM.APPROVE_STS,
                  DM.COMMAND_SEQNO,
                  DM.COMMAND_OTH,
                  DM.PERMIT_DATE,
                  DM.APPROVE_REM,
                  DM.WAITCOMMENT_SEQNO,
                  DM.WAITCOMMENT_OTH,
                  DM.WAIT_DATE,
                  DM.NO_DATE,
                  DM.NO_REM,
                  DM.UDEPT_SEQNO,
                  DM.CPASSPORTNO,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.SUFFIX_SEQNO,
                  DM.COUNT_SEQNO,
                  DM.OCC_SEQNO,
                  DM.EXTIMG,
                  DM.PASSPORT_PIC,
                  DM.VISA_DATE,
                  DM.OLD_PERMIT_DATE,
                  DM.COM_SEQNO,
                  DM.FACTTYPE,
                  DM.RELATIONSHIP,
                  DM.REASON_VISA,
                  DM.REF_PERSON,
                  DM.REF_TEL,
                  DM.REMARK_BL,
                  DM.FINE_NUMBER1,
                  DM.FINE_NUMBER2,
                  DM.FINE_NUMBER3,
                  DM.FINE_NUMBER4,
                  DM.FINE_NUMBER5,
                  DM.FINE_DAY1,
                  DM.FINE_DAY2,
                  DM.FINE_DAY3,
                  DM.FINE_DAY4,
                  DM.FINE_DAY5,
                  DM.FINE_REMARK1,
                  DM.FINE_REMARK2,
                  DM.FINE_REMARK3,
                  DM.FINE_REMARK4,
                  DM.FINE_REMARK5,
                  DM.FINE_STS1,
                  DM.FINE_STS2,
                  DM.FINE_STS3,
                  DM.FINE_STS4,
                  DM.FINE_STS5,
                  DM.FLAGSYSTEM,
                  DM.EXTPERSONQ_SEQNO,
                  DM.IPADDRESS,
                  DM.UIPADDRESS,
                  DM.VISATYPESUB_SEQNO,
                  DM.FEE_STS,
                  DM.FINE_DATE1,
                  DM.FINE_DATE2,
                  DM.NOTROLE_REM,
                  DM.CANCEL_REM,
                  DM.PROVE_BY,
                  DM.PROVE_ID,
                  DM.T_IDICONCEPT,
                  DM.REMARK,
                  DM.ITEMNO,
                  DM.FLAG_QUEONLINE,
                  DM.STATUS_OFFLINE)
          VALUES (P.EXTLIST_SEQNO,
                  P.EXT_SEQNO,
                  P.EXTPERSON_SEQNO,
                  P.DOC_NO,
                  P.REASON_SEQNO,
                  P.EXT_DAY,
                  P.PASSPORTNO,
                  P.EXT_DATE,
                  P.TM6NO,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.EFAMILYNM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.BIRTH_PLACE,
                  P.NATION_SEQNO,
                  P.PASSPORT_PLACE,
                  P.PASSPORT_DATE,
                  P.PASSPORT_EXPDATE,
                  P.IN_DATE,
                  P.CONV_SEQNO,
                  P.CONVREGNO,
                  P.FROMCOUNT_SEQNO,
                  P.DEPT_SEQNO,
                  P.VISATYPE_SEQNO,
                  P.VISA_EXPDATE,
                  P.BUILDING,
                  P.ADDR,
                  P.ROAD,
                  P.PV_SEQNO,
                  P.AMP_SEQNO,
                  P.TMB_SEQNO,
                  P.POSTCODE,
                  P.TEL,
                  P.PERSON_STS,
                  P.ACTFLAG,
                  P.FINE_SEQNO1,
                  P.FINE_SEQNO2,
                  P.FINE_SEQNO3,
                  P.FINE_SEQNO4,
                  P.FEESLIP_SEQNO,
                  P.APPROVE_STS,
                  P.COMMAND_SEQNO,
                  P.COMMAND_OTH,
                  P.PERMIT_DATE,
                  P.APPROVE_REM,
                  P.WAITCOMMENT_SEQNO,
                  P.WAITCOMMENT_OTH,
                  P.WAIT_DATE,
                  P.NO_DATE,
                  P.NO_REM,
                  P.UDEPT_SEQNO,
                  P.CPASSPORTNO,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.SUFFIX_SEQNO,
                  P.COUNT_SEQNO,
                  P.OCC_SEQNO,
                  P.EXTIMG,
                  P.PASSPORT_PIC,
                  P.VISA_DATE,
                  P.OLD_PERMIT_DATE,
                  P.COM_SEQNO,
                  P.FACTTYPE,
                  P.RELATIONSHIP,
                  P.REASON_VISA,
                  P.REF_PERSON,
                  P.REF_TEL,
                  P.REMARK_BL,
                  P.FINE_NUMBER1,
                  P.FINE_NUMBER2,
                  P.FINE_NUMBER3,
                  P.FINE_NUMBER4,
                  P.FINE_NUMBER5,
                  P.FINE_DAY1,
                  P.FINE_DAY2,
                  P.FINE_DAY3,
                  P.FINE_DAY4,
                  P.FINE_DAY5,
                  P.FINE_REMARK1,
                  P.FINE_REMARK2,
                  P.FINE_REMARK3,
                  P.FINE_REMARK4,
                  P.FINE_REMARK5,
                  P.FINE_STS1,
                  P.FINE_STS2,
                  P.FINE_STS3,
                  P.FINE_STS4,
                  P.FINE_STS5,
                  P.FLAGSYSTEM,
                  P.EXTPERSONQ_SEQNO,
                  P.IPADDRESS,
                  P.UIPADDRESS,
                  P.VISATYPESUB_SEQNO,
                  P.FEE_STS,
                  P.FINE_DATE1,
                  P.FINE_DATE2,
                  P.NOTROLE_REM,
                  P.CANCEL_REM,
                  P.PROVE_BY,
                  P.PROVE_ID,
                  P.T_IDICONCEPT,
                  P.REMARK,
                  P.ITEMNO,
                  P.FLAG_QUEONLINE,
                  P.STATUS_OFFLINE);


   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EXT_EXTENSIONLIST_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EXT_EXTENSIONLIST_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.EXT_EXTENSIONLIST DM
        USING (SELECT *
                 FROM PIBICS.EXT_EXTENSIONLIST@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.EXTLIST_SEQNO = P.EXTLIST_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EXT_SEQNO = P.EXT_SEQNO,
                 DM.EXTPERSON_SEQNO = P.EXTPERSON_SEQNO,
                 DM.DOC_NO = P.DOC_NO,
                 DM.REASON_SEQNO = P.REASON_SEQNO,
                 DM.EXT_DAY = P.EXT_DAY,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.EXT_DATE = P.EXT_DATE,
                 DM.TM6NO = P.TM6NO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.PASSPORT_PLACE = P.PASSPORT_PLACE,
                 DM.PASSPORT_DATE = P.PASSPORT_DATE,
                 DM.PASSPORT_EXPDATE = P.PASSPORT_EXPDATE,
                 DM.IN_DATE = P.IN_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.CONVREGNO = P.CONVREGNO,
                 DM.FROMCOUNT_SEQNO = P.FROMCOUNT_SEQNO,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISA_EXPDATE = P.VISA_EXPDATE,
                 DM.BUILDING = P.BUILDING,
                 DM.ADDR = P.ADDR,
                 DM.ROAD = P.ROAD,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.TMB_SEQNO = P.TMB_SEQNO,
                 DM.POSTCODE = P.POSTCODE,
                 DM.TEL = P.TEL,
                 DM.PERSON_STS = P.PERSON_STS,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.FINE_SEQNO1 = P.FINE_SEQNO1,
                 DM.FINE_SEQNO2 = P.FINE_SEQNO2,
                 DM.FINE_SEQNO3 = P.FINE_SEQNO3,
                 DM.FINE_SEQNO4 = P.FINE_SEQNO4,
                 DM.FEESLIP_SEQNO = P.FEESLIP_SEQNO,
                 DM.APPROVE_STS = P.APPROVE_STS,
                 DM.COMMAND_SEQNO = P.COMMAND_SEQNO,
                 DM.COMMAND_OTH = P.COMMAND_OTH,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.APPROVE_REM = P.APPROVE_REM,
                 DM.WAITCOMMENT_SEQNO = P.WAITCOMMENT_SEQNO,
                 DM.WAITCOMMENT_OTH = P.WAITCOMMENT_OTH,
                 DM.WAIT_DATE = P.WAIT_DATE,
                 DM.NO_DATE = P.NO_DATE,
                 DM.NO_REM = P.NO_REM,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.COUNT_SEQNO = P.COUNT_SEQNO,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.EXTIMG = P.EXTIMG,
                 DM.PASSPORT_PIC = P.PASSPORT_PIC,
                 DM.VISA_DATE = P.VISA_DATE,
                 DM.OLD_PERMIT_DATE = P.OLD_PERMIT_DATE,
                 DM.COM_SEQNO = P.COM_SEQNO,
                 DM.FACTTYPE = P.FACTTYPE,
                 DM.RELATIONSHIP = P.RELATIONSHIP,
                 DM.REASON_VISA = P.REASON_VISA,
                 DM.REF_PERSON = P.REF_PERSON,
                 DM.REF_TEL = P.REF_TEL,
                 DM.REMARK_BL = P.REMARK_BL,
                 DM.FINE_NUMBER1 = P.FINE_NUMBER1,
                 DM.FINE_NUMBER2 = P.FINE_NUMBER2,
                 DM.FINE_NUMBER3 = P.FINE_NUMBER3,
                 DM.FINE_NUMBER4 = P.FINE_NUMBER4,
                 DM.FINE_NUMBER5 = P.FINE_NUMBER5,
                 DM.FINE_DAY1 = P.FINE_DAY1,
                 DM.FINE_DAY2 = P.FINE_DAY2,
                 DM.FINE_DAY3 = P.FINE_DAY3,
                 DM.FINE_DAY4 = P.FINE_DAY4,
                 DM.FINE_DAY5 = P.FINE_DAY5,
                 DM.FINE_REMARK1 = P.FINE_REMARK1,
                 DM.FINE_REMARK2 = P.FINE_REMARK2,
                 DM.FINE_REMARK3 = P.FINE_REMARK3,
                 DM.FINE_REMARK4 = P.FINE_REMARK4,
                 DM.FINE_REMARK5 = P.FINE_REMARK5,
                 DM.FINE_STS1 = P.FINE_STS1,
                 DM.FINE_STS2 = P.FINE_STS2,
                 DM.FINE_STS3 = P.FINE_STS3,
                 DM.FINE_STS4 = P.FINE_STS4,
                 DM.FINE_STS5 = P.FINE_STS5,
                 DM.FLAGSYSTEM = P.FLAGSYSTEM,
                 DM.EXTPERSONQ_SEQNO = P.EXTPERSONQ_SEQNO,
                 DM.IPADDRESS = P.IPADDRESS,
                 DM.UIPADDRESS = P.UIPADDRESS,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.FEE_STS = P.FEE_STS,
                 DM.FINE_DATE1 = P.FINE_DATE1,
                 DM.FINE_DATE2 = P.FINE_DATE2,
                 DM.NOTROLE_REM = P.NOTROLE_REM,
                 DM.CANCEL_REM = P.CANCEL_REM,
                 DM.PROVE_BY = P.PROVE_BY,
                 DM.PROVE_ID = P.PROVE_ID,
                 DM.T_IDICONCEPT = P.T_IDICONCEPT,
                 DM.REMARK = P.REMARK,
                 DM.ITEMNO = P.ITEMNO,
                 DM.FLAG_QUEONLINE = P.FLAG_QUEONLINE,
                 DM.STATUS_OFFLINE = P.STATUS_OFFLINE
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EXTLIST_SEQNO,
                  DM.EXT_SEQNO,
                  DM.EXTPERSON_SEQNO,
                  DM.DOC_NO,
                  DM.REASON_SEQNO,
                  DM.EXT_DAY,
                  DM.PASSPORTNO,
                  DM.EXT_DATE,
                  DM.TM6NO,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.EFAMILYNM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.BIRTH_PLACE,
                  DM.NATION_SEQNO,
                  DM.PASSPORT_PLACE,
                  DM.PASSPORT_DATE,
                  DM.PASSPORT_EXPDATE,
                  DM.IN_DATE,
                  DM.CONV_SEQNO,
                  DM.CONVREGNO,
                  DM.FROMCOUNT_SEQNO,
                  DM.DEPT_SEQNO,
                  DM.VISATYPE_SEQNO,
                  DM.VISA_EXPDATE,
                  DM.BUILDING,
                  DM.ADDR,
                  DM.ROAD,
                  DM.PV_SEQNO,
                  DM.AMP_SEQNO,
                  DM.TMB_SEQNO,
                  DM.POSTCODE,
                  DM.TEL,
                  DM.PERSON_STS,
                  DM.ACTFLAG,
                  DM.FINE_SEQNO1,
                  DM.FINE_SEQNO2,
                  DM.FINE_SEQNO3,
                  DM.FINE_SEQNO4,
                  DM.FEESLIP_SEQNO,
                  DM.APPROVE_STS,
                  DM.COMMAND_SEQNO,
                  DM.COMMAND_OTH,
                  DM.PERMIT_DATE,
                  DM.APPROVE_REM,
                  DM.WAITCOMMENT_SEQNO,
                  DM.WAITCOMMENT_OTH,
                  DM.WAIT_DATE,
                  DM.NO_DATE,
                  DM.NO_REM,
                  DM.UDEPT_SEQNO,
                  DM.CPASSPORTNO,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.SUFFIX_SEQNO,
                  DM.COUNT_SEQNO,
                  DM.OCC_SEQNO,
                  DM.EXTIMG,
                  DM.PASSPORT_PIC,
                  DM.VISA_DATE,
                  DM.OLD_PERMIT_DATE,
                  DM.COM_SEQNO,
                  DM.FACTTYPE,
                  DM.RELATIONSHIP,
                  DM.REASON_VISA,
                  DM.REF_PERSON,
                  DM.REF_TEL,
                  DM.REMARK_BL,
                  DM.FINE_NUMBER1,
                  DM.FINE_NUMBER2,
                  DM.FINE_NUMBER3,
                  DM.FINE_NUMBER4,
                  DM.FINE_NUMBER5,
                  DM.FINE_DAY1,
                  DM.FINE_DAY2,
                  DM.FINE_DAY3,
                  DM.FINE_DAY4,
                  DM.FINE_DAY5,
                  DM.FINE_REMARK1,
                  DM.FINE_REMARK2,
                  DM.FINE_REMARK3,
                  DM.FINE_REMARK4,
                  DM.FINE_REMARK5,
                  DM.FINE_STS1,
                  DM.FINE_STS2,
                  DM.FINE_STS3,
                  DM.FINE_STS4,
                  DM.FINE_STS5,
                  DM.FLAGSYSTEM,
                  DM.EXTPERSONQ_SEQNO,
                  DM.IPADDRESS,
                  DM.UIPADDRESS,
                  DM.VISATYPESUB_SEQNO,
                  DM.FEE_STS,
                  DM.FINE_DATE1,
                  DM.FINE_DATE2,
                  DM.NOTROLE_REM,
                  DM.CANCEL_REM,
                  DM.PROVE_BY,
                  DM.PROVE_ID,
                  DM.T_IDICONCEPT,
                  DM.REMARK,
                  DM.ITEMNO,
                  DM.FLAG_QUEONLINE,
                  DM.STATUS_OFFLINE)
          VALUES (P.EXTLIST_SEQNO,
                  P.EXT_SEQNO,
                  P.EXTPERSON_SEQNO,
                  P.DOC_NO,
                  P.REASON_SEQNO,
                  P.EXT_DAY,
                  P.PASSPORTNO,
                  P.EXT_DATE,
                  P.TM6NO,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.EFAMILYNM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.BIRTH_PLACE,
                  P.NATION_SEQNO,
                  P.PASSPORT_PLACE,
                  P.PASSPORT_DATE,
                  P.PASSPORT_EXPDATE,
                  P.IN_DATE,
                  P.CONV_SEQNO,
                  P.CONVREGNO,
                  P.FROMCOUNT_SEQNO,
                  P.DEPT_SEQNO,
                  P.VISATYPE_SEQNO,
                  P.VISA_EXPDATE,
                  P.BUILDING,
                  P.ADDR,
                  P.ROAD,
                  P.PV_SEQNO,
                  P.AMP_SEQNO,
                  P.TMB_SEQNO,
                  P.POSTCODE,
                  P.TEL,
                  P.PERSON_STS,
                  P.ACTFLAG,
                  P.FINE_SEQNO1,
                  P.FINE_SEQNO2,
                  P.FINE_SEQNO3,
                  P.FINE_SEQNO4,
                  P.FEESLIP_SEQNO,
                  P.APPROVE_STS,
                  P.COMMAND_SEQNO,
                  P.COMMAND_OTH,
                  P.PERMIT_DATE,
                  P.APPROVE_REM,
                  P.WAITCOMMENT_SEQNO,
                  P.WAITCOMMENT_OTH,
                  P.WAIT_DATE,
                  P.NO_DATE,
                  P.NO_REM,
                  P.UDEPT_SEQNO,
                  P.CPASSPORTNO,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.SUFFIX_SEQNO,
                  P.COUNT_SEQNO,
                  P.OCC_SEQNO,
                  P.EXTIMG,
                  P.PASSPORT_PIC,
                  P.VISA_DATE,
                  P.OLD_PERMIT_DATE,
                  P.COM_SEQNO,
                  P.FACTTYPE,
                  P.RELATIONSHIP,
                  P.REASON_VISA,
                  P.REF_PERSON,
                  P.REF_TEL,
                  P.REMARK_BL,
                  P.FINE_NUMBER1,
                  P.FINE_NUMBER2,
                  P.FINE_NUMBER3,
                  P.FINE_NUMBER4,
                  P.FINE_NUMBER5,
                  P.FINE_DAY1,
                  P.FINE_DAY2,
                  P.FINE_DAY3,
                  P.FINE_DAY4,
                  P.FINE_DAY5,
                  P.FINE_REMARK1,
                  P.FINE_REMARK2,
                  P.FINE_REMARK3,
                  P.FINE_REMARK4,
                  P.FINE_REMARK5,
                  P.FINE_STS1,
                  P.FINE_STS2,
                  P.FINE_STS3,
                  P.FINE_STS4,
                  P.FINE_STS5,
                  P.FLAGSYSTEM,
                  P.EXTPERSONQ_SEQNO,
                  P.IPADDRESS,
                  P.UIPADDRESS,
                  P.VISATYPESUB_SEQNO,
                  P.FEE_STS,
                  P.FINE_DATE1,
                  P.FINE_DATE2,
                  P.NOTROLE_REM,
                  P.CANCEL_REM,
                  P.PROVE_BY,
                  P.PROVE_ID,
                  P.T_IDICONCEPT,
                  P.REMARK,
                  P.ITEMNO,
                  P.FLAG_QUEONLINE,
                  P.STATUS_OFFLINE);


   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EXT_EXTENSIONLIST_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EXT_EXTENSIONLIST_U_M',
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
END P_EXT_EXTENSIONLIST_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_EXT_EXTENSIONLIST_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_EXT_EXTENSIONLIST_M" TO "BIOSAADM";
