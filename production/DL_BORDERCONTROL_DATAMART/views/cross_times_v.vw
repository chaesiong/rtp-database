CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL_DATAMART"."CROSS_TIMES_V" ("YEAR_NUMERIC", "MONTH_NAME", "DATE_VALUE", "MOVEMENT_TYPE", "COUNTER") AS 
  WITH time_dimension AS (SELECT DISTINCT year_numeric, month_numeric, month_name, TRUNC(date_value) AS date_value FROM dl_bordercontrol_datamart.dim_times)
SELECT year_numeric
      ,LPAD(month_numeric, 2, '0') || ' ' ||  month_name AS month_name
      ,date_value
      ,mt.name AS movement_type
      ,0 AS counter
  FROM dl_bordercontrol_datamart.dim_movement_types mt
 CROSS JOIN time_dimension
 WHERE mt.id NOT IN ('-100', '-200', 'OFFLOAD');
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."CROSS_TIMES_V" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."CROSS_TIMES_V" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."CROSS_TIMES_V" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."CROSS_TIMES_V" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."CROSS_TIMES_V" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."CROSS_TIMES_V" TO "APPSUP";