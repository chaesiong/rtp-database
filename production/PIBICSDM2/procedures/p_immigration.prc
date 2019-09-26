CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_IMMIGRATION" 
IS
 v_dstart VARCHAR2 (15);
 v_dend VARCHAR2 (15);
 var_rows NUMBER;
 vstdate DATE;
 veddate DATE;

BEGIN
 /* Create date : 31-7-2109 */
 v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
 v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.IMMIGRATION DM
  USING (SELECT PERSONID,TM6NO,INOUTDTE,CARDTYPE,TFIRSTNM,TMIDDLENM,TFAMILYNM,EFIRSTNM,EMIDDLENM,EFAMILYNM
  ,SEX,BIRTHDTE,NATIONCD,TDTCD,TDTNO,VISATYPECDORG,VISAEXPDTE,PASSPORTDTE,PASSPORTISU,PASSPORTEXPDTE
  ,UPDUSR,UPDDTE,UPDTERM,REMARK,RESCERTNO,DEPTCD,FLAGPASS,STATUS,TM5_SEQNO,TM2INOUT_SEQNO
  ,PM_RE_ENTRY,PM_REEXPDTE,PM_EXTENSION,PM_EXEXPDTE,PM_NON_QUOTA,PM_NONEXPDTE,NEWPERMIT,PERMITCD,CONVCD,CONVREGNO
  ,SEQNO,CREATE_BY,CREATE_DATE,UPDATE_BY,UPDATE_DATE,VERSION,RPJSEQNO,CONV_SEQNO,VISATYPE_SEQNO,DEPT_SEQNO
  ,COUNT_SEQNO,PERMIT_SEQNO,CITIZENID,PASS_SEQNO,FLIGHTPREFIX,FLIGHTNUMBER,DEPTCDORG,VISATYPECD,RESCERTTYPE,RESPVCD
  ,RESNOYEAR,PV_SEQNO,PD_SEQNO,ZONE_SEQNO,SHIFT_SEQNO,FLAGDUPPERSON 
     FROM PIBICS.IMMIGRATION@PIBICS_PROD
     WHERE (CREATE_DATE >= TO_DATE(v_dstart,'yyyymmddhh24mi')
      AND CREATE_DATE < TO_DATE(v_dend,'yyyymmddhh24mi'))
      OR 
      (UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmddhh24mi')
      AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmddhh24mi')
      AND CREATE_DATE IS NULL)
      --AND UPDATE_DATE IS NULL
      --WHERE INOUTDTE >= TO_DATE(v_dstart,'yyyymmddhh24mi') AND INOUTDTE < TO_DATE(v_dend,'yyyymmddhh24mi')
      ) P
  ON (DM.PERSONID = P.PERSONID)
 /*WHEN MATCHED 
 THEN 
  UPDATE SET      DM.TM6NO = P.TM6NO,
     DM.INOUTDTE = P.INOUTDTE,
     DM.CARDTYPE = P.CARDTYPE,
     DM.TFIRSTNM = P.TFIRSTNM,
     DM.TMIDDLENM = P.TMIDDLENM,
     DM.TFAMILYNM = P.TFAMILYNM,
     DM.EFIRSTNM = P.EFIRSTNM,
     DM.EMIDDLENM = P.EMIDDLENM,
     DM.EFAMILYNM = P.EFAMILYNM,
     DM.SEX = P.SEX,
     DM.BIRTHDTE = P.BIRTHDTE,
     DM.NATIONCD = P.NATIONCD,
     DM.TDTCD = P.TDTCD,
     DM.TDTNO = P.TDTNO,
     DM.VISATYPECDORG = P.VISATYPECDORG,
     DM.VISAEXPDTE = P.VISAEXPDTE,
     DM.PASSPORTDTE = P.PASSPORTDTE,
     DM.PASSPORTISU = P.PASSPORTISU,
     DM.PASSPORTEXPDTE = P.PASSPORTEXPDTE,
     DM.UPDUSR = P.UPDUSR,
     DM.UPDDTE = P.UPDDTE,
     DM.UPDTERM = P.UPDTERM,
     DM.REMARK = P.REMARK,
     DM.RESCERTNO = P.RESCERTNO,
     DM.DEPTCD = P.DEPTCD,
     DM.FLAGPASS = P.FLAGPASS,
     DM.STATUS = P.STATUS,
     DM.TM5_SEQNO = P.TM5_SEQNO,
     DM.TM2INOUT_SEQNO = P.TM2INOUT_SEQNO,
     DM.PM_RE_ENTRY = P.PM_RE_ENTRY,
     DM.PM_REEXPDTE = P.PM_REEXPDTE,
     DM.PM_EXTENSION = P.PM_EXTENSION,
     DM.PM_EXEXPDTE = P.PM_EXEXPDTE,
     DM.PM_NON_QUOTA = P.PM_NON_QUOTA,
     DM.PM_NONEXPDTE = P.PM_NONEXPDTE,
     DM.NEWPERMIT = P.NEWPERMIT,
     DM.PERMITCD = P.PERMITCD,
     DM.CONVCD = P.CONVCD,
     DM.CONVREGNO = P.CONVREGNO,
     DM.SEQNO = P.SEQNO,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION,
     DM.RPJSEQNO = P.RPJSEQNO,
     DM.CONV_SEQNO = P.CONV_SEQNO,
     DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
     DM.DEPT_SEQNO = P.DEPT_SEQNO,
     DM.COUNT_SEQNO = P.COUNT_SEQNO,
     DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
     DM.CITIZENID = P.CITIZENID,
     DM.PASS_SEQNO = P.PASS_SEQNO,
     DM.FLIGHTPREFIX = P.FLIGHTPREFIX,
     DM.FLIGHTNUMBER = P.FLIGHTNUMBER,
     DM.DEPTCDORG = P.DEPTCDORG,
     DM.VISATYPECD = P.VISATYPECD,
     DM.RESCERTTYPE = P.RESCERTTYPE,
     DM.RESPVCD = P.RESPVCD,
     DM.RESNOYEAR = P.RESNOYEAR,
     DM.PV_SEQNO = P.PV_SEQNO,
     DM.PD_SEQNO = P.PD_SEQNO,
     DM.ZONE_SEQNO = P.ZONE_SEQNO,
     DM.SHIFT_SEQNO = P.SHIFT_SEQNO,
     DM.FLAGDUPPERSON = P.FLAGDUPPERSON
*/
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.PERSONID,
     DM.TM6NO,
     DM.INOUTDTE,
     DM.CARDTYPE,
     DM.TFIRSTNM,
     DM.TMIDDLENM,
     DM.TFAMILYNM,
     DM.EFIRSTNM,
     DM.EMIDDLENM,
     DM.EFAMILYNM,
     DM.SEX,
     DM.BIRTHDTE,
     DM.NATIONCD,
     DM.TDTCD,
     DM.TDTNO,
     DM.VISATYPECDORG,
     DM.VISAEXPDTE,
     DM.PASSPORTDTE,
     DM.PASSPORTISU,
     DM.PASSPORTEXPDTE,
     DM.UPDUSR,
     DM.UPDDTE,
     DM.UPDTERM,
     DM.REMARK,
     DM.RESCERTNO,
     DM.DEPTCD,
     DM.FLAGPASS,
     DM.STATUS,
     DM.TM5_SEQNO,
     DM.TM2INOUT_SEQNO,
     DM.PM_RE_ENTRY,
     DM.PM_REEXPDTE,
     DM.PM_EXTENSION,
     DM.PM_EXEXPDTE,
     DM.PM_NON_QUOTA,
     DM.PM_NONEXPDTE,
     DM.NEWPERMIT,
     DM.PERMITCD,
     DM.CONVCD,
     DM.CONVREGNO,
     DM.SEQNO,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION,
     DM.RPJSEQNO,
     DM.CONV_SEQNO,
     DM.VISATYPE_SEQNO,
     DM.DEPT_SEQNO,
     DM.COUNT_SEQNO,
     DM.PERMIT_SEQNO,
     DM.CITIZENID,
     DM.PASS_SEQNO,
     DM.FLIGHTPREFIX,
     DM.FLIGHTNUMBER,
     DM.DEPTCDORG,
     DM.VISATYPECD,
     DM.RESCERTTYPE,
     DM.RESPVCD,
     DM.RESNOYEAR,
     DM.PV_SEQNO,
     DM.PD_SEQNO,
     DM.ZONE_SEQNO,
     DM.SHIFT_SEQNO,
     DM.FLAGDUPPERSON) 
  VALUES (     P.PERSONID,
     P.TM6NO,
     P.INOUTDTE,
     P.CARDTYPE,
     P.TFIRSTNM,
     P.TMIDDLENM,
     P.TFAMILYNM,
     P.EFIRSTNM,
     P.EMIDDLENM,
     P.EFAMILYNM,
     P.SEX,
     P.BIRTHDTE,
     P.NATIONCD,
     P.TDTCD,
     P.TDTNO,
     P.VISATYPECDORG,
     P.VISAEXPDTE,
     P.PASSPORTDTE,
     P.PASSPORTISU,
     P.PASSPORTEXPDTE,
     P.UPDUSR,
     P.UPDDTE,
     P.UPDTERM,
     P.REMARK,
     P.RESCERTNO,
     P.DEPTCD,
     P.FLAGPASS,
     P.STATUS,
     P.TM5_SEQNO,
     P.TM2INOUT_SEQNO,
     P.PM_RE_ENTRY,
     P.PM_REEXPDTE,
     P.PM_EXTENSION,
     P.PM_EXEXPDTE,
     P.PM_NON_QUOTA,
     P.PM_NONEXPDTE,
     P.NEWPERMIT,
     P.PERMITCD,
     P.CONVCD,
     P.CONVREGNO,
     P.SEQNO,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION,
     P.RPJSEQNO,
     P.CONV_SEQNO,
     P.VISATYPE_SEQNO,
     P.DEPT_SEQNO,
     P.COUNT_SEQNO,
     P.PERMIT_SEQNO,
     P.CITIZENID,
     P.PASS_SEQNO,
     P.FLIGHTPREFIX,
     P.FLIGHTNUMBER,
     P.DEPTCDORG,
     P.VISATYPECD,
     P.RESCERTTYPE,
     P.RESPVCD,
     P.RESNOYEAR,
     P.PV_SEQNO,
     P.PD_SEQNO,
     P.ZONE_SEQNO,
     P.SHIFT_SEQNO,
     P.FLAGDUPPERSON);

 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('IMMIGRATION_C', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
  VALUES ('IMMIGRATION_C', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_IMMIGRATION;
/
