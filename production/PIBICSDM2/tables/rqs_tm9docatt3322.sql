CREATE TABLE "PIBICSDM2"."RQS_TM9DOCATT3322" 
   (	"TM9DOCATT3322_SEQNO" NUMBER, 
	"TM9_SEQNO" NUMBER, 
	"DOCATT3322_1" CHAR(1 CHAR), 
	"DOCATT3322_2" CHAR(1 CHAR), 
	"DOCATT3322_3" CHAR(1 CHAR), 
	"DOCATT3322_41" CHAR(1 CHAR), 
	"DOCATT3322_42" CHAR(1 CHAR), 
	"DOCATT3322_42DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3322_51" CHAR(1 CHAR), 
	"DOCATT3322_52" CHAR(1 CHAR), 
	"DOCATT3322_53" CHAR(1 CHAR), 
	"DOCATT3322_61" CHAR(1 CHAR), 
	"DOCATT3322_62" CHAR(1 CHAR), 
	"DOCATT3322_62DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3322_71" CHAR(1 CHAR), 
	"DOCATT3322_72" CHAR(1 CHAR), 
	"DOCATT3322_81" CHAR(1 CHAR), 
	"DOCATT3322_82" CHAR(1 CHAR), 
	"DOCATT3322_9" CHAR(1 CHAR), 
	"DOCATT3322_9DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3322_10" CHAR(1 CHAR), 
	"DOCATT3322_10DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3322_11" CHAR(1 CHAR), 
	"DOCATT3322_12" CHAR(1 CHAR), 
	"DOCATT3322_13" CHAR(1 CHAR), 
	"DOCATT3322_14" CHAR(1 CHAR), 
	"DOCATT3322_14DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3322_15" CHAR(1 CHAR), 
	"DOCATT3322_16" CHAR(1 CHAR), 
	"DOCATT3322_17" CHAR(1 CHAR), 
	"DOCATT3322_18" CHAR(1 CHAR), 
	"DOCATT3322_191" CHAR(1 CHAR), 
	"DOCATT3322_192" CHAR(1 CHAR), 
	"DOCATT3322_193" CHAR(1 CHAR), 
	"DOCATT3322_20" CHAR(1 CHAR), 
	"DOCATT3322_21" CHAR(1 CHAR), 
	"DOCATT3322_211" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DOCATT3322_212" VARCHAR2(2000 CHAR), 
	"DOCATT3322_213" VARCHAR2(2000 CHAR), 
	"DOCATT3322_214" VARCHAR2(2000 CHAR), 
	"DOCATT3322_215" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3322" ADD CONSTRAINT "RQS_TM9DOCATT3322_PK" PRIMARY KEY ("TM9DOCATT3322_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3322" ADD FOREIGN KEY ("TM9_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_TM9" ("TM9_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM9DOCATT3322_PK" ON "PIBICSDM2"."RQS_TM9DOCATT3322" ("TM9DOCATT3322_SEQNO") 
  ;
