CREATE TABLE "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" 
   (	"FSS_SEQNO" NUMBER NOT NULL ENABLE, 
	"SYSTEM_NAME" VARCHAR2(60 CHAR), 
	"SYSTEM_CODE" VARCHAR2(10 CHAR), 
	"SYSTEM_TYPE" VARCHAR2(1 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"PRATE_SEQNO" NUMBER
   ) ;
  ALTER TABLE "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" ADD CONSTRAINT "FS_SLIPSYSTEM_PK" PRIMARY KEY ("FSS_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."FS_SLIPSYSTEM_PK" ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" ("FSS_SEQNO") 
  ;
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."FS_SLIPSYSTEM" TO "BIOSAADM";
