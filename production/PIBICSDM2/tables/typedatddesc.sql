CREATE TABLE "PIBICSDM2"."TYPEDATDDESC" 
   (	"SEQNO" NUMBER, 
	"TYPECD" VARCHAR2(20 CHAR), 
	"TYPEDESC" VARCHAR2(100 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."TYPEDATDDESC_PK" ON "PIBICSDM2"."TYPEDATDDESC" ("SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TYPEDATDDESC" TO "BIOSAADM";
