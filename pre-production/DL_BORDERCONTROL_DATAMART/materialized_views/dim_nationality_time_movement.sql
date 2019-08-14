CREATE MATERIALIZED VIEW "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT" ("YEAR_NUMERIC", "MONTH_NAME", "DATE_VALUE", "NATIONALITY", "NATIONALITY_ID", "MOVEMENT_TYPE", "COUNTER")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATASTORE" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH COMPLETE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION ENABLE QUERY REWRITE
  AS SELECT *
    FROM dl_bordercontrol_datamart.cross_nationalities_times_v
  UNION ALL
  SELECT year_numeric
        ,month_name
        ,date_value
        ,nationality
        ,nationality_id
        ,'Total' AS movement_type
        ,0 AS counter
    FROM dl_bordercontrol_datamart.cross_nationalities_times_v
   GROUP BY year_numeric, month_name, date_value, nationality, nationality_id;
   COMMENT ON MATERIALIZED VIEW "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT"  IS 'snapshot table for snapshot DL_BORDERCONTROL_DATAMART.DIM_NATIONALITY_TIME_MOVEMENT';
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."DIM_NATIONALITY_TIME_MOVEMENT" TO "TESTADM";