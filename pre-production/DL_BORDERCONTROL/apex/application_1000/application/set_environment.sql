prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>1672400873050999
,p_default_application_id=>1000
,p_default_owner=>'APEX_USER_MANAGEMENT'
);
end;
/

prompt APPLICATION 1000 - Dermalog User Management
--
-- Application Export:
--   Application:     1000
--   Name:            Dermalog User Management
--   Exported By:     DL_BORDERCONTROL
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.1.4.00.08
--   Instance ID:     218201677993142
--

-- Application Statistics:
--   Pages:                     20
--     Items:                  114
--     Validations:             11
--     Processes:               42
--     Regions:                 50
--     Buttons:                 52
--     Dynamic Actions:         15
--   Shared Components:
--     Logic:
--       Items:                  1
--       Processes:              2
--     Navigation:
--       Lists:                  3
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         2
--       Authorization:          9
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              15
--         Label:                5
--         List:                11
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:               9
--       LOVs:                  18
--       Shortcuts:              1
--     Globalization:
--     Reports:
--   Supporting Objects:  Included

