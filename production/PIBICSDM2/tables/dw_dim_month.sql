CREATE TABLE "PIBICSDM2"."DW_DIM_MONTH" 
   (	"MONTH_SEQNO" NUMBER(*,0), 
	"MONTHTHNAME" VARCHAR2(100 CHAR), 
	"MONTHENNAME" VARCHAR2(100 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DW_DIM_MONTH" TO "BIOSAADM";
