CREATE TABLE "PIBICSDM2"."WELFARE_HREDOCDT" 
   (	"FSCYEAR" CHAR(4 CHAR), 
	"DEPTCD" CHAR(4 CHAR), 
	"RQTDOCNO" CHAR(20 CHAR), 
	"MONTH" CHAR(2 CHAR), 
	"PMTAMT" NUMBER(10,2), 
	"RQTAMT" NUMBER(10,2), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WELFARE_HREDOCDT" TO "BIOSAADM";
