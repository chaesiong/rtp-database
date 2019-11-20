CREATE TABLE "PIBICSDM2"."UNTM2REFTYPE" 
   (	"SEQNO" NUMBER, 
	"REFNM" VARCHAR2(100 CHAR), 
	"REFTYPE" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."UNTM2REFTYPE" ADD PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207855" ON "PIBICSDM2"."UNTM2REFTYPE" ("SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."UNTM2REFTYPE" TO "BIOSAADM";
