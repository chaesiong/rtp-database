CREATE TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"ROLE_ID" VARCHAR2(32 CHAR), 
	"ROLE_DN" VARCHAR2(256 CHAR), 
	"MEMBER_ROLE_ID" VARCHAR2(32 CHAR), 
	"MEMBER_ROLE_DN" VARCHAR2(256 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ADD CONSTRAINT "ROLE_ROLE_REL$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ADD CONSTRAINT "ROLE_ROLE_REL$UQ00" UNIQUE ("ROLE_ID", "MEMBER_ROLE_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ADD CONSTRAINT "ROLE_ROLE_REL$UQ01" UNIQUE ("ROLE_DN", "MEMBER_ROLE_DN")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ADD CONSTRAINT "ROLE_ROLE_REL$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                  ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ADD CONSTRAINT "ROLE_ROLE_REL$CHK02" CHECK ((ROLE_ID is not null and MEMBER_ROLE_ID is not null and ROLE_ID != MEMBER_ROLE_ID and ROLE_DN is null and MEMBER_ROLE_DN is null)
                                                                                      --
                                                                                      or (ROLE_ID is null and MEMBER_ROLE_ID is null and ROLE_DN is not null and MEMBER_ROLE_DN is not null and ROLE_DN != MEMBER_ROLE_DN)
                                                                                      --
                                                                                      ) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ADD CONSTRAINT "ROLE_ROLE_REL$FK00" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ROLES" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ADD CONSTRAINT "ROLE_ROLE_REL$FK01" FOREIGN KEY ("MEMBER_ROLE_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ROLES" ("ID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_ROLE_REL"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_ROLE_REL"."ROLE_ID" IS 'ROLES.ID of the role';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_ROLE_REL"."ROLE_DN" IS '"Distinguish Name" (DN) of the role from "Active Directory" (AD)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_ROLE_REL"."MEMBER_ROLE_ID" IS 'ROLES.ID of the role who is a member of ROLE_ID';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_ROLE_REL"."MEMBER_ROLE_DN" IS '"Distinguish Name" (DN) from "Active Directory" (AD) of the role it is a member of ROLE_DN';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_ROLE_REL"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ROLE_ROLE_REL"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."ROLE_ROLE_REL"  IS 'Multi hierarchy of roles (container of grants), the member role inherits the grants of the role';
  CREATE INDEX "DL_USER_MANAGEMENT"."ROLE_ROLE_REL$IX00" ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ROLE_ROLE_REL$PK" ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ROLE_ROLE_REL$UQ00" ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ("ROLE_ID", "MEMBER_ROLE_ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ROLE_ROLE_REL$UQ01" ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" ("ROLE_DN", "MEMBER_ROLE_DN") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "SERVAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ROLE_ROLE_REL" TO "SANTIPATN_P";
