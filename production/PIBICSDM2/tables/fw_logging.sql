CREATE TABLE "PIBICSDM2"."FW_LOGGING" 
   (	"USER_ID" VARCHAR2(20 CHAR), 
	"PROGRAM_ID" VARCHAR2(20 CHAR), 
	"LOG_LEVEL" VARCHAR2(20 CHAR), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_LOGGING" ADD CONSTRAINT "XPKFW_LOGGING" PRIMARY KEY ("USER_ID", "PROGRAM_ID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_LOGGING" ON "PIBICSDM2"."FW_LOGGING" ("USER_ID", "PROGRAM_ID") 
  ;