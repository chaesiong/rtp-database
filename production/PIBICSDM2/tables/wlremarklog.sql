CREATE TABLE "PIBICSDM2"."WLREMARKLOG" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"REMK" VARCHAR2(2500 CHAR), 
	"LOGUSERID" VARCHAR2(20 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"WATCHLISTLOGID" NUMBER(10,0), 
	"WLREMARKLOGID" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."WLREMARKLOG_PK" ON "PIBICSDM2"."WLREMARKLOG" ("WLREMARKLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WLREMARKLOG" TO "BIOSAADM";
