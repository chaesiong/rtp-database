CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS"."PKG_SYNC_RESIDENTS" as

  /*******************************************************************************
  * This package provides procedures to transfer then resident data to dl_bordercontrol as direct transfer
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * MLanger   20.11.2018  Initial
  *
  *******************************************************************************/

  -- Global Variables
    g_pkg_name constant varchar2(100 char) := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit);


  -- START: prc_sync_resident_data_bc  - procedure transfers the resident information to table dl_bordercontrol.table residence ************************************************
    procedure prc_sync_resident_data_bc;


end;
/
