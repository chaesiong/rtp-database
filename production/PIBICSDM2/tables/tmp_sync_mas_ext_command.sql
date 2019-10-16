CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_EXT_COMMAND" 
   (	"COMMAND_SEQNO" NUMBER, 
	"COMMANDTNM" VARCHAR2(200 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"COMMANDENM" VARCHAR2(200 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_EXT_COMMAND" ADD CONSTRAINT "TMP_SYNC_MAS_EXT_COMMAND_PK" PRIMARY KEY ("COMMAND_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_EXT_COMMAND_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_EXT_COMMAND" ("COMMAND_SEQNO") 
  ;