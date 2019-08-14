CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_FELLOW_PASSENGER" ("KEY_VALUE", "PERSON", "RELATION", "NATIONALITY", "RECEIPT", "TM6_NO", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "SEX", "DATE_OF_BIRTH", "PLACE_OF_BIRTH", "REASON", "APPROVAL_STATUS") AS 
  SELECT key_value
        ,person
        ,relation
        ,nationality
        ,receipt
        ,tm6_no
        ,first_name
        ,middle_name
        ,last_name
        ,sex
        ,date_of_birth
        ,place_of_birth
        ,reason
        ,approval_status
    FROM fellow_passenger
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FELLOW_PASSENGER" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_FELLOW_PASSENGER" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_FELLOW_PASSENGER" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FELLOW_PASSENGER" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_FELLOW_PASSENGER" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_FELLOW_PASSENGER" TO "TESTADM";