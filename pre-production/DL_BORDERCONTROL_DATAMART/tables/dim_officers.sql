CREATE TABLE "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(128 CHAR), 
	"CREATE_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE NOT NULL ENABLE, 
	"MODIFY_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" ADD CONSTRAINT "DIM_OFFICERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS"."ID" IS 'Officers from Dermalog Usermanagement';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS_PK" ON "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" ("ID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_OFFICERS" TO "TESTADM";