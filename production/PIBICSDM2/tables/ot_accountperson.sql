CREATE TABLE "PIBICSDM2"."OT_ACCOUNTPERSON" 
   (	"ACCPERSONSEQNO" NUMBER, 
	"ACCOUNTSEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"ACPRECEIVE" NUMBER(7,2), 
	"ACPAIRPORT" NUMBER(7,2), 
	"ACPPERCENT1" NUMBER(7,2), 
	"ACPPERCENT2" NUMBER(7,2), 
	"ACPPERCENT3" NUMBER(7,2), 
	"ACPPERCENT4" NUMBER(7,2), 
	"ACPTAX" NUMBER(7,2), 
	"ACPLOAN" NUMBER(7,2), 
	"ACPRELATION" NUMBER(7,2), 
	"ACPDEATH" NUMBER(7,2), 
	"ACPOTHER1" NUMBER(7,2), 
	"ACPOTHER2" NUMBER(7,2), 
	"ACPOTHER3" NUMBER(7,2), 
	"ACPOTHER4" NUMBER(7,2), 
	"ACPOTHER5" NUMBER(7,2), 
	"ACPINCOME" NUMBER(7,2), 
	"ACPRATE" NUMBER(3,2), 
	"OTDEPT_SEQNO" NUMBER, 
	"POSLEVEL_SEQNO" NUMBER, 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"OTFIRSTNM" VARCHAR2(60 CHAR), 
	"OTFAMILYNM" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CARD_ID" VARCHAR2(13 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_ACCOUNTPERSON" ADD CONSTRAINT "OT_ACCOUNTPERSON_PK" PRIMARY KEY ("ACCPERSONSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_ACCOUNTPERSON" ADD CONSTRAINT "OT_ACCOUNTPERSON_U01" UNIQUE ("PROFILE_SEQNO", "ACCOUNTSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_ACCOUNTPERSON" ADD CONSTRAINT "OT_ACCOUNTPERSON_R01" FOREIGN KEY ("ACCOUNTSEQNO")
	  REFERENCES "PIBICSDM2"."OT_ACCOUNT" ("ACCOUNTSEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_ACCOUNTPERSON" ADD CONSTRAINT "OT_ACCOUNTPERSON_R04" FOREIGN KEY ("POSLEVEL_SEQNO")
	  REFERENCES "PIBICSDM2"."POSLEVEL" ("POSLEVEL_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_ACCOUNTPERSON" ADD CONSTRAINT "OT_ACCOUNTPERSON_R02" FOREIGN KEY ("PROFILE_SEQNO")
	  REFERENCES "PIBICSDM2"."HR_PROFILE" ("PROFILE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_ACCOUNTPERSON_PK" ON "PIBICSDM2"."OT_ACCOUNTPERSON" ("ACCPERSONSEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."OT_ACCOUNTPERSON_U01" ON "PIBICSDM2"."OT_ACCOUNTPERSON" ("PROFILE_SEQNO", "ACCOUNTSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_ACCOUNTPERSON" TO "BIOSAADM";
