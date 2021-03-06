CREATE TABLE "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" 
   (	"CITIZENID" VARCHAR2(13 CHAR), 
	"PASSPORTNO" VARCHAR2(12 CHAR), 
	"M_ROW$$" VARCHAR2(255 CHAR), 
	"SEQUENCE$$" NUMBER, 
	"DMLTYPE$$" VARCHAR2(1 CHAR), 
	"OLD_NEW$$" VARCHAR2(1 CHAR), 
	"CHANGE_VECTOR$$" RAW(255), 
	"XID$$" NUMBER
   ) ;
   COMMENT ON TABLE "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT"  IS 'snapshot log for master table DL_STAGING4PIBICS.THAIPASSPORT';
  CREATE INDEX "DL_STAGING4PIBICS"."I_MLOG$_THAIPASSPORT" ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" ("XID$$") 
  ;
CREATE INDEX "DL_STAGING4PIBICS"."MV_LOG_THAIPASSPORT_I" ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" ("CITIZENID", "PASSPORTNO", "SEQUENCE$$") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "SERVAPP";
  GRANT DELETE ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."MLOG$_THAIPASSPORT" TO "BIOSAADM";
