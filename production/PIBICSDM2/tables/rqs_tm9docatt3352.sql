CREATE TABLE "PIBICSDM2"."RQS_TM9DOCATT3352" 
   (	"TM9DOCATT3352_SEQNO" NUMBER, 
	"TM9_SEQNO" NUMBER, 
	"DOCATT3352_1" CHAR(1 CHAR), 
	"DOCATT3352_2" CHAR(1 CHAR), 
	"DOCATT3352_3" CHAR(1 CHAR), 
	"DOCATT3352_41" CHAR(1 CHAR), 
	"DOCATT3352_42" CHAR(1 CHAR), 
	"DOCATT3352_43" CHAR(1 CHAR), 
	"DOCATT3352_44" CHAR(1 CHAR), 
	"DOCATT3352_5" CHAR(1 CHAR), 
	"DOCATT3352_5DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3352_61" CHAR(1 CHAR), 
	"DOCATT3352_62" CHAR(1 CHAR), 
	"DOCATT3352_71" CHAR(1 CHAR), 
	"DOCATT3352_72" CHAR(1 CHAR), 
	"DOCATT3352_81" CHAR(1 CHAR), 
	"DOCATT3352_82" CHAR(1 CHAR), 
	"DOCATT3352_9" CHAR(1 CHAR), 
	"DOCATT3352_9DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3352_10" CHAR(1 CHAR), 
	"DOCATT3352_10DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3352_11" CHAR(1 CHAR), 
	"DOCATT3352_12" CHAR(1 CHAR), 
	"DOCATT3352_13" CHAR(1 CHAR), 
	"DOCATT3352_13DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3352_14" CHAR(1 CHAR), 
	"DOCATT3352_15" CHAR(1 CHAR), 
	"DOCATT3352_15DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3352_16" CHAR(1 CHAR), 
	"DOCATT3352_17" CHAR(1 CHAR), 
	"DOCATT3352_18" CHAR(1 CHAR), 
	"DOCATT3352_19" CHAR(1 CHAR), 
	"DOCATT3352_20" CHAR(1 CHAR), 
	"DOCATT3352_20DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3352_211" CHAR(1 CHAR), 
	"DOCATT3352_212" CHAR(1 CHAR), 
	"DOCATT3352_213" CHAR(1 CHAR), 
	"DOCATT3352_22" CHAR(1 CHAR), 
	"DOCATT3352_22DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3352_23" CHAR(1 CHAR), 
	"DOCATT3352_231" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DOCATT3352_232" VARCHAR2(2000 CHAR), 
	"DOCATT3352_233" VARCHAR2(2000 CHAR), 
	"DOCATT3352_234" VARCHAR2(2000 CHAR), 
	"DOCATT3352_235" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3352" ADD CONSTRAINT "RQS_TM9DOCATT3352_PK" PRIMARY KEY ("TM9DOCATT3352_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3352" ADD FOREIGN KEY ("TM9_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_TM9" ("TM9_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM9DOCATT3352_PK" ON "PIBICSDM2"."RQS_TM9DOCATT3352" ("TM9DOCATT3352_SEQNO") 
  ;
