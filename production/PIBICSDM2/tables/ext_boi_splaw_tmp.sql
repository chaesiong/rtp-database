CREATE TABLE "PIBICSDM2"."EXT_BOI_SPLAW_TMP" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"FACTTYPE" CHAR(1 CHAR), 
	"DUE_YEAR" NUMBER(5,1), 
	"GUARANTY_NO" VARCHAR2(20 CHAR), 
	"GUARANTY_DATE" DATE, 
	"GUARANTY_YEAR" NUMBER(4,1), 
	"CONTINENT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(500 CHAR), 
	"TERMINAL_DATE" DATE, 
	"CHGPASS_NAME" VARCHAR2(100 CHAR), 
	"CHGPASS_OPASS" VARCHAR2(100 CHAR), 
	"CHGPASS_NPASS" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"GUARANTY_NO2" VARCHAR2(20 CHAR), 
	"COMPANY_SEQNO" NUMBER, 
	"COMPANYNM" VARCHAR2(1000 CHAR), 
	"POSITION" VARCHAR2(100 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_BOI_SPLAW_TMP" TO "BIOSAADM";
