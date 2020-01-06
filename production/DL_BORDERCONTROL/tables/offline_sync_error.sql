CREATE TABLE "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"PAYLOAD" CLOB, 
	"ERROR_MESSAGE" CLOB, 
	"URL" VARCHAR2(255 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" ADD CONSTRAINT "OFFLINE_SYNC_ERROR$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"."KEY_VALUE" IS 'Key value default on sys_guid()';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"."PAYLOAD" IS 'Payload that has been send';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"."ERROR_MESSAGE" IS 'Error message that came back';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"."URL" IS 'URL that the error occured on';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"."INS_AT" IS 'Inserted date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"."INS_BY" IS 'Inserted user';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"."DML_AT" IS 'Modified date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"."DML_BY" IS 'Modified user';
   COMMENT ON TABLE "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR"  IS 'Table to store sync errors that occured';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR$PK" ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000539720C00002$$" ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000539720C00003$$" ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" (
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR" TO "PORNRUKSA_S";
