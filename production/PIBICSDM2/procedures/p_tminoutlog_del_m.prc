CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_TMINOUTLOG_DEL_M" (v_dstart varchar2)
IS
 v_dend VARCHAR2 (15);
 var_rows NUMBER;
 vstdate DATE;
 veddate DATE;

BEGIN
 /* Create date : 10-6-2109 */
 --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
 --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');
 
 v_dend := v_dstart;
 
 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.TMINOUTLOG DM
  USING (SELECT * 
     FROM PIBICS.TMINOUTLOG@PIBICS_PROD
     WHERE TO_CHAR(LOGDTE,'dd/mm/yyyy') = v_dstart AND LOGFLAG = 'D' ) P
  ON (DM.TMINOUTLOGID = P.TMINOUTLOGID)
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.SEQNO,
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
     DM.DEPTCD,
     DM.TRAVCD,
     DM.CONVCD,
     DM.CONVREGNO,
     DM.TDTCD,
     DM.TDTNO,
     DM.VISATYPECD,
     DM.VISAEXPDTE,
     DM.PERMITCD,
     DM.NEWPERMIT,
     DM.PASSPORTDTE,
     DM.PASSPORTISU,
     DM.PASSPORTEXPDTE,
     DM.TARGETNO,
     DM.INTYPE,
     DM.CHKPOINTNO,
     DM.CREUSR,
     DM.CREDTE,
     DM.CREDTERM,
     DM.UPDUSR,
     DM.UPDDTE,
     DM.UPDTERM,
     DM.ISPROCESS,
     DM.PERSONID,
     DM.TFSNDXNM,
     DM.TLSNDXNM,
     DM.TMSNDXNM,
     DM.EFSNDXNM,
     DM.ELSNDXNM,
     DM.EMSNDXNM,
     DM.REMARK,
     DM.LOGUSERID,
     DM.LOGFLAG,
     DM.LOGDTE,
     DM.TMINOUTLOGID,
     DM.RESCERTNO,
     DM.IMGINOUT,
     DM.EXTID,
     DM.PM_RE_ENTRY,
     DM.PM_REEXPDTE,
     DM.PM_EXTENSION,
     DM.PM_EXEXPDTE,
     DM.PM_NON_QUOTA,
     DM.PM_NONEXPDTE,
     DM.TM5_SEQNO,
     DM.TM2INOUT_SEQNO,
     DM.STATUS,
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
     DM.TYPEDATA,
     DM.FLAGJOINPASS,
     DM.FLAGFINES,
     DM.RESCERTTYPE,
     DM.RESPVCD,
     DM.RESNOYEAR,
     DM.DELREMARK,
     DM.PV_SEQNO,
     DM.PD_SEQNO,
     DM.ZONE_SEQNO,
     DM.SHIFT_SEQNO) 
  VALUES (     P.SEQNO,
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
     P.DEPTCD,
     P.TRAVCD,
     P.CONVCD,
     P.CONVREGNO,
     P.TDTCD,
     P.TDTNO,
     P.VISATYPECD,
     P.VISAEXPDTE,
     P.PERMITCD,
     P.NEWPERMIT,
     P.PASSPORTDTE,
     P.PASSPORTISU,
     P.PASSPORTEXPDTE,
     P.TARGETNO,
     P.INTYPE,
     P.CHKPOINTNO,
     P.CREUSR,
     P.CREDTE,
     P.CREDTERM,
     P.UPDUSR,
     P.UPDDTE,
     P.UPDTERM,
     P.ISPROCESS,
     P.PERSONID,
     P.TFSNDXNM,
     P.TLSNDXNM,
     P.TMSNDXNM,
     P.EFSNDXNM,
     P.ELSNDXNM,
     P.EMSNDXNM,
     P.REMARK,
     P.LOGUSERID,
     P.LOGFLAG,
     P.LOGDTE,
     P.TMINOUTLOGID,
     P.RESCERTNO,
     P.IMGINOUT,
     P.EXTID,
     P.PM_RE_ENTRY,
     P.PM_REEXPDTE,
     P.PM_EXTENSION,
     P.PM_EXEXPDTE,
     P.PM_NON_QUOTA,
     P.PM_NONEXPDTE,
     P.TM5_SEQNO,
     P.TM2INOUT_SEQNO,
     P.STATUS,
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
     P.TYPEDATA,
     P.FLAGJOINPASS,
     P.FLAGFINES,
     P.RESCERTTYPE,
     P.RESPVCD,
     P.RESNOYEAR,
     P.DELREMARK,
     P.PV_SEQNO,
     P.PD_SEQNO,
     P.ZONE_SEQNO,
     P.SHIFT_SEQNO);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('TMINOUTLOGDEL_C_M', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('TMINOUTLOGDEL_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
  RAISE;
END P_TMINOUTLOG_DEL_M;
/