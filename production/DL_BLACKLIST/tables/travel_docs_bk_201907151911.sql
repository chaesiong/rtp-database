CREATE TABLE "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"UNIQUE_VALUE" VARCHAR2(32 CHAR), 
	"DOC_TYPE" VARCHAR2(2 CHAR), 
	"ISSUING_COUNTRY" VARCHAR2(3 CHAR), 
	"DOC_NUMBER" VARCHAR2(20 CHAR), 
	"DATE_OF_ISSUE" DATE, 
	"DATE_OF_EXPIRY$VC" VARCHAR2(6 CHAR), 
	"DATE_OF_EXPIRY" DATE, 
	"SURNAME" VARCHAR2(100 CHAR), 
	"GIVEN_NAME" VARCHAR2(100 CHAR), 
	"NATIONALITY" VARCHAR2(3 CHAR), 
	"PLACE_OF_BIRTH" VARCHAR2(100 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"ISSUING_AUTHORITY" VARCHAR2(100 CHAR), 
	"DATE_OF_BIRTH$VC" VARCHAR2(6 CHAR), 
	"DATE_OF_BIRTH" DATE, 
	"MRZ_FORMAT" VARCHAR2(4 CHAR), 
	"MRZ_DATA" VARCHAR2(90 CHAR), 
	"DATA_ACQUISITION_TYPE" VARCHAR2(6 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR), 
	"IDENTITY" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DOC_CLASS" VARCHAR2(32 CHAR), 
	"HAIR_COLOR" VARCHAR2(100 CHAR), 
	"HAIR_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"FACE_ID" VARCHAR2(32 CHAR), 
	"DATE_OF_BIRTH_PARTIAL" "DL_BLACKLIST"."CT_PARTIAL_DATE" 
   ) ;
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK_201907151911" TO "PUNYAWII_D";
