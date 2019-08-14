CREATE TABLE "DL_BORDERCONTROL"."OFFLINE_MODE" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"FILE_BLOB" BLOB NOT NULL ENABLE, 
	"FILE_NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"FILE_MIMETYPE" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE, 
	"FILE_VERSION" NUMBER NOT NULL ENABLE, 
	"DOWNLOAD_LAST" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"DOWNLOAD_TOTAL" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."OFFLINE_MODE" ADD CONSTRAINT "OFFLINE_MODE$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."OFFLINE_MODE" ADD CONSTRAINT "OFFLINE_MODE$UQ01" UNIQUE ("FILE_VERSION")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."OFFLINE_MODE" ADD CONSTRAINT "OFFLINE_MODE$CK01" CHECK (IS_ACTIVE in ('Y','N')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."KEY_VALUE" IS 'Key value default on sys_guid()';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."FILE_BLOB" IS 'offline version bmbs as zip';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."FILE_NAME" IS 'file name';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."FILE_MIMETYPE" IS 'file mimetype for the download';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."IS_ACTIVE" IS 'key if the entry is active';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."FILE_VERSION" IS 'version of the bmbs offline file';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."DOWNLOAD_LAST" IS 'when has the version last been downloaded';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."DOWNLOAD_TOTAL" IS 'number of total downloads';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."INS_AT" IS 'when the entry has been created';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."INS_BY" IS 'by whom the entry has been created';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."DML_AT" IS 'when the entry has last been changed';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OFFLINE_MODE"."DML_BY" IS 'by whom the entry has last been changed';
   COMMENT ON TABLE "DL_BORDERCONTROL"."OFFLINE_MODE"  IS 'Table to store the bmbs offline versions';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."OFFLINE_MODE$PK" ON "DL_BORDERCONTROL"."OFFLINE_MODE" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."OFFLINE_MODE$UQ01" ON "DL_BORDERCONTROL"."OFFLINE_MODE" ("FILE_VERSION") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000489703C00002$$" ON "DL_BORDERCONTROL"."OFFLINE_MODE" (
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."OFFLINE_MODE" TO "DL_COMMON";
  GRANT INSERT ON "DL_BORDERCONTROL"."OFFLINE_MODE" TO "DL_COMMON";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_MODE" TO "DL_COMMON";
  GRANT UPDATE ON "DL_BORDERCONTROL"."OFFLINE_MODE" TO "DL_COMMON";
  GRANT SELECT ON "DL_BORDERCONTROL"."OFFLINE_MODE" TO "TESTADM";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."OFFLINE_MODE$TIUD0" 
	before update on DL_BORDERCONTROL.OFFLINE_MODE for each row
--
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------
* MStahl    10.04.2019  Added
*******************************************************************************/
--
begin
	:new.dml_at := systimestamp;
	:new.dml_by := dl_common.pkg_session.get_audit_user();
end;
/
ALTER TRIGGER "DL_BORDERCONTROL"."OFFLINE_MODE$TIUD0" ENABLE;
