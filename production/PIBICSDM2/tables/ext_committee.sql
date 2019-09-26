CREATE TABLE "PIBICSDM2"."EXT_COMMITTEE" 
   (	"COMMITTEE_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"CMEETING_NO" VARCHAR2(20 CHAR), 
	"CMEETING_DATE" DATE, 
	"CREMARK" VARCHAR2(1000 CHAR), 
	"CRESOLVE" CHAR(1 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"CR_DETAIL" VARCHAR2(200 CHAR), 
	"CDATE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_COMMITTEE" ADD CONSTRAINT "EXT_COMMITEE_PK" PRIMARY KEY ("COMMITTEE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_COMMITTEE" ADD CONSTRAINT "EXT_COMMITTEE_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_COMMITEE_PK" ON "PIBICSDM2"."EXT_COMMITTEE" ("COMMITTEE_SEQNO") 
  ;
