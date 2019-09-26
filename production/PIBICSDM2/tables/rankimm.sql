CREATE TABLE "PIBICSDM2"."RANKIMM" 
   (	"RANKID" CHAR(2 CHAR), 
	"RANKNM" VARCHAR2(60 CHAR), 
	"RANKFULLNM" VARCHAR2(60 CHAR), 
	"RANKLEVEL" CHAR(1 CHAR), 
	"UPDUSER" CHAR(6 CHAR), 
	"UPDDTE" DATE, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RANKIMM" ADD CONSTRAINT "RANKIMMID_PK" PRIMARY KEY ("RANKID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RANKIMMID_PK" ON "PIBICSDM2"."RANKIMM" ("RANKID") 
  ;
