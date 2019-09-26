CREATE TABLE "PIBICSDM2"."FW_MESSAGE" 
   (	"MESSAGE_ID" NUMBER, 
	"MESSAGE_DESC" VARCHAR2(250 CHAR), 
	"MESSAGE_TARGET" CHAR(1 CHAR), 
	"MESSAGE_EXPDATE" TIMESTAMP (6), 
	"MESSAGE_EFFECTTIME" TIMESTAMP (6), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"MESSAGE_TYPE" CHAR(1 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_MESSAGE" ADD CONSTRAINT "XPKFW_MESSAGE" PRIMARY KEY ("MESSAGE_ID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_MESSAGE" ON "PIBICSDM2"."FW_MESSAGE" ("MESSAGE_ID") 
  ;
