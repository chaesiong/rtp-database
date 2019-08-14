CREATE TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"REFERENCE_ENTITY" VARCHAR2(255 CHAR), 
	"REFERENCE_NUMBER" VARCHAR2(255 CHAR), 
	"BOOKING_NUMBER" VARCHAR2(20 CHAR), 
	"RECEIPT_NUMBER" VARCHAR2(20 CHAR), 
	"ISSUING_DATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"TOTAL_COSTS" NUMBER, 
	"PRINT_FLAG" VARCHAR2(20 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE, 
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
	"STATUS" VARCHAR2(20 CHAR) DEFAULT ON NULL 'ACTIVE' NOT NULL ENABLE, 
	"STATUS_NOTE" VARCHAR2(500 CHAR), 
	"OWNER" VARCHAR2(32 CHAR), 
	"PERMIT" VARCHAR2(32 CHAR), 
	"PERMIT_DATE" DATE, 
	"GENERATION_STATUS" VARCHAR2(20 CHAR) DEFAULT ON NULL 'AUTO' NOT NULL ENABLE, 
	"SALUTATION" VARCHAR2(32 CHAR), 
	"FEE_OR_FINE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"CHARGE_NUMBER" VARCHAR2(50 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE) and length(KEY_VALUE) >= 3) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$CK01" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$CK03" CHECK (print_flag IN ('Y', 'N')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$CK05" CHECK (status IN ('ACTIVE', 'CANCEL')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$CK06" CHECK (fee_or_fine IN ('FEE', 'FINE')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$CK02" CHECK ((NVL(reference_entity, 'ANY') = 'ANY' AND reference_number IS NULL) OR (reference_entity IS NOT NULL AND reference_number IS NOT NULL)) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$CK04" CHECK ((fee_or_fine = 'FEE'  AND (departure_date  IS NULL
                                                                                                                   AND  permit          IS NULL
                                                                                                                   AND  permit_date     IS NULL
                                                                                                                   AND  charge_number   IS NULL))
                                                                                          OR (fee_or_fine = 'FINE' AND charge_number    IS NOT NULL)) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK01" FOREIGN KEY ("BORDERDOCUMENT")
	  REFERENCES "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("BRDDOCID") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK02" FOREIGN KEY ("PERSON")
	  REFERENCES "DL_BORDERCONTROL"."PERSON" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK03" FOREIGN KEY ("ENTRY_FORM")
	  REFERENCES "DL_BORDERCONTROL"."ENTRY_FORMS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK04" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK05" FOREIGN KEY ("NATIONALITY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK06" FOREIGN KEY ("TRANS_VEHICLES")
	  REFERENCES "DL_COMMON"."TRANS_VEHICLES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK07" FOREIGN KEY ("VISA_TYPE")
	  REFERENCES "DL_COMMON"."VISA_TYPES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK08" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK09" FOREIGN KEY ("PERMIT")
	  REFERENCES "DL_BORDERCONTROL"."FAF_PERMIT_TYPE" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ADD CONSTRAINT "FAF_FEES_AND_FINES$FK10" FOREIGN KEY ("SALUTATION")
	  REFERENCES "DL_COMMON"."SALUTATIONS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."NOTICE" IS 'Column for notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."REFERENCE_ENTITY" IS 'Defines the referenced entity of the reference_number (for example for VISA number -> VISAS.VISA_NUMBER); this is the most flexible solution to connect the original references to this receipt';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."REFERENCE_NUMBER" IS 'Defines the reference_number of this receipt (the reference number is for example the original VISA number this receipt was generated from); has to be defined together with column reference_entity';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."BOOKING_NUMBER" IS 'Booking number (defines the complete number with column receipt_number --> <booking_number>/<receipt_number>)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."RECEIPT_NUMBER" IS 'Receipt number (defines the complete number with column booking_number --> <booking_number>/<receipt_number>)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."ISSUING_DATE" IS 'Date the receipt was issued';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."TOTAL_COSTS" IS 'Contains the complete costs of this receipt (sum of detail entries)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."PRINT_FLAG" IS 'Defines if the receipt was printed (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."BORDERDOCUMENT" IS 'FK dl_bordercontrol.borderdocuments (references the borderdocument which was used to create this dataset from the original reference)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."DOCNO" IS 'Passport Number of the person';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."PERSON" IS 'FK dl_bordercontrol.person (references the person if a visa or something similiar is connected to this dataset - for historic data only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."ENTRY_FORM" IS 'FK dl_bordercontrol.entry_form (includes the TM6No)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."FIRST_NAME" IS 'First name of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."MIDDLE_NAME" IS 'Middle name of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."LAST_NAME" IS 'Last name of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."THAI_LAST_NAME" IS 'Last name (Thai) of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."THAI_FIRST_NAME" IS 'First name (Thai) of the person which has to pay';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."SEX" IS 'FK dl_common.human_sexes (Gender of the person)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."DATE_OF_BIRTH" IS 'Date of birth of the person';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."NATIONALITY" IS 'FK dl_common.icao_doc_codes (Nationality of the person)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."TRANS_VEHICLES" IS 'FK dl_common.trans_vehicles (Vehicle the person travelled to Thailand with)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."TRANS_NUMBER" IS 'Number of transportation (e.g. flight number)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."ARRIVAL_DATE" IS 'Date the person arrived';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."VISA_TYPE" IS 'FK dl_common.visa_types (Type of VISA)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."VISA_EXPIRY_DATE" IS 'Expiry date of VISA of the person (Fine field only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."DEPARTURE_DATE" IS 'Departure date of the person (Fine field only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."STATUS" IS 'Defines status value of this receipt (ACTIVE = Receipt is active, CANCEL = Receipt was cancelled by an officer)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."STATUS_NOTE" IS 'Note of the officer if this receipt was cancelled';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."OWNER" IS 'FK dl_bordercontrol.owners (defines the application which is the working system for this fee or fine entry)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."PERMIT" IS 'FK dl_bordercontrol.faf_permit_type (will be imported from PIBICS) - (Fine field only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."PERMIT_DATE" IS 'Date of Permit setting (will be imported from PIBICS) - (Fine field only)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."GENERATION_STATUS" IS 'Defines the generation status of this receipt (AUTO = Automatically generated, MANUAL = manually generated)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."SALUTATION" IS 'FK dl_common.salutations (defines the salutation of the person which has to pay)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."FEE_OR_FINE" IS 'Defines if this dataset is a Fee or Fine entry (FEE = Fee entry, FINE = Fine entry)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"."CHARGE_NUMBER" IS 'Charge Number';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES"  IS 'Used for Fees and Fines';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."FAF_FEES_AND_FINES$PK" ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" TO "APPSUP";
