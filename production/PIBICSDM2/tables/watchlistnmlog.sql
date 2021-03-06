CREATE TABLE "PIBICSDM2"."WATCHLISTNMLOG" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"WLTLASTNM" VARCHAR2(60 CHAR), 
	"WLTFIRSTNM" VARCHAR2(60 CHAR), 
	"WLTMIDDLENM" VARCHAR2(60 CHAR), 
	"WLELASTNM" VARCHAR2(60 CHAR), 
	"WLEMIDDLENM" VARCHAR2(60 CHAR), 
	"WLEFIRSTNM" VARCHAR2(60 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"LOGUSERID" VARCHAR2(20 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"TFSNDXNM" VARCHAR2(60 CHAR), 
	"TMSNDXNM" VARCHAR2(60 CHAR), 
	"TLSNDXNM" VARCHAR2(60 CHAR), 
	"WATCHLISTNMLOGID" NUMBER(10,0), 
	"WATCHLISTLOGID" NUMBER(10,0), 
	"FLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WATCHLISTNMLOG" ADD CONSTRAINT "WATCHLISTNMLOG_PK" PRIMARY KEY ("WATCHLISTNMLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WATCHLISTNMLOG_PK" ON "PIBICSDM2"."WATCHLISTNMLOG" ("WATCHLISTNMLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WATCHLISTNMLOG" TO "BIOSAADM";
