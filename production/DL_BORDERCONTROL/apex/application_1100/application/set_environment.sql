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
,p_default_application_id=>1100
,p_default_owner=>'DL_BORDERCONTROL'
);
end;
/

prompt APPLICATION 1100 - Dashboard
--
-- Application Export:
--   Application:     1100
--   Name:            Dashboard
--   Exported By:     DL_BORDERCONTROL
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.1.4.00.08
--   Instance ID:     218201677993142
--

-- Application Statistics:
--   Pages:                      3
--     Items:                    2
--     Processes:                5
--     Regions:                  8
--     Buttons:                  1
--     Dynamic Actions:          6
--   Shared Components:
--     Logic:
--       Items:                 11
--       Processes:              2
--       Computations:           3
--     Navigation:
--       Lists:                  7
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         2
--     User Interface:
--       Themes:                 2
--       Templates:
--         Page:                20
--         Region:              28
--         Label:               10
--         List:                22
--         Popup LOV:            2
--         Calendar:             2
--         Breadcrumb:           2
--         Button:               6
--         Report:              17
--       LOVs:                  15
--       Plug-ins:               1
--     Globalization:
--     Reports:
--   Supporting Objects:  Excluded

