CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_ARSCASEMONTH" ("MM1", "MM2", "MM3", "MM4", "MM5", "MM6", "MM7", "MM8", "MM9", "MM10", "MM11", "MM12", "CREATE_DATE", "TOTALEDITMAIN", "TOTALCHGCIVIL", "TOTALCHGDOMICILE", "TOTALREVOKECERT", "TOTALLEAVEPLACE", "TOTALDAMAGED", "TOTALLOST", "TOTALPHOTONEW", "TOTALRECEIPT", "TOTALEDITADDITIONAL", "TOTALCHGOCC", "TOTALRENEWALCERT", "TOTALALIENCERTNEW") AS 
  SELECT   MM1,
            MM2,
            MM3,
            MM4,
            MM5,
            MM6,
            MM7,
            MM8,
            MM9,
            MM10,
            MM11,
            MM12,
            CREATE_DATE,
            totaleditmain,
            totalchgcivil,
            totalchgdomicile,
            totalrevokecert,
            totalleaveplace,
            totaldamaged,
            totallost,
            totalphotonew,
            totalreceipt,
            totaleditadditional,
            totalchgocc,
            totalrenewalcert,
            totalaliencertnew
     FROM   (  SELECT   TO_CHAR (create_date, 'YYYYMM') CREATE_DATE,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '01' THEN 1
                              END)
                           MM1,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '02' THEN 1
                              END)
                           MM2,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '03' THEN 1
                              END)
                           MM3,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '04' THEN 1
                              END)
                           MM4,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '05' THEN 1
                              END)
                           MM5,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '06' THEN 1
                              END)
                           MM6,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '07' THEN 1
                              END)
                           MM7,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '08' THEN 1
                              END)
                           MM8,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '09' THEN 1
                              END)
                           MM9,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '10' THEN 1
                              END)
                           MM10,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '11' THEN 1
                              END)
                           MM11,
                        COUNT(CASE
                                 WHEN TO_CHAR (CREATE_DATE, 'MM') = '12' THEN 1
                              END)
                           MM12,
                        totaleditmain,
                        totalchgcivil,
                        totalchgdomicile,
                        totalrevokecert,
                        totalleaveplace,
                        totaldamaged,
                        totallost,
                        totalphotonew,
                        totalreceipt,
                        totaleditadditional,
                        totalchgocc,
                        totalrenewalcert,
                        totalaliencertnew
                 FROM   ars_statisticalwork
             GROUP BY   TO_CHAR (create_date, 'YYYYMM'),
                        totaleditmain,
                        totalchgcivil,
                        totalchgdomicile,
                        totalrevokecert,
                        totalleaveplace,
                        totaldamaged,
                        totallost,
                        totalphotonew,
                        totalreceipt,
                        totaleditadditional,
                        totalchgocc,
                        totalrenewalcert,
                        totalaliencertnew) ;
  GRANT SELECT ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_ARSCASEMONTH" TO "BIOSAADM";
