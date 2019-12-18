CREATE TABLE "DL_USER_MANAGEMENT"."GRANTS$HIS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR), 
	"DESCRIPTION" VARCHAR2(250 CHAR), 
	"SORT_ORDER" NUMBER, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."GRANTS$HIS" ADD CONSTRAINT "GRANTS$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                            ,'U'
                                                                                            ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."GRANTS$HIS$IX00" ON "DL_USER_MANAGEMENT"."GRANTS$HIS" ("ID", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."GRANTS$HIS" TO "PORNRUKSA_S";
