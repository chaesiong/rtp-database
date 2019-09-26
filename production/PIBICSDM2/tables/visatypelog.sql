CREATE TABLE "PIBICSDM2"."VISATYPELOG" 
   (	"VISATYPECD" CHAR(4 CHAR), 
	"VISATYPETNM" VARCHAR2(60 CHAR), 
	"VISATYPEENM" VARCHAR2(60 CHAR), 
	"PERMITTDAYS" NUMBER(*,0) DEFAULT 0, 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"VISATYPELOGID" NUMBER(5,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."VISATYPELOG" ADD CONSTRAINT "VISATYPELOG_PK" PRIMARY KEY ("VISATYPELOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."VISATYPELOG_PK" ON "PIBICSDM2"."VISATYPELOG" ("VISATYPELOGID") 
  ;
