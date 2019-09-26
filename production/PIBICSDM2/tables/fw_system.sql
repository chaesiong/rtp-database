CREATE TABLE "PIBICSDM2"."FW_SYSTEM" 
   (	"SYSTEM_CODE" VARCHAR2(10 CHAR), 
	"SYSTEM_NAME" VARCHAR2(200 CHAR), 
	"SYSTEM_VERSION" VARCHAR2(5 CHAR), 
	"SYSTEM_LICENSE" CHAR(1 CHAR), 
	"SYSTEM_INSTALL" TIMESTAMP (6), 
	"MAXSYSTEM_SESSION" NUMBER(*,0), 
	"LASTMODIFY" TIMESTAMP (6), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"LASTUPDATE" TIMESTAMP (6), 
	"SYSTEM_PROFILE" VARCHAR2(3 CHAR), 
	"FLAGWLLOG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_SYSTEM" ADD CONSTRAINT "XPKFW_SYSTEM" PRIMARY KEY ("SYSTEM_CODE")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_SYSTEM" ON "PIBICSDM2"."FW_SYSTEM" ("SYSTEM_CODE") 
  ;
