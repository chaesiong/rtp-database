CREATE TABLE "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" 
   (	"TRCD_TABLE_NAME" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"COUNT" NUMBER DEFAULT 0, 
	"DML_AT" TIMESTAMP (6) DEFAULT systimestamp NOT NULL ENABLE
   ) ;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE"."TRCD_TABLE_NAME" IS 'Name of the  transcode table for the data';
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE"  IS 'Counters for the transcode tables';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE_UK" ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" ("TRCD_TABLE_NAME") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "APPSUP";
