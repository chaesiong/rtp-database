CREATE TABLE "PIBICSDM2"."BLIMREASON_TYPE" 
   (	"REASON_TYPE_SEQNO" NUMBER, 
	"REASON_TYPENM" VARCHAR2(50 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."BLIMREASON_TYPE" ADD CONSTRAINT "BLIMREASON_TYPE_PK" PRIMARY KEY ("REASON_TYPE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."BLIMREASON_TYPE" ADD CONSTRAINT "BLIMREASON_TYPE_U01" UNIQUE ("REASON_TYPENM")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."BLIMREASON_TYPE_PK" ON "PIBICSDM2"."BLIMREASON_TYPE" ("REASON_TYPE_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."BLIMREASON_TYPE_U01" ON "PIBICSDM2"."BLIMREASON_TYPE" ("REASON_TYPENM") 
  ;
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."BLIMREASON_TYPE" TO "BIOSAADM";
