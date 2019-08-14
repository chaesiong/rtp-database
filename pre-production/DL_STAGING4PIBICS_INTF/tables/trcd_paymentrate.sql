CREATE TABLE "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" 
   (	"SEQNO" NUMBER, 
	"CODE" NUMBER, 
	"KEY_VALUE" VARCHAR2(32 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" ADD CONSTRAINT "TRCD_PAYMENTRATE_UK1" UNIQUE ("SEQNO")
  USING INDEX  ENABLE;
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE"  IS 'Transcode Table for DL_STAGING4PIBICS.PAYMENTRATE to DL_BORDERCONTROL.FAF_PAYMENT_RATE';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE_UK1" ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" ("SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "TESTADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TRCD_PAYMENTRATE" TO "TRAINEE";
