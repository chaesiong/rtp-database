CREATE TABLE "DL_BORDERCONTROL"."CREW_MEMBERS" 
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
  ALTER TABLE "DL_BORDERCONTROL"."CREW_MEMBERS" ADD CONSTRAINT "CREW_MEMBERS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."CREW_MEMBERS" ADD CONSTRAINT "CREW_MEMBERS$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."CREW_MEMBERS" ADD CONSTRAINT "CREW_MEMBERS$CK01" CHECK (DML_TYPE in ('I' ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."DOC_NO" IS 'Passport Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."FIRST_NAME" IS 'First name of the crew member';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."LAST_NAME" IS 'Last name of the crew member';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."FLIGHT_NO" IS 'Flight number the crew member is coming with';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."CREW_MEMBERS"."ARRIVAL_DATE" IS 'Arrival name of the crew member';
   COMMENT ON TABLE "DL_BORDERCONTROL"."CREW_MEMBERS"  IS 'Table for Crew Members used for BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."CREW_MEMBERS$IX00" ON "DL_BORDERCONTROL"."CREW_MEMBERS" ("DOC_NO", "FIRST_NAME", "LAST_NAME", "FLIGHT_NO") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."CREW_MEMBERS$PK" ON "DL_BORDERCONTROL"."CREW_MEMBERS" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."CREW_MEMBERS" TO "TRAINEE";
