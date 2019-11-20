CREATE TABLE "PIBICSDM2"."DEPORTPRO" 
   (	"DPP_SEQNO" NUMBER(10,0), 
	"PHB_SEQNO" NUMBER, 
	"PRODTE" TIMESTAMP (6), 
	"PROUSRID" VARCHAR2(20 CHAR), 
	"DEPORTTYPE" CHAR(1 CHAR), 
	"FLIGNTTYPE" CHAR(1 CHAR), 
	"CONVREGNO1" VARCHAR2(20 CHAR), 
	"CONVREGNO2" VARCHAR2(20 CHAR), 
	"CONVREGNO3" VARCHAR2(20 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"OUTDTE" TIMESTAMP (6), 
	"CONV_SEQNO" NUMBER, 
	"CONV_NOTE" VARCHAR2(200 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"DEPORTDEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DEPORTPRO" ADD PRIMARY KEY ("DPP_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DEPORTPRO" ADD FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."DEPORTPRO" ADD FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DPTPROID_PK" ON "PIBICSDM2"."DEPORTPRO" ("DPP_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DEPORTPRO" TO "BIOSAADM";
