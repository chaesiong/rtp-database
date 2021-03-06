CREATE TABLE "PIBICSDM2"."TMMORETHAN" 
   (	"TDTNO" VARCHAR2(200 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"CNT" NUMBER, 
	"CREUSR" VARCHAR2(20 CHAR), 
	"DEPTCD" CHAR(5 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMMORETHAN" TO "BIOSAADM";
