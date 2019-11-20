CREATE TABLE "PIBICSDM2"."DW_FACT_EXTENSION_STAT" 
   (	"EXT_SEQNO" NUMBER(*,0), 
	"EXT_DATE" VARCHAR2(10 CHAR), 
	"EXT_D" NUMBER(*,0), 
	"MONTH_SEQNO" NUMBER(*,0), 
	"EXT_Y" NUMBER(*,0), 
	"REASON_SEQNO" NUMBER(*,0), 
	"NATION_SEQNO" NUMBER(*,0), 
	"VISATYPE_SEQNO" NUMBER(*,0), 
	"DEPT_SEQNO" NUMBER(*,0), 
	"DEPT1_SEQNO" NUMBER(*,0), 
	"DEPT2_SEQNO" NUMBER(*,0), 
	"DEPT3_SEQNO" NUMBER(*,0), 
	"SEX" CHAR(1 CHAR), 
	"EXT_STAT" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DW_FACT_EXTENSION_STAT" TO "BIOSAADM";
