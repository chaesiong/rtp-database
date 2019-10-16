CREATE TABLE "PIBICSDM2"."ARS_COPYRECEIPT" 
   (	"COPYRECEIPT_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"REPTBOOK_NO" VARCHAR2(10 CHAR), 
	"REPTNO" NUMBER, 
	"REPT_DATE" DATE, 
	"ACPLS_SEQNO" NUMBER, 
	"PLSCD" CHAR(4 CHAR), 
	"RECEIPTCD" CHAR(1 CHAR), 
	"REPTDESC" VARCHAR2(100 CHAR), 
	"AMOUNT" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACPV_SEQNO" NUMBER, 
	"ACBH_SEQNO" NUMBER, 
	"REPTPHOTO" VARCHAR2(100 CHAR), 
	"FLAG" CHAR(1 CHAR), 
	"COPYRIGHTNO_REPT" VARCHAR2(100 CHAR), 
	"COPYRIGHT_DATEREPT" DATE, 
	"TO_NO" VARCHAR2(200 CHAR), 
	"TO_DATED" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_COPYRECEIPT" ADD CONSTRAINT "ARS_COPYRECEIPT_PK" PRIMARY KEY ("COPYRECEIPT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_COPYRECEIPT" ADD FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_COPYRECEIPT_PK" ON "PIBICSDM2"."ARS_COPYRECEIPT" ("COPYRECEIPT_SEQNO") 
  ;