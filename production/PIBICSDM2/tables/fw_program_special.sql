CREATE TABLE "PIBICSDM2"."FW_PROGRAM_SPECIAL" 
   (	"SEQUS" NUMBER, 
	"USER_ID" VARCHAR2(20 CHAR), 
	"ITEM_SEQ" NUMBER, 
	"ROLE_ID" NUMBER, 
	"GROUP_ID" NUMBER, 
	"NODE_ID" NUMBER, 
	"PROGRAM_ID" VARCHAR2(25 CHAR), 
	"UPD_USERID" VARCHAR2(20 CHAR), 
	"MEMBER_TYPE" CHAR(1 CHAR), 
	"DISABLE" CHAR(1 CHAR), 
	"LASTUPDATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAM_SPECIAL" ADD CONSTRAINT "XPKFW_PROGRAM_SPECIAL" PRIMARY KEY ("SEQUS")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAM_SPECIAL" ADD CONSTRAINT "R_31" FOREIGN KEY ("USER_ID")
	  REFERENCES "PIBICSDM2"."FW_USER" ("USER_ID") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAM_SPECIAL" ADD CONSTRAINT "R_30" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "PIBICSDM2"."FW_GROUP" ("GROUP_ID") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAM_SPECIAL" ADD CONSTRAINT "R_38" FOREIGN KEY ("NODE_ID")
	  REFERENCES "PIBICSDM2"."FW_NODEMENU" ("NODE_ID") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAM_SPECIAL" ADD CONSTRAINT "R_66" FOREIGN KEY ("ITEM_SEQ")
	  REFERENCES "PIBICSDM2"."FW_PERMITITEM" ("ITEM_SEQ") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAM_SPECIAL" ADD CONSTRAINT "R_28" FOREIGN KEY ("PROGRAM_ID")
	  REFERENCES "PIBICSDM2"."FW_PROGRAMLIST" ("PROGRAM_ID") ENABLE;
  ALTER TABLE "PIBICSDM2"."FW_PROGRAM_SPECIAL" ADD CONSTRAINT "R_44" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "PIBICSDM2"."FW_ROLE" ("ROLE_ID") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."XPKFW_PROGRAM_SPECIAL" ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" ("SEQUS") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FW_PROGRAM_SPECIAL" TO "BIOSAADM";
