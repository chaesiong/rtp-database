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
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS_INTF"."CNT_TRANSCODE" TO "BIOSAADM";
