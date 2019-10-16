CREATE TABLE "PIBICSDM2"."SYS_SYNC_LOG" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"LOG_LEVEL" VARCHAR2(20), 
	"LOG_CLASS" VARCHAR2(64), 
	"LOG_METHOD" VARCHAR2(64), 
	"REMARK" VARCHAR2(4000), 
	"ERROR_MSG" VARCHAR2(4000), 
	"START_DATETIME" TIMESTAMP (6), 
	"END_DATETIME" TIMESTAMP (6), 
	"PROCESSING_TIME" NUMBER(18,5), 
	"TABLE_NAME" VARCHAR2(255), 
	"QUERY_COMMAND" VARCHAR2(4000), 
	"ISTART_DATE" NUMBER, 
	"IEND_DATE" NUMBER, 
	"PROCESS_BY" VARCHAR2(64)
   ) ;
  ALTER TABLE "PIBICSDM2"."SYS_SYNC_LOG" ADD CONSTRAINT "SYS_LOG_SYNC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."ID" IS 'auto running';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."LOG_LEVEL" IS 'log level';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."LOG_CLASS" IS 'log class';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."LOG_METHOD" IS 'log method';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."REMARK" IS 'remark detail';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."ERROR_MSG" IS 'error message';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."START_DATETIME" IS 'start datetime';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."END_DATETIME" IS 'end datetime';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."PROCESSING_TIME" IS 'processing time';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."TABLE_NAME" IS 'ชื่อตาราง';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."QUERY_COMMAND" IS 'Query';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."ISTART_DATE" IS 'start date format number yyyyddmm';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."IEND_DATE" IS 'end date format number yyyyddmm';
   COMMENT ON COLUMN "PIBICSDM2"."SYS_SYNC_LOG"."PROCESS_BY" IS 'create by username';
  CREATE INDEX "PIBICSDM2"."SYS_LOG_SYNC_IDX1" ON "PIBICSDM2"."SYS_SYNC_LOG" ("START_DATETIME") 
  ;
  ;