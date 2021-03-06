CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_WATCHLIST" 
IS
 v_dstart VARCHAR2 (15);
 v_dend VARCHAR2 (15);
 var_rows NUMBER;
 vstdate date;
 veddate date;
  
BEGIN
 /* Create date : 6-12-2108 */
 v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'YYYYMMDD');
 v_dend := TO_CHAR (TRUNC (SYSDATE), 'YYYYMMDD');

    vstdate :=sysdate;

 MERGE INTO PIBICSDM2.WATCHLIST DM
  USING (SELECT * 
     FROM PIBICS.WATCHLIST@PIBICS_PROD
     WHERE TO_CHAR(CREDTE,'YYYYMMDD') >= v_dstart
      AND TO_CHAR(CREDTE,'YYYYMMDD') <= v_dend
      AND UPDDTE IS NULL) P
  ON (DM.WLCD = P.WLCD)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.OWNERAGE = P.OWNERAGE,
     DM.AGCCONT = P.AGCCONT,
     DM.AGCPHONE = P.AGCPHONE,
     DM.EMGCONT = P.EMGCONT,
     DM.DOCREF = P.DOCREF,
     DM.SECLEV = P.SECLEV,
     DM.BIRTHPLACE = P.BIRTHPLACE,
     DM.ADDR = P.ADDR,
     DM.HOUSE = P.HOUSE,
     DM.SOI = P.SOI,
     DM.ROAD = P.ROAD,
     DM.MOO = P.MOO,
     DM.DISTRICT = P.DISTRICT,
     DM.CITY = P.CITY,
     DM.STATE = P.STATE,
     DM.CURZIPCODE = P.CURZIPCODE,
     DM.HEIGHT = P.HEIGHT,
     DM.WEIGHT = P.WEIGHT,
     DM.HAIRCOLOR = P.HAIRCOLOR,
     DM.HAIR = P.HAIR,
     DM.FACE = P.FACE,
     DM.BUILD = P.BUILD,
     DM.EYECOLOR = P.EYECOLOR,
     DM.COMPLEXION = P.COMPLEXION,
     DM.FEATURE = P.FEATURE,
     DM.PECULIARITY = P.PECULIARITY,
     DM.OCCCD = P.OCCCD,
     DM.TARGETNO = P.TARGETNO,
     DM.OPERREF = P.OPERREF,
     DM.OWNERORG = P.OWNERORG,
     DM.WARRNO = P.WARRNO,
     DM.WARRDTE = P.WARRDTE,
     DM.WARREXPDTE = P.WARREXPDTE,
     DM.DOCREFER = P.DOCREFER,
     DM.BLAWSNO = P.BLAWSNO,
     DM.RLAWSNO = P.RLAWSNO,
     DM.PENALNO = P.PENALNO,
     DM.ALLEGECD = P.ALLEGECD,
     DM.REASONCD = P.REASONCD,
     DM.TDCD = P.TDCD,
     DM.CREUSR = P.CREUSR,
     DM.CREDTE = P.CREDTE,
     DM.CREORG = P.CREORG,
     DM.UPDUSR = P.UPDUSR,
     DM.UPDDTE = P.UPDDTE,
     DM.UPDORG = P.UPDORG,
     DM.DOCDTE = P.DOCDTE,
     DM.DOCNO = P.DOCNO,
     DM.STS = P.STS,
     DM.CAUSE = P.CAUSE,
     DM.BIRTHDTE = P.BIRTHDTE,
     DM.SEX = P.SEX,
     DM.NATIONCD = P.NATIONCD,
     DM.OTHERAGCCONT = P.OTHERAGCCONT,
     DM.RMK1 = P.RMK1,
     DM.RMK2 = P.RMK2,
     DM.RMK3 = P.RMK3,
     DM.RMK4 = P.RMK4,
     DM.RMKDTE = P.RMKDTE,
     DM.RMKDTE1 = P.RMKDTE1,
     DM.PRECINCTCD = P.PRECINCTCD,
     DM.ARREST = P.ARREST,
     DM.PERMITDTE1 = P.PERMITDTE1,
     DM.PERMITDTE2 = P.PERMITDTE2,
     DM.PERMIT = P.PERMIT,
     DM.RMKAGCCONT = P.RMKAGCCONT,
     DM.RMKARREST = P.RMKARREST,
     DM.RMKPERMIT = P.RMKPERMIT,
     DM.RMK11 = P.RMK11,
     DM.RMK12 = P.RMK12,
     DM.RMK13 = P.RMK13,
     DM.RMKDTE11 = P.RMKDTE11,
     DM.RMKDTE12 = P.RMKDTE12,
     DM.RMKMORE = P.RMKMORE,
     DM.REASON_OTH = P.REASON_OTH,
     DM.REASON_TYPE_SEQNO = P.REASON_TYPE_SEQNO,
     DM.NATION_SEQNO = P.NATION_SEQNO,
     DM.REASON_SEQNO = P.REASON_SEQNO,
     DM.OPER_SEQNO = P.OPER_SEQNO,
     DM.TD_SEQNO = P.TD_SEQNO,
     DM.CARD_ID = P.CARD_ID,
     DM.FLAGCHECKPOINT = P.FLAGCHECKPOINT,
     DM.CASES_NO = P.CASES_NO,
     DM.LOGIN_ID = P.LOGIN_ID,
     DM.KEY_DATE = P.KEY_DATE,
     DM.HIDDENREMARK = P.HIDDENREMARK,
     DM.PV_SEQNO = P.PV_SEQNO,
     DM.TMB_SEQNO = P.TMB_SEQNO,
     DM.AMP_SEQNO = P.AMP_SEQNO,
     DM.HIDEDTE = P.HIDEDTE,
     DM.DEPT_SEQNO = P.DEPT_SEQNO,
     DM.REMARK = P.REMARK
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
     DM.OTHERAGCCONT,
     DM.RMK1,
     DM.RMK2,
     DM.RMK3,
     DM.RMK4,
     DM.RMKDTE,
     DM.RMKDTE1,
     DM.PRECINCTCD,
     DM.ARREST,
     DM.PERMITDTE1,
     DM.PERMITDTE2,
     DM.PERMIT,
     DM.RMKAGCCONT,
     DM.RMKARREST,
     DM.RMKPERMIT,
     DM.RMK11,
     DM.RMK12,
     DM.RMK13,
     DM.RMKDTE11,
     DM.RMKDTE12,
     DM.RMKMORE,
     DM.REASON_OTH,
     DM.REASON_TYPE_SEQNO,
     DM.NATION_SEQNO,
     DM.REASON_SEQNO,
     DM.OPER_SEQNO,
     DM.TD_SEQNO,
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
     P.OTHERAGCCONT,
     P.RMK1,
     P.RMK2,
     P.RMK3,
     P.RMK4,
     P.RMKDTE,
     P.RMKDTE1,
     P.PRECINCTCD,
     P.ARREST,
     P.PERMITDTE1,
     P.PERMITDTE2,
     P.PERMIT,
     P.RMKAGCCONT,
     P.RMKARREST,
     P.RMKPERMIT,
     P.RMK11,
     P.RMK12,
     P.RMK13,
     P.RMKDTE11,
     P.RMKDTE12,
     P.RMKMORE,
     P.REASON_OTH,
     P.REASON_TYPE_SEQNO,
     P.NATION_SEQNO,
     P.REASON_SEQNO,
     P.OPER_SEQNO,
     P.TD_SEQNO,
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
     P.DEPT_SEQNO,
     P.REMARK);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG   VALUES ('WATCHLIST_C', var_rows, SYSDATE);

 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL VALUES ('WATCHLIST_C', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);
 COMMIT;
 
 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.WATCHLIST DM
  USING (SELECT * 
     FROM PIBICS.WATCHLIST@PIBICS_PROD
     WHERE TO_CHAR(UPDDTE,'YYYYMMDD') >= v_dstart
      AND TO_CHAR(UPDDTE,'YYYYMMDD') <= v_dend) P
  ON (DM.WLCD = P.WLCD)
 WHEN MATCHED 
 THEN 
  UPDATE SET      DM.OWNERAGE = P.OWNERAGE,
     DM.AGCCONT = P.AGCCONT,
     DM.AGCPHONE = P.AGCPHONE,
     DM.EMGCONT = P.EMGCONT,
     DM.DOCREF = P.DOCREF,
     DM.SECLEV = P.SECLEV,
     DM.BIRTHPLACE = P.BIRTHPLACE,
     DM.ADDR = P.ADDR,
     DM.HOUSE = P.HOUSE,
     DM.SOI = P.SOI,
     DM.ROAD = P.ROAD,
     DM.MOO = P.MOO,
     DM.DISTRICT = P.DISTRICT,
     DM.CITY = P.CITY,
     DM.STATE = P.STATE,
     DM.CURZIPCODE = P.CURZIPCODE,
     DM.HEIGHT = P.HEIGHT,
     DM.WEIGHT = P.WEIGHT,
     DM.HAIRCOLOR = P.HAIRCOLOR,
     DM.HAIR = P.HAIR,
     DM.FACE = P.FACE,
     DM.BUILD = P.BUILD,
     DM.EYECOLOR = P.EYECOLOR,
     DM.COMPLEXION = P.COMPLEXION,
     DM.FEATURE = P.FEATURE,
     DM.PECULIARITY = P.PECULIARITY,
     DM.OCCCD = P.OCCCD,
     DM.TARGETNO = P.TARGETNO,
     DM.OPERREF = P.OPERREF,
     DM.OWNERORG = P.OWNERORG,
     DM.WARRNO = P.WARRNO,
     DM.WARRDTE = P.WARRDTE,
     DM.WARREXPDTE = P.WARREXPDTE,
     DM.DOCREFER = P.DOCREFER,
     DM.BLAWSNO = P.BLAWSNO,
     DM.RLAWSNO = P.RLAWSNO,
     DM.PENALNO = P.PENALNO,
     DM.ALLEGECD = P.ALLEGECD,
     DM.REASONCD = P.REASONCD,
     DM.TDCD = P.TDCD,
     DM.CREUSR = P.CREUSR,
     DM.CREDTE = P.CREDTE,
     DM.CREORG = P.CREORG,
     DM.UPDUSR = P.UPDUSR,
     DM.UPDDTE = P.UPDDTE,
     DM.UPDORG = P.UPDORG,
     DM.DOCDTE = P.DOCDTE,
     DM.DOCNO = P.DOCNO,
     DM.STS = P.STS,
     DM.CAUSE = P.CAUSE,
     DM.BIRTHDTE = P.BIRTHDTE,
     DM.SEX = P.SEX,
     DM.NATIONCD = P.NATIONCD,
     DM.OTHERAGCCONT = P.OTHERAGCCONT,
     DM.RMK1 = P.RMK1,
     DM.RMK2 = P.RMK2,
     DM.RMK3 = P.RMK3,
     DM.RMK4 = P.RMK4,
     DM.RMKDTE = P.RMKDTE,
     DM.RMKDTE1 = P.RMKDTE1,
     DM.PRECINCTCD = P.PRECINCTCD,
     DM.ARREST = P.ARREST,
     DM.PERMITDTE1 = P.PERMITDTE1,
     DM.PERMITDTE2 = P.PERMITDTE2,
     DM.PERMIT = P.PERMIT,
     DM.RMKAGCCONT = P.RMKAGCCONT,
     DM.RMKARREST = P.RMKARREST,
     DM.RMKPERMIT = P.RMKPERMIT,
     DM.RMK11 = P.RMK11,
     DM.RMK12 = P.RMK12,
     DM.RMK13 = P.RMK13,
     DM.RMKDTE11 = P.RMKDTE11,
     DM.RMKDTE12 = P.RMKDTE12,
     DM.RMKMORE = P.RMKMORE,
     DM.REASON_OTH = P.REASON_OTH,
     DM.REASON_TYPE_SEQNO = P.REASON_TYPE_SEQNO,
     DM.NATION_SEQNO = P.NATION_SEQNO,
     DM.REASON_SEQNO = P.REASON_SEQNO,
     DM.OPER_SEQNO = P.OPER_SEQNO,
     DM.TD_SEQNO = P.TD_SEQNO,
     DM.CARD_ID = P.CARD_ID,
     DM.FLAGCHECKPOINT = P.FLAGCHECKPOINT,
     DM.CASES_NO = P.CASES_NO,
     DM.LOGIN_ID = P.LOGIN_ID,
     DM.KEY_DATE = P.KEY_DATE,
     DM.HIDDENREMARK = P.HIDDENREMARK,
     DM.PV_SEQNO = P.PV_SEQNO,
     DM.TMB_SEQNO = P.TMB_SEQNO,
     DM.AMP_SEQNO = P.AMP_SEQNO,
     DM.HIDEDTE = P.HIDEDTE,
     DM.DEPT_SEQNO = P.DEPT_SEQNO,
     DM.REMARK = P.REMARK
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
     DM.OTHERAGCCONT,
     DM.RMK1,
     DM.RMK2,
     DM.RMK3,
     DM.RMK4,
     DM.RMKDTE,
     DM.RMKDTE1,
     DM.PRECINCTCD,
     DM.ARREST,
     DM.PERMITDTE1,
     DM.PERMITDTE2,
     DM.PERMIT,
     DM.RMKAGCCONT,
     DM.RMKARREST,
     DM.RMKPERMIT,
     DM.RMK11,
     DM.RMK12,
     DM.RMK13,
     DM.RMKDTE11,
     DM.RMKDTE12,
     DM.RMKMORE,
     DM.REASON_OTH,
     DM.REASON_TYPE_SEQNO,
     DM.NATION_SEQNO,
     DM.REASON_SEQNO,
     DM.OPER_SEQNO,
     DM.TD_SEQNO,
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
     P.OTHERAGCCONT,
     P.RMK1,
     P.RMK2,
     P.RMK3,
     P.RMK4,
     P.RMKDTE,
     P.RMKDTE1,
     P.PRECINCTCD,
     P.ARREST,
     P.PERMITDTE1,
     P.PERMITDTE2,
     P.PERMIT,
     P.RMKAGCCONT,
     P.RMKARREST,
     P.RMKPERMIT,
     P.RMK11,
     P.RMK12,
     P.RMK13,
     P.RMKDTE11,
     P.RMKDTE12,
     P.RMKMORE,
     P.REASON_OTH,
     P.REASON_TYPE_SEQNO,
     P.NATION_SEQNO,
     P.REASON_SEQNO,
     P.OPER_SEQNO,
     P.TD_SEQNO,
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
     P.DEPT_SEQNO,
     P.REMARK);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG   VALUES ('WATCHLIST_U', var_rows, SYSDATE);

  veddate :=sysdate;
  INSERT INTO IMPORT_LOG_DETAIL VALUES ('WATCHLIST_U', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);
  COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_WATCHLIST;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_WATCHLIST" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_WATCHLIST" TO "BIOSAADM";
