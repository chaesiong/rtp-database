CREATE TABLE "PIBICSDM2"."FUNCTIONAREALOG" 
   (	"FAID" NUMBER(10,0), 
	"AREAID" VARCHAR2(20 CHAR), 
	"FUNCTIONCD" VARCHAR2(20 CHAR), 
	"MAXROW" NUMBER(10,0), 
	"TIMEOUT" NUMBER(10,0), 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"FUNCTIONAREALOGID" NUMBER(10,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."FUNCTIONAREALOG" ADD CONSTRAINT "FUNCTIONAREALOG_PK" PRIMARY KEY ("FUNCTIONAREALOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FUNCTIONAREALOG_PK" ON "PIBICSDM2"."FUNCTIONAREALOG" ("FUNCTIONAREALOGID") 
  ;
