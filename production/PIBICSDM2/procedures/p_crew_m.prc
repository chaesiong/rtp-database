CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CREW_M" (v_dstart varchar2,v_dend varchar2)
IS
   var_rows   NUMBER;
   vstdate date;
   veddate date;
BEGIN
   /*   Create date : 27-01-2018    */
   --No.25
  -- v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
  -- v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

 vstdate :=sysdate;
 

   MERGE INTO CREW DM
        USING (SELECT *
                 FROM PIBICS.CREW@PIBICS_PROD
                WHERE     TO_CHAR (CREATE_DATE, 'yyyymmdd') >= v_dstart
                      AND TO_CHAR (CREATE_DATE, 'yyyymmdd') < v_dend
                      AND UPDATE_DATE IS NULL) P
           ON (DM.CREW_SEQNO = P.CREW_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.TM6NO = P.TM6NO,
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
                 DM.PERSONID = P.PERSONID,
                 DM.REMARK = P.REMARK,
                 DM.STATUS = P.STATUS,
                 DM.TM5_SEQNO = P.TM5_SEQNO,
                 DM.TM2INOUT_SEQNO = P.TM2INOUT_SEQNO,
                 DM.RANKCRW_SEQNO = P.RANKCRW_SEQNO,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.INOUTDTE_IMM = P.INOUTDTE_IMM,
                 DM.DEPTCD_IMM = P.DEPTCD_IMM,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.SHIFT_SEQNO = P.SHIFT_SEQNO,
                 DM.PD_SEQNO = P.PD_SEQNO,
                 DM.ZONE_SEQNO = P.ZONE_SEQNO,
                 DM.IMGINOUT = P.IMGINOUT,
                 DM.IMGPASS = P.IMGPASS
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CREW_SEQNO,
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
                  DM.PERSONID,
                  DM.REMARK,
                  DM.STATUS,
                  DM.TM5_SEQNO,
                  DM.TM2INOUT_SEQNO,
                  DM.RANKCRW_SEQNO,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.ACTFLAG,
                  DM.INOUTDTE_IMM,
                  DM.DEPTCD_IMM,
                  DM.CREATE_IP,
                  DM.UPDATE_IP,
                  DM.SHIFT_SEQNO,
                  DM.PD_SEQNO,
                  DM.ZONE_SEQNO,
                  DM.IMGINOUT,
                  DM.IMGPASS)
          VALUES (P.CREW_SEQNO,
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
                  P.PERSONID,
                  P.REMARK,
                  P.STATUS,
                  P.TM5_SEQNO,
                  P.TM2INOUT_SEQNO,
                  P.RANKCRW_SEQNO,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.ACTFLAG,
                  P.INOUTDTE_IMM,
                  P.DEPTCD_IMM,
                  P.CREATE_IP,
                  P.UPDATE_IP,
                  P.SHIFT_SEQNO,
                  P.PD_SEQNO,
                  P.ZONE_SEQNO,
                  P.IMGINOUT,
                  P.IMGPASS);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG VALUES ('CREW_C_M', var_rows, SYSDATE);

  veddate :=sysdate;
   
  INSERT INTO IMPORT_LOG_DETAIL VALUES ('CREW_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

  COMMIT;
   
 
 vstdate :=sysdate;
    
   
   MERGE INTO CREW DM
        USING (SELECT *
                 FROM PIBICS.CREW@PIBICS_PROD
                WHERE     TO_CHAR (UPDATE_DATE, 'yyyymmdd') >= v_dstart
                      AND TO_CHAR (UPDATE_DATE, 'yyyymmdd') < v_dend) P
           ON (DM.CREW_SEQNO = P.CREW_SEQNO)
   WHEN MATCHED
   THEN
      UPDATE SET DM.TM6NO = P.TM6NO,
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
                 DM.PERSONID = P.PERSONID,
                 DM.REMARK = P.REMARK,
                 DM.STATUS = P.STATUS,
                 DM.TM5_SEQNO = P.TM5_SEQNO,
                 DM.TM2INOUT_SEQNO = P.TM2INOUT_SEQNO,
                 DM.RANKCRW_SEQNO = P.RANKCRW_SEQNO,
                 DM.CREATE_BY = P.CREATE_BY,
                 DM.CREATE_DATE = P.CREATE_DATE,
                 DM.UPDATE_BY = P.UPDATE_BY,
                 DM.UPDATE_DATE = P.UPDATE_DATE,
                 DM.VERSION = P.VERSION,
                 DM.ACTFLAG = P.ACTFLAG,
                 DM.INOUTDTE_IMM = P.INOUTDTE_IMM,
                 DM.DEPTCD_IMM = P.DEPTCD_IMM,
                 DM.CREATE_IP = P.CREATE_IP,
                 DM.UPDATE_IP = P.UPDATE_IP,
                 DM.SHIFT_SEQNO = P.SHIFT_SEQNO,
                 DM.PD_SEQNO = P.PD_SEQNO,
                 DM.ZONE_SEQNO = P.ZONE_SEQNO,
                 DM.IMGINOUT = P.IMGINOUT,
                 DM.IMGPASS = P.IMGPASS
   WHEN NOT MATCHED
   THEN
      INSERT     (DM.CREW_SEQNO,
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
                  DM.PERSONID,
                  DM.REMARK,
                  DM.STATUS,
                  DM.TM5_SEQNO,
                  DM.TM2INOUT_SEQNO,
                  DM.RANKCRW_SEQNO,
                  DM.CREATE_BY,
                  DM.CREATE_DATE,
                  DM.UPDATE_BY,
                  DM.UPDATE_DATE,
                  DM.VERSION,
                  DM.ACTFLAG,
                  DM.INOUTDTE_IMM,
                  DM.DEPTCD_IMM,
                  DM.CREATE_IP,
                  DM.UPDATE_IP,
                  DM.SHIFT_SEQNO,
                  DM.PD_SEQNO,
                  DM.ZONE_SEQNO,
                  DM.IMGINOUT,
                  DM.IMGPASS)
          VALUES (P.CREW_SEQNO,
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
                  P.PERSONID,
                  P.REMARK,
                  P.STATUS,
                  P.TM5_SEQNO,
                  P.TM2INOUT_SEQNO,
                  P.RANKCRW_SEQNO,
                  P.CREATE_BY,
                  P.CREATE_DATE,
                  P.UPDATE_BY,
                  P.UPDATE_DATE,
                  P.VERSION,
                  P.ACTFLAG,
                  P.INOUTDTE_IMM,
                  P.DEPTCD_IMM,
                  P.CREATE_IP,
                  P.UPDATE_IP,
                  P.SHIFT_SEQNO,
                  P.PD_SEQNO,
                  P.ZONE_SEQNO,
                  P.IMGINOUT,
                  P.IMGPASS);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('CREW_U_M', var_rows, SYSDATE);

  veddate :=sysdate;
   
  INSERT INTO IMPORT_LOG_DETAIL VALUES ('CREW_U_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

  COMMIT;
   
   
   
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_CREW_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_CREW_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_CREW_M" TO "BIOSAADM";
