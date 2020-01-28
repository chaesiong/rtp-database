CREATE MATERIALIZED VIEW "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" ("DATES", "DAY_MOVEMENTS", "TOTAL_MOVEMENTS", "DAY_ABIS", "TOTAL_ABIS", "DAY_BORDERDOCUMENTS", "TOTAL_BORDERDOCUMENTS", "REMAINING_FACE")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATASTORE" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH COMPLETE ON DEMAND START WITH sysdate+0 NEXT sysdate + 1
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS with
agg_movements as (
    select trunc(ins_at)    as dates
          ,count(*)         as day_movements
          ,sum(count(*)) over (order by trunc(ins_at)) as total_movements
        from dl_bordercontrol.movements
    where is_finished = 'Y'
    group by trunc(ins_at)
    order by trunc(ins_at)),
agg_abis as (
    select trunc(date_created)  as dates
          ,count(*)             as day_abis
          ,sum(count(*)) over (order by trunc(date_created)) as total_abis
    from dl_biostore_movements.record
    group by trunc(date_created)),
agg_borderdocuments as (
    select trunc(ins_at)    as dates
          ,count(*)         as day_borderdocuments
          ,sum(count(*)) over (order by trunc(ins_at)) as total_borderdocuments
    from dl_bordercontrol.borderdocuments
    group by trunc(ins_at)),
agg_remaining as (
    select trunc(lm.check_time) as dates
          ,min(remaining_face)  as faces
    from dl_bordercontrol.license_monitoring lm
    where lm.abis_system = 'MOVEMENTS'
    group by trunc(lm.check_time))
select am.dates
      ,am.day_movements
      ,am.total_movements
      ,aa.day_abis
      ,aa.total_abis
      ,ab.day_borderdocuments
      ,ab.total_borderdocuments
      ,ar.faces as remaining_face
from agg_movements am
join agg_abis aa            on am.dates = aa.dates
join agg_borderdocuments ab on am.dates = ab.dates
left join agg_remaining ar  on am.dates = ar.dates
;
   COMMENT ON MATERIALIZED VIEW "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS"  IS 'snapshot table for snapshot DL_BORDERCONTROL.MV_TRANSACTION_DATA_ANALYSIS';
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS" TO "PUNYAWII_D";
