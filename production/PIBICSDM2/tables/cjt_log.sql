CREATE TABLE "PIBICSDM2"."CJT_LOG" 
   (	"CARD_ID" VARCHAR2(9 CHAR), 
	"WLCD" VARCHAR2(7 CHAR), 
	"UPDDTE" DATE, 
	"UPDUSR" CHAR(6 CHAR), 
	"STATUS" CHAR(1 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CJT_LOG" TO "BIOSAADM";
