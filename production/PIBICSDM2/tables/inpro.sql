CREATE TABLE "PIBICSDM2"."INPRO" 
   (	"INPRO_SEQNO" NUMBER, 
	"OFD_SEQNO" NUMBER, 
	"DPT_SEQNO" NUMBER, 
	"PRODTE" DATE, 
	"PROUSRID" VARCHAR2(60 CHAR), 
	"NOTE" VARCHAR2(200 CHAR), 
	"AUTHORISE" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INPRO" ADD CONSTRAINT "INPRO_PK" PRIMARY KEY ("INPRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INPRO" ADD FOREIGN KEY ("DPT_SEQNO")
	  REFERENCES "PIBICSDM2"."DEPORTEE" ("DPT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INPRO" ADD FOREIGN KEY ("OFD_SEQNO")
	  REFERENCES "PIBICSDM2"."OFFENDER" ("OFD_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INPRO_PK" ON "PIBICSDM2"."INPRO" ("INPRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INPRO" TO "BIOSAADM";
