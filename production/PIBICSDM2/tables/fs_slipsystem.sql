CREATE TABLE "PIBICSDM2"."FS_SLIPSYSTEM" 
   (	"FSS_SEQNO" NUMBER, 
	"SYSTEM_NAME" VARCHAR2(60 CHAR), 
	"SYSTEM_CODE" VARCHAR2(10 CHAR), 
	"SYSTEM_TYPE" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PRATE_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_SLIPSYSTEM" ADD CONSTRAINT "FS_SLIPSYSTEM_PK" PRIMARY KEY ("FSS_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_SLIPSYSTEM_PK" ON "PIBICSDM2"."FS_SLIPSYSTEM" ("FSS_SEQNO") 
  ;