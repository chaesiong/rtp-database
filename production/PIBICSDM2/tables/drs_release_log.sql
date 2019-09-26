CREATE TABLE "PIBICSDM2"."DRS_RELEASE_LOG" 
   (	"RELEASE_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"DOCNO" VARCHAR2(100 CHAR), 
	"DOC_DATE" DATE, 
	"ISSUEDEPT_SEQNO" NUMBER, 
	"ISSUE_DATE" DATE, 
	"ISSUENM" VARCHAR2(100 CHAR), 
	"NOTE" VARCHAR2(200 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"DETAIN_NO" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(50 CHAR), 
	"RELEASE_LOG_SEQNO" NUMBER, 
	"RELEASETYPE_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_RELEASE_LOG" ADD PRIMARY KEY ("RELEASE_LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_RELEASE_LOG" ADD CONSTRAINT "DRS_RELEASE_LOG_R01" FOREIGN KEY ("RELEASETYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_RELEASETYPE" ("RELEASETYPE_SEQNO") ENABLE;
  ;
