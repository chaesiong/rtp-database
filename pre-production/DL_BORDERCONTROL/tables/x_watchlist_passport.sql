CREATE TABLE "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" 
   (	"WATCHLISTPASSPORTID" VARCHAR2(32 CHAR) DEFAULT ON NULL sys_guid() NOT NULL ENABLE, 
	"DOCNUMBER" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"ISSUINGCOUNTRY" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"EXPIRYDATE" VARCHAR2(6 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" ADD CONSTRAINT "X_WATCHLIST_PASSPORT_PK" PRIMARY KEY ("WATCHLISTPASSPORTID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT"."WATCHLISTPASSPORTID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT"."DOCNUMBER" IS 'Column for Document Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT"."ISSUINGCOUNTRY" IS 'Country Code for Issuing Country';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT"."EXPIRYDATE" IS 'Date of expiry';
   COMMENT ON TABLE "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT"  IS 'Used in BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT$IX00" ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" ("DOCNUMBER", "ISSUINGCOUNTRY", "EXPIRYDATE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT_PK" ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" ("WATCHLISTPASSPORTID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."X_WATCHLIST_PASSPORT" TO "TRAINEE";
