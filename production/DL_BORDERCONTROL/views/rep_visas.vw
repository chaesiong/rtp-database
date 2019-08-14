CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_VISAS" ("CREATED_AT", "BORDERPOST", "PORT_MOVEMENT", "SEX", "NAT", "NAT_VALUE", "VISA_TYPE") AS 
  SELECT
        m.ins_at created_at,
        m.ins_borderpost borderpost,
        m.exitflg port_movement,
        bd.sex,
        bd.nat,
        (
            SELECT
                nvl(display_value,display_value$dlc)
            FROM
                dl_common.countries$lc
            WHERE
                key_value = bd.nat
        ) nat_value,
        v.visa_type
    FROM movements m
    JOIN visas v ON m.visa = v.key_value
    JOIN borderdocuments bd ON m.brddocid = bd.brddocid;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VISAS" TO "JASPER_REPORTING";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VISAS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_VISAS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_VISAS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VISAS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_VISAS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VISAS" TO "APPSUP";
