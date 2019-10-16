CREATE TABLE "PIBICSDM2"."RFC_TM3" 
   (	"TM3_SEQNO" NUMBER, 
	"TM2_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"GENDER" CHAR(1 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RFC_TM3" ADD CONSTRAINT "RFC_TM3_PK" PRIMARY KEY ("TM3_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RFC_TM3_PK" ON "PIBICSDM2"."RFC_TM3" ("TM3_SEQNO") 
  ;