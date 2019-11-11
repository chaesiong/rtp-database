CREATE TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"USER_ID" VARCHAR2(256 CHAR), 
	"USER_SOURCE" NUMBER, 
	"APP_NAME" VARCHAR2(100 CHAR), 
	"OPERATION" NUMBER, 
	"COMMENTS" VARCHAR2(500 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" ADD CONSTRAINT "ACTIVITIES$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" ADD CONSTRAINT "ACTIVITIES$CHK00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" ADD CONSTRAINT "ACTIVITIES$CHK01" CHECK (DML_TYPE in ('I'
                                                                                            ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES" ADD CONSTRAINT "ACTIVITIES$CHK02" CHECK (OPERATION in (1
                                                                                             ,2
                                                                                             ,3)) ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."USER_ID" IS 'DN if the user is from LDAP, users.id if the user is from Dermalog User Management';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."USER_SOURCE" IS '1 - if the user is from LDAP, 2 if the user is from Dermalog User Management';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."APP_NAME" IS 'Application Name';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."OPERATION" IS '1 - LOGIN, 2 - LOGOUT, 3 - FAILED LOGIN ATTEMPT. See lookup category user_operation.';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."COMMENTS" IS 'Comments on Operation';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ACTIVITIES"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."ACTIVITIES"  IS 'User activities';
  CREATE INDEX "DL_USER_MANAGEMENT"."ACTIVITIES$IX00" ON "DL_USER_MANAGEMENT"."ACTIVITIES" ("USER_ID", "APP_NAME") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."ACTIVITIES$IX01" ON "DL_USER_MANAGEMENT"."ACTIVITIES" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ACTIVITIES$PK" ON "DL_USER_MANAGEMENT"."ACTIVITIES" ("ID") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSUPPORT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOAPPREPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."ACTIVITIES" TO "BIOSAADM";
