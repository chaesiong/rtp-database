CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_PROCESSOT_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate    DATE;
   veddate    DATE;
BEGIN
   /* Create date : 12-12-2108 */
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE) + 1, 'yyyymmdd');

   vstdate := SYSDATE;

   MERGE INTO PIBICSDM2.PROCESSOT DM
        USING (SELECT *
                 FROM PIBICS.PROCESSOT@PIBICS_PROD
                WHERE     PROCESSDTE >= TO_DATE (v_dstart, 'yyyymmdd')
                      AND PROCESSDTE <= TO_DATE (v_dend, 'yyyymmdd')) P
           ON (DM.EXTOVS_SEQNO = P.EXTOVS_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.EXTPERSON_SEQNO = P.EXTPERSON_SEQNO,
                 DM.OPASSPORTNO = P.OPASSPORTNO,
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
                 DM.STATUSEXT = P.STATUSEXT,
                 DM.STATUSEXTDTE = P.STATUSEXTDTE,
                 DM.RQS_STS = P.RQS_STS,
                 DM.VISATYPESUB_SEQNO = P.VISATYPESUB_SEQNO,
                 DM.SUFFIX_SEQNO = P.SUFFIX_SEQNO,
                 DM.EXTFLAG = P.EXTFLAG,
                 DM.CHNGPERSON_SEQNO = P.CHNGPERSON_SEQNO,
                 DM.CHNGPERMITDTE = P.CHNGPERMITDTE,
                 DM.CHNGFLAG = P.CHNGFLAG,
                 DM.RQSPERSON_SEQNO = P.RQSPERSON_SEQNO,
                 DM.RQSPERMITDTE = P.RQSPERMITDTE,
                 DM.RQSFLAG = P.RQSFLAG,
                 DM.EXTOVS_DATE = P.EXTOVS_DATE,
                 DM.PROCESSDTE = P.PROCESSDTE,
                 DM.REMARK = P.REMARK,
                 DM.UDEPT_ORG = P.UDEPT_ORG,
                 DM.YEAROFDOB = P.YEAROFDOB,
                 DM.SEXDESC = P.SEXDESC,
                 DM.DEPTLEVEL1 = P.DEPTLEVEL1,
                 DM.DEPTLEVEL2 = P.DEPTLEVEL2
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.EXTOVS_SEQNO,
                  DM.EXTPERSON_SEQNO,
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
                  DM.STATUSEXT,
                  DM.STATUSEXTDTE,
                  DM.RQS_STS,
                  DM.VISATYPESUB_SEQNO,
                  DM.SUFFIX_SEQNO,
                  DM.EXTFLAG,
                  DM.CHNGPERSON_SEQNO,
                  DM.CHNGPERMITDTE,
                  DM.CHNGFLAG,
                  DM.RQSPERSON_SEQNO,
                  DM.RQSPERMITDTE,
                  DM.RQSFLAG,
                  DM.EXTOVS_DATE,
                  DM.PROCESSDTE,
                  DM.REMARK,
                  DM.UDEPT_ORG,
                  DM.YEAROFDOB,
                  DM.SEXDESC,
                  DM.DEPTLEVEL1,
                  DM.DEPTLEVEL2)
          VALUES (P.EXTOVS_SEQNO,
                  P.EXTPERSON_SEQNO,
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
                  P.STATUSEXT,
                  P.STATUSEXTDTE,
                  P.RQS_STS,
                  P.VISATYPESUB_SEQNO,
                  P.SUFFIX_SEQNO,
                  P.EXTFLAG,
                  P.CHNGPERSON_SEQNO,
                  P.CHNGPERMITDTE,
                  P.CHNGFLAG,
                  P.RQSPERSON_SEQNO,
                  P.RQSPERMITDTE,
                  P.RQSFLAG,
                  P.EXTOVS_DATE,
                  P.PROCESSDTE,
                  P.REMARK,
                  P.UDEPT_ORG,
                  P.YEAROFDOB,
                  P.SEXDESC,
                  P.DEPTLEVEL1,
                  P.DEPTLEVEL2);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('PROCESSOT_U_M', var_rows, SYSDATE);

   veddate := SYSDATE;

   INSERT INTO IMPORT_LOG_DETAIL
        VALUES ('PROCESSOT_U_M',
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
END P_PROCESSOT_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_PROCESSOT_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_PROCESSOT_M" TO "BIOSAADM";
