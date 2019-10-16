CREATE TABLE "PIBICSDM2"."FINGERPRINTTYPE" 
   (	"FGPTYPESEQNO" NUMBER, 
	"FGPTYPECD" VARCHAR2(4 CHAR), 
	"FGPTYPEDESC" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(1 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FINGERPRINTTYPE" ADD CONSTRAINT "FINGERPRINTTYPE_PK" PRIMARY KEY ("FGPTYPESEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FINGERPRINTTYPE_PK" ON "PIBICSDM2"."FINGERPRINTTYPE" ("FGPTYPESEQNO") 
  ;