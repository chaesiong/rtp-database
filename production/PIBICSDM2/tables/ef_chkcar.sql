CREATE TABLE "PIBICSDM2"."EF_CHKCAR" 
   (	"PLATE1" VARCHAR2(10 CHAR), 
	"PLATE2" VARCHAR2(10 CHAR), 
	"CAR_PROVINCECD" CHAR(3 CHAR), 
	"CAR_TYPECD" CHAR(2 CHAR), 
	"CAR_BRANDCD" CHAR(3 CHAR), 
	"CAR_COLORCD" CHAR(2 CHAR), 
	"CAR_NUMENG" VARCHAR2(250 CHAR), 
	"CAR_NUMBODY" VARCHAR2(250 CHAR), 
	"CAR_MODEL" VARCHAR2(250 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"DEPTIO_SEQNO" NUMBER, 
	"DATEIO" TIMESTAMP (6), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"EF_CHKCAR_HIST_SEQNO" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EF_CHKCAR" TO "BIOSAADM";
