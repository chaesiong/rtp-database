CREATE TABLE "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"ROLE_ID" VARCHAR2(32 CHAR), 
	"ROLE_DN" VARCHAR2(256 CHAR), 
	"OBJECT_GRANT_REL_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" ADD CONSTRAINT "ROLE_OBJECT_GRANT_REL$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" ADD CONSTRAINT "ROLE_OBJECT_GRANT_REL$CHK00" CHECK ((ROLE_ID is not null and ROLE_DN is null) or (ROLE_ID is null and ROLE_DN is not null)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" ADD CONSTRAINT "ROLE_OBJECT_GRANT_REL$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                                  ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" ADD CONSTRAINT "ROLE_OBJECT_GRANT_REL$FK00" FOREIGN KEY ("OBJECT_GRANT_REL_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."OBJECT_GRANT_REL" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" ADD CONSTRAINT "ROLE_OBJECT_GRANT_REL$FK01" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ROLES" ("ID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL"."ROLE_ID" IS 'roles.id if role is from Dermalog User Management';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL"."ROLE_DN" IS '"Distinguish Name" (DN) of role if it is from "Active Directory" (AD)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL"."OBJECT_GRANT_REL_ID" IS 'Foreign key to table OBJECT_GRANT_REL';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL"  IS 'Permissions of Roles (Intersection table between ROLES and OBJECT_GRANT_REL)';
  CREATE INDEX "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL$IX00" ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" ("ROLE_ID", "OBJECT_GRANT_REL_ID") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL$IX01" ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL$PK" ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" ("ID") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "SERVAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "DL_BORDERCONTROL";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "PIBICSAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "PIBICSAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "DERMALOG_PROXY";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "PIBICSAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."ROLE_OBJECT_GRANT_REL" TO "BIOSAADM";
