CREATE TABLE "DL_STAGING4PIBICS"."CONTINENT" 
   (	"CONTINENT_SEQNO" NUMBER NOT NULL ENABLE, 
	"CONTINENTCD" VARCHAR2(2 CHAR), 
	"CONTINENTTNM" VARCHAR2(60 CHAR), 
	"CONTINENTENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."CONTINENT_UK1" ON "DL_STAGING4PIBICS"."CONTINENT" ("CONTINENT_SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CONTINENT" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CONTINENT" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CONTINENT" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CONTINENT" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CONTINENT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CONTINENT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CONTINENT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."CONTINENT" TO "BIOSAADM";
