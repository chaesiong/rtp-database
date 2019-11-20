CREATE TABLE "PIBICSDM2"."OT_OTSLIP" 
   (	"OTSLIPSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"AGENTNAME" VARCHAR2(100 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"OTSLIPNO" VARCHAR2(20 CHAR), 
	"OTSLIPBOOKNO" VARCHAR2(20 CHAR), 
	"OTSLIPDATE" TIMESTAMP (6), 
	"TOTALAMOUNT" NUMBER(10,2), 
	"PRINTFLAG" CHAR(1 CHAR), 
	"OTSLIPSTATUS" VARCHAR2(10 CHAR), 
	"OTREMARK" VARCHAR2(1000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"SLIPTYPE" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_OTSLIP" ADD CONSTRAINT "OT_OTSLIP_PK" PRIMARY KEY ("OTSLIPSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_OTSLIP_PK" ON "PIBICSDM2"."OT_OTSLIP" ("OTSLIPSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_OTSLIP" TO "BIOSAADM";
