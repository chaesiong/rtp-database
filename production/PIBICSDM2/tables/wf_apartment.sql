CREATE TABLE "PIBICSDM2"."WF_APARTMENT" 
   (	"APT_SEQNO" NUMBER, 
	"APT_ROOMNO" VARCHAR2(5 CHAR), 
	"APT_WATER_METERNO" VARCHAR2(20 CHAR), 
	"APT_REMARK" VARCHAR2(500 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"BD_ID" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_APARTMENT" ADD CONSTRAINT "WF_APARTMENT_PK" PRIMARY KEY ("APT_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_APARTMENT_PK" ON "PIBICSDM2"."WF_APARTMENT" ("APT_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WF_APARTMENT" TO "BIOSAADM";
