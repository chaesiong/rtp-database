CREATE TABLE "PIBICSDM2"."RQS_TM14DOCATT" 
   (	"TM14DOCATT_SEQNO" NUMBER, 
	"TM14_SEQNO" NUMBER, 
	"DOCATT_1" CHAR(1 CHAR), 
	"DOCATT_2" CHAR(1 CHAR), 
	"DOCATT_3" CHAR(1 CHAR), 
	"DOCATT_4" CHAR(1 CHAR), 
	"DOCATT_5" CHAR(1 CHAR), 
	"DOCATT_6" CHAR(1 CHAR), 
	"DOCATT_7" CHAR(1 CHAR), 
	"DOCATT_8" CHAR(1 CHAR), 
	"DOCATT_91" CHAR(1 CHAR), 
	"DOCATT_10" CHAR(1 CHAR), 
	"DOCATT_11" CHAR(1 CHAR), 
	"DOCATT_121" CHAR(1 CHAR), 
	"DOCATT_131" CHAR(1 CHAR), 
	"DOCATT_141" CHAR(1 CHAR), 
	"DOCATT_151" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DOCATT_8DESC" VARCHAR2(2000 CHAR), 
	"DOCATT_92" CHAR(1 CHAR), 
	"DOCATT_93" CHAR(1 CHAR), 
	"DOCATT_94" CHAR(1 CHAR), 
	"DOCATT_132" CHAR(1 CHAR), 
	"DOCATT_133" CHAR(1 CHAR), 
	"DOCATT_142" CHAR(1 CHAR), 
	"DOCATT_15" CHAR(1 CHAR), 
	"DOCATT_122" CHAR(1 CHAR), 
	"DOCATT_152" VARCHAR2(2000 CHAR), 
	"DOCATT_153" VARCHAR2(2000 CHAR), 
	"DOCATT_154" VARCHAR2(2000 CHAR), 
	"DOCATT_155" VARCHAR2(2000 CHAR), 
	"DOCATT_134" VARCHAR2(1 CHAR), 
	"DOCATT_16" VARCHAR2(1 CHAR), 
	"DOCATT_17" VARCHAR2(1 CHAR), 
	"DOCATT_18" VARCHAR2(1 CHAR), 
	"DOCATT_19" VARCHAR2(1 CHAR), 
	"DOCATT_20" VARCHAR2(1 CHAR), 
	"DOCATT_21" VARCHAR2(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM14DOCATT" ADD CONSTRAINT "RQS_TM14DOCATT_PK" PRIMARY KEY ("TM14DOCATT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_TM14DOCATT" ADD FOREIGN KEY ("TM14_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_TM14" ("TM14_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM14DOCATT_PK" ON "PIBICSDM2"."RQS_TM14DOCATT" ("TM14DOCATT_SEQNO") 
  ;