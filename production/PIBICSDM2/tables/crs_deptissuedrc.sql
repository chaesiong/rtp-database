CREATE TABLE "PIBICSDM2"."CRS_DEPTISSUEDRC" 
   (	"DEPTISSUEDRC_SEQNO" NUMBER, 
	"DEPTISSUEDRC_CODE" CHAR(3 CHAR), 
	"DEPTISSUEDRC_NAME" VARCHAR2(30 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."CRS_DEPTISSUEDRC" ADD CONSTRAINT "CRS_DEPTISSUEDRC_PK" PRIMARY KEY ("DEPTISSUEDRC_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CRS_DEPTISSUEDRC_PK" ON "PIBICSDM2"."CRS_DEPTISSUEDRC" ("DEPTISSUEDRC_SEQNO") 
  ;
