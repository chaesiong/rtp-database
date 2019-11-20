CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_STATISTICALWORK" ("STATISTIC", "CREATE_DATE") AS 
  SELECT   '0' statistic, '01' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '02' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '03' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '04' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '05' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '06' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '07' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '08' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '09' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '10' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '11' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '12' create_date FROM DUAL ;
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICALWORK" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICALWORK" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICALWORK" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_STATISTICALWORK" TO "BIOSAADM";
