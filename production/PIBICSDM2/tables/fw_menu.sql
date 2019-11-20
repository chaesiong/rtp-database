CREATE TABLE "PIBICSDM2"."FW_MENU" 
   (	"NODE_ID" NUMBER, 
	"PROGRAM_ID" VARCHAR2(25 CHAR), 
	"LINK" VARCHAR2(300 CHAR), 
	"PERMISSION_ID" NUMBER(*,0), 
	"SEQ" NUMBER(*,0), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"LASTUPDATE" TIMESTAMP (6), 
	"SHOW_FLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_MENU" ADD CONSTRAINT "XPKFW_MENU" PRIMARY KEY ("NODE_ID", "PROGRAM_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_MENU" ADD CONSTRAINT "R_3" FOREIGN KEY ("NODE_ID")
	  REFERENCES "PIBICSDM2"."FW_NODEMENU" ("NODE_ID") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_MENU" ADD CONSTRAINT "R_65" FOREIGN KEY ("PERMISSION_ID")
	  REFERENCES "PIBICSDM2"."FW_PERMITSET" ("PERMISSION_ID") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_MENU" ADD CONSTRAINT "R_6" FOREIGN KEY ("PROGRAM_ID")
	  REFERENCES "PIBICSDM2"."FW_PROGRAMLIST" ("PROGRAM_ID") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_MENU" ON "PIBICSDM2"."FW_MENU" ("NODE_ID", "PROGRAM_ID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FW_MENU" TO "BIOSAADM";
