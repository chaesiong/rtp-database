CREATE TABLE "PIBICSDM2"."INV_PLCASEHISTORY" 
   (	"PLC_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PLC_CASENO" VARCHAR2(20 CHAR), 
	"PLC_CASEOWNER" VARCHAR2(100 CHAR), 
	"PLC_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"PLC_REMARK" CLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLCASEHISTORY" ADD CONSTRAINT "INV_PLCASEHISTORY_PK" PRIMARY KEY ("PLC_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLCASEHISTORY" ADD CONSTRAINT "INV_PLCASEHISTORY_R01" FOREIGN KEY ("PL_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE" ("PL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLCASEHISTORY_PK" ON "PIBICSDM2"."INV_PLCASEHISTORY" ("PLC_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301520C00012$$" ON "PIBICSDM2"."INV_PLCASEHISTORY" (
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_PLCASEHISTORY" TO "BIOSAADM";
