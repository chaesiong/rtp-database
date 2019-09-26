CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING"."PKG_SYNC_BC_MOVEMENTS" as 

  /*******************************************************************************
  * This package provides procedures to transfer movements data to user dl_bordercontrol
  * 
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * MLanger   22.11.2018  Initial
  * 
  *******************************************************************************/

  -- Global Variables
    g_pkg_name constant varchar2(100 char) := lower($$plsql_unit_owner) || '.' || lower($$plsql_unit);



end;
/
