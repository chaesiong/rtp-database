CREATE TABLE "DL_USER_MANAGEMENT"."LOOKUPS$HIS" 
   (	"KEY_CATEGORY" VARCHAR2(64 CHAR) NOT NULL ENABLE, 
	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"PARENT_KEY_CATEGORY" VARCHAR2(64 CHAR), 
	"PARENT_KEY_VALUE" VARCHAR2(32 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"LOCALE" VARCHAR2(5 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TAG" VARCHAR2(255 CHAR), 
	"DISPLAY_VALUE_SHORT" VARCHAR2(30 CHAR), 
	"DISPLAY_VALUE_ALTERNATIVE" VARCHAR2(200 CHAR), 
	"VALUE_LARGE_DATA_ID" NUMBER(*,0)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."LOOKUPS$HIS" ADD CONSTRAINT "LOOKUPS$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                              ,'U'
                                                                                              ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."LOOKUPS$HIS$IX00" ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" ("KEY_CATEGORY", "KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."LOOKUPS$HIS" TO "PORNRUKSA_S";
