CREATE TABLE "PIBICSDM2"."DRS_RECVTYPE" 
   (	"RECVTYPE_SEQNO" NUMBER, 
	"RECVTYPECD" CHAR(1 CHAR), 
	"RECVDESC" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_RECVTYPE" ADD PRIMARY KEY ("RECVTYPE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_RECVTYPE" ADD CONSTRAINT "DRS_RECVTYPE_U01" UNIQUE ("RECVDESC")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_RECVTYPE" ADD UNIQUE ("RECVTYPECD")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DRS_RECVTYPE_U01" ON "PIBICSDM2"."DRS_RECVTYPE" ("RECVDESC") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207149" ON "PIBICSDM2"."DRS_RECVTYPE" ("RECVTYPE_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207159" ON "PIBICSDM2"."DRS_RECVTYPE" ("RECVTYPECD") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DRS_RECVTYPE" TO "BIOSAADM";
