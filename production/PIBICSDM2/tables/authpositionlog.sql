CREATE TABLE "PIBICSDM2"."AUTHPOSITIONLOG" 
   (	"AUTHPOSID" NUMBER(10,0), 
	"WKGCD" VARCHAR2(20 CHAR), 
	"POSLEVELID" CHAR(2 CHAR), 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"AUTHPOSITIONLOGID" NUMBER(5,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."AUTHPOSITIONLOG" ADD CONSTRAINT "AUTHPOSITIONLOG_PK" PRIMARY KEY ("AUTHPOSITIONLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."AUTHPOSITIONLOG_PK" ON "PIBICSDM2"."AUTHPOSITIONLOG" ("AUTHPOSITIONLOGID") 
  ;