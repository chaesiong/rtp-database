CREATE TABLE "PIBICSDM2"."LOGSPC" 
   (	"LOGSPC_SEQNO" NUMBER, 
	"SPCTYPE" CHAR(1 CHAR), 
	"SPCDTE" TIMESTAMP (6), 
	"SPCUSER" VARCHAR2(20 CHAR), 
	"SPCDEVICE" VARCHAR2(100 CHAR), 
	"SPCPARAM" VARCHAR2(1024 CHAR), 
	"SPCIMPDATE" TIMESTAMP (6), 
	"SPCRESULT" CHAR(1 CHAR), 
	"NOTE" VARCHAR2(1024 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."LOGSPC_PK" ON "PIBICSDM2"."LOGSPC" ("LOGSPC_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."LOGSPC" TO "BIOSAADM";
