CREATE TABLE "PIBICSDM2"."WORKPERMISSIONLOG" 
   (	"WORKPERID" NUMBER(10,0), 
	"FAID" NUMBER(10,0), 
	"WKGCD" VARCHAR2(20 CHAR), 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"WORKPERMISSIONLOGID" NUMBER(5,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."WORKPERMISSIONLOG" ADD CONSTRAINT "WORKPERMISSIONLOG_PK" PRIMARY KEY ("WORKPERMISSIONLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WORKPERMISSIONLOG_PK" ON "PIBICSDM2"."WORKPERMISSIONLOG" ("WORKPERMISSIONLOGID") 
  ;
