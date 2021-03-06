CREATE TABLE "PIBICSDM2"."EXT_PRO_218_125" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"PARENTOF" VARCHAR2(200 CHAR), 
	"DEPOSIT" NUMBER, 
	"SALARY" NUMBER, 
	"POSITION" VARCHAR2(100 CHAR), 
	"COMPANY" VARCHAR2(100 CHAR), 
	"OTH" VARCHAR2(1500 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"COMPANY_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_218_125" ADD CONSTRAINT "EXT_PRO_218_125_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_218_125" ADD CONSTRAINT "EXT_PRO_218_125_R02" FOREIGN KEY ("COMPANY_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_COMPANY" ("COMPANY_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_218_125" ADD CONSTRAINT "EXT_PRO_218_125_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_218_125_PK" ON "PIBICSDM2"."EXT_PRO_218_125" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PRO_218_125" TO "BIOSAADM";
