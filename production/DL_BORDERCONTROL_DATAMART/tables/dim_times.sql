CREATE TABLE "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE, 
	"YEAR_NUMERIC" NUMBER(4,0), 
	"MONTH_NUMERIC" NUMBER(2,0), 
	"WEEKDAY_NUMERIC" NUMBER(1,0), 
	"HOUR24_NUMERIC" NUMBER(2,0), 
	"MONTH_NAME" VARCHAR2(50 CHAR), 
	"WEEKDAY_NAME" VARCHAR2(50 CHAR), 
	"QUARTER_NUMERIC" NUMBER(1,0), 
	"QUARTER_NAME" VARCHAR2(100 CHAR), 
	"CALWEEK_NUMERIC" NUMBER(2,0), 
	"CREATE_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE NOT NULL ENABLE, 
	"DATE_VALUE" DATE, 
	"DAY_NUMERIC" NUMBER(2,0), 
	"MODIFY_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" ADD CONSTRAINT "DIM_TIME_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL_DATAMART"."DIM_TIMES"."ID" IS 'Format: YYYYDDMMHH24';
   COMMENT ON COLUMN "DL_BORDERCONTROL_DATAMART"."DIM_TIMES"."DATE_VALUE" IS 'The date value of this day';
  CREATE BITMAP INDEX "DL_BORDERCONTROL_DATAMART"."DIM_TIMES_MONTH_IDX" ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" ("MONTH_NUMERIC", "MONTH_NAME") 
  ;
CREATE BITMAP INDEX "DL_BORDERCONTROL_DATAMART"."DIM_TIMES_YEAR_BIDX" ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" ("YEAR_NUMERIC") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL_DATAMART"."DIM_TIME_PK" ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" ("ID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_TIMES" TO "APPSUP";
