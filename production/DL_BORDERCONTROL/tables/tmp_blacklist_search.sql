CREATE TABLE "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" 
   (	"KEY_VALUE" VARCHAR2(32) NOT NULL ENABLE, 
	"APP_SESSION" VARCHAR2(32) NOT NULL ENABLE, 
	"JSON_DATA" CLOB, 
	"UPDATE_DATE" DATE DEFAULT sysdate, 
	"INSERT_DATE" DATE DEFAULT sysdate
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" ADD CONSTRAINT "JSON_DATA_CHECK" CHECK (JSON_DATA IS JSON) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" ADD CONSTRAINT "TMP_BLACKLIST_SEARCH_PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" ADD CONSTRAINT "APP_SESSION_UQ" UNIQUE ("APP_SESSION")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH"."APP_SESSION" IS 'Column Applikcation Session';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH"."JSON_DATA" IS 'Column for Jason Data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH"."UPDATE_DATE" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH"."INSERT_DATE" IS 'Date of Insert Date';
   COMMENT ON TABLE "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH"  IS 'Used in BmBS, VOA, Re-Entry';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."APP_SESSION_UQ" ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" ("APP_SESSION") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312139C00003$$" ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH_PK" ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_BLACKLIST_SEARCH" TO "PUNYAWII_D";
