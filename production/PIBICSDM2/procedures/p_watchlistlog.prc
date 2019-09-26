CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_WATCHLISTLOG" 
IS
 v_dstart VARCHAR2 (15);
 v_dend VARCHAR2 (15);
 var_rows NUMBER;
 vstdate DATE;
 veddate DATE;

BEGIN
 /* Create date : 28-2-2109 */
 v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'YYYYMMDD');
 v_dend := TO_CHAR (TRUNC (SYSDATE), 'YYYYMMDD');

 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.WATCHLISTLOG DM
  USING (SELECT * 
     FROM PIBICS.WATCHLISTLOG@PIBICS_PROD
     WHERE TO_CHAR(LOGDTE,'yyyymmdd') >= v_dstart
     AND TO_CHAR(LOGDTE,'yyyymmdd') <= v_dend ) P
     --WHERE LOGDTE >= TO_DATE(v_dstart,'YYYYMMDD')
      --AND LOGDTE <= TO_DATE(v_dend,'YYYYMMDD')) P
  ON (DM.WATCHLISTLOGID = P.WATCHLISTLOGID)
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.WLCD,
     DM.OWNERAGE,
     DM.AGCCONT,
     DM.AGCPHONE,
     DM.EMGCONT,
     DM.DOCREF,
     DM.SECLEV,
     DM.BIRTHPLACE,
     DM.ADDR,
     DM.HOUSE,
     DM.SOI,
     DM.ROAD,
     DM.MOO,
     DM.DISTRICT,
     DM.CITY,
     DM.STATE,
     DM.CURZIPCODE,
     DM.HEIGHT,
     DM.WEIGHT,
     DM.HAIRCOLOR,
     DM.HAIR,
     DM.FACE,
     DM.BUILD,
     DM.EYECOLOR,
     DM.COMPLEXION,
     DM.FEATURE,
     DM.PECULIARITY,
     DM.OCCCD,
     DM.TARGETNO,
     DM.OPERREF,
     DM.OWNERORG,
     DM.WARRNO,
     DM.WARRDTE,
     DM.WARREXPDTE,
     DM.DOCREFER,
     DM.BLAWSNO,
     DM.RLAWSNO,
     DM.PENALNO,
     DM.ALLEGECD,
     DM.REASONCD,
     DM.TDCD,
     DM.CREUSR,
     DM.CREDTE,
     DM.CREORG,
     DM.UPDUSR,
     DM.UPDDTE,
     DM.UPDORG,
     DM.DOCDTE,
     DM.DOCNO,
     DM.STS,
     DM.CAUSE,
     DM.BIRTHDTE,
     DM.SEX,
     DM.NATIONCD,
     DM.LOGUSERID,
     DM.LOGFLAG,
     DM.LOGDTE,
     DM.OTHERAGCCONT,
     DM.RMK1,
     DM.RMK2,
     DM.RMK3,
     DM.RMK4,
     DM.RMKDTE,
     DM.RMKDTE1,
     DM.WATCHLISTLOGID,
     DM.PRECINCTCD,
     DM.ARREST,
     DM.PERMITDTE1,
     DM.PERMITDTE2,
     DM.PERMIT,
     DM.RMKAGCCONT,
     DM.RMKARREST,
     DM.RMKPERMIT,
     DM.DELREMARK,
     DM.RMK11,
     DM.RMK12,
     DM.RMK13,
     DM.RMKDTE11,
     DM.RMKDTE12,
     DM.RMKMORE,
     DM.REASON_OTH,
     DM.REASON_TYPE_SEQNO,
     DM.CARD_ID,
     DM.FLAGCHECKPOINT,
     DM.CASES_NO,
     DM.LOGIN_ID,
     DM.KEY_DATE,
     DM.HIDDENREMARK,
     DM.PV_SEQNO,
     DM.TMB_SEQNO,
     DM.AMP_SEQNO,
     DM.HIDEDTE,
     DM.NATION_SEQNO,
     DM.REASON_SEQNO,
     DM.OPER_SEQNO,
     DM.TD_SEQNO,
     DM.DEPT_SEQNO,
     DM.REMARK) 
  VALUES (     P.WLCD,
     P.OWNERAGE,
     P.AGCCONT,
     P.AGCPHONE,
     P.EMGCONT,
     P.DOCREF,
     P.SECLEV,
     P.BIRTHPLACE,
     P.ADDR,
     P.HOUSE,
     P.SOI,
     P.ROAD,
     P.MOO,
     P.DISTRICT,
     P.CITY,
     P.STATE,
     P.CURZIPCODE,
     P.HEIGHT,
     P.WEIGHT,
     P.HAIRCOLOR,
     P.HAIR,
     P.FACE,
     P.BUILD,
     P.EYECOLOR,
     P.COMPLEXION,
     P.FEATURE,
     P.PECULIARITY,
     P.OCCCD,
     P.TARGETNO,
     P.OPERREF,
     P.OWNERORG,
     P.WARRNO,
     P.WARRDTE,
     P.WARREXPDTE,
     P.DOCREFER,
     P.BLAWSNO,
     P.RLAWSNO,
     P.PENALNO,
     P.ALLEGECD,
     P.REASONCD,
     P.TDCD,
     P.CREUSR,
     P.CREDTE,
     P.CREORG,
     P.UPDUSR,
     P.UPDDTE,
     P.UPDORG,
     P.DOCDTE,
     P.DOCNO,
     P.STS,
     P.CAUSE,
     P.BIRTHDTE,
     P.SEX,
     P.NATIONCD,
     P.LOGUSERID,
     P.LOGFLAG,
     P.LOGDTE,
     P.OTHERAGCCONT,
     P.RMK1,
     P.RMK2,
     P.RMK3,
     P.RMK4,
     P.RMKDTE,
     P.RMKDTE1,
     P.WATCHLISTLOGID,
     P.PRECINCTCD,
     P.ARREST,
     P.PERMITDTE1,
     P.PERMITDTE2,
     P.PERMIT,
     P.RMKAGCCONT,
     P.RMKARREST,
     P.RMKPERMIT,
     P.DELREMARK,
     P.RMK11,
     P.RMK12,
     P.RMK13,
     P.RMKDTE11,
     P.RMKDTE12,
     P.RMKMORE,
     P.REASON_OTH,
     P.REASON_TYPE_SEQNO,
     P.CARD_ID,
     P.FLAGCHECKPOINT,
     P.CASES_NO,
     P.LOGIN_ID,
     P.KEY_DATE,
     P.HIDDENREMARK,
     P.PV_SEQNO,
     P.TMB_SEQNO,
     P.AMP_SEQNO,
     P.HIDEDTE,
     P.NATION_SEQNO,
     P.REASON_SEQNO,
     P.OPER_SEQNO,
     P.TD_SEQNO,
     P.DEPT_SEQNO,
     P.REMARK);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('WATCHLISTLOG_C', var_rows, SYSDATE);
  
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL 
 VALUES ('WATCHLISTLOG_C', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_WATCHLISTLOG;
/
