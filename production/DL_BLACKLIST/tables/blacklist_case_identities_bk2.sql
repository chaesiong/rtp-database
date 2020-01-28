CREATE TABLE "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" 
   (	"CASE_NUMBER" VARCHAR2(100 CHAR), 
	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BLACKLIST_CASE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"IDENTITY" VARCHAR2(32 CHAR) NOT NULL ENABLE
   ) ;
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "PUNYAWII_D";
