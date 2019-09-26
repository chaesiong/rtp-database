CREATE TABLE "PIBICSDM2"."FS_DEPTCHANGEPERSONLOG" 
   (	"FSDCPERSONLOGSEQNO" NUMBER, 
	"FSDEPTCHANGELOGSEQNO" NUMBER, 
	"FSDCPERSONSEQNO" NUMBER, 
	"FSDEPTCHANGESEQNO" NUMBER, 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"PROFILE_SEQNO" NUMBER, 
	"CHANGEDATE" DATE, 
	"ORGDEPT_SEQNO" NUMBER, 
	"NEWDEPT_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USERID" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_DEPTCHANGEPERSONLOG" ADD CONSTRAINT "FS_DEPTCHANGEPERSONLOG_PK" PRIMARY KEY ("FSDCPERSONLOGSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_DEPTCHANGEPERSONLOG" ADD CONSTRAINT "FS_DEPTCHANGEPERSONLOG_R01" FOREIGN KEY ("FSDEPTCHANGELOGSEQNO")
	  REFERENCES "PIBICSDM2"."FS_DEPTCHANGELOG" ("FSDEPTCHANGELOGSEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_DEPTCHANGEPERSONLOG_PK" ON "PIBICSDM2"."FS_DEPTCHANGEPERSONLOG" ("FSDCPERSONLOGSEQNO") 
  ;
