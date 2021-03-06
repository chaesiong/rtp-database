CREATE TABLE "PIBICSDM2"."TRAIN_SCHEDULE" 
   (	"SCH_SEQNO" NUMBER, 
	"SCH_TOPIC" VARCHAR2(100 CHAR), 
	"SCH_STARTDATE" DATE, 
	"SCH_STARTTIME" CHAR(5 CHAR), 
	"SCH_ENDDATE" DATE, 
	"SCH_ENDTIME" CHAR(5 CHAR), 
	"SCH_PLACEDETAIL" VARCHAR2(100 CHAR), 
	"INS_SEQNO" NUMBER, 
	"COURSE_SEQNO" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_SCHEDULE" ADD CONSTRAINT "TRAIN_SCHEDULE_PK" PRIMARY KEY ("SCH_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_SCHEDULE" ADD CONSTRAINT "TRAIN_SCHEDULE_R01" FOREIGN KEY ("COURSE_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_COURSE" ("COURSE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_SCHEDULE" ADD CONSTRAINT "TRAIN_SCHEDULE_R02" FOREIGN KEY ("INS_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_INSTRUCTOR" ("INS_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_SCHEDULE_PK" ON "PIBICSDM2"."TRAIN_SCHEDULE" ("SCH_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TRAIN_SCHEDULE" TO "BIOSAADM";
