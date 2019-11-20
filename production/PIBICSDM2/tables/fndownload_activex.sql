CREATE TABLE "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" 
   (	"SEQNO" NUMBER, 
	"NAME" VARCHAR2(50 CHAR), 
	"PIC_PATH" VARCHAR2(100 CHAR), 
	"DRIVER_PATH" VARCHAR2(100 CHAR), 
	"MANUAL_PATH" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" ADD CONSTRAINT "FNDOWNLOAD_ACTIVEX_PK" PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FNDOWNLOAD_ACTIVEX_PK" ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" ("SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FNDOWNLOAD_ACTIVEX" TO "BIOSAADM";
