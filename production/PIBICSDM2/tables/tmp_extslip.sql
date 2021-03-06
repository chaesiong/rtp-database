CREATE TABLE "PIBICSDM2"."TMP_EXTSLIP" 
   (	"EXTSLIPID" NUMBER(20,0), 
	"SLIPNO" VARCHAR2(10 CHAR), 
	"SLIPBOOKNO" VARCHAR2(10 CHAR), 
	"EXTID" NUMBER(20,0), 
	"SLIPDTE" DATE, 
	"FULLNM" VARCHAR2(100 CHAR), 
	"AMOUNT" NUMBER(15,0), 
	"PRINTFLAG" CHAR(1 CHAR), 
	"STATUS" CHAR(1 CHAR), 
	"CREUSR" CHAR(6 CHAR), 
	"CREDTE" DATE, 
	"UPDUSR" CHAR(6 CHAR), 
	"UPDDTE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_EXTSLIP" ADD PRIMARY KEY ("EXTSLIPID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207455" ON "PIBICSDM2"."TMP_EXTSLIP" ("EXTSLIPID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_EXTSLIP" TO "BIOSAADM";
