CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_YEARZERO" ("STATISTIC", "CREATE_DATE") AS 
  SELECT   '0' statistic, '1995' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '1996' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '1997' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '1998' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '1999' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2000' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2001' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2002' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2003' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2004' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2005' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2006' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2007' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2008' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2009' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2010' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2011' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2012' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2013' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2014' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2015' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2016' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2017' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2018' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2019' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2020' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2021' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2022' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2023' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2024' create_date FROM DUAL
   UNION
   SELECT   '0' statistic, '2025' create_date FROM DUAL ;
  GRANT SELECT ON "PIBICSDM2"."VW_YEARZERO" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_YEARZERO" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_YEARZERO" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_YEARZERO" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_YEARZERO" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_YEARZERO" TO "BIOSAADM";
