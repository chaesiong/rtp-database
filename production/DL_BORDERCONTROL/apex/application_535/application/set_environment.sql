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
,p_default_application_id=>535
,p_default_owner=>'DL_BLACKLIST'
);
end;
/

prompt APPLICATION 535 - BBS - Biometric Blacklist System
--
-- Application Export:
--   Application:     535
--   Name:            BBS - Biometric Blacklist System
--   Exported By:     DL_BORDERCONTROL
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         5.1.4.00.08
--   Instance ID:     218201677993142
--

-- Application Statistics:
--   Pages:                     19
--     Items:                  515
--     Computations:             3
--     Validations:              3
--     Processes:               34
--     Regions:                172
--     Buttons:                 69
--     Dynamic Actions:        162
--   Shared Components:
--     Logic:
--       Items:                  5
--       Processes:              4
--       Computations:           3
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--     Security:
--       Authentication:         2
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
--       LOVs:                  16
--       Plug-ins:              12
--     Globalization:
--       Messages:             951
--     Reports:
--   Supporting Objects:  Included

