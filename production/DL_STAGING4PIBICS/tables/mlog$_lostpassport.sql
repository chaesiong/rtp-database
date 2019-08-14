CREATE TABLE "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" 
   (	"LPPCD" VARCHAR2(20 CHAR), 
	"M_ROW$$" VARCHAR2(255 CHAR), 
	"SEQUENCE$$" NUMBER, 
	"DMLTYPE$$" VARCHAR2(1 CHAR), 
	"OLD_NEW$$" VARCHAR2(1 CHAR), 
	"CHANGE_VECTOR$$" RAW(255), 
	"XID$$" NUMBER
   ) ;
   COMMENT ON TABLE "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT"  IS 'snapshot log for master table DL_STAGING4PIBICS.LOSTPASSPORT';
  CREATE INDEX "DL_STAGING4PIBICS"."I_MLOG$_LOSTPASSPORT" ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" ("XID$$") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "SERVAPP";
  GRANT DELETE ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_LOSTPASSPORT" TO "APPSUP";
