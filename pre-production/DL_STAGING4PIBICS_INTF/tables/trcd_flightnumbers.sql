CREATE TABLE "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" 
   (	"SEQNO" NUMBER, 
	"FLIGHTNUM" VARCHAR2(50 CHAR), 
	"KEY_VALUE" VARCHAR2(32 CHAR), 
	"DIRECTION" NUMBER
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" ADD CONSTRAINT "TRCD_FLIGHTNUMBERS_UK1" UNIQUE ("SEQNO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS"."FLIGHTNUM" IS 'concatinated from PIBICS FLIGHTPREFIX and FLIGHTNUMBER  ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS"."KEY_VALUE" IS 'Not unique here';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS"."DIRECTION" IS 'Already converted to Bordercontrol keys';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS_UK1" ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" ("SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "TESTADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_FLIGHTNUMBERS" TO "TRAINEE";