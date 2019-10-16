CREATE TABLE "PIBICSDM2"."FN_ADDRESS90_IDENTIFIED" 
   (	"IDENTIFIED_SEQNO" NUMBER, 
	"REQ_PASSPORTNO" VARCHAR2(20 CHAR), 
	"REQ_NATION_SEQNO" NUMBER, 
	"REQ_SEX" CHAR(1 CHAR), 
	"REQ_BIRTHDTE" VARCHAR2(10 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"REQ_NUM" NUMBER, 
	"VERIFY_INOUT" CHAR(1 CHAR), 
	"VERIFY_BLACKLIST" CHAR(1 CHAR), 
	"VERIFY_ADDRESS90" CHAR(1 CHAR), 
	"REQ_IPADDRESS" VARCHAR2(20 CHAR), 
	"REQ_IDENT_CLIENT" VARCHAR2(250 CHAR), 
	"REQ_TM6NO" VARCHAR2(20 CHAR), 
	"REQ_EFIRSTNM" VARCHAR2(60 CHAR), 
	"REQ_EFAMILYNM" VARCHAR2(60 CHAR), 
	"REQ_EMIDDLENM" VARCHAR2(60 CHAR), 
	"REQ_INOUTDTE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."FN_ADDRESS90_IDENTIFIED" ADD CONSTRAINT "FN_ADDRESS90_IDENTIFIED_PK" PRIMARY KEY ("IDENTIFIED_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FN_ADDRESS90_IDENTIFIED" ADD CONSTRAINT "FN_ADDRESS90_IDENTIFIED_R01" FOREIGN KEY ("REQ_NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."CREATEDATEIDX" ON "PIBICSDM2"."FN_ADDRESS90_IDENTIFIED" (TO_CHAR("CREATE_DATE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."REQ_PASSPORTNO_IDX" ON "PIBICSDM2"."FN_ADDRESS90_IDENTIFIED" ("REQ_PASSPORTNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."FN_ADDRESS90_IDENTIFIED_PK" ON "PIBICSDM2"."FN_ADDRESS90_IDENTIFIED" ("IDENTIFIED_SEQNO") 
  ;