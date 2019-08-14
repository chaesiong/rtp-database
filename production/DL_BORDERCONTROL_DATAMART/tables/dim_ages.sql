CREATE TABLE "DL_BORDERCONTROL_DATAMART"."DIM_AGES" 
   (	"ID" NUMBER(3,0) NOT NULL ENABLE, 
	"ID_AGE_GROUP_10" NUMBER(6,0), 
	"ID_ALL_AGES" NUMBER(3,0), 
	"CREATE_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE NOT NULL ENABLE, 
	"MODIFY_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL_DATAMART"."DIM_AGES" ADD CONSTRAINT "DIMENSION_AGES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL_DATAMART"."DIM_AGES"."ID" IS 'The age';
   COMMENT ON COLUMN "DL_BORDERCONTROL_DATAMART"."DIM_AGES"."ID_AGE_GROUP_10" IS 'Begin of 10 year interval (i.e. 10 means 10-19)';
   COMMENT ON COLUMN "DL_BORDERCONTROL_DATAMART"."DIM_AGES"."ID_ALL_AGES" IS 'If all ages are selected';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL_DATAMART"."DIMENSION_AGES_PK" ON "DL_BORDERCONTROL_DATAMART"."DIM_AGES" ("ID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_AGES" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_AGES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."DIM_AGES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."DIM_AGES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_AGES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."DIM_AGES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_AGES" TO "APPSUP";
