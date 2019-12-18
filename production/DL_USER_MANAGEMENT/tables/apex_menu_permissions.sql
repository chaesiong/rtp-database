CREATE TABLE "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" 
   (	"MENU_USER" VARCHAR2(50 CHAR), 
	"MENU_ROLE" VARCHAR2(32 CHAR), 
	"MENU_OBJECT" VARCHAR2(32 CHAR), 
	"MENU_APP" VARCHAR2(100 CHAR), 
	"MENU_PAGE" NUMBER, 
	"MENU_ID" NUMBER(15,0) NOT NULL ENABLE
   ) ;
   COMMENT ON MATERIALIZED VIEW "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS"  IS 'snapshot table for snapshot DL_USER_MANAGEMENT.APEX_MENU_PERMISSIONS';
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" TO "PORNRUKSA_S";
