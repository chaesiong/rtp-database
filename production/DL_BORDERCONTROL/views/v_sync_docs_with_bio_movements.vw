CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_SYNC_DOCS_WITH_BIO_MOVEMENTS" ("BRDDOCID") AS 
  select distinct bd.brddocid
  from borderdocuments bd
  join movements m on bd.brddocid = m.brddocid
  join movements_blob mb on m.mvmntid = mb.mvmnt_id
 where bd.afisid is null
   and m.is_finished = 'Y'
   and coalesce(
         /*mb.live_photo -- skip movements that only contain face images until ABIS with face-sdk 5.x or higher
       ,*/ mb.wsq_rt
       , mb.wsq_ri
       , mb.wsq_rm
       , mb.wsq_rr
       , mb.wsq_rl
       , mb.wsq_lt
       , mb.wsq_li
       , mb.wsq_lm
       , mb.wsq_lr
       , mb.wsq_ll
       ) is not null
minus
select brddocid
  from movements m
  join travel_abis_insert_error tair on m.mvmntid = tair.movement_id
;
  GRANT SELECT ON "DL_BORDERCONTROL"."V_SYNC_DOCS_WITH_BIO_MOVEMENTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_SYNC_DOCS_WITH_BIO_MOVEMENTS" TO "BIOSUPPORT";
