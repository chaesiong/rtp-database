CREATE TABLE "PIBICSDM2"."TM6EXCELLOG" 
   (	"TM6EXLOGSEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"FILENAME" VARCHAR2(200 CHAR), 
	"UPLOADSTATUS" CHAR(1 CHAR), 
	"TOTALROW" NUMBER, 
	"PRROW" NUMBER, 
	"ERRROW" NUMBER, 
	"STARTPROCESS" TIMESTAMP (6), 
	"ENDPROCESS" TIMESTAMP (6), 
	"STATUS" CHAR(1 CHAR), 
	"STATUSFILE" CHAR(1 CHAR), 
	"FILEERROR" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TM6EXCELLOG" ADD CONSTRAINT "TM6EXCELLOG_PK" PRIMARY KEY ("TM6EXLOGSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TM6EXCELLOG_PK" ON "PIBICSDM2"."TM6EXCELLOG" ("TM6EXLOGSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TM6EXCELLOG" TO "BIOSAADM";
