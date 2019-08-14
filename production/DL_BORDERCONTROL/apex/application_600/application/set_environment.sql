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
,p_default_application_id=>600
,p_default_owner=>'DL_BORDERCONTROL_DATAMART'
);
end;
/

prompt APPLICATION 600 - Dermalog Border Control Reporting
--
-- Application Export:
--   Application:     600
--   Name:            Dermalog Border Control Reporting
--   Exported By:     DL_BORDERCONTROL
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.1.4.00.08
--   Instance ID:     218201677993142
--

-- Application Statistics:
--   Pages:                      8
--     Items:                   71
--     Processes:                8
--     Regions:                 33
--     Buttons:                 11
--     Dynamic Actions:          4
--   Shared Components:
--     Logic:
--     Navigation:
--       Lists:                  4
--       Breadcrumbs:            1
--         Entries:              6
--     Security:
--       Authentication:         3
--       Authorization:          1
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
--       LOVs:                  19
--     Globalization:
--     Reports:
--   Supporting Objects:  Included

