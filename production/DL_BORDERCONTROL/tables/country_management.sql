CREATE TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"COUTRY_CODE" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"DIRECTION" NUMBER NOT NULL ENABLE, 
	"NEED_LC" NUMBER NOT NULL ENABLE, 
	"NEED_VISUM" NUMBER NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NEED_HEALTHCHECK" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"MESSAGE_DONE" VARCHAR2(255 CHAR), 
	"MESSAGE_FINGERS_RIGHT" VARCHAR2(255 CHAR), 
	"MESSAGE_FINGERS_LEFT" VARCHAR2(255 CHAR), 
	"MESSAGE_THUMBS" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ADD CONSTRAINT "COUNTRY_MANAGEMENT$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ADD CONSTRAINT "COUNTRY_MANAGEMENT$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                          ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ADD CONSTRAINT "COUNTRY_MANAGEMENT$FK00" FOREIGN KEY ("COUTRY_CODE")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."ID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."COUTRY_CODE" IS 'Column for Country Code';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."DIRECTION" IS 'Column for Direction (arrival or departure';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."NEED_LC" IS 'Flag if traveller LC';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."NEED_VISUM" IS 'Flag if traveller need visum';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."NEED_HEALTHCHECK" IS 'Travelers from this country must be checked for illness';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."MESSAGE_DONE" IS 'The message to show on bioscreen display when the passenger from this land is done';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."MESSAGE_FINGERS_RIGHT" IS 'The message to show on bioscreen display when the passenger from this land captures the right hand';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."MESSAGE_FINGERS_LEFT" IS 'The message to show on bioscreen display when the passenger from this land captures the left hand';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"."MESSAGE_THUMBS" IS 'The message to show on bioscreen display when the passenger from this land captures the thumbs';
   COMMENT ON TABLE "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT"  IS 'Is used for BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$IX00" ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ("COUTRY_CODE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$IX01" ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$IX02" ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ("INS_TERMINAL") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT$PK" ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" ("ID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."COUNTRY_MANAGEMENT" TO "PUNYAWII_D";
