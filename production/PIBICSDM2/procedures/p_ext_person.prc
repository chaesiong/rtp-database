CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_EXT_PERSON" 
IS
   v_dstart   VARCHAR2 (15);
   v_dend     VARCHAR2 (15);
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /*  Create date : 27-01-2018 */
   --No.5
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');
   v_dstart := TO_CHAR (SYSDATE-1/24, 'yyyymmddhh24mi');
   v_dend := TO_CHAR (SYSDATE, 'yyyymmddhh24mi');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.EXT_PERSON DM
        USING (SELECT *
                 FROM PIBICS.EXT_PERSON@PIBICS_PROD
                WHERE     --CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      --AND CREATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      CREATE_DATE >= TO_DATE (v_dstart, 'yyyymmddhh24mi')
                      AND CREATE_DATE <= TO_DATE (v_dend, 'yyyymmddhh24mi')
                      AND UPDATE_DATE IS NULL) P
           ON (DM.EXTPERSON_SEQNO = P.EXTPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.OPASSPORTNO = P.OPASSPORTNO,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.EXT_DATE = P.EXT_DATE,
                 DM.DOCNO = P.DOCNO,
                 DM.TM6NO = P.TM6NO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.OPASSPORT_PLACE = P.OPASSPORT_PLACE,
                 DM.OPASSPORT_DATE = P.OPASSPORT_DATE,
                 DM.OPASSPORT_EXPDATE = P.OPASSPORT_EXPDATE,
                 DM.CPASSPORT_PLACE = P.CPASSPORT_PLACE,
                 DM.CPASSPORT_EXPDATE = P.CPASSPORT_EXPDATE,
                 DM.CPASSPORT_DATE = P.CPASSPORT_DATE,
                 DM.IN_DATE = P.IN_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.CONVREGNO = P.CONVREGNO,
                 DM.FROMCOUNT = P.FROMCOUNT,
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
                 DM.REASON_SEQNO = P.REASON_SEQNO,
                 DM.REASON_DAY = P.REASON_DAY,
                 DM.APPROVE_STS = P.APPROVE_STS,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.PERSON_STS = P.PERSON_STS,
                 DM.EXT_SEQNO = P.EXT_SEQNO,
                 DM.FEESLIP_SEQNO = P.FEESLIP_SEQNO,
                 DM.SEQNO = P.SEQNO,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.PASSPORT_PIC = P.PASSPORT_PIC,
                 DM.STATUSEXT = P.STATUSEXT,
                 DM.STATUSEXTDTE = P.STATUSEXTDTE,
                 DM.RQS_STS = P.RQS_STS,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EXTPERSON_SEQNO,
                  DM.OPASSPORTNO,
                  DM.CPASSPORTNO,
                  DM.EXT_DATE,
                  DM.DOCNO,
                  DM.TM6NO,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.EFAMILYNM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.BIRTH_PLACE,
                  DM.NATION_SEQNO,
                  DM.OPASSPORT_PLACE,
                  DM.OPASSPORT_DATE,
                  DM.OPASSPORT_EXPDATE,
                  DM.CPASSPORT_PLACE,
                  DM.CPASSPORT_EXPDATE,
                  DM.CPASSPORT_DATE,
                  DM.IN_DATE,
                  DM.CONV_SEQNO,
                  DM.CONVREGNO,
                  DM.FROMCOUNT,
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
                  DM.REASON_SEQNO,
                  DM.REASON_DAY,
                  DM.APPROVE_STS,
                  DM.PERMIT_DATE,
                  DM.PERSON_STS,
                  DM.EXT_SEQNO,
                  DM.FEESLIP_SEQNO,
                  DM.SEQNO,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.UDEPT_SEQNO,
                  DM.PASSPORT_PIC,
                  DM.STATUSEXT,
                  DM.STATUSEXTDTE,
                  DM.RQS_STS,
                  DM.VISATYPESUB_SEQNO,
                  DM.SUFFIX_SEQNO)
          VALUES (P.EXTPERSON_SEQNO,
                  P.OPASSPORTNO,
                  P.CPASSPORTNO,
                  P.EXT_DATE,
                  P.DOCNO,
                  P.TM6NO,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.EFAMILYNM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.BIRTH_PLACE,
                  P.NATION_SEQNO,
                  P.OPASSPORT_PLACE,
                  P.OPASSPORT_DATE,
                  P.OPASSPORT_EXPDATE,
                  P.CPASSPORT_PLACE,
                  P.CPASSPORT_EXPDATE,
                  P.CPASSPORT_DATE,
                  P.IN_DATE,
                  P.CONV_SEQNO,
                  P.CONVREGNO,
                  P.FROMCOUNT,
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
                  P.REASON_SEQNO,
                  P.REASON_DAY,
                  P.APPROVE_STS,
                  P.PERMIT_DATE,
                  P.PERSON_STS,
                  P.EXT_SEQNO,
                  P.FEESLIP_SEQNO,
                  P.SEQNO,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.UDEPT_SEQNO,
                  P.PASSPORT_PIC,
                  P.STATUSEXT,
                  P.STATUSEXTDTE,
                  P.RQS_STS,
                  P.VISATYPESUB_SEQNO,
                  P.SUFFIX_SEQNO);


   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EXT_PERSON_C', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EXT_PERSON_C',
                var_rows,
                SYSDATE,
                v_dstart,
                v_dend,
                vstdate,
                veddate);

   COMMIT;

   vstdate := SYSDATE;


   MERGE INTO PIBICSDM2.EXT_PERSON DM
        USING (SELECT *
                 FROM PIBICS.EXT_PERSON@PIBICS_PROD
                WHERE     
                        --UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmdd')
                      --AND UPDATE_DATE < TO_DATE (v_dend, 'yyyymmdd')
                      UPDATE_DATE >= TO_DATE (v_dstart, 'yyyymmddhh24mi')
                      AND UPDATE_DATE <= TO_DATE (v_dend, 'yyyymmddhh24mi')
                      ) P
           ON (DM.EXTPERSON_SEQNO = P.EXTPERSON_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.OPASSPORTNO = P.OPASSPORTNO,
                 DM.CPASSPORTNO = P.CPASSPORTNO,
                 DM.EXT_DATE = P.EXT_DATE,
                 DM.DOCNO = P.DOCNO,
                 DM.TM6NO = P.TM6NO,
                 DM.EFIRSTNM = P.EFIRSTNM,
                 DM.EMIDDLENM = P.EMIDDLENM,
                 DM.EFAMILYNM = P.EFAMILYNM,
                 DM.SEX = P.SEX,
                 DM.BIRTH_DATE = P.BIRTH_DATE,
                 DM.BIRTH_PLACE = P.BIRTH_PLACE,
                 DM.NATION_SEQNO = P.NATION_SEQNO,
                 DM.OPASSPORT_PLACE = P.OPASSPORT_PLACE,
                 DM.OPASSPORT_DATE = P.OPASSPORT_DATE,
                 DM.OPASSPORT_EXPDATE = P.OPASSPORT_EXPDATE,
                 DM.CPASSPORT_PLACE = P.CPASSPORT_PLACE,
                 DM.CPASSPORT_EXPDATE = P.CPASSPORT_EXPDATE,
                 DM.CPASSPORT_DATE = P.CPASSPORT_DATE,
                 DM.IN_DATE = P.IN_DATE,
                 DM.CONV_SEQNO = P.CONV_SEQNO,
                 DM.CONVREGNO = P.CONVREGNO,
                 DM.FROMCOUNT = P.FROMCOUNT,
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
                 DM.REASON_SEQNO = P.REASON_SEQNO,
                 DM.REASON_DAY = P.REASON_DAY,
                 DM.APPROVE_STS = P.APPROVE_STS,
                 DM.PERMIT_DATE = P.PERMIT_DATE,
                 DM.PERSON_STS = P.PERSON_STS,
                 DM.EXT_SEQNO = P.EXT_SEQNO,
                 DM.FEESLIP_SEQNO = P.FEESLIP_SEQNO,
                 DM.SEQNO = P.SEQNO,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.UDEPT_SEQNO = P.UDEPT_SEQNO,
                 DM.PASSPORT_PIC = P.PASSPORT_PIC,
                 DM.STATUSEXT = P.STATUSEXT,
                 DM.STATUSEXTDTE = P.STATUSEXTDTE,
                 DM.RQS_STS = P.RQS_STS,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EXTPERSON_SEQNO,
                  DM.OPASSPORTNO,
                  DM.CPASSPORTNO,
                  DM.EXT_DATE,
                  DM.DOCNO,
                  DM.TM6NO,
                  DM.EFIRSTNM,
                  DM.EMIDDLENM,
                  DM.EFAMILYNM,
                  DM.SEX,
                  DM.BIRTH_DATE,
                  DM.BIRTH_PLACE,
                  DM.NATION_SEQNO,
                  DM.OPASSPORT_PLACE,
                  DM.OPASSPORT_DATE,
                  DM.OPASSPORT_EXPDATE,
                  DM.CPASSPORT_PLACE,
                  DM.CPASSPORT_EXPDATE,
                  DM.CPASSPORT_DATE,
                  DM.IN_DATE,
                  DM.CONV_SEQNO,
                  DM.CONVREGNO,
                  DM.FROMCOUNT,
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
                  DM.REASON_SEQNO,
                  DM.REASON_DAY,
                  DM.APPROVE_STS,
                  DM.PERMIT_DATE,
                  DM.PERSON_STS,
                  DM.EXT_SEQNO,
                  DM.FEESLIP_SEQNO,
                  DM.SEQNO,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.UDEPT_SEQNO,
                  DM.PASSPORT_PIC,
                  DM.STATUSEXT,
                  DM.STATUSEXTDTE,
                  DM.RQS_STS,
                  DM.VISATYPESUB_SEQNO,
                  DM.SUFFIX_SEQNO)
          VALUES (P.EXTPERSON_SEQNO,
                  P.OPASSPORTNO,
                  P.CPASSPORTNO,
                  P.EXT_DATE,
                  P.DOCNO,
                  P.TM6NO,
                  P.EFIRSTNM,
                  P.EMIDDLENM,
                  P.EFAMILYNM,
                  P.SEX,
                  P.BIRTH_DATE,
                  P.BIRTH_PLACE,
                  P.NATION_SEQNO,
                  P.OPASSPORT_PLACE,
                  P.OPASSPORT_DATE,
                  P.OPASSPORT_EXPDATE,
                  P.CPASSPORT_PLACE,
                  P.CPASSPORT_EXPDATE,
                  P.CPASSPORT_DATE,
                  P.IN_DATE,
                  P.CONV_SEQNO,
                  P.CONVREGNO,
                  P.FROMCOUNT,
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
                  P.REASON_SEQNO,
                  P.REASON_DAY,
                  P.APPROVE_STS,
                  P.PERMIT_DATE,
                  P.PERSON_STS,
                  P.EXT_SEQNO,
                  P.FEESLIP_SEQNO,
                  P.SEQNO,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.UDEPT_SEQNO,
                  P.PASSPORT_PIC,
                  P.STATUSEXT,
                  P.STATUSEXTDTE,
                  P.RQS_STS,
                  P.VISATYPESUB_SEQNO,
                  P.SUFFIX_SEQNO);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EXT_PERSON_U', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('EXT_PERSON_U',
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
END P_EXT_PERSON;
/
