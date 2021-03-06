CREATE TABLE "PIBICSDM2"."WLRELATION" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"RELATION" VARCHAR2(60 CHAR), 
	"ARFIRSTNM" VARCHAR2(60 CHAR), 
	"ARLASTNM" VARCHAR2(60 CHAR), 
	"ARMIDDLENM" VARCHAR2(60 CHAR), 
	"REMK" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WLRELATION" ADD CONSTRAINT "PK_WLRELATION" PRIMARY KEY ("SEQNO", "WLCD")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."PK_WLRELATION" ON "PIBICSDM2"."WLRELATION" ("SEQNO", "WLCD") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WLRELATION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WLRELATION" TO "APPSUSR";
