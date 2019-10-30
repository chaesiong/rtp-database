CREATE MATERIALIZED VIEW "DL_USER_MANAGEMENT"."APEX_MENU_PERMISSIONS" ("MENU_USER", "MENU_ROLE", "MENU_OBJECT", "MENU_APP", "MENU_PAGE", "MENU_ID")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATASTORE" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS select
    u.username as menu_user,
    urr.role_id as menu_role,
    ogr.object_id as menu_object,
    opr.app_name as menu_app,
    opr.page_id as menu_page,
    am.key_value as menu_id
  from dl_user_management.user_role_rel urr
    left join dl_user_management.users u
        on u.id = urr.user_id
    right join dl_user_management.role_object_grant_rel rogr
        on rogr.role_id = urr.role_id
    right join dl_user_management.object_grant_rel ogr
        on ogr.id = rogr.object_grant_rel_id
    right join dl_user_management.object_page_rel opr
        on opr.object_id = ogr.object_id
    right join dl_common.apex_menu am
        on am.page_id   = opr.page_id
        and am.app_alias = opr.app_name;
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
