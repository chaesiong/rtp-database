CREATE TABLE "DL_BLACKLIST"."BIOMETRICS_BK" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"BLACKLIST_CASE_ID" VARCHAR2(32 CHAR), 
	"ABIS_ID" NUMBER
   ) ;
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."BIOMETRICS_BK" TO "PORNRUKSA_S";
