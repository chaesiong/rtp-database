CREATE TABLE "PIBICSDM2"."DRS_DETAINROOM" 
   (	"DETAINROOM_SEQNO" NUMBER, 
	"DETAINROOMID" VARCHAR2(10 CHAR), 
	"DETAINROOM_NAME" VARCHAR2(20 CHAR), 
	"LOCATEDEPT_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"REMARK" VARCHAR2(150 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_DETAINROOM" ADD CONSTRAINT "DRS_DETAINROOM_PK" PRIMARY KEY ("DETAINROOM_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DRS_DETAINROOM_PK" ON "PIBICSDM2"."DRS_DETAINROOM" ("DETAINROOM_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."DRS_DETAINROOM_U01" ON "PIBICSDM2"."DRS_DETAINROOM" ("DETAINROOMID", "LOCATEDEPT_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DRS_DETAINROOM" TO "BIOSAADM";
