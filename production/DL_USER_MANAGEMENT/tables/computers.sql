CREATE TABLE "DL_USER_MANAGEMENT"."COMPUTERS" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(250 CHAR), 
	"DNS_NAME" VARCHAR2(250 CHAR), 
	"SORT_ORDER" NUMBER, 
	"IS_ACTIVE" NUMBER DEFAULT ON NULL 1 NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTERS" ADD CONSTRAINT "COMPUTERS$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTERS" ADD CONSTRAINT "COMPUTERS_UN" UNIQUE ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTERS" ADD CONSTRAINT "COMPUTERS$UQ01" UNIQUE ("DNS_NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTERS" ADD CONSTRAINT "COMPUTERS$CHK00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTERS" ADD CONSTRAINT "COMPUTERS$CHK01" CHECK (DML_TYPE in ('I'
                                                                                          ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTERS" ADD CONSTRAINT "COMPUTERS$CHK02" CHECK (IS_ACTIVE in (0
                                                                                           ,1)) ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."COMPUTERS"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."COMPUTERS"."NAME" IS 'Name of the Computer';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."COMPUTERS"."DESCRIPTION" IS 'Description of the computer';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."COMPUTERS"."DNS_NAME" IS 'DNS-Hostname or IP-Address';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."COMPUTERS"."SORT_ORDER" IS 'Sort order in maintenance application. The lower the number, the higher is the display position of the computer in the list';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."COMPUTERS"."IS_ACTIVE" IS '1 if the computer is curently active, else 0';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."COMPUTERS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."COMPUTERS"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."COMPUTERS"  IS 'Computers';
  CREATE INDEX "DL_USER_MANAGEMENT"."COMPUTERS$IX00" ON "DL_USER_MANAGEMENT"."COMPUTERS" ("NAME", "SORT_ORDER") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."COMPUTERS$IX01" ON "DL_USER_MANAGEMENT"."COMPUTERS" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."COMPUTERS$PK" ON "DL_USER_MANAGEMENT"."COMPUTERS" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."COMPUTERS$UQ01" ON "DL_USER_MANAGEMENT"."COMPUTERS" ("DNS_NAME") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."COMPUTERS_UN" ON "DL_USER_MANAGEMENT"."COMPUTERS" ("NAME") 
  ;
  GRANT DELETE ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS" TO "SANTIPATN_P";
