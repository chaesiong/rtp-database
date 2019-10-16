CREATE TABLE "PIBICSDM2"."FS_FINESDEPTDUE" 
   (	"FSFDEPTDUESEQNO" NUMBER, 
	"FSFDEUSEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"AMOUNT2PER" NUMBER, 
	"AMOUNT1PER" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_FINESDEPTDUE" ADD CONSTRAINT "FS_FINESDEPTDUE_PK" PRIMARY KEY ("FSFDEPTDUESEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_FINESDEPTDUE" ADD CONSTRAINT "FS_FINESDEPTDUE_R02" FOREIGN KEY ("FSFDEUSEQNO")
	  REFERENCES "PIBICSDM2"."FS_FINESDUE" ("FSFDEUSEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_FINESDEPTDUE_PK" ON "PIBICSDM2"."FS_FINESDEPTDUE" ("FSFDEPTDUESEQNO") 
  ;