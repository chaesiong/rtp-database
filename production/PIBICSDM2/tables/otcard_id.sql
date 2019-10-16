CREATE TABLE "PIBICSDM2"."OTCARD_ID" 
   (	"SEQNO" NUMBER, 
	"NAME" VARCHAR2(100 CHAR), 
	"SNAME" VARCHAR2(100 CHAR), 
	"CARD_ID" VARCHAR2(13 CHAR), 
	"RANKNAME" VARCHAR2(60 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."OTCARD_ID" ADD CONSTRAINT "OTCARD_ID_PK" PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OTCARD_ID_PK" ON "PIBICSDM2"."OTCARD_ID" ("SEQNO") 
  ;