CREATE TABLE "PIBICSDM2"."RANKLOG" 
   (	"RANKID" CHAR(2 CHAR), 
	"RANKNM" VARCHAR2(60 CHAR), 
	"RANKFULLNM" VARCHAR2(60 CHAR), 
	"RANKLEVEL" CHAR(1 CHAR), 
	"UPDUSER" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"ACTFLAG" CHAR(1 CHAR), 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"RANKLOGID" NUMBER(5,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."RANKLOG" ADD CONSTRAINT "RANKLOG_PK" PRIMARY KEY ("RANKLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RANKLOG_PK" ON "PIBICSDM2"."RANKLOG" ("RANKLOGID") 
  ;
