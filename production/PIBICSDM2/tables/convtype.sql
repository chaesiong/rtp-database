CREATE TABLE "PIBICSDM2"."CONVTYPE" 
   (	"CONVTYPE_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"CONVTYPETNM" VARCHAR2(60 CHAR), 
	"CONVTYPEENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER(1,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."CONVTYPE" ADD CONSTRAINT "CONVTYPE_PK" PRIMARY KEY ("CONVTYPE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."CONVTYPE" ADD CONSTRAINT "CONVTYPE_R01" FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CONVTYPE_PK" ON "PIBICSDM2"."CONVTYPE" ("CONVTYPE_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CONVTYPE" TO "BIOSAADM";
