CREATE TABLE "PIBICSDM2"."WEAPONBRAND" 
   (	"WB_SEQNO" NUMBER, 
	"WB_BRANDNAME" VARCHAR2(60 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WEAPONBRAND" ADD CONSTRAINT "WEAPONBRAND_PK" PRIMARY KEY ("WB_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."WEAPONBRAND" ADD CONSTRAINT "WEAPONBRAND_U01" UNIQUE ("WB_BRANDNAME")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WEAPONBRAND_PK" ON "PIBICSDM2"."WEAPONBRAND" ("WB_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."WEAPONBRAND_U01" ON "PIBICSDM2"."WEAPONBRAND" ("WB_BRANDNAME") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WEAPONBRAND" TO "BIOSAADM";
