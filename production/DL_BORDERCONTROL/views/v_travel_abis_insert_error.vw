CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_TRAVEL_ABIS_INSERT_ERROR" ("MOVEMENT_ID", "ERROR_MESSAGE") AS 
  select errors.movement_id
     , errors.error_message
from (
    select movement_id
         , error_message
         , row_number() over (partition by movement_id order by ins_at desc) seq
      from travel_abis_insert_error
    ) errors
    join movements m on m.mvmntid = errors.movement_id
    join borderdocuments bd on bd.brddocid = m.brddocid
where errors.seq = 1
  and bd.afisid is null;
  GRANT SELECT ON "DL_BORDERCONTROL"."V_TRAVEL_ABIS_INSERT_ERROR" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_TRAVEL_ABIS_INSERT_ERROR" TO "BIOSUPPORT";
