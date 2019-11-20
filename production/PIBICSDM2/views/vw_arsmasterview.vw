CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_ARSMASTERVIEW" ("SUBJECT", "STATISTIC", "CREATE_DATE") AS 
  SELECT   'แก้ไขข้อมูลบุคคลต่างด้าว' subject,
              DECODE (SUM (TOTALEDITMAIN), NULL, 0, SUM (TOTALEDITMAIN))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'ย้ายภูมิลำเนา' subject,
              DECODE (SUM (TOTALCHGdomicile), NULL, 0, SUM (TOTALCHGdomicile))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'เพิกถอน' subject,
              DECODE (SUM (TOTALREvokecert), NULL, 0, SUM (TOTALREvokecert))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'สละถิ่น' subject,
              DECODE (SUM (TOTALleaveplace), NULL, 0, SUM (TOTALleaveplace))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'รับคืนใบสำคัญฯ กรณีชำรุด' subject,
              DECODE (SUM (TOTALdamaged), NULL, 0, SUM (TOTALdamaged))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'รับคืนใบสำคัญฯ กรณีสูญหาย' subject,
              DECODE (SUM (TOTALlost), NULL, 0, SUM (TOTALlost)) statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'ปิดรูปถ่ายใหม่' subject,
              DECODE (SUM (TOTALphotonew), NULL, 0, SUM (TOTALphotonew))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'รับแจ้งการชำระค่าธรรมเนียม' subject,
              DECODE (SUM (TOTALRECEIPT), NULL, 0, SUM (TOTALRECEIPT))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'แก้ไขรายการหมายเหตุ' subject,
              DECODE (SUM (TOTALeditadditional),
                      NULL, 0,
                      SUM (TOTALeditadditional))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'รับแจ้งการเปลี่ยนอาชีพ' subject,
              DECODE (SUM (TOTALchgocc), NULL, 0, SUM (TOTALchgocc)) statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'ต่ออายุใบสำคัญ' subject,
              DECODE (SUM (TOTALrenewalcert), NULL, 0, SUM (TOTALrenewalcert))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm')
   UNION
     SELECT   'ลงทะเบียนรับปลายขั้วใหม่' subject,
              DECODE (SUM (TOTALaliencertnew),
                      NULL, 0,
                      SUM (TOTALaliencertnew))
                 statistic,
              TO_CHAR (create_date, 'yyyymm') create_date
       FROM   ars_statisticalwork
   GROUP BY   TO_CHAR (create_date, 'yyyymm') ;
  GRANT SELECT ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_ARSMASTERVIEW" TO "BIOSAADM";
