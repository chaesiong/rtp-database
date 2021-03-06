CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_STATISTICWORK" ("STATISTIC", "MM1") AS 
  SELECT   '0' statistic, '01' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '02' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '03' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '04' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '05' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '06' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '07' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '08' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '09' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '10' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '11' mm1 FROM DUAL
   UNION
   SELECT   '0' statistic, '12' mm1 FROM DUAL ;
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICWORK" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICWORK" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICWORK" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_STATISTICWORK" TO "BIOSAADM";
