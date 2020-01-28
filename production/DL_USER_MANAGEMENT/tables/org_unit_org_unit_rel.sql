CREATE TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"ORG_UNIT_ID" VARCHAR2(32 CHAR), 
	"ORG_UNIT_DN" VARCHAR2(256 CHAR), 
	"MEMBER_ORG_UNIT_ID" VARCHAR2(32 CHAR), 
	"MEMBER_ORG_UNIT_DN" VARCHAR2(256 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$UQ00" UNIQUE ("MEMBER_ORG_UNIT_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$UQ01" UNIQUE ("MEMBER_ORG_UNIT_DN")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                                  ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$CHK02" CHECK ((ORG_UNIT_ID is not null and MEMBER_ORG_UNIT_ID is not null and ORG_UNIT_ID != MEMBER_ORG_UNIT_ID and ORG_UNIT_DN is null and MEMBER_ORG_UNIT_DN is null)
                                                                                                      --
                                                                                                      or (ORG_UNIT_ID is null and MEMBER_ORG_UNIT_ID is null and ORG_UNIT_DN is not null and MEMBER_ORG_UNIT_DN is not null and ORG_UNIT_DN != MEMBER_ORG_UNIT_DN)
                                                                                                      --
                                                                                                      ) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$FK00" FOREIGN KEY ("ORG_UNIT_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ORG_UNITS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ADD CONSTRAINT "ORG_UNIT_ORG_UNIT_REL$FK01" FOREIGN KEY ("MEMBER_ORG_UNIT_ID")
	  REFERENCES "DL_USER_MANAGEMENT"."ORG_UNITS" ("ID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."ORG_UNIT_ID" IS 'ORG_UNITS.ID of the organisation unit';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."ORG_UNIT_DN" IS '"Distinguish Name" (DN) of the organisation unit from "Active Directory" (AD)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."MEMBER_ORG_UNIT_ID" IS 'ORG_UNITS.ID of the organisation unit who is a member of ORG_UNIT_ID';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."MEMBER_ORG_UNIT_DN" IS '"Distinguish Name" (DN) from "Active Directory" (AD) of the organisation unit who is a member of ORG_UNIT_DN';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL"  IS 'Intersection table between ORG_UNITS and ORG_UNITS, at which the organisation unit is a member of an other organisation unit and currently the organisation unit can only be assigned to ONE organisation unit';
  CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$IX00" ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$PK" ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$UQ00" ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ("MEMBER_ORG_UNIT_ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL$UQ01" ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" ("MEMBER_ORG_UNIT_DN") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "SERVAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNIT_ORG_UNIT_REL" TO "SANTIPATN_P";
