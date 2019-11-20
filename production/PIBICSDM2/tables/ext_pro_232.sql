CREATE TABLE "PIBICSDM2"."EXT_PRO_232" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"DOCDATE" DATE, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"AGENCY" VARCHAR2(50 CHAR), 
	"BOOK" VARCHAR2(1000 CHAR), 
	"SPORT_BOOK" VARCHAR2(2000 CHAR), 
	"COMMAND_FROM" VARCHAR2(150 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"LOCATION" VARCHAR2(1000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_232" ADD CONSTRAINT "EXT_PRO_232_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_PRO_232" ADD CONSTRAINT "EXT_PRO_232_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PRO_232_PK" ON "PIBICSDM2"."EXT_PRO_232" ("PRO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PRO_232" TO "BIOSAADM";
