CREATE TABLE "PIBICSDM2"."EXT_DOCNO" 
   (	"DOCNO_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"RUNNO" NUMBER, 
	"TYPE" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"F_TEXT" VARCHAR2(20 CHAR), 
	"L_TEXT" VARCHAR2(20 CHAR), 
	"M_TEXT" VARCHAR2(20 CHAR), 
	"N_DIGIT" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"GOVSECTION" VARCHAR2(50 CHAR), 
	"PROC_TO" VARCHAR2(100 CHAR), 
	"PROC_RUNNO" NUMBER, 
	"TEL" VARCHAR2(20 CHAR), 
	"ZONE_SEQNO" NUMBER, 
	"NO_TEXT" VARCHAR2(20 CHAR), 
	"STATUS_OFFLINE" VARCHAR2(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_DOCNO" ADD CONSTRAINT "EXT_DOCNO_PK" PRIMARY KEY ("DOCNO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_DOCNO" ADD CONSTRAINT "EXT_DOCNO_R02" FOREIGN KEY ("ZONE_SEQNO")
	  REFERENCES "PIBICSDM2"."ZONE" ("ZONE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_DOCNO_PK" ON "PIBICSDM2"."EXT_DOCNO" ("DOCNO_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_DOCNO" TO "BIOSAADM";
