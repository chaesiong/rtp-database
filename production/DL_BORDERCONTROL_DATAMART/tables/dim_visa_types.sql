CREATE TABLE "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(128 CHAR), 
	"CREATE_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE NOT NULL ENABLE, 
	"MODIFY_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" ADD CONSTRAINT "DIM_VISA_TYPES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES_PK" ON "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" ("ID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_VISA_TYPES" TO "APPSUP";
