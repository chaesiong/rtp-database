CREATE TABLE "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" 
   (	"COUNTRY" VARCHAR2(3 CHAR) NOT NULL ENABLE, 
	"ICAO_CODE" VARCHAR2(3 CHAR) NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" ADD CONSTRAINT "COUNTRIES_ICAO_CODES_UK_COUNTRY" UNIQUE ("COUNTRY")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" ADD CONSTRAINT "COUNTRIES_ICAO_CODES_UK_ICAO" UNIQUE ("ICAO_CODE") DISABLE;
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES"."COUNTRY" IS 'COUNTRY-Id (PIBICS)';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES"."ICAO_CODE" IS 'ICAO-Code ';
   COMMENT ON TABLE "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES"  IS 'If COUNTRY-CODE and ICAO-Code are different and the subject is a real country the asssignment is stored here. Must be unique in both directions. This table is necessary because PIBICS knows only COUNTRIES but uses them for places where we need ICAO-Doc-Codes';
  CREATE UNIQUE INDEX "DL_COMMON"."COUNTRIES_ICAO_CODES_UK_COUNTRY" ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" ("COUNTRY") 
  ;
  GRANT SELECT ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES_ICAO_DOC_CODES" TO "BIOSUPPORT";
