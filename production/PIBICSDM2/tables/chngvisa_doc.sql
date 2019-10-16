CREATE TABLE "PIBICSDM2"."CHNGVISA_DOC" 
   (	"DOC_SEQNO" NUMBER, 
	"DOCNM" VARCHAR2(250 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"NOTE" VARCHAR2(200 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CHNGVISA_DOC" ADD CONSTRAINT "CHNGVISA_DOC_PK" PRIMARY KEY ("DOC_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CHNGVISA_DOC_PK" ON "PIBICSDM2"."CHNGVISA_DOC" ("DOC_SEQNO") 
  ;