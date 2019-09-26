CREATE TABLE "PIBICSDM2"."FN_DOCUMENT" 
   (	"FN_SEQNO" NUMBER, 
	"HOTEL_SEQNO" NUMBER, 
	"DOCNAME" VARCHAR2(100 CHAR), 
	"DOCFILENAME" VARCHAR2(50 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FN_DOCUMENT" ADD CONSTRAINT "FN_DOCUMENT_PK" PRIMARY KEY ("FN_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FN_DOCUMENT_PK" ON "PIBICSDM2"."FN_DOCUMENT" ("FN_SEQNO") 
  ;
