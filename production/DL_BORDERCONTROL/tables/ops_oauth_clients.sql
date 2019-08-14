CREATE TABLE "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" 
   (	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"CLIENT_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"CLIENT_SECRET" VARCHAR2(32 CHAR), 
	"DML_AT" DATE DEFAULT sysdate NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" ADD CONSTRAINT "OPS_OAUTH_CLIENTS_PK" PRIMARY KEY ("NAME")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS"."NAME" IS 'Name of Client';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS"."CLIENT_ID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS"."CLIENT_SECRET" IS 'Column for Client Secret';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS"."DML_AT" IS 'Date of last update';
   COMMENT ON TABLE "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS"  IS 'Contains all defined OAUTH Clients, used for deployment of webservices.  The content of this table might get stale and must be refreshed from the real ORDS_METADATA_VIEW, when new client_ids or secrets are generated :This table will be granted to the Webservice';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS_PK" ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" ("NAME") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "DL_BLACKLIST";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."OPS_OAUTH_CLIENTS" TO "APPSUP";
