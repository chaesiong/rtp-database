CREATE TABLE "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" 
   (	"CASE_NUMBER" VARCHAR2(100 CHAR), 
	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER(2,0), 
	"WLTFIRSTNM" VARCHAR2(60 CHAR), 
	"GIVENNAME_THAI" VARCHAR2(100 CHAR), 
	"CREDTE" DATE
   ) ;
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."KEEP_BLACKLIST_DATA" TO "PUNYAWII_D";
