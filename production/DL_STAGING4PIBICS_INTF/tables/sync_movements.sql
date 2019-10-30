CREATE TABLE "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" 
   (	"SEQNO" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATE_DATE" DATE NOT NULL ENABLE, 
	"MVMNTID" VARCHAR2(32 CHAR), 
	"BRDDOCID" VARCHAR2(32 CHAR), 
	"KV_ENTRY_FORMS" VARCHAR2(32 CHAR), 
	"MOVEMENT_DT" DATE, 
	"DOCNO" VARCHAR2(20 CHAR), 
	"EXITFLG" NUMBER(*,0) NOT NULL ENABLE, 
	"ISSUECTRY" VARCHAR2(20 CHAR), 
	"EXPIRYDATE" DATE, 
	"TM6NO" VARCHAR2(32 CHAR), 
	"IS_ACTIVE_IN_MVLOG" VARCHAR2(1 CHAR) DEFAULT 'Y' NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT 'I' NOT NULL ENABLE, 
	"DML_START_TS" TIMESTAMP (6) DEFAULT systimestamp NOT NULL ENABLE, 
	"CURRENTNESS_IN_PIBICS" DATE NOT NULL ENABLE, 
	"PIBICS_TABLE_CD" VARCHAR2(1 CHAR) DEFAULT 'T' NOT NULL ENABLE, 
	"CURRENTNESS_IN_BC" DATE, 
	"ROW_SHALL_BE_IGNORED" VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" ADD CONSTRAINT "SYNC_MOVEMENTS_PK" PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" ADD CONSTRAINT "SYNC_MOVEMENTS_FK1" FOREIGN KEY ("MVMNTID")
	  REFERENCES "DL_BORDERCONTROL"."MOVEMENTS" ("MVMNTID") ON DELETE SET NULL ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."SEQNO" IS 'PK of PIBICS table';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."MVMNTID" IS 'PK of DL_BORDERCONTROL.MOVEMENTS  table';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."BRDDOCID" IS 'PK of DL_BORDERCONTROL.BORDERDOCUMENTS';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."KV_ENTRY_FORMS" IS 'PK of DL_BORDERCONTROL.ENTRY_FORMS';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."MOVEMENT_DT" IS 'Business UK of  DL_BORDERCONTROL table';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."TM6NO" IS 'Business UK of  DL_BORDERCONTROL table';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."DML_TYPE" IS 'Type of last logical DML I,U,D';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."DML_START_TS" IS 'Start of last run which touched this row';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."CURRENTNESS_IN_PIBICS" IS 'The update or create date in the source';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."PIBICS_TABLE_CD" IS 'Code for input table from PIBICS: T = TMINOUT, C = CREW, A = Archive ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."CURRENTNESS_IN_BC" IS 'The update or create date in the target (movement)';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"."ROW_SHALL_BE_IGNORED" IS 'This data is garbage and cannot be processed';
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS"  IS 'sync table of DL_BORDERCONTROL.MOVEMENTS,BORDERDOCUMENTS  and  ENTRY_FORMS ';
  CREATE INDEX "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_CD" ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" ("CREATE_DATE") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS_PK" ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" ("SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_MOVEMENTS" TO "BIOSUPPORT";
