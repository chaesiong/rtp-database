CREATE TABLE "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"COMPUTER_ID" VARCHAR2(32 CHAR), 
	"COMPUTER_DN" VARCHAR2(256 CHAR), 
	"ROLE_ID" VARCHAR2(32 CHAR), 
	"ROLE_DN" VARCHAR2(256 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" ADD CONSTRAINT "COMPUTER_ROLE_REL$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                                  ,'U'
                                                                                                                  ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS$IX00" ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" ("ID", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ROLE_REL$HIS" TO "PORNRUKSA_S";
