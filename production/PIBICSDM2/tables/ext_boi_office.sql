CREATE TABLE "PIBICSDM2"."EXT_BOI_OFFICE" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"DUE_YEAR" NUMBER(5,1), 
	"POSITION" VARCHAR2(500 CHAR), 
	"COMPANY_SEQNO" NUMBER, 
	"COMPANYTYPENM" VARCHAR2(2000 CHAR), 
	"COMPANYNM" VARCHAR2(2000 CHAR), 
	"CAPITAL" NUMBER(15,2), 
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
	"CONTINENT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"FACT_LESSINCOME" NUMBER(15,2), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TRANSFER_FROM" DATE, 
	"TRANSFER_TO" DATE, 
	"TRANSFER_AMOUNT" NUMBER(15,2), 
	"COMPANYTYPE_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_OFFICE" ADD PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_OFFICE" ADD CONSTRAINT "EXT_BOI_OFFICE_R03" FOREIGN KEY ("CONTINENT_SEQNO")
	  REFERENCES "PIBICSDM2"."CONTINENT" ("CONTINENT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_OFFICE" ADD CONSTRAINT "EXT_BOI_OFFICE_R04" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_OFFICE" ADD CONSTRAINT "EXT_BOI_OFFICE_R02" FOREIGN KEY ("COMPANY_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_COMPANY" ("COMPANY_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_OFFICE" ADD CONSTRAINT "EXT_BOI_OFFICE_R05" FOREIGN KEY ("COMPANYTYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_COMPANYTYPE" ("COMTYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_OFFICE" ADD CONSTRAINT "EXT_BOI_OFFICE_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207548" ON "PIBICSDM2"."EXT_BOI_OFFICE" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_BOI_OFFICE" TO "BIOSAADM";
