CREATE TABLE "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" 
   (	"CASE_NUMBER" VARCHAR2(100 CHAR), 
	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BLACKLIST_CASE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"IDENTITY" VARCHAR2(32 CHAR) NOT NULL ENABLE
   ) ;
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."BLACKLIST_CASE_IDENTITIES_BK2" TO "BIOSAADM";
