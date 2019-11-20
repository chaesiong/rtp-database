CREATE TABLE "PIBICSDM2"."TMP_EXTSLIPLOG" 
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
	"UPDDTE" DATE, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"EXTSLIPLOGID" NUMBER(20,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_EXTSLIPLOG" ADD PRIMARY KEY ("EXTSLIPLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207456" ON "PIBICSDM2"."TMP_EXTSLIPLOG" ("EXTSLIPLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_EXTSLIPLOG" TO "BIOSAADM";
