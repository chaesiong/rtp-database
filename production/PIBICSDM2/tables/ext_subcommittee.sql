CREATE TABLE "PIBICSDM2"."EXT_SUBCOMMITTEE" 
   (	"SUBCOMMITTEE_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"SMEETING_NO" VARCHAR2(20 CHAR), 
	"SMEETING_DATE" DATE, 
	"SREMARK" VARCHAR2(1000 CHAR), 
	"SRESOLVE" CHAR(1 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"SR_DETAIL" VARCHAR2(200 CHAR), 
	"SDATE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_SUBCOMMITTEE" ADD CONSTRAINT "EXT_SUBCOMMITEE_PK" PRIMARY KEY ("SUBCOMMITTEE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_SUBCOMMITTEE" ADD CONSTRAINT "EXT_SUBCOMMITTEE_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_SUBCOMMITEE_PK" ON "PIBICSDM2"."EXT_SUBCOMMITTEE" ("SUBCOMMITTEE_SEQNO") 
  ;