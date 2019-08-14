CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_FAF_VISAS" ("PRINT_FLAG", "BORDERDOCUMENT", "DOCNO", "TM6_NO", "ENTRY_FORM", "PERSON", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "THAI_LAST_NAME", "THAI_FIRST_NAME", "SEX", "DATE_OF_BIRTH", "NATIONALITY", "TRANS_VEHICLE", "TRANS_NUMBER", "ARRIVAL_DATE", "VISA_TYPE", "EXPIRY_DATE", "DEPARTURE_DATE", "STATUS", "STATUS_NOTE", "PERMIT", "PERMIT_DATE", "GENERATION_STATUS", "SALUTATION", "VISA_NUMBER", "KEY_VALUE") AS 
  SELECT 'N' AS print_flag
      ,v.borderdocument
      ,b.docno
      ,p.tm6_no
      ,NULL AS entry_form
      ,v.person
      ,p.first_name
      ,p.middle_name
      ,p.last_name
      ,NULL AS thai_last_name
      ,NULL AS thai_first_name
      ,p.sex
      ,p.date_of_birth
      ,p.nationality
      ,v.trans_vehicle
      ,v.trans_number
      ,v.applicant_date AS arrival_date
      ,v.visa_type
      ,v.expiry_date
      ,NULL AS departure_date
      ,NULL AS status
      ,NULL AS status_note
      ,NULL AS permit
      ,NULL AS permit_date
      ,NULL AS generation_status
      ,p.salutation
      ,v.visa_number
      ,v.key_value
  FROM visas v
  LEFT JOIN borderdocuments b ON b.brddocid  = v.borderdocument
  LEFT JOIN person p          ON p.key_value = v.person
;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_VISAS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_FAF_VISAS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_FAF_VISAS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_VISAS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_FAF_VISAS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FAF_VISAS" TO "APPSUP";