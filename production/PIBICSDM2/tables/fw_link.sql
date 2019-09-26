CREATE TABLE "PIBICSDM2"."FW_LINK" 
   (	"SERIAL_CODE" VARCHAR2(100 CHAR), 
	"USER_ID" VARCHAR2(20 CHAR), 
	"PASSWORD" VARCHAR2(20 CHAR), 
	"PROGRAM_ID" VARCHAR2(20 CHAR), 
	"PARAM" VARCHAR2(200 CHAR), 
	"CREATEDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_LINK" ADD CONSTRAINT "XPKFW_LINK" PRIMARY KEY ("SERIAL_CODE")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_LINK" ON "PIBICSDM2"."FW_LINK" ("SERIAL_CODE") 
  ;
