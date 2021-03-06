CREATE TABLE "PIBICSDM2"."DRS_IDCSTS" 
   (	"IDCSTS_SEQNO" NUMBER, 
	"IDCSTSCD" CHAR(2 CHAR), 
	"IDCSTS_DESC" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_IDCSTS" ADD CONSTRAINT "DRS_IDCSTS_PK" PRIMARY KEY ("IDCSTS_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DRS_IDCSTS_PK" ON "PIBICSDM2"."DRS_IDCSTS" ("IDCSTS_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."DRS_IDCSTS_U01" ON "PIBICSDM2"."DRS_IDCSTS" ("IDCSTS_DESC") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."DRS_IDCSTS_U02" ON "PIBICSDM2"."DRS_IDCSTS" ("IDCSTSCD") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DRS_IDCSTS" TO "BIOSAADM";
