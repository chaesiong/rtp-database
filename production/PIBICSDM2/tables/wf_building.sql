CREATE TABLE "PIBICSDM2"."WF_BUILDING" 
   (	"BD_ID" NUMBER, 
	"BD_NAME" VARCHAR2(200 CHAR), 
	"VERSION" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"BD_ADDR" VARCHAR2(300 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"BD_PHONENO" VARCHAR2(100 CHAR), 
	"BD_POSTNO" CHAR(5 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_BUILDING_PK" ON "PIBICSDM2"."WF_BUILDING" ("BD_ID") 
  ;
