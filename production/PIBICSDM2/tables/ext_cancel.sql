CREATE TABLE "PIBICSDM2"."EXT_CANCEL" 
   (	"CANCEL_SEQNO" NUMBER, 
	"EXTLIST_SEQNO" NUMBER, 
	"WRONG_DATE" DATE, 
	"WRONG_REMARK" VARCHAR2(150 CHAR), 
	"CANCEL_COMMAND" VARCHAR2(100 CHAR), 
	"CANCEL_DUEDATE" DATE, 
	"CANCEL_FOOTER" VARCHAR2(100 CHAR), 
	"CANCEL_AT" VARCHAR2(100 CHAR), 
	"CANCEL_DOCDATE" DATE, 
	"CANCEL_DOCNO" VARCHAR2(50 CHAR), 
	"CANCEL_REM_SEQNO" NUMBER, 
	"CANCEL_REMARK" VARCHAR2(150 CHAR), 
	"STATUS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"REMARK" VARCHAR2(300 CHAR), 
	"CANCEL_REM_OTH" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PROVE_BY" VARCHAR2(20 CHAR), 
	"WRONGDOC_DATE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_CANCEL" ADD CONSTRAINT "EXT_CANCEL_PK" PRIMARY KEY ("CANCEL_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_CANCEL" ADD CONSTRAINT "EXT_CANCEL_R02" FOREIGN KEY ("CANCEL_REM_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_CANCEL_REMARK" ("CANCEL_REM_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_CANCEL" ADD CONSTRAINT "EXT_CANCEL_R01" FOREIGN KEY ("EXTLIST_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_EXTENSIONLIST" ("EXTLIST_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_CANCEL_PK" ON "PIBICSDM2"."EXT_CANCEL" ("CANCEL_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_CANCEL" TO "BIOSAADM";
