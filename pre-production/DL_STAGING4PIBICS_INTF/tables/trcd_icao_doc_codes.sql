CREATE TABLE "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" 
   (	"SEQNO" NUMBER NOT NULL ENABLE, 
	"CODE" VARCHAR2(3 CHAR), 
	"KEY_VALUE" VARCHAR2(3 CHAR)
   )   NO INMEMORY ;
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES"  IS 'Synchronisation Table for PIBICS.COUNTRY -> DL_COMMON.ICAO_DOC_CODES, filled from DL_COMMON.COUNTRIES_ICAO_DOC_CODES';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES_UK1" ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" ("SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "TESTADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_ICAO_DOC_CODES" TO "TRAINEE";