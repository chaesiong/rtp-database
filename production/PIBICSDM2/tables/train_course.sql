CREATE TABLE "PIBICSDM2"."TRAIN_COURSE" 
   (	"COURSE_SEQNO" NUMBER, 
	"PLACE_SEQNO" NUMBER, 
	"COURSE_CODE" VARCHAR2(10 CHAR), 
	"COURSE_NAME" VARCHAR2(200 CHAR), 
	"COURSE_TYPE" VARCHAR2(40 CHAR), 
	"COURSE_STATUS" CHAR(1 CHAR), 
	"COURSE_BUDGET" VARCHAR2(10 CHAR), 
	"COURSE_FISCALYEAR" VARCHAR2(4 CHAR), 
	"COURSE_CLASSNO" NUMBER, 
	"COURSE_STARTDATE" DATE, 
	"COURSE_ENDDATE" DATE, 
	"COURSE_PLACEDETAIL" VARCHAR2(100 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"COURSE_OTHERTYPE" VARCHAR2(100 CHAR), 
	"COURSE_STARTTIME" CHAR(5 CHAR), 
	"COURSE_ENDTIME" CHAR(5 CHAR), 
	"COURSE_FILE1" VARCHAR2(60 CHAR), 
	"COURSE_FILE2" VARCHAR2(60 CHAR), 
	"COURSE_FILE3" VARCHAR2(60 CHAR), 
	"COURSE_FILE4" VARCHAR2(60 CHAR), 
	"COURSE_FILE5" VARCHAR2(60 CHAR), 
	"REMARK1" VARCHAR2(100 CHAR), 
	"REMARK2" VARCHAR2(100 CHAR), 
	"REMARK3" VARCHAR2(100 CHAR), 
	"REMARK4" VARCHAR2(100 CHAR), 
	"REMARK5" VARCHAR2(100 CHAR), 
	"COURSE_PERPASS" NUMBER(10,2), 
	"COURSE_STDSCORE" NUMBER(10,2), 
	"COURSE_PERSCORE" NUMBER(10,2)
   ) ;
  ALTER TABLE "PIBICSDM2"."TRAIN_COURSE" ADD CONSTRAINT "TRAIN_COURSE_PK" PRIMARY KEY ("COURSE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TRAIN_COURSE" ADD CONSTRAINT "TRAIN_COURSE_R01" FOREIGN KEY ("PLACE_SEQNO")
	  REFERENCES "PIBICSDM2"."TRAIN_PLACE" ("PLACE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TRAIN_COURSE_PK" ON "PIBICSDM2"."TRAIN_COURSE" ("COURSE_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TRAIN_COURSE" TO "BIOSAADM";
