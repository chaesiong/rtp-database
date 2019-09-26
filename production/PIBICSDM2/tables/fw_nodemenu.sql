CREATE TABLE "PIBICSDM2"."FW_NODEMENU" 
   (	"NODE_ID" NUMBER, 
	"ROLE_ID" NUMBER, 
	"PARENT_ID" NUMBER, 
	"NODE_SEQ" NUMBER, 
	"DESCRIPTION" VARCHAR2(100 CHAR), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_NODEMENU" ADD CONSTRAINT "XPKFW_NODEMENU" PRIMARY KEY ("NODE_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_NODEMENU" ADD CONSTRAINT "R_2" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "PIBICSDM2"."FW_ROLE" ("ROLE_ID") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_NODEMENU" ON "PIBICSDM2"."FW_NODEMENU" ("NODE_ID") 
  ;
