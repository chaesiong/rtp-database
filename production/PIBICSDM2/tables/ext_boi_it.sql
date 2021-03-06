CREATE TABLE "PIBICSDM2"."EXT_BOI_IT" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"DUE_YEAR" NUMBER(5,1), 
	"POSITION" VARCHAR2(500 CHAR), 
	"COMPANY_SEQNO" NUMBER, 
	"COMPANYNM" VARCHAR2(1000 CHAR), 
	"DOCPROVE_DATE" DATE, 
	"DOCPROVE_YEAR" NUMBER, 
	"DOCWORK_DATE" DATE, 
	"DOCWORK_EXPDATE" DATE, 
	"ALIENSALARY" NUMBER(15,2), 
	"ALIEXTAX" NUMBER(15,2), 
	"CONTINENT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(500 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"COMPANYTYPENM" VARCHAR2(2000 CHAR), 
	"CAPITAL" NUMBER(15,2), 
	"CAPITALPAY" NUMBER(15,2), 
	"SHARES" NUMBER(15,2), 
	"SUMINCOME" NUMBER(15,2), 
	"ASSET" NUMBER(15,2), 
	"SUMOFFICER" NUMBER, 
	"THAIOFFICER" NUMBER, 
	"PERMANENCE" NUMBER, 
	"DAILY" NUMBER, 
	"ALIENOFFICER" NUMBER, 
	"ALIENINCOMEM" NUMBER(15,2), 
	"ALIENTAXM" NUMBER(15,2), 
	"ALIENINCOMEY" NUMBER(15,2), 
	"ALIENTAXY" NUMBER(15,2), 
	"OTH" VARCHAR2(100 CHAR), 
	"FACT1" CHAR(1 CHAR), 
	"FACT2" CHAR(1 CHAR), 
	"FACT_LESSINCOME" NUMBER, 
	"ALIENCOMEM" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_IT" ADD CONSTRAINT "EXT_BOI_IT_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_IT" ADD CONSTRAINT "EXT_BOI_IT_R03" FOREIGN KEY ("CONTINENT_SEQNO")
	  REFERENCES "PIBICSDM2"."CONTINENT" ("CONTINENT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_IT" ADD CONSTRAINT "EXT_BOI_IT_R04" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_IT" ADD CONSTRAINT "EXT_BOI_IT_R02" FOREIGN KEY ("COMPANY_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_COMPANY" ("COMPANY_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_IT" ADD CONSTRAINT "EXT_BOI_IT_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_BOI_IT_PK" ON "PIBICSDM2"."EXT_BOI_IT" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_BOI_IT" TO "BIOSAADM";
