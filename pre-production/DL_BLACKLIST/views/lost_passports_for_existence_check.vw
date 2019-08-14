CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK" ("ISSUING_COUNTRY", "DOC_NUMBER", "DATE_OF_EXPIRY", "NOTICE") AS 
  SELECT td.issuing_country
      ,td.doc_number
      ,td.date_of_expiry
      ,c.notice
 FROM dl_blacklist.travel_docs td
 JOIN dl_blacklist.identities i                 ON td.identity = i.key_value
 JOIN dl_blacklist.blacklist_case_identities ci ON ci.identity = i.key_value
 JOIN dl_blacklist.blacklist_cases c            ON c.id        = ci.blacklist_case
                                               AND c.case_type = 'LOST_PASSPORT'
;
   COMMENT ON TABLE "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK"  IS 'All lost passports in the system, used for alarm in the user interface';
  GRANT SELECT ON "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."LOST_PASSPORTS_FOR_EXISTENCE_CHECK" TO "TESTADM";
