CREATE TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" 
   (	"BRDDOCID" VARCHAR2(32 CHAR) DEFAULT ON NULL sys_guid() NOT NULL ENABLE, 
	"DOCTYPE" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"DOCNO" VARCHAR2(15 CHAR) NOT NULL ENABLE, 
	"ISSUECTRY" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"NAT" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"DOB" VARCHAR2(10 CHAR) NOT NULL ENABLE, 
	"EXPIRYDATE" DATE NOT NULL ENABLE, 
	"GIVENNAME" VARCHAR2(150 CHAR), 
	"SURNAME" VARCHAR2(150 CHAR) NOT NULL ENABLE, 
	"OPTIONALDATA" VARCHAR2(16 CHAR), 
	"AFISID" NUMBER, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"OFFICER_OBSERVATION" VARCHAR2(255 CHAR), 
	"MRZDG1" VARCHAR2(90 CHAR), 
	"P_01" VARCHAR2(100 CHAR), 
	"P_02" VARCHAR2(100 CHAR), 
	"P_03" VARCHAR2(100 CHAR), 
	"P_04" VARCHAR2(100 CHAR), 
	"P_05" VARCHAR2(100 CHAR), 
	"MIDDLENAME" VARCHAR2(150 CHAR), 
	"GIVENNAME_THAI" VARCHAR2(150 CHAR), 
	"MIDDLENAME_THAI" VARCHAR2(150 CHAR), 
	"SURNAME_THAI" VARCHAR2(150 CHAR), 
	"CALC_DOB" DATE, 
	"MANUAL_EXPIRY_DATE" DATE, 
	"MANUAL_ISSUING_DATE" DATE, 
	"MANUAL_NATIONALITY" VARCHAR2(3 CHAR), 
	"MANUAL_PLACEOFBIRTH" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"SEX" NUMBER(32,0) NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DOCCLASS" VARCHAR2(32 CHAR), 
	"SUB_NATIONALITY" VARCHAR2(32 CHAR), 
	"SOURCE_SYSTEM" NUMBER DEFAULT ON NULL 1 NOT NULL ENABLE, 
	"CALC_MRZDG1" VARCHAR2(90 CHAR), 
	"DOB_PARTIAL" "DL_BORDERCONTROL"."CT_PARTIAL_DATE_TYPE" 
   )   NO INMEMORY ;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$CHK01" CHECK ( trunc(expirydate) = expirydate ) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$CHK00" CHECK ( dml_type IN ( 'I','U') ) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS_PK" PRIMARY KEY ("BRDDOCID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$FK01" FOREIGN KEY ("ISSUECTRY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$FK02" FOREIGN KEY ("NAT")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS" ADD CONSTRAINT "BORDERDOCUMENTS$FK03" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("NUM_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."BRDDOCID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOCTYPE" IS 'Column for Document Type';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOCNO" IS 'Column for Document Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."ISSUECTRY" IS 'Column for Issuring Country';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."NAT" IS 'Column for Nationality';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOB" IS 'Column for Date of Birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."EXPIRYDATE" IS 'Column for expirydate';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."GIVENNAME" IS 'Column for givenname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SURNAME" IS 'Column for surname';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."OPTIONALDATA" IS 'Column for optional data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."AFISID" IS 'Column for AFIS-ID';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."INS_TERMINAL" IS 'Terminal, where data was inserted (Foreign Key)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."INS_BORDERPOST" IS 'Borderpost, where data was inserted (Foreign Key)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."OFFICER_OBSERVATION" IS 'Column for officer observation';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MRZDG1" IS 'Machine Readable Zone ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_01" IS 'p_01';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_02" IS 'p_02';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_03" IS 'p_03';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_04" IS 'p_04';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."P_05" IS 'p_05';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MIDDLENAME" IS 'Column for middlename';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."GIVENNAME_THAI" IS 'Column for givenname thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MIDDLENAME_THAI" IS 'Column for middlename thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SURNAME_THAI" IS 'Column for surname in thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."CALC_DOB" IS 'Column for calculate Date of Birth';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MANUAL_EXPIRY_DATE" IS 'Border document data that differ from automatically read data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MANUAL_ISSUING_DATE" IS 'Border document data that differ from automatically read data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MANUAL_NATIONALITY" IS 'Border document data that differ from automatically read data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."MANUAL_PLACEOFBIRTH" IS 'Border document data that differ from automatically read data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SEX" IS 'Column for Sex/Gender';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOCCLASS" IS 'Defines the document class (like passport, id, image, etc.); FK to table dl_common.bc_doc_types';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SUB_NATIONALITY" IS 'Sub-nationality (e.g. there are several sub-nationalities in china); soft-fk to DL_COMMON.SUB_NATIONALITIES';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."SOURCE_SYSTEM" IS '1=BmbS 2=PIBICS 4=Offline';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCUMENTS"."DOB_PARTIAL" IS 'Special Date Type for Date of Birth, day and month can be zero';
   COMMENT ON TABLE "DL_BORDERCONTROL"."BORDERDOCUMENTS"  IS 'Is used for BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX00" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("DOCTYPE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX01" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("ISSUECTRY") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX02" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("NAT") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX03" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("SEX") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX05" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX06" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("INS_TERMINAL") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX07" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("DOCCLASS") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX08" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("AFISID", '1') 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$IX09" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("NAT", "DOB", "SURNAME") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS$UK1" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("DOCNO", "ISSUECTRY", "EXPIRYDATE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."BORDERDOCUMENTS_PK" ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("BRDDOCID") 
  ;
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "SERVAPP";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_BLACKLIST" WITH GRANT OPTION;
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "APPSUP";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PIBICSDM2";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_INTERFACE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOAPPREPORT";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOAPPREPORT";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSUPPORT";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCUMENTS" TO "PORNRUKSA_S";
