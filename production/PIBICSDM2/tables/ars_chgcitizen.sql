CREATE TABLE "PIBICSDM2"."ARS_CHGCITIZEN" 
   (	"CHGCITIZEN_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"GAZETIENO" VARCHAR2(100 CHAR), 
	"GAZETIEBOOKNO" VARCHAR2(100 CHAR), 
	"GAZETIEAS" VARCHAR2(1500 CHAR), 
	"GAZETIE_DATE" DATE, 
	"NOTICEPLS_SEQNO" NUMBER, 
	"NOTICEPLS_DATE" DATE, 
	"NOTICEPLS_NO" VARCHAR2(1500 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"NPOLISBH_SEQNO" NUMBER, 
	"NPOLISPV_SEQNO" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"CITIZENTYPE" CHAR(1 CHAR), 
	"GAINTYPE" CHAR(1 CHAR), 
	"GAINTYPEO_DESC" VARCHAR2(1000 CHAR), 
	"COPYRIGHTNO" VARCHAR2(100 CHAR), 
	"COPYRIGHT_DATE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_CHGCITIZEN" ADD CONSTRAINT "ARS_CHGCITIZEN_PK" PRIMARY KEY ("CHGCITIZEN_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGCITIZEN" ADD CONSTRAINT "ARS_CHGCITIZEN_R01" FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_CHGCITIZEN_PK" ON "PIBICSDM2"."ARS_CHGCITIZEN" ("CHGCITIZEN_SEQNO") 
  ;
