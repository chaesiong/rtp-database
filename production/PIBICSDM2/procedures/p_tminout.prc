CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_TMINOUT" (
    v_dstart VARCHAR2,/* Ex. 201901150000 */
    v_dend VARCHAR2/* Ex. 201901160000 */
 --   v_dstart2 VARCHAR2,/* Ex. 20190115 */
  --  v_dend2 VARCHAR2/* Ex. 20190116 */
)
AS 
BEGIN
 /* Create date : 16-01-2019 */
 
 DECLARE
 var_rows NUMBER;
 vstdate date;
 veddate date;
 
 BEGIN
 
 INSERT INTO IMPORT_LOG VALUES ('TMINOUT_C_start', 0, SYSDATE);
 vstdate :=sysdate;
 
 MERGE INTO PIBICSDM2.TMINOUT DM
  USING (SELECT 
        SEQNO,
        TM6NO,
        INOUTDTE,
        CARDTYPE,
        TFIRSTNM,
        TMIDDLENM,
        TFAMILYNM,
        EFIRSTNM,
        EMIDDLENM,
        EFAMILYNM,
        SEX,
        BIRTHDTE,
        NATIONCD,
        DEPTCD,
        TRAVCD,
        CONVCD,
        CONVREGNO,
        TDTCD,
        TDTNO,
        VISATYPECD,
        VISAEXPDTE,
        PASSPORTDTE,
        PASSPORTISU,
        PASSPORTEXPDTE,
        TARGETNO,
        INTYPE,
        CHKPOINTNO,
        CREUSR,
        CREDTE,
        CREDTERM,
        UPDUSR,
        UPDDTE,
        UPDTERM,
        ISPROCESS,
        PERSONID,
        TFSNDXNM,
        TLSNDXNM,
        TMSNDXNM,
        EFSNDXNM,
        ELSNDXNM,
        EMSNDXNM,
        REMARK,
        RESCERTNO,
        PM_RE_ENTRY,
        PM_REEXPDTE,
        PM_EXTENSION,
        PM_EXEXPDTE,
        PM_NON_QUOTA,
        PM_NONEXPDTE,
        STATUS,
        TM5_SEQNO,
        TM2INOUT_SEQNO,
        CREATE_BY,
        CREATE_DATE,
        UPDATE_BY,
        UPDATE_DATE,
        RPJSEQNO,
        PERMITCD,
        NEWPERMIT,
        CONV_SEQNO,
        VISATYPE_SEQNO,
        DEPT_SEQNO,
        COUNT_SEQNO,
        PERMIT_SEQNO,
        CITIZENID,
        PASS_SEQNO,
        FLIGHTPREFIX,
        FLIGHTNUMBER,
        TYPEDATA,
        DEPTCDORG,
        FLAGJOINPASS,
        FLAGFINES,
        RESCERTTYPE,
        RESPVCD,
        RESNOYEAR,
        PV_SEQNO,
        PD_SEQNO,
        ZONE_SEQNO,
        SHIFT_SEQNO,
        VERSION  
     FROM PIBICS.TMINOUT@PIBICS_PROD
     WHERE (CREATE_DATE >= TO_DATE(v_dstart,'yyyymmddhh24mi')
              AND CREATE_DATE < TO_DATE(v_dend,'yyyymmddhh24mi'))
              OR
            (CREDTE >= TO_DATE(v_dstart,'yyyymmddhh24mi')
              AND CREDTE < TO_DATE(v_dend,'yyyymmddhh24mi'))
              ) P
  ON (DM.SEQNO = P.SEQNO)
 WHEN MATCHED 
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
     DM.DEPTCD = P.DEPTCD,
     DM.TRAVCD = P.TRAVCD,
     DM.CONVCD = P.CONVCD,
     DM.CONVREGNO = P.CONVREGNO,
     DM.TDTCD = P.TDTCD,
     DM.TDTNO = P.TDTNO,
     DM.VISATYPECD = P.VISATYPECD,
     DM.VISAEXPDTE = P.VISAEXPDTE,
     DM.PASSPORTDTE = P.PASSPORTDTE,
     DM.PASSPORTISU = P.PASSPORTISU,
     DM.PASSPORTEXPDTE = P.PASSPORTEXPDTE,
     DM.TARGETNO = P.TARGETNO,
     DM.INTYPE = P.INTYPE,
     DM.CHKPOINTNO = P.CHKPOINTNO,
     DM.CREUSR = P.CREUSR,
     DM.CREDTE = P.CREDTE,
     DM.CREDTERM = P.CREDTERM,
     DM.UPDUSR = P.UPDUSR,
     DM.UPDDTE = P.UPDDTE,
     DM.UPDTERM = P.UPDTERM,
     DM.ISPROCESS = P.ISPROCESS,
     DM.PERSONID = P.PERSONID,
     DM.TFSNDXNM = P.TFSNDXNM,
     DM.TLSNDXNM = P.TLSNDXNM,
     DM.TMSNDXNM = P.TMSNDXNM,
     DM.EFSNDXNM = P.EFSNDXNM,
     DM.ELSNDXNM = P.ELSNDXNM,
     DM.EMSNDXNM = P.EMSNDXNM,
     DM.REMARK = P.REMARK,
     DM.RESCERTNO = P.RESCERTNO,
     DM.PM_RE_ENTRY = P.PM_RE_ENTRY,
     DM.PM_REEXPDTE = P.PM_REEXPDTE,
     DM.PM_EXTENSION = P.PM_EXTENSION,
     DM.PM_EXEXPDTE = P.PM_EXEXPDTE,
     DM.PM_NON_QUOTA = P.PM_NON_QUOTA,
     DM.PM_NONEXPDTE = P.PM_NONEXPDTE,
     DM.STATUS = P.STATUS,
     DM.TM5_SEQNO = P.TM5_SEQNO,
     DM.TM2INOUT_SEQNO = P.TM2INOUT_SEQNO,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION,
     DM.RPJSEQNO = P.RPJSEQNO,
     DM.PERMITCD = P.PERMITCD,
     DM.NEWPERMIT = P.NEWPERMIT,
     DM.CONV_SEQNO = P.CONV_SEQNO,
     DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
     DM.DEPT_SEQNO = P.DEPT_SEQNO,
     DM.COUNT_SEQNO = P.COUNT_SEQNO,
     DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
     DM.CITIZENID = P.CITIZENID,
     DM.PASS_SEQNO = P.PASS_SEQNO,
     DM.FLIGHTPREFIX = P.FLIGHTPREFIX,
     DM.FLIGHTNUMBER = P.FLIGHTNUMBER,
     DM.TYPEDATA = P.TYPEDATA,
     DM.DEPTCDORG = P.DEPTCDORG,
     DM.FLAGJOINPASS = P.FLAGJOINPASS,
     DM.FLAGFINES = P.FLAGFINES,
     DM.RESCERTTYPE = P.RESCERTTYPE,
     DM.RESPVCD = P.RESPVCD,
     DM.RESNOYEAR = P.RESNOYEAR,
     DM.PV_SEQNO = P.PV_SEQNO,
     DM.PD_SEQNO = P.PD_SEQNO,
     DM.ZONE_SEQNO = P.ZONE_SEQNO,
     DM.SHIFT_SEQNO = P.SHIFT_SEQNO
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
     DM.RESCERTNO,
     DM.PM_RE_ENTRY,
     DM.PM_REEXPDTE,
     DM.PM_EXTENSION,
     DM.PM_EXEXPDTE,
     DM.PM_NON_QUOTA,
     DM.PM_NONEXPDTE,
     DM.STATUS,
     DM.TM5_SEQNO,
     DM.TM2INOUT_SEQNO,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION,
     DM.RPJSEQNO,
     DM.PERMITCD,
     DM.NEWPERMIT,
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
     DM.DEPTCDORG,
     DM.FLAGJOINPASS,
     DM.FLAGFINES,
     DM.RESCERTTYPE,
     DM.RESPVCD,
     DM.RESNOYEAR,
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
     P.RESCERTNO,
     P.PM_RE_ENTRY,
     P.PM_REEXPDTE,
     P.PM_EXTENSION,
     P.PM_EXEXPDTE,
     P.PM_NON_QUOTA,
     P.PM_NONEXPDTE,
     P.STATUS,
     P.TM5_SEQNO,
     P.TM2INOUT_SEQNO,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION,
     P.RPJSEQNO,
     P.PERMITCD,
     P.NEWPERMIT,
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
     P.DEPTCDORG,
     P.FLAGJOINPASS,
     P.FLAGFINES,
     P.RESCERTTYPE,
     P.RESPVCD,
     P.RESNOYEAR,
     P.PV_SEQNO,
     P.PD_SEQNO,
     P.ZONE_SEQNO,
     P.SHIFT_SEQNO);



 var_rows := SQL%ROWCOUNT;
 
 veddate :=sysdate;

 INSERT INTO IMPORT_LOG   VALUES ('TMINOUT_C_end', var_rows, SYSDATE);
 INSERT INTO IMPORT_LOG_DETAIL VALUES ('TMINOUT_C_end', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


INSERT INTO IMPORT_LOG   VALUES ('TMINOUT_U_start', 0, SYSDATE);
vstdate :=sysdate;

 MERGE INTO PIBICSDM2.TMINOUT DM
  USING (SELECT 
         SEQNO,
        TM6NO,
        INOUTDTE,
        CARDTYPE,
        TFIRSTNM,
        TMIDDLENM,
        TFAMILYNM,
        EFIRSTNM,
        EMIDDLENM,
        EFAMILYNM,
        SEX,
        BIRTHDTE,
        NATIONCD,
        DEPTCD,
        TRAVCD,
        CONVCD,
        CONVREGNO,
        TDTCD,
        TDTNO,
        VISATYPECD,
        VISAEXPDTE,
        PASSPORTDTE,
        PASSPORTISU,
        PASSPORTEXPDTE,
        TARGETNO,
        INTYPE,
        CHKPOINTNO,
        CREUSR,
        CREDTE,
        CREDTERM,
        UPDUSR,
        UPDDTE,
        UPDTERM,
        ISPROCESS,
        PERSONID,
        TFSNDXNM,
        TLSNDXNM,
        TMSNDXNM,
        EFSNDXNM,
        ELSNDXNM,
        EMSNDXNM,
        REMARK,
        RESCERTNO,
        PM_RE_ENTRY,
        PM_REEXPDTE,
        PM_EXTENSION,
        PM_EXEXPDTE,
        PM_NON_QUOTA,
        PM_NONEXPDTE,
        STATUS,
        TM5_SEQNO,
        TM2INOUT_SEQNO,
        CREATE_BY,
        CREATE_DATE,
        UPDATE_BY,
        UPDATE_DATE,
        RPJSEQNO,
        PERMITCD,
        NEWPERMIT,
        CONV_SEQNO,
        VISATYPE_SEQNO,
        DEPT_SEQNO,
        COUNT_SEQNO,
        PERMIT_SEQNO,
        CITIZENID,
        PASS_SEQNO,
        FLIGHTPREFIX,
        FLIGHTNUMBER,
        TYPEDATA,
        DEPTCDORG,
        FLAGJOINPASS,
        FLAGFINES,
        RESCERTTYPE,
        RESPVCD,
        RESNOYEAR,
        PV_SEQNO,
        PD_SEQNO,
        ZONE_SEQNO,
        SHIFT_SEQNO,
        VERSION  
     FROM PIBICS.TMINOUT@PIBICS_PROD
     WHERE TO_CHAR(UPDDTE,'yyyymmddhh24mi') >= v_dstart
      AND TO_CHAR(UPDDTE,'yyyymmddhh24mi') < v_dend) P
  ON (DM.SEQNO = P.SEQNO)
 WHEN MATCHED 
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
     DM.DEPTCD = P.DEPTCD,
     DM.TRAVCD = P.TRAVCD,
     DM.CONVCD = P.CONVCD,
     DM.CONVREGNO = P.CONVREGNO,
     DM.TDTCD = P.TDTCD,
     DM.TDTNO = P.TDTNO,
     DM.VISATYPECD = P.VISATYPECD,
     DM.VISAEXPDTE = P.VISAEXPDTE,
     DM.PASSPORTDTE = P.PASSPORTDTE,
     DM.PASSPORTISU = P.PASSPORTISU,
     DM.PASSPORTEXPDTE = P.PASSPORTEXPDTE,
     DM.TARGETNO = P.TARGETNO,
     DM.INTYPE = P.INTYPE,
     DM.CHKPOINTNO = P.CHKPOINTNO,
     DM.CREUSR = P.CREUSR,
     DM.CREDTE = P.CREDTE,
     DM.CREDTERM = P.CREDTERM,
     DM.UPDUSR = P.UPDUSR,
     DM.UPDDTE = P.UPDDTE,
     DM.UPDTERM = P.UPDTERM,
     DM.ISPROCESS = P.ISPROCESS,
     DM.PERSONID = P.PERSONID,
     DM.TFSNDXNM = P.TFSNDXNM,
     DM.TLSNDXNM = P.TLSNDXNM,
     DM.TMSNDXNM = P.TMSNDXNM,
     DM.EFSNDXNM = P.EFSNDXNM,
     DM.ELSNDXNM = P.ELSNDXNM,
     DM.EMSNDXNM = P.EMSNDXNM,
     DM.REMARK = P.REMARK,
     DM.RESCERTNO = P.RESCERTNO,
     DM.PM_RE_ENTRY = P.PM_RE_ENTRY,
     DM.PM_REEXPDTE = P.PM_REEXPDTE,
     DM.PM_EXTENSION = P.PM_EXTENSION,
     DM.PM_EXEXPDTE = P.PM_EXEXPDTE,
     DM.PM_NON_QUOTA = P.PM_NON_QUOTA,
     DM.PM_NONEXPDTE = P.PM_NONEXPDTE,
     DM.STATUS = P.STATUS,
     DM.TM5_SEQNO = P.TM5_SEQNO,
     DM.TM2INOUT_SEQNO = P.TM2INOUT_SEQNO,
     DM.CREATE_BY = P.CREATE_BY,
     DM.CREATE_DATE = P.CREATE_DATE,
     DM.UPDATE_BY = P.UPDATE_BY,
     DM.UPDATE_DATE = P.UPDATE_DATE,
     DM.VERSION = P.VERSION,
     DM.RPJSEQNO = P.RPJSEQNO,
     DM.PERMITCD = P.PERMITCD,
     DM.NEWPERMIT = P.NEWPERMIT,
     DM.CONV_SEQNO = P.CONV_SEQNO,
     DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
     DM.DEPT_SEQNO = P.DEPT_SEQNO,
     DM.COUNT_SEQNO = P.COUNT_SEQNO,
     DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
     DM.CITIZENID = P.CITIZENID,
     DM.PASS_SEQNO = P.PASS_SEQNO,
     DM.FLIGHTPREFIX = P.FLIGHTPREFIX,
     DM.FLIGHTNUMBER = P.FLIGHTNUMBER,
     DM.TYPEDATA = P.TYPEDATA,
     DM.DEPTCDORG = P.DEPTCDORG,
     DM.FLAGJOINPASS = P.FLAGJOINPASS,
     DM.FLAGFINES = P.FLAGFINES,
     DM.RESCERTTYPE = P.RESCERTTYPE,
     DM.RESPVCD = P.RESPVCD,
     DM.RESNOYEAR = P.RESNOYEAR,
     DM.PV_SEQNO = P.PV_SEQNO,
     DM.PD_SEQNO = P.PD_SEQNO,
     DM.ZONE_SEQNO = P.ZONE_SEQNO,
     DM.SHIFT_SEQNO = P.SHIFT_SEQNO
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
     DM.RESCERTNO,
     DM.PM_RE_ENTRY,
     DM.PM_REEXPDTE,
     DM.PM_EXTENSION,
     DM.PM_EXEXPDTE,
     DM.PM_NON_QUOTA,
     DM.PM_NONEXPDTE,
     DM.STATUS,
     DM.TM5_SEQNO,
     DM.TM2INOUT_SEQNO,
     DM.CREATE_BY,
     DM.CREATE_DATE,
     DM.UPDATE_BY,
     DM.UPDATE_DATE,
     DM.VERSION,
     DM.RPJSEQNO,
     DM.PERMITCD,
     DM.NEWPERMIT,
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
     DM.DEPTCDORG,
     DM.FLAGJOINPASS,
     DM.FLAGFINES,
     DM.RESCERTTYPE,
     DM.RESPVCD,
     DM.RESNOYEAR,
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
     P.RESCERTNO,
     P.PM_RE_ENTRY,
     P.PM_REEXPDTE,
     P.PM_EXTENSION,
     P.PM_EXEXPDTE,
     P.PM_NON_QUOTA,
     P.PM_NONEXPDTE,
     P.STATUS,
     P.TM5_SEQNO,
     P.TM2INOUT_SEQNO,
     P.CREATE_BY,
     P.CREATE_DATE,
     P.UPDATE_BY,
     P.UPDATE_DATE,
     P.VERSION,
     P.RPJSEQNO,
     P.PERMITCD,
     P.NEWPERMIT,
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
     P.DEPTCDORG,
     P.FLAGJOINPASS,
     P.FLAGFINES,
     P.RESCERTTYPE,
     P.RESPVCD,
     P.RESNOYEAR,
     P.PV_SEQNO,
     P.PD_SEQNO,
     P.ZONE_SEQNO,
     P.SHIFT_SEQNO);



 var_rows := SQL%ROWCOUNT;
 
 veddate := sysdate;

 INSERT INTO IMPORT_LOG   VALUES ('TMINOUT_U_end', var_rows, SYSDATE);
 INSERT INTO IMPORT_LOG_DETAIL VALUES ('TMINOUT_U_end', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;



EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
  
  END;
  
END P_TMINOUT;
/
