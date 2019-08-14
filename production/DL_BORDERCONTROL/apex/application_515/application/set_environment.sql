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
,p_default_application_id=>515
,p_default_owner=>'DL_BORDERCONTROL'
);
end;
/

prompt APPLICATION 515 - Re-Entry Permit
--
-- Application Export:
--   Application:     515
--   Name:            Re-Entry Permit
--   Exported By:     DL_BORDERCONTROL
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.1.4.00.08
--   Instance ID:     218201677993142
--

-- Application Statistics:
--   Pages:                      8
--     Items:                  149
--     Validations:              3
--     Processes:               15
--     Regions:                 42
--     Buttons:                 16
--     Dynamic Actions:         38
--   Shared Components:
--     Logic:
--       Items:                 11
--       Processes:              3
--       Computations:           3
--       Build Options:          2
--     Navigation:
--       Lists:                  4
--       Breadcrumbs:            1
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
--       Shortcuts:              1
--       Plug-ins:               1
--     Globalization:
--       Messages:               2
--     Reports:
--   Supporting Objects:  Included

