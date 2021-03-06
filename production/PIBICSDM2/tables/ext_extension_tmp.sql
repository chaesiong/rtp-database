CREATE TABLE "PIBICSDM2"."EXT_EXTENSION_TMP" 
   (	"EXT_SEQNO" NUMBER, 
	"DOCNO" VARCHAR2(50 CHAR), 
	"EXT_DATE" DATE, 
	"APPROVE_STS" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PERMIT_DATE" DATE, 
	"WAIT_DATE" DATE, 
	"NO_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_EXTENSION_TMP" TO "BIOSAADM";
