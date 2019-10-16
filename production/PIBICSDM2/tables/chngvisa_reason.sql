CREATE TABLE "PIBICSDM2"."CHNGVISA_REASON" 
   (	"REASON_SEQNO" NUMBER, 
	"REASON_GROUP" VARCHAR2(2 CHAR), 
	"REASONNM" VARCHAR2(2000 CHAR), 
	"VISABOI_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"REASONTYPE" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CHNGVISA_REASON" ADD CONSTRAINT "CHNGVISA_REASON_PK" PRIMARY KEY ("REASON_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CHNGVISA_REASON_PK" ON "PIBICSDM2"."CHNGVISA_REASON" ("REASON_SEQNO") 
  ;