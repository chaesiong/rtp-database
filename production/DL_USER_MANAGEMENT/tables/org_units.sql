CREATE TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(250 CHAR), 
	"STREET" VARCHAR2(250 CHAR), 
	"CITY" VARCHAR2(130 CHAR), 
	"STATE_PROVINCE" VARCHAR2(130 CHAR), 
	"POSTCODE" VARCHAR2(40 CHAR), 
	"COUNTRY" VARCHAR2(32 CHAR), 
	"CONTACT_INFO" VARCHAR2(500 CHAR), 
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
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS_UN" UNIQUE ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$CHK00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$CHK01" CHECK (DML_TYPE in ('I'
                                                                                          ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$CHK02" CHECK (IS_ACTIVE in (0
                                                                                           ,1)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS" ADD CONSTRAINT "ORG_UNITS$FK00" FOREIGN KEY ("COUNTRY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."NAME" IS 'Name of the organisation unit';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."DESCRIPTION" IS 'Description of the organisation unit';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."CONTACT_INFO" IS 'Freeform text for how to contact this organisation unit, for example Telefon-/Telefax-Number, eMail-Address , ...';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."SORT_ORDER" IS 'Sort order in maintenance application. The lower the number, the higher is the display position of the organisation unit in the list';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."IS_ACTIVE" IS '1 if the organisation unit is curently active, else 0';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."ORG_UNITS"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."ORG_UNITS"  IS 'Organisation units';
  CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$IX00" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("NAME", "SORT_ORDER") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$IX01" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("DML_AT", "DML_BY") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$IX02" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("COUNTRY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$PK" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS_UN" ON "DL_USER_MANAGEMENT"."ORG_UNITS" ("NAME") 
  ;
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS" TO "PORNRUKSA_S";
