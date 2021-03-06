CREATE TABLE "DL_STAGING4PIBICS"."WATCHLIST2" 
   (	"WLCD" VARCHAR2(7 CHAR) NOT NULL ENABLE, 
	"SEQNO" NUMBER DEFAULT ON NULL -1 NOT NULL ENABLE, 
	"OWNERAGE" VARCHAR2(4 CHAR), 
	"AGCCONT" VARCHAR2(2 CHAR), 
	"AGCPHONE" VARCHAR2(40 CHAR), 
	"EMGCONT" VARCHAR2(100 CHAR), 
	"DOCREF" VARCHAR2(60 CHAR), 
	"SECLEV" VARCHAR2(2 CHAR), 
	"BIRTHPLACE" VARCHAR2(500 CHAR), 
	"ADDR" VARCHAR2(60 CHAR), 
	"HOUSE" VARCHAR2(60 CHAR), 
	"SOI" VARCHAR2(60 CHAR), 
	"ROAD" VARCHAR2(60 CHAR), 
	"MOO" VARCHAR2(60 CHAR), 
	"DISTRICT" VARCHAR2(60 CHAR), 
	"CITY" VARCHAR2(60 CHAR), 
	"STATE" VARCHAR2(60 CHAR), 
	"CURZIPCODE" VARCHAR2(60 CHAR), 
	"HEIGHT" VARCHAR2(4 CHAR), 
	"WEIGHT" VARCHAR2(3 CHAR), 
	"HAIRCOLOR" VARCHAR2(30 CHAR), 
	"HAIR" VARCHAR2(30 CHAR), 
	"FACE" VARCHAR2(30 CHAR), 
	"BUILD" VARCHAR2(80 CHAR), 
	"EYECOLOR" VARCHAR2(30 CHAR), 
	"COMPLEXION" VARCHAR2(30 CHAR), 
	"FEATURE" VARCHAR2(60 CHAR), 
	"PECULIARITY" VARCHAR2(60 CHAR), 
	"OCCCD" VARCHAR2(4 CHAR), 
	"TARGETNO" VARCHAR2(10 CHAR), 
	"OPERREF" VARCHAR2(60 CHAR), 
	"OWNERORG" VARCHAR2(60 CHAR), 
	"WARRNO" VARCHAR2(200 CHAR), 
	"WARRDTE" DATE, 
	"WARREXPDTE" DATE, 
	"DOCREFER" VARCHAR2(60 CHAR), 
	"BLAWSNO" VARCHAR2(60 CHAR), 
	"RLAWSNO" VARCHAR2(60 CHAR), 
	"PENALNO" VARCHAR2(60 CHAR), 
	"ALLEGECD" VARCHAR2(4 CHAR), 
	"REASONCD" VARCHAR2(4 CHAR), 
	"TDCD" VARCHAR2(4 CHAR), 
	"CREUSR" VARCHAR2(20 CHAR), 
	"CREDTE" DATE, 
	"CREORG" VARCHAR2(5 CHAR), 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"UPDORG" VARCHAR2(5 CHAR), 
	"DOCDTE" DATE, 
	"DOCNO" VARCHAR2(20 CHAR), 
	"STS" VARCHAR2(10 CHAR), 
	"CAUSE" VARCHAR2(255 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"NATIONCD" VARCHAR2(3 CHAR), 
	"OTHERAGCCONT" VARCHAR2(200 CHAR), 
	"RMK1" VARCHAR2(40 CHAR), 
	"RMK2" VARCHAR2(60 CHAR), 
	"RMK3" VARCHAR2(150 CHAR), 
	"RMK4" VARCHAR2(40 CHAR), 
	"RMKDTE" DATE, 
	"RMKDTE1" DATE, 
	"PRECINCTCD" VARCHAR2(4 CHAR), 
	"ARREST" VARCHAR2(1 CHAR), 
	"PERMITDTE1" DATE, 
	"PERMITDTE2" DATE, 
	"PERMIT" VARCHAR2(1 CHAR), 
	"RMKAGCCONT" VARCHAR2(200 CHAR), 
	"RMKARREST" VARCHAR2(255 CHAR), 
	"RMKPERMIT" VARCHAR2(2500 CHAR), 
	"RMK11" VARCHAR2(40 CHAR), 
	"RMK12" VARCHAR2(60 CHAR), 
	"RMK13" VARCHAR2(150 CHAR), 
	"RMKDTE11" DATE, 
	"RMKDTE12" DATE, 
	"RMKMORE" VARCHAR2(1000 CHAR), 
	"REASON_OTH" VARCHAR2(500 CHAR), 
	"REASON_TYPE_SEQNO" NUMBER, 
	"NATION_SEQNO" NUMBER, 
	"REASON_SEQNO" NUMBER, 
	"OPER_SEQNO" NUMBER, 
	"TD_SEQNO" NUMBER, 
	"CARD_ID" VARCHAR2(20 CHAR), 
	"FLAGCHECKPOINT" VARCHAR2(1 CHAR), 
	"CASES_NO" VARCHAR2(50 CHAR), 
	"LOGIN_ID" VARCHAR2(20 CHAR), 
	"KEY_DATE" DATE, 
	"HIDDENREMARK" VARCHAR2(1000 CHAR), 
	"PV_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"HIDEDTE" TIMESTAMP (6), 
	"DEPT_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(3500 CHAR), 
	"WLTLASTNM" VARCHAR2(60 CHAR), 
	"WLTFIRSTNM" VARCHAR2(60 CHAR), 
	"WLTMIDDLENM" VARCHAR2(60 CHAR), 
	"WLELASTNM" VARCHAR2(60 CHAR), 
	"WLEMIDDLENM" VARCHAR2(60 CHAR), 
	"WLEFIRSTNM" VARCHAR2(60 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"NATIONCD_WLNM" VARCHAR2(3 CHAR), 
	"BIRTHDTE_WLNM" VARCHAR2(10 CHAR), 
	"TFSNDXNM" VARCHAR2(60 CHAR), 
	"TMSNDXNM" VARCHAR2(60 CHAR), 
	"TLSNDXNM" VARCHAR2(60 CHAR), 
	"FLAG" VARCHAR2(1 CHAR), 
	"SEQNO_WLIC" NUMBER, 
	"IDCCD_WLIC" CHAR(4), 
	"DOCNO_WLIC" VARCHAR2(20 CHAR), 
	"ISUDTE_WLIC" DATE, 
	"ISUPLACE_WLIC" VARCHAR2(60 CHAR)
   ) ;
  CREATE INDEX "DL_STAGING4PIBICS"."IDX_WL2_CREDTE" ON "DL_STAGING4PIBICS"."WATCHLIST2" (TO_CHAR("CREDTE",'YYYYMMDD')) 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "APPSUP";
  GRANT DELETE ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."WATCHLIST2" TO "BIOSAADM";
