CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_REPS_TM8_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.9
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.REPS_TM8 DM
        USING (SELECT *
                 FROM PIBICS.REPS_TM8@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.TM8_SEQNO = P.TM8_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.TM8NO = P.TM8NO,
                 DM.YEAR = P.YEAR,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.WRITTEN = P.WRITTEN,
                 DM.PERSONID = P.PERSONID,
                 DM.FAMILYNM = P.FAMILYNM,
                 DM.FIRSTNM = P.FIRSTNM,
                 DM.MIDDLENM = P.MIDDLENM,
                 DM.NATIONAL_SEQNO = P.NATIONAL_SEQNO,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.SEX = P.SEX,
                 DM.AGE = P.AGE,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.BIRTHCOUNT_SEQNO = P.BIRTHCOUNT_SEQNO,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.PASSPORT_DATE = P.PASSPORT_DATE,
                 DM.PASSPORTEXP_DATE = P.PASSPORTEXP_DATE,
                 DM.PASSPORTISSUEBY = P.PASSPORTISSUEBY,
                 DM.CHILDNO = P.CHILDNO,
                 DM.ADDR = P.ADDR,
                 DM.ROAD = P.ROAD,
                 DM.TMB_SEQNO = P.TMB_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.VISANO = P.VISANO,
                 DM.TDT_SEQNO = P.TDT_SEQNO,
                 DM.VISAISSUE = P.VISAISSUE,
                 DM.VISA_DATE = P.VISA_DATE,
                 DM.OPERMIT_SEQNO = P.OPERMIT_SEQNO,
                 DM.ARRIVE_DATE = P.ARRIVE_DATE,
                 DM.OPERMIT_DATE = P.OPERMIT_DATE,
                 DM.DOCTYPE = P.DOCTYPE,
                 DM.PURPOSECOUNT_SEQNO = P.PURPOSECOUNT_SEQNO,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.LEAVE_DATE = P.LEAVE_DATE,
                 DM.RETURN_DATE = P.RETURN_DATE,
                 DM.PURPOSE = P.PURPOSE,
                 DM.APPVSTS = P.APPVSTS,
                 DM.DOC_DATE = P.DOC_DATE,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.PERMIT_STATUS = P.PERMIT_STATUS,
                 DM.NEWPERMIT_DATE = P.NEWPERMIT_DATE,
                 DM.REASON_SEQNO = P.REASON_SEQNO,
                 DM.REASONDESC = P.REASONDESC,
                 DM.TM6_SEQNO = P.TM6_SEQNO,
                 DM.ENDPERMIT_DATE = P.ENDPERMIT_DATE,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.VERSION = P.VERSION,
                 DM.OVISATYPE_SEQNO = P.OVISATYPE_SEQNO,
                 DM.TODAY_DATE = P.TODAY_DATE,
                 DM.IMGINOUT = P.IMGINOUT,
                 DM.TM6NO = P.TM6NO,
                 DM.APPVSTSBYDATE = P.APPVSTSBYDATE,
                 DM.APPVSTSBYDEPT_SEQNO = P.APPVSTSBYDEPT_SEQNO,
                 DM.FLAG_BOI = P.FLAG_BOI,
                 DM.IPADDRESS = P.IPADDRESS,
                 DM.UIPADDRESS = P.UIPADDRESS,
                 DM.T_IDICONCEPT = P.T_IDICONCEPT,
                 DM.ZONE_SEQNO = P.ZONE_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.EXTLIST_SEQNO = P.EXTLIST_SEQNO,
                 DM.MANUALTM8 = P.MANUALTM8,
                 DM.REPSPERSON_SEQNO = P.REPSPERSON_SEQNO,
                 DM.TELEPHONE = P.TELEPHONE,
                 DM.IMG_PERSON = P.IMG_PERSON,
                 DM.FLAG_QUEONLINE = P.FLAG_QUEONLINE,
                 DM.PD_SEQNO = P.PD_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.TM8_SEQNO,
                  DM.TM8NO,
                  DM.YEAR,
                  DM.FEES_SEQNO,
                  DM.WRITTEN,
                  DM.PERSONID,
                  DM.FAMILYNM,
                  DM.FIRSTNM,
                  DM.MIDDLENM,
                  DM.NATIONAL_SEQNO,
                  DM.BIRTH_DATE,
                  DM.SEX,
                  DM.AGE,
                  DM.OCC_SEQNO,
                  DM.BIRTH_PLACE,
                  DM.BIRTHCOUNT_SEQNO,
                  DM.PASSPORTNO,
                  DM.PASSPORT_DATE,
                  DM.PASSPORTEXP_DATE,
                  DM.PASSPORTISSUEBY,
                  DM.CHILDNO,
                  DM.ADDR,
                  DM.ROAD,
                  DM.TMB_SEQNO,
                  DM.AMP_SEQNO,
                  DM.PV_SEQNO,
                  DM.VISANO,
                  DM.TDT_SEQNO,
                  DM.VISAISSUE,
                  DM.VISA_DATE,
                  DM.OPERMIT_SEQNO,
                  DM.ARRIVE_DATE,
                  DM.OPERMIT_DATE,
                  DM.DOCTYPE,
                  DM.PURPOSECOUNT_SEQNO,
                  DM.CONV_SEQNO,
                  DM.LEAVE_DATE,
                  DM.RETURN_DATE,
                  DM.PURPOSE,
                  DM.APPVSTS,
                  DM.DOC_DATE,
                  DM.DEPT_SEQNO,
                  DM.PERMIT_STATUS,
                  DM.NEWPERMIT_DATE,
                  DM.REASON_SEQNO,
                  DM.REASONDESC,
                  DM.TM6_SEQNO,
                  DM.ENDPERMIT_DATE,
                  DM.CREATE_DATE,
                  DM.CREATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_BY,
                  DM.VERSION,
                  DM.OVISATYPE_SEQNO,
                  DM.TODAY_DATE,
                  DM.IMGINOUT,
                  DM.TM6NO,
                  DM.APPVSTSBYDATE,
                  DM.APPVSTSBYDEPT_SEQNO,
                  DM.FLAG_BOI,
                  DM.IPADDRESS,
                  DM.UIPADDRESS,
                  DM.T_IDICONCEPT,
                  DM.ZONE_SEQNO,
                  DM.SUFFIX_SEQNO,
                  DM.EXTLIST_SEQNO,
                  DM.MANUALTM8,
                  DM.REPSPERSON_SEQNO,
                  DM.TELEPHONE,
                  DM.IMG_PERSON,
                  DM.FLAG_QUEONLINE,
                  DM.PD_SEQNO)
          VALUES (P.TM8_SEQNO,
                  P.TM8NO,
                  P.YEAR,
                  P.FEES_SEQNO,
                  P.WRITTEN,
                  P.PERSONID,
                  P.FAMILYNM,
                  P.FIRSTNM,
                  P.MIDDLENM,
                  P.NATIONAL_SEQNO,
                  P.BIRTH_DATE,
                  P.SEX,
                  P.AGE,
                  P.OCC_SEQNO,
                  P.BIRTH_PLACE,
                  P.BIRTHCOUNT_SEQNO,
                  P.PASSPORTNO,
                  P.PASSPORT_DATE,
                  P.PASSPORTEXP_DATE,
                  P.PASSPORTISSUEBY,
                  P.CHILDNO,
                  P.ADDR,
                  P.ROAD,
                  P.TMB_SEQNO,
                  P.AMP_SEQNO,
                  P.PV_SEQNO,
                  P.VISANO,
                  P.TDT_SEQNO,
                  P.VISAISSUE,
                  P.VISA_DATE,
                  P.OPERMIT_SEQNO,
                  P.ARRIVE_DATE,
                  P.OPERMIT_DATE,
                  P.DOCTYPE,
                  P.PURPOSECOUNT_SEQNO,
                  P.CONV_SEQNO,
                  P.LEAVE_DATE,
                  P.RETURN_DATE,
                  P.PURPOSE,
                  P.APPVSTS,
                  P.DOC_DATE,
                  P.DEPT_SEQNO,
                  P.PERMIT_STATUS,
                  P.NEWPERMIT_DATE,
                  P.REASON_SEQNO,
                  P.REASONDESC,
                  P.TM6_SEQNO,
                  P.ENDPERMIT_DATE,
                  P.CREATE_DATE,
                  P.CREATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_BY,
                  P.VERSION,
                  P.OVISATYPE_SEQNO,
                  P.TODAY_DATE,
                  P.IMGINOUT,
                  P.TM6NO,
                  P.APPVSTSBYDATE,
                  P.APPVSTSBYDEPT_SEQNO,
                  P.FLAG_BOI,
                  P.IPADDRESS,
                  P.UIPADDRESS,
                  P.T_IDICONCEPT,
                  P.ZONE_SEQNO,
                  P.SUFFIX_SEQNO,
                  P.EXTLIST_SEQNO,
                  P.MANUALTM8,
                  P.REPSPERSON_SEQNO,
                  P.TELEPHONE,
                  P.IMG_PERSON,
                  P.FLAG_QUEONLINE,
                  P.PD_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('REPS_TM8_C_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('REPS_TM8_C_M',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;



   MERGE INTO PIBICSDM2.REPS_TM8 DM
        USING (SELECT *
                 FROM PIBICS.REPS_TM8@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.TM8_SEQNO = P.TM8_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.TM8NO = P.TM8NO,
                 DM.YEAR = P.YEAR,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.WRITTEN = P.WRITTEN,
                 DM.PERSONID = P.PERSONID,
                 DM.FAMILYNM = P.FAMILYNM,
                 DM.FIRSTNM = P.FIRSTNM,
                 DM.MIDDLENM = P.MIDDLENM,
                 DM.NATIONAL_SEQNO = P.NATIONAL_SEQNO,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.SEX = P.SEX,
                 DM.AGE = P.AGE,
                 DM.OCC_SEQNO = P.OCC_SEQNO,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.BIRTHCOUNT_SEQNO = P.BIRTHCOUNT_SEQNO,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.PASSPORT_DATE = P.PASSPORT_DATE,
                 DM.PASSPORTEXP_DATE = P.PASSPORTEXP_DATE,
                 DM.PASSPORTISSUEBY = P.PASSPORTISSUEBY,
                 DM.CHILDNO = P.CHILDNO,
                 DM.ADDR = P.ADDR,
                 DM.ROAD = P.ROAD,
                 DM.TMB_SEQNO = P.TMB_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.VISANO = P.VISANO,
                 DM.TDT_SEQNO = P.TDT_SEQNO,
                 DM.VISAISSUE = P.VISAISSUE,
                 DM.VISA_DATE = P.VISA_DATE,
                 DM.OPERMIT_SEQNO = P.OPERMIT_SEQNO,
                 DM.ARRIVE_DATE = P.ARRIVE_DATE,
                 DM.OPERMIT_DATE = P.OPERMIT_DATE,
                 DM.DOCTYPE = P.DOCTYPE,
                 DM.PURPOSECOUNT_SEQNO = P.PURPOSECOUNT_SEQNO,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.LEAVE_DATE = P.LEAVE_DATE,
                 DM.RETURN_DATE = P.RETURN_DATE,
                 DM.PURPOSE = P.PURPOSE,
                 DM.APPVSTS = P.APPVSTS,
                 DM.DOC_DATE = P.DOC_DATE,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.PERMIT_STATUS = P.PERMIT_STATUS,
                 DM.NEWPERMIT_DATE = P.NEWPERMIT_DATE,
                 DM.REASON_SEQNO = P.REASON_SEQNO,
                 DM.REASONDESC = P.REASONDESC,
                 DM.TM6_SEQNO = P.TM6_SEQNO,
                 DM.ENDPERMIT_DATE = P.ENDPERMIT_DATE,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.VERSION = P.VERSION,
                 DM.OVISATYPE_SEQNO = P.OVISATYPE_SEQNO,
                 DM.TODAY_DATE = P.TODAY_DATE,
                 DM.IMGINOUT = P.IMGINOUT,
                 DM.TM6NO = P.TM6NO,
                 DM.APPVSTSBYDATE = P.APPVSTSBYDATE,
                 DM.APPVSTSBYDEPT_SEQNO = P.APPVSTSBYDEPT_SEQNO,
                 DM.FLAG_BOI = P.FLAG_BOI,
                 DM.IPADDRESS = P.IPADDRESS,
                 DM.UIPADDRESS = P.UIPADDRESS,
                 DM.T_IDICONCEPT = P.T_IDICONCEPT,
                 DM.ZONE_SEQNO = P.ZONE_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.EXTLIST_SEQNO = P.EXTLIST_SEQNO,
                 DM.MANUALTM8 = P.MANUALTM8,
                 DM.REPSPERSON_SEQNO = P.REPSPERSON_SEQNO,
                 DM.TELEPHONE = P.TELEPHONE,
                 DM.IMG_PERSON = P.IMG_PERSON,
                 DM.FLAG_QUEONLINE = P.FLAG_QUEONLINE,
                 DM.PD_SEQNO = P.PD_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.TM8_SEQNO,
                  DM.TM8NO,
                  DM.YEAR,
                  DM.FEES_SEQNO,
                  DM.WRITTEN,
                  DM.PERSONID,
                  DM.FAMILYNM,
                  DM.FIRSTNM,
                  DM.MIDDLENM,
                  DM.NATIONAL_SEQNO,
                  DM.BIRTH_DATE,
                  DM.SEX,
                  DM.AGE,
                  DM.OCC_SEQNO,
                  DM.BIRTH_PLACE,
                  DM.BIRTHCOUNT_SEQNO,
                  DM.PASSPORTNO,
                  DM.PASSPORT_DATE,
                  DM.PASSPORTEXP_DATE,
                  DM.PASSPORTISSUEBY,
                  DM.CHILDNO,
                  DM.ADDR,
                  DM.ROAD,
                  DM.TMB_SEQNO,
                  DM.AMP_SEQNO,
                  DM.PV_SEQNO,
                  DM.VISANO,
                  DM.TDT_SEQNO,
                  DM.VISAISSUE,
                  DM.VISA_DATE,
                  DM.OPERMIT_SEQNO,
                  DM.ARRIVE_DATE,
                  DM.OPERMIT_DATE,
                  DM.DOCTYPE,
                  DM.PURPOSECOUNT_SEQNO,
                  DM.CONV_SEQNO,
                  DM.LEAVE_DATE,
                  DM.RETURN_DATE,
                  DM.PURPOSE,
                  DM.APPVSTS,
                  DM.DOC_DATE,
                  DM.DEPT_SEQNO,
                  DM.PERMIT_STATUS,
                  DM.NEWPERMIT_DATE,
                  DM.REASON_SEQNO,
                  DM.REASONDESC,
                  DM.TM6_SEQNO,
                  DM.ENDPERMIT_DATE,
                  DM.CREATE_DATE,
                  DM.CREATE_BY,
                  DM.UPDATE_DATE,
                  DM.UPDATE_BY,
                  DM.VERSION,
                  DM.OVISATYPE_SEQNO,
                  DM.TODAY_DATE,
                  DM.IMGINOUT,
                  DM.TM6NO,
                  DM.APPVSTSBYDATE,
                  DM.APPVSTSBYDEPT_SEQNO,
                  DM.FLAG_BOI,
                  DM.IPADDRESS,
                  DM.UIPADDRESS,
                  DM.T_IDICONCEPT,
                  DM.ZONE_SEQNO,
                  DM.SUFFIX_SEQNO,
                  DM.EXTLIST_SEQNO,
                  DM.MANUALTM8,
                  DM.REPSPERSON_SEQNO,
                  DM.TELEPHONE,
                  DM.IMG_PERSON,
                  DM.FLAG_QUEONLINE,
                  DM.PD_SEQNO)
          VALUES (P.TM8_SEQNO,
                  P.TM8NO,
                  P.YEAR,
                  P.FEES_SEQNO,
                  P.WRITTEN,
                  P.PERSONID,
                  P.FAMILYNM,
                  P.FIRSTNM,
                  P.MIDDLENM,
                  P.NATIONAL_SEQNO,
                  P.BIRTH_DATE,
                  P.SEX,
                  P.AGE,
                  P.OCC_SEQNO,
                  P.BIRTH_PLACE,
                  P.BIRTHCOUNT_SEQNO,
                  P.PASSPORTNO,
                  P.PASSPORT_DATE,
                  P.PASSPORTEXP_DATE,
                  P.PASSPORTISSUEBY,
                  P.CHILDNO,
                  P.ADDR,
                  P.ROAD,
                  P.TMB_SEQNO,
                  P.AMP_SEQNO,
                  P.PV_SEQNO,
                  P.VISANO,
                  P.TDT_SEQNO,
                  P.VISAISSUE,
                  P.VISA_DATE,
                  P.OPERMIT_SEQNO,
                  P.ARRIVE_DATE,
                  P.OPERMIT_DATE,
                  P.DOCTYPE,
                  P.PURPOSECOUNT_SEQNO,
                  P.CONV_SEQNO,
                  P.LEAVE_DATE,
                  P.RETURN_DATE,
                  P.PURPOSE,
                  P.APPVSTS,
                  P.DOC_DATE,
                  P.DEPT_SEQNO,
                  P.PERMIT_STATUS,
                  P.NEWPERMIT_DATE,
                  P.REASON_SEQNO,
                  P.REASONDESC,
                  P.TM6_SEQNO,
                  P.ENDPERMIT_DATE,
                  P.CREATE_DATE,
                  P.CREATE_BY,
                  P.UPDATE_DATE,
                  P.UPDATE_BY,
                  P.VERSION,
                  P.OVISATYPE_SEQNO,
                  P.TODAY_DATE,
                  P.IMGINOUT,
                  P.TM6NO,
                  P.APPVSTSBYDATE,
                  P.APPVSTSBYDEPT_SEQNO,
                  P.FLAG_BOI,
                  P.IPADDRESS,
                  P.UIPADDRESS,
                  P.T_IDICONCEPT,
                  P.ZONE_SEQNO,
                  P.SUFFIX_SEQNO,
                  P.EXTLIST_SEQNO,
                  P.MANUALTM8,
                  P.REPSPERSON_SEQNO,
                  P.TELEPHONE,
                  P.IMG_PERSON,
                  P.FLAG_QUEONLINE,
                  P.PD_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('REPS_TM8_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('REPS_TM8_U_M',
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
END P_REPS_TM8_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_REPS_TM8_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_REPS_TM8_M" TO "BIOSAADM";
