CREATE TABLE "DL_BORDERCONTROL"."VEHICLE_DETAILS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"MVMNTID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"VEHICLE_TYPE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(255 CHAR), 
	"OWNER" VARCHAR2(255 CHAR), 
	"FROM1" VARCHAR2(32 CHAR), 
	"TO1" VARCHAR2(32 CHAR), 
	"PROVINCE" VARCHAR2(32 CHAR), 
	"DATE_TIME" DATE, 
	"FROM2" VARCHAR2(32 CHAR), 
	"TO2" VARCHAR2(32 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"MSCS_CARDTYPE" VARCHAR2(1 CHAR), 
	"MSCS_CONVREGNO" VARCHAR2(20 CHAR), 
	"MSCS_IOCOUNTCD" NUMBER, 
	"MSCS_IOPORTNM" VARCHAR2(250 CHAR), 
	"MSCS_IONOTE" VARCHAR2(250 CHAR), 
	"MSCS_IODEPT" NUMBER, 
	"MSCS_IODEPTTH" NUMBER
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1 ,'MONTH')) 
 (PARTITION "P_BEFORE_2018"  VALUES LESS THAN (TO_DATE(' 2018-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) ) ;
  ALTER TABLE "DL_BORDERCONTROL"."VEHICLE_DETAILS" ADD CONSTRAINT "VEHICLE_DETAILS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VEHICLE_DETAILS" ADD CONSTRAINT "VEHICLE_DETAILS$CHK00" CHECK (DML_TYPE in ('I'
																									,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VEHICLE_DETAILS" ADD CONSTRAINT "VEHICLE_DETAILS$FK00" FOREIGN KEY ("VEHICLE_TYPE")
	  REFERENCES "DL_COMMON"."TRANS_VEHICLES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."VEHICLE_DETAILS" ADD CONSTRAINT "VEHICLE_DETAILS$FK03" FOREIGN KEY ("MVMNTID")
	  REFERENCES "DL_BORDERCONTROL"."MOVEMENTS" ("MVMNTID") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."MVMNTID" IS 'Foreign Key to table DL_BORDERCONTROL.MOVEMENTS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."VEHICLE_TYPE" IS 'Vehicle Type';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."NAME" IS 'Name of Vehicle';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."OWNER" IS 'Owner of Vehicle';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."FROM1" IS 'Date1 From';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."TO1" IS 'Date1 To';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."PROVINCE" IS 'Column for Province';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."DATE_TIME" IS 'Date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."FROM2" IS 'Date2 From';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."TO2" IS 'Date2 To';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."MSCS_CARDTYPE" IS 'Equivalent to pibics.tm2.cardtype. Added by MSCS.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."MSCS_CONVREGNO" IS 'Equivalent to pibics.tm2.convregno. flight number. Data type taken from dl_bordercontrol.flights. Added by MSCS.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."MSCS_IOCOUNTCD" IS 'Equivalent to pibics.tm2.iocountcd. Added by MSCS.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."MSCS_IOPORTNM" IS 'Equivalent to pibics.tm2.ioportnm. Added by MSCS.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."MSCS_IONOTE" IS 'Equivalent to pibics.tm2.ionote. Added by MSCS.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."MSCS_IODEPT" IS 'Equivalent to pibics.tm2.iodept. Added by MSCS.';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."VEHICLE_DETAILS"."MSCS_IODEPTTH" IS 'Equivalent to pibics.tm2.iodeptth. Added by MSCS.';
   COMMENT ON TABLE "DL_BORDERCONTROL"."VEHICLE_DETAILS"  IS 'Table for Vehicle Details -- Used in BmBS';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."VEHICLE_DETAILS$PK" ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."VEHICLE_DETAILS" TO "PORNRUKSA_S";
