CREATE TABLE "PIBICSDM2"."CJTTRANSFER" 
   (	"CJTSEQNO" NUMBER, 
	"TRANSFERDTE" DATE, 
	"CJTTIMES" NUMBER, 
	"TRANSFERLOGDTE" DATE, 
	"CJTTYPE" CHAR(1 CHAR), 
	"CJTADD" NUMBER DEFAULT 0, 
	"CJTUPD" NUMBER DEFAULT 0, 
	"CJTDEL" NUMBER DEFAULT 0, 
	"CJTFAIL" NUMBER DEFAULT 0, 
	"CJTTOTAL" NUMBER DEFAULT 0
   ) ;
  ALTER TABLE "PIBICSDM2"."CJTTRANSFER" ADD CONSTRAINT "CJTTRANSFER_PK" PRIMARY KEY ("CJTSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CJTTRANSFER_PK" ON "PIBICSDM2"."CJTTRANSFER" ("CJTSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CJTTRANSFER" TO "BIOSAADM";
