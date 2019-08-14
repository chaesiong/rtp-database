CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."V_VISAS" ("VISA_KEY_VALUE", "PASSPORT_NO", "VISA_NUMBER", "PERSON_NAME", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "SEX", "DATE_OF_BIRTH", "NATIONALITY", "BORDERPOST", "ISSUING_DATE", "STATUS", "VISA_TYPE", "RECEIPT", "PERSON") AS 
  SELECT v.key_value AS visa_key_value
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
      ,v.visa_type
      ,v.receipt
      ,v.person
  FROM dl_bordercontrol.visas v
  JOIN dl_bordercontrol.person p                ON v.person         = p.key_value
  LEFT JOIN dl_bordercontrol.borderdocuments bd ON v.borderdocument = bd.brddocid
  ORDER BY issuing_date DESC
;
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISAS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."V_VISAS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."V_VISAS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISAS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."V_VISAS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."V_VISAS" TO "TESTADM";
