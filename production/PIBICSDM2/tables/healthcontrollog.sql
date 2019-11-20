CREATE TABLE "PIBICSDM2"."HEALTHCONTROLLOG" 
   (	"FLNO" CHAR(9 CHAR), 
	"COUNTCD" CHAR(3 CHAR), 
	"UPDUSR" CHAR(6 CHAR), 
	"UPDDTE" DATE, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"SLIPZONELOGID" NUMBER(5,0)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."HEALTHCONTROLLOG" TO "BIOSAADM";
