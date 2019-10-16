CREATE TABLE "PIBICSDM2"."RQS_TM9DOCATT3321" 
   (	"TM9_SEQNO" NUMBER, 
	"TM9DOCATT3321_SEQNO" NUMBER, 
	"DOCATT3321_1" CHAR(1 CHAR), 
	"DOCATT3321_2" CHAR(1 CHAR), 
	"DOCATT3321_3" CHAR(1 CHAR), 
	"DOCATT3321_41" CHAR(1 CHAR), 
	"DOCATT3321_42" CHAR(1 CHAR), 
	"DOCATT3321_42DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3321_51" CHAR(1 CHAR), 
	"DOCATT3321_52" CHAR(1 CHAR), 
	"DOCATT3321_53" CHAR(1 CHAR), 
	"DOCATT3321_61" CHAR(1 CHAR), 
	"DOCATT3321_62" CHAR(1 CHAR), 
	"DOCATT3321_62DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3321_71" CHAR(1 CHAR), 
	"DOCATT3321_72" CHAR(1 CHAR), 
	"DOCATT3321_81" CHAR(1 CHAR), 
	"DOCATT3321_82" CHAR(1 CHAR), 
	"DOCATT3321_9" CHAR(1 CHAR), 
	"DOCATT3321_9DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3321_10" CHAR(1 CHAR), 
	"DOCATT3321_10DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3321_11" CHAR(1 CHAR), 
	"DOCATT3321_12" CHAR(1 CHAR), 
	"DOCATT3321_13" CHAR(1 CHAR), 
	"DOCATT3321_14" CHAR(1 CHAR), 
	"DOCATT3321_14DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3321_15" CHAR(1 CHAR), 
	"DOCATT3321_16" CHAR(1 CHAR), 
	"DOCATT3321_17" CHAR(1 CHAR), 
	"DOCATT3321_18" CHAR(1 CHAR), 
	"DOCATT3321_191" CHAR(1 CHAR), 
	"DOCATT3321_192" CHAR(1 CHAR), 
	"DOCATT3321_193" CHAR(1 CHAR), 
	"DOCATT3321_20" CHAR(1 CHAR), 
	"DOCATT3321_21" CHAR(1 CHAR), 
	"DOCATT3321_211" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DOCATT3321_212" VARCHAR2(2000 CHAR), 
	"DOCATT3321_213" VARCHAR2(2000 CHAR), 
	"DOCATT3321_214" VARCHAR2(2000 CHAR), 
	"DOCATT3321_215" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3321" ADD CONSTRAINT "RQS_TM9DOCATT3321_PK" PRIMARY KEY ("TM9DOCATT3321_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3321" ADD FOREIGN KEY ("TM9_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_TM9" ("TM9_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM9DOCATT3321_PK" ON "PIBICSDM2"."RQS_TM9DOCATT3321" ("TM9DOCATT3321_SEQNO") 
  ;