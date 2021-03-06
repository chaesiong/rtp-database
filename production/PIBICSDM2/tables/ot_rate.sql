CREATE TABLE "PIBICSDM2"."OT_RATE" 
   (	"OTRATESEQNO" NUMBER, 
	"POSLEVEL_SEQNO" NUMBER, 
	"OTRATE" NUMBER(3,2), 
	"ACTFLAG" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_RATE" ADD CONSTRAINT "OT_RATE_PK" PRIMARY KEY ("OTRATESEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_RATE" ADD CONSTRAINT "OT_RATE_U01" UNIQUE ("POSLEVEL_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_RATE" ADD CONSTRAINT "OT_RATE_R01" FOREIGN KEY ("POSLEVEL_SEQNO")
	  REFERENCES "PIBICSDM2"."POSLEVEL" ("POSLEVEL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_RATE_PK" ON "PIBICSDM2"."OT_RATE" ("OTRATESEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."OT_RATE_U01" ON "PIBICSDM2"."OT_RATE" ("POSLEVEL_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_RATE" TO "BIOSAADM";
