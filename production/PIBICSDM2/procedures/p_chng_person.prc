CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CHNG_PERSON" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.10
   v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.CHNG_PERSON DM
        USING (SELECT *
                 FROM PIBICS.CHNG_PERSON@PIBICS_PROD
                WHERE     CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.CHNGPERSON_SEQNO = P.CHNGPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.PASSPORTNO = P.PASSPORTNO,
                 DM.BIRTHDATE = P.BIRTHDATE,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.SEX = P.SEX,
                 DM.CHANGEVISA_DATE = P.CHANGEVISA_DATE,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISATEYPSUB_SEQNO = P.VISATEYPSUB_SEQNO,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.IN_DATE = P.IN_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.VISA_EXPDATE = P.VISA_EXPDATE,
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
                 DM.PASSPORT_EXPDATE = P.PASSPORT_EXPDATE,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.STATUSCHNG = P.STATUSCHNG,
                 DM.STATUSCHNGDTE = P.STATUSCHNGDTE,
                 DM.STATUS = P.STATUS,
                 DM.CHANGEVISALIST_SEQNO = P.CHANGEVISALIST_SEQNO,
                 DM.FLAGUPDATE = P.FLAGUPDATE
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CHNGPERSON_SEQNO,
                  DM.PASSPORTNO,
                  DM.BIRTHDATE,
                  DM.EFIRSTNM,
                  DM.EFAMILYNM,
                  DM.EMIDDLENM,
                  DM.SEX,
                  DM.CHANGEVISA_DATE,
                  DM.VISATYPE_SEQNO,
                  DM.VISATEYPSUB_SEQNO,
                  DM.NATION_SEQNO,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.ACTFLAG,
                  DM.IN_DATE,
                  DM.CONV_SEQNO,
                  DM.VISA_EXPDATE,
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
                  DM.PASSPORT_EXPDATE,
                  DM.UDEPT_SEQNO,
                  DM.STATUSCHNG,
                  DM.STATUSCHNGDTE,
                  DM.STATUS,
                  DM.CHANGEVISALIST_SEQNO,
                  DM.FLAGUPDATE)
          VALUES (P.CHNGPERSON_SEQNO,
                  P.PASSPORTNO,
                  P.BIRTHDATE,
                  P.EFIRSTNM,
                  P.EFAMILYNM,
                  P.EMIDDLENM,
                  P.SEX,
                  P.CHANGEVISA_DATE,
                  P.VISATYPE_SEQNO,
                  P.VISATEYPSUB_SEQNO,
                  P.NATION_SEQNO,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.ACTFLAG,
                  P.IN_DATE,
                  P.CONV_SEQNO,
                  P.VISA_EXPDATE,
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
                  P.PASSPORT_EXPDATE,
                  P.UDEPT_SEQNO,
                  P.STATUSCHNG,
                  P.STATUSCHNGDTE,
                  P.STATUS,
                  P.CHANGEVISALIST_SEQNO,
                  P.FLAGUPDATE);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CHNG_PERSON_C', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CHNG_PERSON_C',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.CHNG_PERSON DM
        USING (SELECT *
                 FROM PIBICS.CHNG_PERSON@PIBICS_PROD
                WHERE     UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.CHNGPERSON_SEQNO = P.CHNGPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.PASSPORTNO = P.PASSPORTNO,
                 DM.BIRTHDATE = P.BIRTHDATE,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.SEX = P.SEX,
                 DM.CHANGEVISA_DATE = P.CHANGEVISA_DATE,
                 DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                 DM.VISATEYPSUB_SEQNO = P.VISATEYPSUB_SEQNO,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.IN_DATE = P.IN_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.VISA_EXPDATE = P.VISA_EXPDATE,
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
                 DM.PASSPORT_EXPDATE = P.PASSPORT_EXPDATE,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.STATUSCHNG = P.STATUSCHNG,
                 DM.STATUSCHNGDTE = P.STATUSCHNGDTE,
                 DM.STATUS = P.STATUS,
                 DM.CHANGEVISALIST_SEQNO = P.CHANGEVISALIST_SEQNO,
                 DM.FLAGUPDATE = P.FLAGUPDATE
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CHNGPERSON_SEQNO,
                  DM.PASSPORTNO,
                  DM.BIRTHDATE,
                  DM.EFIRSTNM,
                  DM.EFAMILYNM,
                  DM.EMIDDLENM,
                  DM.SEX,
                  DM.CHANGEVISA_DATE,
                  DM.VISATYPE_SEQNO,
                  DM.VISATEYPSUB_SEQNO,
                  DM.NATION_SEQNO,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.ACTFLAG,
                  DM.IN_DATE,
                  DM.CONV_SEQNO,
                  DM.VISA_EXPDATE,
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
                  DM.PASSPORT_EXPDATE,
                  DM.UDEPT_SEQNO,
                  DM.STATUSCHNG,
                  DM.STATUSCHNGDTE,
                  DM.STATUS,
                  DM.CHANGEVISALIST_SEQNO,
                  DM.FLAGUPDATE)
          VALUES (P.CHNGPERSON_SEQNO,
                  P.PASSPORTNO,
                  P.BIRTHDATE,
                  P.EFIRSTNM,
                  P.EFAMILYNM,
                  P.EMIDDLENM,
                  P.SEX,
                  P.CHANGEVISA_DATE,
                  P.VISATYPE_SEQNO,
                  P.VISATEYPSUB_SEQNO,
                  P.NATION_SEQNO,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.ACTFLAG,
                  P.IN_DATE,
                  P.CONV_SEQNO,
                  P.VISA_EXPDATE,
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
                  P.PASSPORT_EXPDATE,
                  P.UDEPT_SEQNO,
                  P.STATUSCHNG,
                  P.STATUSCHNGDTE,
                  P.STATUS,
                  P.CHANGEVISALIST_SEQNO,
                  P.FLAGUPDATE);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CHNG_PERSON_U', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('CHNG_PERSON_U',
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
END P_CHNG_PERSON;
/
