CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_VOA" ("RWNUM", "PASSPORT_NO", "VISA_NUMBER", "PERSON_NAME", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "SEX", "DATE_OF_BIRTH", "NATIONALITY", "BORDERPOST", "ISSUING_DATE", "STATUS") AS 
  SELECT ROWNUM AS rwnum
      ,bd.docno AS passport_no
      ,v.visa_number
      ,p.first_name ||
       CASE WHEN p.last_name   IS NOT NULL THEN ' ' || p.last_name   ELSE NULL END ||
       CASE WHEN p.middle_name IS NOT NULL THEN ' ' || p.middle_name ELSE NULL END
        AS person_name
      ,p.first_name
      ,p.middle_name
      ,p.last_name
      ,p.sex
      ,p.date_of_birth
      ,p.nationality
      ,v.ins_borderpost AS borderpost
      ,v.issuing_date
      ,v.status
  FROM dl_bordercontrol.visas v
  JOIN dl_bordercontrol.person p                ON v.person         = p.key_value
  LEFT JOIN dl_bordercontrol.borderdocuments bd ON v.borderdocument = bd.brddocid
 WHERE v.visa_type = 10;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_VOA" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_VOA" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_VOA" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."REP_VOA" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "PORNRUKSA_S";
