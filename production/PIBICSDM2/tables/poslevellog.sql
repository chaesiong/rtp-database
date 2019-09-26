CREATE TABLE "PIBICSDM2"."POSLEVELLOG" 
   (	"POSLEVELID" CHAR(2 CHAR), 
	"POSLEVELABVNM" VARCHAR2(60 CHAR), 
	"POSLEVELFULLNM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDUSER" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"POSLEVELLOGID" NUMBER(5,0), 
	"POSLEVELENM" VARCHAR2(60 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."POSLEVELLOG" ADD CONSTRAINT "POSLEVELLOG_PK" PRIMARY KEY ("POSLEVELLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."POSLEVELLOG_PK" ON "PIBICSDM2"."POSLEVELLOG" ("POSLEVELLOGID") 
  ;
