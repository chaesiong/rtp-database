CREATE TABLE "PIBICSDM2"."EXT_OFFICE_TYPE" 
   (	"OFFTYPE_SEQNO" NUMBER, 
	"OFFTYPENM" VARCHAR2(100 CHAR), 
	"OFFTYPEDESC" VARCHAR2(200 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_OFFICE_TYPE" ADD CONSTRAINT "EXT_OFFICE_TYPE_PK" PRIMARY KEY ("OFFTYPE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_OFFICE_TYPE_PK" ON "PIBICSDM2"."EXT_OFFICE_TYPE" ("OFFTYPE_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_OFFICE_TYPE" TO "BIOSAADM";
