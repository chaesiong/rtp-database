CREATE TABLE "PIBICSDM2"."REPORTBOI" 
   (	"COM_SEQNO" NUMBER, 
	"COMPANYNM" VARCHAR2(1000 CHAR), 
	"EXTCOUNT" NUMBER, 
	"NAME" VARCHAR2(600 CHAR), 
	"NATIONSBY" VARCHAR2(60 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"EXT_DATE" DATE, 
	"PERMIT_DATE" DATE, 
	"COMPANYNM_CHECK" VARCHAR2(1000 CHAR), 
	"COMSEQNO_CHECK" NUMBER, 
	"EXTLIST_SEQNO" NUMBER, 
	"RUNNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."REPORTBOI" ADD CONSTRAINT "REPORTBOI_PK" PRIMARY KEY ("EXTLIST_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."REPORTBOI_PK" ON "PIBICSDM2"."REPORTBOI" ("EXTLIST_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."REPORTBOI" TO "BIOSAADM";
