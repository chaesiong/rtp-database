CREATE TABLE "DL_USER_MANAGEMENT"."USERS$SGD" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LAST_LOGIN" DATE, 
	"BAD_PASSWORD_COUNT" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"SET_EXPIRED" DATE, 
	"OFFLINE_PIN" NUMBER(4,0)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."USERS$SGD" ADD CONSTRAINT "USERS$SGD$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."USERS$SGD" ADD CONSTRAINT "PASSWORDS_USER_FK" FOREIGN KEY ("ID")
	  REFERENCES "DL_USER_MANAGEMENT"."USERS" ("ID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USERS$SGD"."ID" IS 'Artificial primary key, equal to USERS.ID';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USERS$SGD"."BAD_PASSWORD_COUNT" IS 'Number of times a wrong password has been used to login';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."USERS$SGD"."SET_EXPIRED" IS 'Date when the account was set to expired';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."USERS$SGD"  IS 'Users system generated data (without history)';
  CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."USERS$SGD$PK" ON "DL_USER_MANAGEMENT"."USERS$SGD" ("ID") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$SGD" TO "SANTIPATN_P";
