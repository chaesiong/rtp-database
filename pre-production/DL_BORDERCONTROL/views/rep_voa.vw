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
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA" TO "TESTADM";
