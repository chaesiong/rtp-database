CREATE TABLE "PIBICSDM2"."OT_BANKACCOUNT_LOG" 
   (	"BANKACCTSEQNOLOG" NUMBER, 
	"BANKACCTSEQNO" NUMBER, 
	"BANK_SEQNO" NUMBER, 
	"BANKACCTNO" VARCHAR2(15 CHAR), 
	"PROFILE_SEQNO" NUMBER, 
	"BANKACCTNAME" VARCHAR2(100 CHAR), 
	"BANKBRANCH" VARCHAR2(100 CHAR), 
	"BANKREMARK" VARCHAR2(600 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_USERID" VARCHAR2(30 CHAR), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_BANKACCOUNT_LOG" ADD CONSTRAINT "OT_BANKACCOUNT_LOG_PK" PRIMARY KEY ("BANKACCTSEQNOLOG")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_BANKACCOUNT_LOG" ADD CONSTRAINT "OT_BANKACCOUNT_LOG_R01" FOREIGN KEY ("BANK_SEQNO")
	  REFERENCES "PIBICSDM2"."BANK" ("BANK_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_BANKACCOUNT_LOG_PK" ON "PIBICSDM2"."OT_BANKACCOUNT_LOG" ("BANKACCTSEQNOLOG") 
  ;