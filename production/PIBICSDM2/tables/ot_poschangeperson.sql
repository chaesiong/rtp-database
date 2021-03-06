CREATE TABLE "PIBICSDM2"."OT_POSCHANGEPERSON" 
   (	"OTPOSPERSONSEQNO" NUMBER, 
	"OTPOSCHANGESEQNO" NUMBER, 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"PROFILE_SEQNO" NUMBER, 
	"POSDATE" DATE, 
	"ORGDEPT_SEQNO" NUMBER, 
	"ORGPOSLEVEL_SEQNO" NUMBER, 
	"ORGPOSNUMDAYS" NUMBER, 
	"ORGOTRATE" NUMBER(3,2), 
	"ORGOTRECEIVE" NUMBER(7,2), 
	"TOCORG" NUMBER, 
	"NEWDEPT_SEQNO" NUMBER, 
	"NEWPOSLEVEL_SEQNO" NUMBER, 
	"NEWPOSNUMDAYS" NUMBER, 
	"NEWOTRATE" NUMBER(3,2), 
	"NEWOTRECEIVE" NUMBER(7,2), 
	"TOCNEW" NUMBER, 
	"SECOTRATE" NUMBER(3,2), 
	"ACTORG" CHAR(1 CHAR) DEFAULT NULL, 
	"ACTNEW" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_POSCHANGEPERSON" ADD CONSTRAINT "OT_POSCHANGEPERSON_PK" PRIMARY KEY ("OTPOSPERSONSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_POSCHANGEPERSON" ADD CONSTRAINT "OT_POSCHANGEPERSON_R01" FOREIGN KEY ("OTPOSCHANGESEQNO")
	  REFERENCES "PIBICSDM2"."OT_POSCHANGE" ("OTPOSCHANGESEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_POSCHANGEPERSON" ADD CONSTRAINT "OT_POSCHANGEPERSON_R05" FOREIGN KEY ("ORGPOSLEVEL_SEQNO")
	  REFERENCES "PIBICSDM2"."POSLEVEL" ("POSLEVEL_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_POSCHANGEPERSON" ADD CONSTRAINT "OT_POSCHANGEPERSON_R06" FOREIGN KEY ("NEWPOSLEVEL_SEQNO")
	  REFERENCES "PIBICSDM2"."POSLEVEL" ("POSLEVEL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_POSCHANGEPERSON_PK" ON "PIBICSDM2"."OT_POSCHANGEPERSON" ("OTPOSPERSONSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_POSCHANGEPERSON" TO "BIOSAADM";
