CREATE TABLE "PIBICSDM2"."FW_SERVER" 
   (	"IPSERVER" VARCHAR2(50 CHAR), 
	"SERVER_NAME" VARCHAR2(30 CHAR), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_SERVER" ADD CONSTRAINT "XPKFW_SERVER" PRIMARY KEY ("IPSERVER")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_SERVER" ON "PIBICSDM2"."FW_SERVER" ("IPSERVER") 
  ;
