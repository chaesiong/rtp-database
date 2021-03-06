CREATE TABLE "PIBICSDM2"."FS_SLIPSYSTEM" 
   (	"FSS_SEQNO" NUMBER, 
	"SYSTEM_NAME" VARCHAR2(60 CHAR), 
	"SYSTEM_CODE" VARCHAR2(10 CHAR), 
	"SYSTEM_TYPE" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PRATE_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_SLIPSYSTEM" ADD CONSTRAINT "FS_SLIPSYSTEM_PK" PRIMARY KEY ("FSS_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_SLIPSYSTEM_PK" ON "PIBICSDM2"."FS_SLIPSYSTEM" ("FSS_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FS_SLIPSYSTEM" TO "BIOSAADM";
