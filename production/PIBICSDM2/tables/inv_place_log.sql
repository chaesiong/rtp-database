CREATE TABLE "PIBICSDM2"."INV_PLACE_LOG" 
   (	"PL_SEQNO" NUMBER, 
	"PL_TNAME" VARCHAR2(200 CHAR), 
	"PL_ENAME" VARCHAR2(200 CHAR), 
	"PT_SEQNO" NUMBER, 
	"PL_ADDR" VARCHAR2(200 CHAR), 
	"PL_STREET" VARCHAR2(200 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"PL_POSTCODE" CHAR(10 CHAR), 
	"PL_TELNO" VARCHAR2(50 CHAR), 
	"PL_ACTIVITY" VARCHAR2(600 CHAR), 
	"PL_INFORMATION" VARCHAR2(600 CHAR), 
	"PL_REMARK" VARCHAR2(600 CHAR), 
	"PL_WEBSITE" VARCHAR2(200 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"DEPT_SEQNO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"PL_SECURITYLEVEL" NUMBER, 
	"PS_SEQNO" NUMBER, 
	"PL_GROUP" VARCHAR2(20 CHAR), 
	"PLACELOG_SEQNO" NUMBER, 
	"PLACELOG_DATE" TIMESTAMP (6), 
	"PLACELOG_FLAG" CHAR(1 CHAR), 
	"PLACELOG_USRUPD" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLACE_LOG" ADD CONSTRAINT "INV_PLACE_LOG_PK" PRIMARY KEY ("PLACELOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLACE_LOG" ADD CONSTRAINT "INV_PLACE_LOG_R03" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLACE_LOG" ADD CONSTRAINT "INV_PLACE_LOG_R05" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLACE_LOG" ADD CONSTRAINT "INV_PLACE_LOG_R04" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLACE_LOG" ADD CONSTRAINT "INV_PLACE_LOG_R02" FOREIGN KEY ("PS_SEQNO")
	  REFERENCES "PIBICSDM2"."PLACE_SUBTYPE" ("PS_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLACE_LOG" ADD CONSTRAINT "INV_PLACE_LOG_R01" FOREIGN KEY ("PT_SEQNO")
	  REFERENCES "PIBICSDM2"."PLACE_TYPE" ("PT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLACE_LOG_PK" ON "PIBICSDM2"."INV_PLACE_LOG" ("PLACELOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_PLACE_LOG" TO "BIOSAADM";
