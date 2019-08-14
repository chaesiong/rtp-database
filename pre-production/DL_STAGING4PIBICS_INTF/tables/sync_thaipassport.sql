CREATE TABLE "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" 
   (	"KEY_VALUE" VARCHAR2(32), 
	"CITIZENID" VARCHAR2(13) NOT NULL ENABLE, 
	"PASSPORTNO" VARCHAR2(12) NOT NULL ENABLE, 
	"DML_START_TS" TIMESTAMP (6) DEFAULT systimestamp NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1) DEFAULT 'I' NOT NULL ENABLE, 
	"IS_ACTIVE_IN_MVLOG" VARCHAR2(1) DEFAULT 'Y' NOT NULL ENABLE, 
	"CURRENTNESS_IN_PIBICS" DATE, 
	"PIBICS_TABLE_CD" VARCHAR2(1 CHAR), 
	"CURRENTNESS_IN_BC" DATE, 
	"CREATE_DATE" DATE, 
	"ROW_SHALL_BE_IGNORED" VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" ADD CONSTRAINT "SYNC_THAIPASSPORT_CHK1" CHECK ( is_active_in_mvlog IN (
            'N',
            'Y'
        ) ) ENABLE;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" ADD CONSTRAINT "SYNC_THAIPASSPORT_PK" PRIMARY KEY ("CITIZENID", "PASSPORTNO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" ADD CONSTRAINT "SYNC_THAIPASSPORT_UK2" UNIQUE ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" ADD CONSTRAINT "SYNC_THAIPASSPORT_FK1" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_BORDERCONTROL"."THAIPASSPORT" ("KEY_VALUE") ON DELETE SET NULL ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."KEY_VALUE" IS 'FK to Bordercontrol. This column can be NULL during the sync process or when the corresponding row in the target table is deleted.';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."CITIZENID" IS 'Business Key from PIBICS';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."PASSPORTNO" IS 'Business Key from PIBICS';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."DML_START_TS" IS 'Start of last run which touched this row';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."DML_TYPE" IS 'Type of last logical DML( I,U,D) which touched this row';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."IS_ACTIVE_IN_MVLOG" IS 'If last used DMLTYPE$$ in MV-Log is ''I'' or ''U'' then the row here is considered active (Y), otherwise not (N)';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."CURRENTNESS_IN_PIBICS" IS 'The update or create date in the source';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."CURRENTNESS_IN_BC" IS 'The update or create date in the target';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"."ROW_SHALL_BE_IGNORED" IS 'This data is garbage and cannot be processed';
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT"  IS 'Shadow table of DL_BORDERCONTROL.THAIPASSPORTS. For every thaipassport which comes from PIBICS one row is inserted here.
Every thaipasport deleted in PIBICS will  be marked IS_ACTIVE_IN_MVLOG  = N here.
A row in DL_BORDERCONTROL.THAIPASSPORTS  cannot be deleted if a row here still exists. This is assured by a FK constraint.
With every writenimng access from the MV-Log side the LAST_COMMIT_TS_IN_MVLOG is set to teh val�ue from the MV-Log view';
  CREATE INDEX "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT_CD" ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" ("CREATE_DATE") 
  ;
CREATE INDEX "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT_INDEX1" ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" ("DML_START_TS") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT_PK" ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" ("CITIZENID", "PASSPORTNO") 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT_UK2" ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "TESTADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_THAIPASSPORT" TO "TRAINEE";
