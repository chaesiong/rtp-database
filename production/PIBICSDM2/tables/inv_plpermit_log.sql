CREATE TABLE "PIBICSDM2"."INV_PLPERMIT_LOG" 
   (	"PLE_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PP_SEQNO" NUMBER, 
	"PLE_PERMITNO" VARCHAR2(60 CHAR), 
	"PLE_REGISTERNAME" VARCHAR2(100 CHAR), 
	"PLE_OLDNAME" VARCHAR2(100 CHAR), 
	"PLE_REMARK" VARCHAR2(600 CHAR), 
	"PLE_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"PLPERMITLOG_SEQNO" NUMBER, 
	"PLPERMITLOG_DATE" TIMESTAMP (6), 
	"PLPERMITLOG_FLAG" CHAR(1 CHAR), 
	"PLPERMITLOG_USRUPD" VARCHAR2(20 CHAR), 
	"PLACELOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLPERMIT_LOG" ADD CONSTRAINT "INV_PLPERMIT_LOG_PK" PRIMARY KEY ("PLPERMITLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLPERMIT_LOG" ADD CONSTRAINT "INV_PLPERMIT_LOG_R01" FOREIGN KEY ("PLACELOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE_LOG" ("PLACELOG_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLPERMIT_LOG" ADD CONSTRAINT "INV_PLPERMIT_LOG_R02" FOREIGN KEY ("PP_SEQNO")
	  REFERENCES "PIBICSDM2"."PLACE_PERMITTYPE" ("PP_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLPERMIT_LOG_PK" ON "PIBICSDM2"."INV_PLPERMIT_LOG" ("PLPERMITLOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_PLPERMIT_LOG" TO "BIOSAADM";
