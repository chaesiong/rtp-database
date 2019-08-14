CREATE TABLE "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" 
   (	"KEY_VALUE" VARCHAR2(128) DEFAULT SYS_GUID() NOT NULL ENABLE, 
	"APP_SESSION" VARCHAR2(64) NOT NULL ENABLE, 
	"LAST_NAME" VARCHAR2(128), 
	"FIRST_NAME" VARCHAR2(128), 
	"RELATION" VARCHAR2(128), 
	"DATE_OF_BIRTH" DATE, 
	"GENDER" VARCHAR2(128), 
	"NATIONALITY" VARCHAR2(128), 
	"IMAGE" BLOB, 
	"INSERT_AT" DATE DEFAULT sysdate, 
	"UPDATE_AT" DATE DEFAULT sysdate, 
	"TM6_NO" VARCHAR2(50 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" ADD CONSTRAINT "TMP_COLLECTIVE_PASSPORT_DA_PK" PRIMARY KEY ("KEY_VALUE", "APP_SESSION")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."APP_SESSION" IS 'Application Session';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."LAST_NAME" IS 'Column for Lastname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."FIRST_NAME" IS 'Column for Firstname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."RELATION" IS 'Column for Relation';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."DATE_OF_BIRTH" IS 'Date of birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."GENDER" IS 'Gender';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."NATIONALITY" IS 'Country Code for Nationality';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."IMAGE" IS 'Image';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."INSERT_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."UPDATE_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"."TM6_NO" IS 'Number of TM6 Card';
   COMMENT ON TABLE "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA"  IS 'Used in BmBS, VOA, Re-Entry';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312463C00009$$" ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DA_PK" ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" ("KEY_VALUE", "APP_SESSION") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TMP_COLLECTIVE_PASSPORT_DATA" TO "APPSUP";