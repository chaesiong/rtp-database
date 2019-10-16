CREATE TABLE "PIBICSDM2"."FS_ACCOUNTLOG" 
   (	"FSALOGSEQNO" NUMBER, 
	"FSACCOUNTSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"DEPT2LEVEL_SEQNO" NUMBER, 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_ACCOUNTLOG" ADD CONSTRAINT "FS_ACCOUNTLOG_PK" PRIMARY KEY ("FSALOGSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_ACCOUNTLOG_PK" ON "PIBICSDM2"."FS_ACCOUNTLOG" ("FSALOGSEQNO") 
  ;