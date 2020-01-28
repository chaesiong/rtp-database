CREATE TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"REFERENCE_ENTITY" VARCHAR2(255 CHAR), 
	"REFERENCE_NUMBER" VARCHAR2(255 CHAR), 
	"BOOKING_NUMBER" VARCHAR2(20 CHAR), 
	"RECEIPT_NUMBER" VARCHAR2(20 CHAR), 
	"ISSUING_DATE" DATE, 
	"TOTAL_COSTS" NUMBER, 
	"PRINT_FLAG" VARCHAR2(20 CHAR), 
	"BORDERDOCUMENT" VARCHAR2(32 CHAR), 
	"DOCNO" VARCHAR2(15 CHAR), 
	"PERSON" VARCHAR2(32 CHAR), 
	"ENTRY_FORM" VARCHAR2(32 CHAR), 
	"FIRST_NAME" VARCHAR2(150 CHAR), 
	"MIDDLE_NAME" VARCHAR2(150 CHAR), 
	"LAST_NAME" VARCHAR2(150 CHAR), 
	"THAI_LAST_NAME" VARCHAR2(150 CHAR), 
	"THAI_FIRST_NAME" VARCHAR2(150 CHAR), 
	"SEX" VARCHAR2(32 CHAR), 
	"DATE_OF_BIRTH" DATE, 
	"NATIONALITY" VARCHAR2(32 CHAR), 
	"TRANS_VEHICLES" VARCHAR2(32 CHAR), 
	"TRANS_NUMBER" VARCHAR2(50 CHAR), 
	"ARRIVAL_DATE" DATE, 
	"VISA_TYPE" VARCHAR2(32 CHAR), 
	"VISA_EXPIRY_DATE" DATE, 
	"DEPARTURE_DATE" DATE, 
	"STATUS" VARCHAR2(20 CHAR), 
	"STATUS_NOTE" VARCHAR2(500 CHAR), 
	"OWNER" VARCHAR2(32 CHAR), 
	"PERMIT" VARCHAR2(32 CHAR), 
	"PERMIT_DATE" DATE, 
	"GENERATION_STATUS" VARCHAR2(20 CHAR), 
	"SALUTATION" VARCHAR2(32 CHAR), 
	"FEE_OR_FINE" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" ADD CONSTRAINT "FAF_FEES_AND_FINES$HIS$CK00" CHECK (DML_TYPE in ('I','U','D')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."NOTICE" IS 'Column for notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."REFERENCE_ENTITY" IS 'Defines the referenced entity of the reference_number (for example for VISA number -> VISAS.VISA_NUMBER); this is the most flexible solution to connect the original references to this receipt';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."REFERENCE_NUMBER" IS 'Defines the reference_number of this receipt (the reference number is for example the original VISA number this receipt was generated from); has to be defined together with column reference_entity';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."BOOKING_NUMBER" IS 'Booking number (defines the complete number with column receipt_number --> <booking_number>/<receipt_number>)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."RECEIPT_NUMBER" IS 'Receipt number (defines the complete number with column booking_number --> <booking_number>/<receipt_number>)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."ISSUING_DATE" IS 'Date the receipt was issued';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."TOTAL_COSTS" IS 'Contains the complete costs of this receipt (sum of detail entries)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."PRINT_FLAG" IS 'Defines if the receipt was printed (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."BORDERDOCUMENT" IS 'FK dl_bordercontrol.borderdocuments (references the borderdocument which was used to create this dataset from the original reference)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."DOCNO" IS 'Passport Number of the person';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."PERSON" IS 'FK dl_bordercontrol.person (references the person if a visa or something similiar is connected to this dataset - for historic data only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."ENTRY_FORM" IS 'FK dl_bordercontrol.entry_form (includes the TM6No)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."FIRST_NAME" IS 'First name of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."MIDDLE_NAME" IS 'Middle name of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."LAST_NAME" IS 'Last name of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."THAI_LAST_NAME" IS 'Last name (Thai) of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."THAI_FIRST_NAME" IS 'First name (Thai) of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."SEX" IS 'FK dl_common.human_sexes (Gender of the person)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."DATE_OF_BIRTH" IS 'Date of birth of the person';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."NATIONALITY" IS 'FK dl_common.icao_doc_codes (Nationality of the person)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."TRANS_VEHICLES" IS 'FK dl_common.trans_vehicles (Vehicle the person travelled to Thailand with)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."TRANS_NUMBER" IS 'Number of transportation (e.g. flight number)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."ARRIVAL_DATE" IS 'Date the person arrived';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."VISA_TYPE" IS 'FK dl_common.visa_types (Type of VISA)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."VISA_EXPIRY_DATE" IS 'Expiry date of VISA of the person (Fine field only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."DEPARTURE_DATE" IS 'Departure date of the person (Fine field only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."STATUS" IS 'Defines status value of this receipt (ACTIVE = Receipt is active, CANCEL = Receipt was cancelled by an officer)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."STATUS_NOTE" IS 'Note of the officer if this receipt was cancelled';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."OWNER" IS 'FK dl_bordercontrol.owners (defines the application which is the working system for this fee or fine entry)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."PERMIT" IS 'FK dl_bordercontrol.faf_permit_type (will be imported from PIBICS) - (Fine field only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."PERMIT_DATE" IS 'Date of Permit setting (will be imported from PIBICS) - (Fine field only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."GENERATION_STATUS" IS 'Defines the generation status of this receipt (AUTO = Automatically generated, MANUAL = manually generated)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."SALUTATION" IS 'FK dl_common.salutations (defines the salutation of the person which has to pay)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS"."FEE_OR_FINE" IS 'Defines if this dataset is a Fee or Fine entry (FEE = Fee entry, FINE = Fine entry)';
  CREATE INDEX "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS$IX00" ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$HIS" TO "PUNYAWII_D";
