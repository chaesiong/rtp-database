CREATE TABLE "PIBICSDM2"."BATCH_DIR" 
   (	"BATCHID" NUMBER, 
	"BATCHTYPE" VARCHAR2(70 CHAR), 
	"REMOTEPATH" VARCHAR2(100 CHAR), 
	"LOCALPATH" VARCHAR2(100 CHAR), 
	"UPDUSR" VARCHAR2(32 CHAR), 
	"UPDDTE" DATE, 
	"PRUSR" VARCHAR2(32 CHAR), 
	"PRDTE_ST" DATE, 
	"PRDTE_END" DATE, 
	"FILENAME" VARCHAR2(50 CHAR), 
	"TOTALROW" NUMBER, 
	"PRROW" NUMBER, 
	"ERRROW" NUMBER, 
	"STATUS" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."BATCH_DIR" ADD CONSTRAINT "PK_BATCH_DIR" PRIMARY KEY ("BATCHID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."PK_BATCH_DIR" ON "PIBICSDM2"."BATCH_DIR" ("BATCHID") 
  ;
