CREATE TABLE "PIBICSDM2"."WATCHLISTDOC" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"WLDOCNM" VARCHAR2(50 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WATCHLISTDOC" ADD CONSTRAINT "WATCHLISTDOC_PK" PRIMARY KEY ("WLCD", "SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WATCHLISTDOC_PK" ON "PIBICSDM2"."WATCHLISTDOC" ("WLCD", "SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WATCHLISTDOC" TO "BIOSAADM";
