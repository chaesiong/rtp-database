CREATE TABLE "PIBICSDM2"."INV_PLOTHERINFO_LOG" 
   (	"PLO_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PLO_SECURITYLEVEL" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"PLOTHERINFOLOG_SEQNO" NUMBER, 
	"PLOTHERINFOLOG_DATE" TIMESTAMP (6), 
	"PLOTHERINFOLOG_FLAG" CHAR(1 CHAR), 
	"PLOTHERINFOLOG_USRUPD" VARCHAR2(20 CHAR), 
	"PLO_REMARK" CLOB, 
	"PLACELOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLOTHERINFO_LOG" ADD CONSTRAINT "INV_PLOTHERINFO_LOG_PK" PRIMARY KEY ("PLOTHERINFOLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLOTHERINFO_LOG" ADD CONSTRAINT "INV_PLOTHERINFO_LOG_R01" FOREIGN KEY ("PLACELOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE_LOG" ("PLACELOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLOTHERINFO_LOG_PK" ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" ("PLOTHERINFOLOG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301539C00014$$" ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_PLOTHERINFO_LOG" TO "BIOSAADM";
