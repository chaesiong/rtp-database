CREATE TABLE "PIBICSDM2"."CONVEYANCE" 
   (	"CONV_SEQNO" NUMBER, 
	"CONVCD" CHAR(4 CHAR), 
	"TRAVCD" CHAR(4 CHAR), 
	"CONVTNM" VARCHAR2(60 CHAR), 
	"CONVENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER(1,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."CONVEYANCE" ADD CONSTRAINT "CONVEYANCE_PK" PRIMARY KEY ("CONV_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."CONVEYANCE" ADD CONSTRAINT "CONVEYANCE_U01" UNIQUE ("CONVCD")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."CONVEYANCE" ADD CONSTRAINT "CONVEYANCE_U02" UNIQUE ("CONVTNM")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."IDX_CONVEYANCE_500" ON "PIBICSDM2"."CONVEYANCE" (TO_NUMBER("CONVCD")) 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."CONVEYANCE_PK" ON "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."CONVEYANCE_U01" ON "PIBICSDM2"."CONVEYANCE" ("CONVCD") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."CONVEYANCE_U02" ON "PIBICSDM2"."CONVEYANCE" ("CONVTNM") 
  ;
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CONVEYANCE" TO "BIOSAADM";
