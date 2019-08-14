CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_RECEIPT_FINE" ("KEY_VALUE", "RECEIPT_NO1", "RECEIPT_NO2", "OVERSTAYED_DAYS", "POLICE_STATION", "DATE_DAY", "DATE_MONTH", "DATE_YEAR", "RECEIVED_FROM", "CHARGED_OF", "CASE_NUMBER", "CASE_DATE_DAY", "CASE_DATE_MONTH", "CASE_DATE_YEAR", "COSTS_BATH", "COSTS_SATANG", "COSTS_IN_WORDS") AS 
  SELECT key_value
      ,receipt_no1
      ,receipt_no2
      ,overstayed_days
      ,police_station
      ,date_day
      ,date_month
      ,date_year
      ,received_from
      ,charged_of
      ,case_number
      ,case_date_day
      ,case_date_month
      ,case_date_year
      ,costs_bath
      ,costs_satang
      ,INITCAP(
          CASE
            WHEN costs_bath > 0
            THEN
              TO_CHAR(TO_DATE(costs_bath, 'J'), 'JSP')
            ELSE '-'
          END
       ) || ' Bath' ||
       CASE
          WHEN costs_satang > 0
          THEN
            ' and ' || INITCAP(TO_CHAR(TO_DATE(costs_satang, 'J'), 'JSP')) || ' Satang'
          ELSE NULL
       END AS costs_in_words
  FROM (SELECT faf.key_value
              ,faf.booking_number AS receipt_no1
              ,faf.receipt_number AS receipt_no2
              ,(SELECT SUM(NVL(overstayed_days, 0)) FROM dl_bordercontrol.faf_fees_and_fines_details det WHERE det.fees_and_fines = faf.key_value) AS overstayed_days
              ,b.name AS police_station
              ,TO_CHAR(faf.ins_at, 'DD') AS date_day
              ,TO_CHAR(faf.ins_at, 'MM') AS date_month
              ,TO_CHAR(faf.ins_at, 'YYYY') AS date_year
              ,'received the fine from' AS received_from
              ,'charged of' AS charged_of
              ,'case settlement no.' AS case_number
              ,'date' AS case_date_day
              ,'month' AS case_date_month
              ,'year' AS case_date_year
              ,TRUNC(NVL(faf.total_costs, 0)) AS costs_bath
              ,NVL((faf.total_costs - TRUNC(faf.total_costs)), 0) * 100 AS costs_satang
          FROM dl_bordercontrol.faf_fees_and_fines faf
          --LEFT JOIN dl_bordercontrol.visas v ON faf.key_value = v.receipt
          JOIN dl_bordercontrol.borderposts b ON b.key_value = faf.ins_borderpost)
;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_RECEIPT_FINE" TO "JASPER_REPORTING";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_RECEIPT_FINE" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_RECEIPT_FINE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_RECEIPT_FINE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_RECEIPT_FINE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_RECEIPT_FINE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_RECEIPT_FINE" TO "APPSUP";
