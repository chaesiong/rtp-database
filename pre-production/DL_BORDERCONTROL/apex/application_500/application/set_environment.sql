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
,p_default_application_id=>500
,p_default_owner=>'DL_BORDERCONTROL'
);
end;
/

prompt APPLICATION 500 - BmBS - Biometric Bordercontrol System
--
-- Application Export:
--   Application:     500
--   Name:            BmBS - Biometric Bordercontrol System
--   Exported By:     DL_BORDERCONTROL
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.1.4.00.08
--   Instance ID:     218201677993142
--

-- Application Statistics:
--   Pages:                    119
--     Items:                1,647
--     Computations:            48
--     Validations:             61
--     Processes:              284
--     Regions:                628
--     Buttons:                323
--     Dynamic Actions:        333
--   Shared Components:
--     Logic:
--       Items:                121
--       Processes:             14
--       Computations:          36
--       Web Services:          11
--     Navigation:
--       Lists:                  9
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         7
--       Authorization:          8
--     User Interface:
--       Themes:                 2
--       Templates:
--         Page:                26
--         Region:              39
--         Label:               11
--         List:                28
--         Popup LOV:            2
--         Calendar:             4
--         Breadcrumb:           3
--         Button:               8
--         Report:              21
--       LOVs:                  99
--       Shortcuts:              2
--       Plug-ins:               2
--     Globalization:
--       Messages:              21
--     Reports:
--   Supporting Objects:  Included

