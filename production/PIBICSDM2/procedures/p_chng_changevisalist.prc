CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CHNG_CHANGEVISALIST" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.12
   v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.CHNG_CHANGEVISALIST DM
        USING (SELECT *
                 FROM PIBICS.CHNG_CHANGEVISALIST@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.CHANGEVISALIST_SEQNO = P.CHANGEVISALIST_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.CHANGEVISA_SEQNO = P.CHANGEVISA_SEQNO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.BIRTHDATE = P.BIRTHDATE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.SEX = P.SEX,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.CHNGPERSON_SEQNO = P.CHNGPERSON_SEQNO,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.FINES_SEQNO = P.FINES_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.CHANGEVISA_DOCNO = P.CHANGEVISA_DOCNO,
                 DM.PASSPORT_EXPDATE = P.PASSPORT_EXPDATE,
                 DM.IN_DATE = P.IN_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.VISA_EXPDATE = P.VISA_EXPDATE,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.CONVREGNO = P.CONVREGNO,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.BUILDING = P.BUILDING,
                 DM.ADDR = P.ADDR,
                 DM.ROAD = P.ROAD,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.TMB_SEQNO = P.TMB_SEQNO,
                 DM.POSTCODE = P.POSTCODE,
                 DM.TEL = P.TEL,
                 DM.NOTE = P.NOTE,
                 DM.FINES_STS = P.FINES_STS,
                 DM.FEES_STS = P.FEES_STS,
                 DM.TM6NO = P.TM6NO,
                 DM.IMG_PERSON = P.IMG_PERSON
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CHANGEVISALIST_SEQNO,
                  DM.CHANGEVISA_SEQNO,
                  DM.EFIRSTNM,
                  DM.EFAMILYNM,
                  DM.EMIDDLENM,
                  DM.BIRTHDATE,
                  DM.NATION_SEQNO,
                  DM.PASSPORTNO,
                  DM.SEX,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.CHNGPERSON_SEQNO,
                  DM.UDEPT_SEQNO,
                  DM.ACTFLAG,
                  DM.FEES_SEQNO,
                  DM.FINES_SEQNO,
                  DM.SUFFIX_SEQNO,
                  DM.CHANGEVISA_DOCNO,
                  DM.PASSPORT_EXPDATE,
                  DM.IN_DATE,
                  DM.CONV_SEQNO,
                  DM.VISA_EXPDATE,
                  DM.VISATYPE_SEQNO,
                  DM.VISATYPESUB_SEQNO,
                  DM.CONVREGNO,
                  DM.DEPT_SEQNO,
                  DM.BUILDING,
                  DM.ADDR,
                  DM.ROAD,
                  DM.PV_SEQNO,
                  DM.AMP_SEQNO,
                  DM.TMB_SEQNO,
                  DM.POSTCODE,
                  DM.TEL,
                  DM.NOTE,
                  DM.FINES_STS,
                  DM.FEES_STS,
                  DM.TM6NO,
                  DM.IMG_PERSON)
          VALUES (P.CHANGEVISALIST_SEQNO,
                  P.CHANGEVISA_SEQNO,
                  P.EFIRSTNM,
                  P.EFAMILYNM,
                  P.EMIDDLENM,
                  P.BIRTHDATE,
                  P.NATION_SEQNO,
                  P.PASSPORTNO,
                  P.SEX,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.CHNGPERSON_SEQNO,
                  P.UDEPT_SEQNO,
                  P.ACTFLAG,
                  P.FEES_SEQNO,
                  P.FINES_SEQNO,
                  P.SUFFIX_SEQNO,
                  P.CHANGEVISA_DOCNO,
                  P.PASSPORT_EXPDATE,
                  P.IN_DATE,
                  P.CONV_SEQNO,
                  P.VISA_EXPDATE,
                  P.VISATYPE_SEQNO,
                  P.VISATYPESUB_SEQNO,
                  P.CONVREGNO,
                  P.DEPT_SEQNO,
                  P.BUILDING,
                  P.ADDR,
                  P.ROAD,
                  P.PV_SEQNO,
                  P.AMP_SEQNO,
                  P.TMB_SEQNO,
                  P.POSTCODE,
                  P.TEL,
                  P.NOTE,
                  P.FINES_STS,
                  P.FEES_STS,
                  P.TM6NO,
                  P.IMG_PERSON);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CHNG_CHANGEVISALIST_C', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CHNG_CHANGEVISALIST_C',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.CHNG_CHANGEVISALIST DM
        USING (SELECT *
                 FROM PIBICS.CHNG_CHANGEVISALIST@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.CHANGEVISALIST_SEQNO = P.CHANGEVISALIST_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.CHANGEVISA_SEQNO = P.CHANGEVISA_SEQNO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.BIRTHDATE = P.BIRTHDATE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.PASSPORTNO = P.PASSPORTNO,
                 DM.SEX = P.SEX,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.CHNGPERSON_SEQNO = P.CHNGPERSON_SEQNO,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.FEES_SEQNO = P.FEES_SEQNO,
                 DM.FINES_SEQNO = P.FINES_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.CHANGEVISA_DOCNO = P.CHANGEVISA_DOCNO,
                 DM.PASSPORT_EXPDATE = P.PASSPORT_EXPDATE,
                 DM.IN_DATE = P.IN_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.VISA_EXPDATE = P.VISA_EXPDATE,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.CONVREGNO = P.CONVREGNO,
                 DM.DEPT_SEQNO = P.DEPT_SEQNO,
                 DM.BUILDING = P.BUILDING,
                 DM.ADDR = P.ADDR,
                 DM.ROAD = P.ROAD,
                 DM.PV_SEQNO = P.PV_SEQNO,
                 DM.AMP_SEQNO = P.AMP_SEQNO,
                 DM.TMB_SEQNO = P.TMB_SEQNO,
                 DM.POSTCODE = P.POSTCODE,
                 DM.TEL = P.TEL,
                 DM.NOTE = P.NOTE,
                 DM.FINES_STS = P.FINES_STS,
                 DM.FEES_STS = P.FEES_STS,
                 DM.TM6NO = P.TM6NO,
                 DM.IMG_PERSON = P.IMG_PERSON
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CHANGEVISALIST_SEQNO,
                  DM.CHANGEVISA_SEQNO,
                  DM.EFIRSTNM,
                  DM.EFAMILYNM,
                  DM.EMIDDLENM,
                  DM.BIRTHDATE,
                  DM.NATION_SEQNO,
                  DM.PASSPORTNO,
                  DM.SEX,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.CHNGPERSON_SEQNO,
                  DM.UDEPT_SEQNO,
                  DM.ACTFLAG,
                  DM.FEES_SEQNO,
                  DM.FINES_SEQNO,
                  DM.SUFFIX_SEQNO,
                  DM.CHANGEVISA_DOCNO,
                  DM.PASSPORT_EXPDATE,
                  DM.IN_DATE,
                  DM.CONV_SEQNO,
                  DM.VISA_EXPDATE,
                  DM.VISATYPE_SEQNO,
                  DM.VISATYPESUB_SEQNO,
                  DM.CONVREGNO,
                  DM.DEPT_SEQNO,
                  DM.BUILDING,
                  DM.ADDR,
                  DM.ROAD,
                  DM.PV_SEQNO,
                  DM.AMP_SEQNO,
                  DM.TMB_SEQNO,
                  DM.POSTCODE,
                  DM.TEL,
                  DM.NOTE,
                  DM.FINES_STS,
                  DM.FEES_STS,
                  DM.TM6NO,
                  DM.IMG_PERSON)
          VALUES (P.CHANGEVISALIST_SEQNO,
                  P.CHANGEVISA_SEQNO,
                  P.EFIRSTNM,
                  P.EFAMILYNM,
                  P.EMIDDLENM,
                  P.BIRTHDATE,
                  P.NATION_SEQNO,
                  P.PASSPORTNO,
                  P.SEX,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.CHNGPERSON_SEQNO,
                  P.UDEPT_SEQNO,
                  P.ACTFLAG,
                  P.FEES_SEQNO,
                  P.FINES_SEQNO,
                  P.SUFFIX_SEQNO,
                  P.CHANGEVISA_DOCNO,
                  P.PASSPORT_EXPDATE,
                  P.IN_DATE,
                  P.CONV_SEQNO,
                  P.VISA_EXPDATE,
                  P.VISATYPE_SEQNO,
                  P.VISATYPESUB_SEQNO,
                  P.CONVREGNO,
                  P.DEPT_SEQNO,
                  P.BUILDING,
                  P.ADDR,
                  P.ROAD,
                  P.PV_SEQNO,
                  P.AMP_SEQNO,
                  P.TMB_SEQNO,
                  P.POSTCODE,
                  P.TEL,
                  P.NOTE,
                  P.FINES_STS,
                  P.FEES_STS,
                  P.TM6NO,
                  P.IMG_PERSON);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CHNG_CHANGEVISALIST_U', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CHNG_CHANGEVISALIST_U',
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
END P_CHNG_CHANGEVISALIST;
/
