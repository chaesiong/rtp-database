CREATE TABLE "DL_BLACKLIST"."OPS_PREFERENCES" 
   (	"PREF_NAME" VARCHAR2(100) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(4000) NOT NULL ENABLE, 
	"PREF_VALUE" VARCHAR2(4000)
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."OPS_PREFERENCES" ADD CONSTRAINT "PREFERENCES_PK" PRIMARY KEY ("PREF_NAME")
  USING INDEX (CREATE UNIQUE INDEX "DL_BLACKLIST"."OPS_PREFERENCES_PK" ON "DL_BLACKLIST"."OPS_PREFERENCES" ("PREF_NAME") 
  )  ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."OPS_PREFERENCES"."PREF_NAME" IS 'Name of the preference';
   COMMENT ON COLUMN "DL_BLACKLIST"."OPS_PREFERENCES"."DESCRIPTION" IS 'OPS Preference Description';
   COMMENT ON COLUMN "DL_BLACKLIST"."OPS_PREFERENCES"."PREF_VALUE" IS 'Value of the preference';
   COMMENT ON TABLE "DL_BLACKLIST"."OPS_PREFERENCES"  IS 'Control table fur runtime preferences like default values which should vary by installation. Automatic Initialization of the table is done by PKG_PREFERENCES, so that no seed data is required for the running of the system ';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."OPS_PREFERENCES_PK" ON "DL_BLACKLIST"."OPS_PREFERENCES" ("PREF_NAME") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."OPS_PREFERENCES" TO "APPSUP";
