CREATE TABLE "PIBICSDM2"."ARS_CLOSEPHOTOHIST" 
   (	"CLOSEPHOTOHIST_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"CASETYPE" CHAR(1 CHAR), 
	"CASEDESC" VARCHAR2(100 CHAR), 
	"CLOSE_DATE" DATE, 
	"NOTICEPLS_SEQNO" NUMBER, 
	"NOTICE_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"NOTICE_NO" VARCHAR2(20 CHAR), 
	"NPOLISBH_SEQNO" NUMBER, 
	"NPOLISPV_SEQNO" NUMBER, 
	"PHOTO" VARCHAR2(100 CHAR), 
	"FLAG" CHAR(1 CHAR), 
	"COPYRIGHTNO" VARCHAR2(100 CHAR), 
	"COPYRIGHT_DATE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_CLOSEPHOTOHIST" ADD CONSTRAINT "ARS_CLOSEPHOTOHIST_PK" PRIMARY KEY ("CLOSEPHOTOHIST_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CLOSEPHOTOHIST" ADD FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_CLOSEPHOTOHIST_PK" ON "PIBICSDM2"."ARS_CLOSEPHOTOHIST" ("CLOSEPHOTOHIST_SEQNO") 
  ;
