CREATE TABLE "DL_BORDERCONTROL"."EXTENDSTAY" 
   (	"KEY_VALUE" VARCHAR2(32) DEFAULT SYS_GUID(), 
	"FEES_FK" VARCHAR2(32 CHAR), 
	"PERSON_FK" VARCHAR2(32), 
	"TRANSPORTTYPE_SEQNO" VARCHAR2(20), 
	"VISA_FK" VARCHAR2(32), 
	"DOC_DATE" DATE DEFAULT sysdate, 
	"ARRIVE_DATE" DATE, 
	"LEAVE_DATE" DATE, 
	"END_OF_EXTENSION" DATE, 
	"NEXT_ADDR_REPORT" DATE, 
	"PASSPORTNO" VARCHAR2(20), 
	"PASSPORT_ISSUED_DATE" DATE, 
	"PASSPORT_EXPIRY_DATE" DATE, 
	"PASSPORT_ISSUED_BY" NVARCHAR2(20), 
	"APPROVAL_STATUS" VARCHAR2(32 CHAR), 
	"TM6_NUMBER" VARCHAR2(20), 
	"APPLICATION_NUMBER" NUMBER NOT NULL ENABLE, 
	"ADDITIONAL_INFO" VARCHAR2(256), 
	"REF_PERSON" VARCHAR2(256), 
	"REF_PERSON_PHONE" VARCHAR2(256), 
	"REASON" VARCHAR2(2500), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."EXTENDSTAY" ADD CONSTRAINT "EXTENDSTAY_PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."EXTENDSTAY" ADD CONSTRAINT "EXTENDSTAY_NUMBER_UQ" UNIQUE ("APPLICATION_NUMBER")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."EXTENDSTAY" ADD CONSTRAINT "EXTENDSTAY_PERSON_FK" FOREIGN KEY ("PERSON_FK")
	  REFERENCES "DL_BORDERCONTROL"."PERSON" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."EXTENDSTAY" ADD CONSTRAINT "EXTENDSTAY_VISA_FK" FOREIGN KEY ("VISA_FK")
	  REFERENCES "DL_BORDERCONTROL"."VISAS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."FEES_FK" IS 'Foreign Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."PERSON_FK" IS 'Foreign Key (The Person who requested the ExtendStay)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."TRANSPORTTYPE_SEQNO" IS 'Foreign Key (Transport Type like Ship, Plane)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."VISA_FK" IS 'Foreign Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."DOC_DATE" IS 'Creation Date of the document';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."ARRIVE_DATE" IS 'Date of arrival in Thailand';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."LEAVE_DATE" IS 'Date of end of stay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."END_OF_EXTENSION" IS 'End of the Re-Entry Permit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."NEXT_ADDR_REPORT" IS 'The next report of adress has to be before or on this day';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."PASSPORTNO" IS 'The Passport Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."PASSPORT_ISSUED_DATE" IS 'Passport issued at ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."PASSPORT_EXPIRY_DATE" IS 'Passport will expire on';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."PASSPORT_ISSUED_BY" IS 'Passport was issued by (Country)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."APPROVAL_STATUS" IS 'A = Approved, N = Not Approved, R = End of ExtStay, C = Canceled';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."TM6_NUMBER" IS 'A Foreign Key to the Entry Forms Table to determine which TM6 was used';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."APPLICATION_NUMBER" IS 'The Unique Application Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."ADDITIONAL_INFO" IS 'Column for additional Information/Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."REF_PERSON" IS 'Reference Person in Thailand';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."REF_PERSON_PHONE" IS 'Reference Persons Phone Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."REASON" IS 'Reason for the ExtStay e.g. Retirement';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."EXTENDSTAY"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON TABLE "DL_BORDERCONTROL"."EXTENDSTAY"  IS 'Used in Extend-Stay';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."EXTENDSTAY_NUMBER_UQ" ON "DL_BORDERCONTROL"."EXTENDSTAY" ("APPLICATION_NUMBER") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."EXTENDSTAY_PK" ON "DL_BORDERCONTROL"."EXTENDSTAY" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."EXTENDSTAY" TO "PUNYAWII_D";
