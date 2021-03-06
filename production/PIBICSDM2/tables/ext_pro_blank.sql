CREATE TABLE "PIBICSDM2"."EXT_PRO_BLANK" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"ALIEN_DETAIL" VARCHAR2(2000 CHAR), 
	"FACT_DETAIL" VARCHAR2(255 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_BLANK" ADD CONSTRAINT "EXT_PRO_BLANK_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_BLANK" ADD CONSTRAINT "EXT_PRO_BLANK_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_BLANK_PK" ON "PIBICSDM2"."EXT_PRO_BLANK" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PRO_BLANK" TO "BIOSAADM";
