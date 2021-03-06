CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTSUMOTRATE" ("SUMOTRATE") AS 
  SELECT   SUM (numrate) SUMOTRATE
     FROM   vwotrate
    WHERE   actflag = 'ACTIVE' ;
  GRANT SELECT ON "PIBICSDM2"."VWOTSUMOTRATE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUMOTRATE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUMOTRATE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWOTSUMOTRATE" TO "BIOSAADM";
