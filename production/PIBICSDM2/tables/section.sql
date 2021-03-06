CREATE TABLE "PIBICSDM2"."SECTION" 
   (	"SECTION_SEQNO" NUMBER, 
	"SECTIONNM" VARCHAR2(50 CHAR), 
	"SECTIONDESC" VARCHAR2(250 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1
   ) ;
  ALTER TABLE "PIBICSDM2"."SECTION" ADD PRIMARY KEY ("SECTION_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SECTION_PK" ON "PIBICSDM2"."SECTION" ("SECTION_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SECTION" TO "BIOSAADM";
