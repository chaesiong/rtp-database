CREATE TABLE "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" 
   (	"STEP_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"RUN_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"TOPIC" VARCHAR2(500 CHAR) NOT NULL ENABLE, 
	"SESSION_SID" NUMBER NOT NULL ENABLE, 
	"TAG" VARCHAR2(2000 CHAR) NOT NULL ENABLE, 
	"PROGRAM_UNIT" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"CALLED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"SUBTOPIC" VARCHAR2(500 CHAR) NOT NULL ENABLE, 
	"START_TS" TIMESTAMP (6) NOT NULL ENABLE, 
	"END_TS" TIMESTAMP (6), 
	"EVENTS" VARCHAR2(1000 CHAR), 
	"CNT_PROCESSED" NUMBER DEFAULT 0, 
	"TIMEFRAME" VARCHAR2(8 CHAR), 
	"BATCHSIZE" NUMBER, 
	"CNT_INPUT" NUMBER DEFAULT 0
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" ADD CONSTRAINT "LOG_RUN_STEPS" PRIMARY KEY ("RUN_ID", "STEP_ID")
  USING INDEX (CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS_PK" ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" ("STEP_ID", "RUN_ID") 
  )  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."STEP_ID" IS 'technical ident';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."RUN_ID" IS 'ID of the whole run ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."TOPIC" IS 'mostly the name of the process';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."SESSION_SID" IS 'The session ID of the run, can be used to detect crashed runs because their session does not exist any longer';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."TAG" IS 'severaal runs can be grouoped together with a common tag for easier magaement';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."PROGRAM_UNIT" IS 'top level entry point of this run';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."CALLED_BY" IS 'whodunnit, the usual audit user ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."SUBTOPIC" IS 'mostly the name of the table which was written';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."START_TS" IS 'One of the defining elements of a run';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."END_TS" IS 'Filled at the end of the run. Runs without this are still running or abended .Only set when the process ends at all';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."EVENTS" IS 'List of business-oriented events in this run, amended by the program, business oriented';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."CNT_PROCESSED" IS 'Number of processed rows';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."TIMEFRAME" IS 'Timeframe of the process';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."BATCHSIZE" IS 'Batchsize of the merge process';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"."CNT_INPUT" IS 'Number of rows in iinput';
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS"  IS 'One row for every step of a process run  Steps  without a filled END_TS are considered broken or running';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS_PK" ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" ("STEP_ID", "RUN_ID") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "TESTADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."LOG_RUN_STEPS" TO "TRAINEE";