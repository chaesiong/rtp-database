CREATE TABLE "PIBICSDM2"."AGCCONTACT" 
   (	"AGCCONT_SEQNO" NUMBER, 
	"AGCCONTCD" CHAR(2 CHAR), 
	"AGCCONTNM" VARCHAR2(60 CHAR), 
	"AGCCONTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"SORT" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."AGCCONTACT" ADD CONSTRAINT "AGCCONTACT_R01" PRIMARY KEY ("AGCCONT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."AGCCONTACT" ADD CONSTRAINT "AGCCONTACT_U01" UNIQUE ("AGCCONTCD")
  USING INDEX (CREATE UNIQUE INDEX "PIBICSDM2"."AGGCCONTCD_PK" ON "PIBICSDM2"."AGCCONTACT" ("AGCCONTCD") 
  )  ENABLE;
  ALTER TABLE "PIBICSDM2"."AGCCONTACT" ADD CONSTRAINT "AGCCONTACT_U02" UNIQUE ("AGCCONTNM")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."AGCCONTACT_R01" ON "PIBICSDM2"."AGCCONTACT" ("AGCCONT_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."AGCCONTACT_U02" ON "PIBICSDM2"."AGCCONTACT" ("AGCCONTNM") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."AGGCCONTCD_PK" ON "PIBICSDM2"."AGCCONTACT" ("AGCCONTCD") 
  ;
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."AGCCONTACT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."AGCCONTACT" TO "APPSUSR";
