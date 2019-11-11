CREATE TABLE "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" 
   (	"ORA_ERR_NUMBER$" NUMBER, 
	"ORA_ERR_MESG$" VARCHAR2(2000 CHAR), 
	"ORA_ERR_ROWID$" UROWID (4000), 
	"ORA_ERR_OPTYP$" VARCHAR2(2 CHAR), 
	"ORA_ERR_TAG$" VARCHAR2(2000 CHAR), 
	"ENTRY_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"OWNERAGE" VARCHAR2(4 CHAR), 
	"EXPIRYDATE" VARCHAR2(20 CHAR), 
	"NATIONCD" VARCHAR2(3 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"CASE_ID" VARCHAR2(32 CHAR), 
	"IDENTITY_ID" VARCHAR2(32 CHAR), 
	"ADDRESS_ID" VARCHAR2(32 CHAR), 
	"TRAVEL_DOC_ID" VARCHAR2(32 CHAR), 
	"CREATE_DATE" DATE, 
	"PIBICS_TABLE_CD" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"CURRENTNESS_IN_PIBICS" DATE, 
	"CURRENTNESS_IN_BC" DATE
   )   NO INMEMORY ;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."WLCD" IS 'PK of PIBICS table WATCHLIST ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."SEQNO" IS 'PK of PIBICS table WATCHLISTNM';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."EXPIRYDATE" IS 'PK of PIBICS table LOSTPASSPORT ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."NATIONCD" IS 'PK of PIBICS table LOSTPASSPORT';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."PASSPORTNO" IS 'PK of PIBICS table LOSTPASSPORT';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."CASE_ID" IS 'PK of BLACKLIST_CASES';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."IDENTITY_ID" IS 'PK of IDENTITIES';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."ADDRESS_ID" IS 'PK of ADRERSSES';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"."TRAVEL_DOC_ID" IS 'PK of TRAVEL_DOCS';
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES"  IS 'sync table of DL_BLACKLIST.BLACKLIST_CASES and other tables  ';
  CREATE INDEX "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES_CD" ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" ("CREATE_DATE") 
  ;
CREATE INDEX "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES_CI" ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" ("CASE_ID", "IDENTITY_ID") 
  ;
CREATE INDEX "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES_LOSTPASSPORT" ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" ("WLCD", "NATIONCD", "PASSPORTNO", "EXPIRYDATE", "PIBICS_TABLE_CD") 
  ;
CREATE INDEX "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES_TAG" ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" ("ORA_ERR_TAG$") 
  ;
CREATE INDEX "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES_WATCHLIST" ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" ("WLCD", "SEQNO", "PIBICS_TABLE_CD") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS_INTF"."ERR$_SYNC_BLACKLIST_CASES" TO "BIOSAADM";
