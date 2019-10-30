CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."IDENTITIES_CASES_TRAVEL_DOCS_MOD" ("IDENTITY_ID", "MODIFIED_IDENTITY", "MODIFIED_PASSPORT", "NUMBER_PASSPORT", "MODIFIED_CASES", "NUMBER_CASES") AS 
  select key_value as identity_id
        ,dml_at    as modified_identity
        ,(select max(dml_at) from dl_blacklist.travel_docs td where td.identity = bi.key_value) as modified_passport
        ,(select count(*) from dl_blacklist.travel_docs td where td.identity = bi.key_value) as number_passport
        ,(select max(dml_at)
          from dl_blacklist.blacklist_cases
          where id in (select blacklist_case
                      from dl_blacklist.blacklist_case_identities
                      where identity = bi.key_value)) as modified_cases
        ,(select count(*)
          from dl_blacklist.blacklist_cases
          where id in (select blacklist_case
                      from dl_blacklist.blacklist_case_identities
                      where identity = bi.key_value)) as number_cases
  from dl_blacklist.identities bi;
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_CASES_TRAVEL_DOCS_MOD" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_CASES_TRAVEL_DOCS_MOD" TO "BIOSUPPORT";
