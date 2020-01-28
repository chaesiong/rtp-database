CREATE TABLE "DL_BORDERCONTROL"."BORDERPOSTS$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BORDER_TYPE" VARCHAR2(32 CHAR), 
	"NAME" VARCHAR2(128 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"BORDER_TO_COUNTRY" VARCHAR2(32 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"PROVINCEID" VARCHAR2(32 CHAR), 
	"CODE" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERPOSTS$HIS" ADD CONSTRAINT "BORDERPOSTS$HIS$CHK$C05" CHECK (DML_TYPE in ('I'
                                                                                                      ,'U'
                                                                                                      ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."BORDER_TYPE" IS 'Column for Border Type (Land, Air, Sea)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."NAME" IS 'Name of Borderpost';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."BORDER_TO_COUNTRY" IS 'Country Code of Border to Contry';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_BORDERCONTROL"."BORDERPOSTS$HIS"  IS 'History of Borderposts';
  CREATE INDEX "DL_BORDERCONTROL"."BORDERPOSTS$HIS$IX00" ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$HIS" TO "PUNYAWII_D";
