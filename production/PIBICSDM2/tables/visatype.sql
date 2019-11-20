CREATE TABLE "PIBICSDM2"."VISATYPE" 
   (	"VISATYPE_SEQNO" NUMBER, 
	"VISATYPECD" CHAR(4 CHAR), 
	"VISATYPETNM" VARCHAR2(120 CHAR), 
	"VISATYPEENM" VARCHAR2(60 CHAR), 
	"PERMITTDAYS" NUMBER(*,0) DEFAULT 0, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"VISATYPE_EXT" VARCHAR2(60 CHAR), 
	"OLD_VISATYPE" CHAR(4 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."VISATYPE" ADD CONSTRAINT "VISATYPE_PK" PRIMARY KEY ("VISATYPE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."VISATYPECD_PK" ON "PIBICSDM2"."VISATYPE" ("VISATYPECD") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."VISATYPE_PK" ON "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VISATYPE" TO "BIOSAADM";
