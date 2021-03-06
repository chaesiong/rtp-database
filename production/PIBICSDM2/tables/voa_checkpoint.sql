CREATE TABLE "PIBICSDM2"."VOA_CHECKPOINT" 
   (	"CP_SEQNO" NUMBER, 
	"CP_NO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"FIXTEXT" VARCHAR2(5 CHAR), 
	"VISANO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."VOA_CHECKPOINT" ADD CONSTRAINT "VOA_CHECKPOINT_PK" PRIMARY KEY ("CP_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."VOA_CHECKPOINT_PK" ON "PIBICSDM2"."VOA_CHECKPOINT" ("CP_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VOA_CHECKPOINT" TO "BIOSAADM";
