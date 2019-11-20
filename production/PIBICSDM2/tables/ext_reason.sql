CREATE TABLE "PIBICSDM2"."EXT_REASON" 
   (	"REASON_SEQNO" NUMBER, 
	"REASONEXTABB" CHAR(1 CHAR), 
	"REASONEXTENM" VARCHAR2(4000 CHAR), 
	"REASONEXTTNM" VARCHAR2(300 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PERMIT_DAY" NUMBER, 
	"DEPTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"REASONCD" VARCHAR2(4 CHAR), 
	"WAIT_DAY" NUMBER, 
	"LAWSET" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_REASON" ADD CONSTRAINT "EXT_REASON_PK" PRIMARY KEY ("REASON_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_REASON_PK" ON "PIBICSDM2"."EXT_REASON" ("REASON_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_REASON" TO "BIOSAADM";
