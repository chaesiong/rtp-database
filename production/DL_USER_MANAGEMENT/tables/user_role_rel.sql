CREATE TABLE "DL_USER_MANAGEMENT"."USER_ROLE_REL" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"USER_ID" VARCHAR2(32 CHAR), 
	"USER_DN" VARCHAR2(256 CHAR), 
	"ROLE_ID" VARCHAR2(32 CHAR), 
	"ROLE_DN" VARCHAR2(256 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."USER_ROLE_REL" ADD CONSTRAINT "USER_ROLE_REL$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."USER_ROLE_REL" ADD CONSTRAINT "USER_ROLE_REL$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                  ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."USER_ROLE_REL" ADD CONSTRAINT "USER_ROLE_REL$CHK02" CHECK ((USER_ID is not null and USER_DN is null)
                                                                                      --
                                                                                      or (USER_ID is null and USER_DN is not null)
                                                                                      --
                                                                                      ) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."USER_ROLE_REL" ADD CONSTRAINT "USER_ROLE_REL$CHK03" CHECK ((ROLE_ID is not null and ROLE_DN is null)
                                                                                      --
                                                                                      or (ROLE_ID is null and ROLE_DN is not null)
                                                                                      --
                                                                                      ) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."USER_ROLE_REL" ADD CONSTRAINT "USER_ROLE_REL$FK00" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ROLES" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."USER_ROLE_REL" ADD CONSTRAINT "USER_ROLE_REL$FK01" FOREIGN KEY ("USER_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."USERS" ("ID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USER_ROLE_REL"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USER_ROLE_REL"."USER_ID" IS 'users.id if user is from Dermalog User Management as member of';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USER_ROLE_REL"."USER_DN" IS '"Distinguish Name" (DN) of user if he is from "Active Directory" (AD) as member of';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USER_ROLE_REL"."ROLE_ID" IS 'roles.id if role is from Dermalog User Management';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USER_ROLE_REL"."ROLE_DN" IS '"Distinguish Name" (DN) of role if it is a role from "Active Directory" (AD)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USER_ROLE_REL"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USER_ROLE_REL"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."USER_ROLE_REL"  IS 'Intersection table between USERS and ROLES, at which the user is a member of a role';
  CREATE INDEX "DL_USER_MANAGEMENT"."USER_ROLE_REL$IX00" ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" ("USER_ID", "ROLE_ID") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."USER_ROLE_REL$IX01" ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" ("DML_AT", "DML_BY") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."USER_ROLE_REL$IX02" ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" (COALESCE("USER_ID","USER_DN"), COALESCE("ROLE_ID","ROLE_DN")) 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."USER_ROLE_REL$PK" ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" ("ID") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "SERVAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "PIBICSAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "PIBICSAPP";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "PIBICSAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."USER_ROLE_REL" TO "BIOSAADM";
