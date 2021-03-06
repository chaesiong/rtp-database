CREATE TABLE "PIBICSDM2"."EXT_BOI_PRESS" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"POSITION" VARCHAR2(500 CHAR), 
	"COMPANY_SEQNO" NUMBER, 
	"COMPANYNM" VARCHAR2(1000 CHAR), 
	"CERT" VARCHAR2(25 CHAR), 
	"CERT_DATE" DATE, 
	"CERT_YEAR" NUMBER(4,1), 
	"WPERMIT_DATEFROM" DATE, 
	"WPERMIT_DATETO" DATE, 
	"PRESSID_EXPDATE" DATE, 
	"ALIEN_INCOME" NUMBER(15,2), 
	"ALIEN_TAX" NUMBER(15,2), 
	"CONTINENT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DUE_YEAR" NUMBER(5,1)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_PRESS" ADD CONSTRAINT "EXT_BOI_PRESS_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_PRESS" ADD CONSTRAINT "EXT_BOI_PRESS_R03" FOREIGN KEY ("CONTINENT_SEQNO")
	  REFERENCES "PIBICSDM2"."CONTINENT" ("CONTINENT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_PRESS" ADD CONSTRAINT "EXT_BOI_PRESS_R04" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_PRESS" ADD CONSTRAINT "EXT_BOI_PRESS_R02" FOREIGN KEY ("COMPANY_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_COMPANY" ("COMPANY_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_PRESS" ADD CONSTRAINT "EXT_BOI_PRESS_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_BOI_PRESS_PK" ON "PIBICSDM2"."EXT_BOI_PRESS" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_BOI_PRESS" TO "BIOSAADM";
