CREATE TABLE "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"DOC_NO" VARCHAR2(15 CHAR) NOT NULL ENABLE, 
	"FIRST_NAME" VARCHAR2(150 CHAR), 
	"LAST_NAME" VARCHAR2(150 CHAR), 
	"FLIGHT_NO" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"ARRIVAL_DATE" DATE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" ADD CONSTRAINT "CREW_MEMBERS$HIS$CK00" CHECK (DML_TYPE in ('I','U','D')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."DOC_NO" IS 'Passport Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."FIRST_NAME" IS 'First name of the crew member';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."LAST_NAME" IS 'Last name of the crew member';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."FLIGHT_NO" IS 'Flight number the crew member is coming with';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"."ARRIVAL_DATE" IS 'Arrival name of the crew member';
   COMMENT ON TABLE "DL_BORDERCONTROL"."CREW_MEMBERS$HIS"  IS 'History for Crew Members';
  CREATE INDEX "DL_BORDERCONTROL"."CREW_MEMBERS$HIS$IX00" ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS$HIS" TO "PUNYAWII_D";
