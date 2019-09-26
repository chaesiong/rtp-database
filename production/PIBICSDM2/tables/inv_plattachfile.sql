CREATE TABLE "PIBICSDM2"."INV_PLATTACHFILE" 
   (	"PLA_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PLA_FILENAME" VARCHAR2(30 CHAR), 
	"PLA_FILEPATH" VARCHAR2(60 CHAR), 
	"PLA_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLATTACHFILE" ADD CONSTRAINT "INV_PLATTACHFILE_PK" PRIMARY KEY ("PLA_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLATTACHFILE" ADD CONSTRAINT "INV_PLATTACHFILE_R01" FOREIGN KEY ("PL_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE" ("PL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLATTACHFILE_PK" ON "PIBICSDM2"."INV_PLATTACHFILE" ("PLA_SEQNO") 
  ;
