CREATE OR REPLACE EDITIONABLE FUNCTION "DL_COMMON"."F_BLOB_TO_CLOB_BASE64" (p_blob in blob) return clob is

    /*******************************************************************************
    * this function is based on the function base64encode from package pkg_abis_util
    * it converts a blob into a clob by using utl_encode.base64_encode 
    * for mare details see: https://docs.oracle.com/database/121/ARPLS/u_encode.htm#ARPLS090
    * 
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * MLanger   24.11.2018  Initial
    * 
    *******************************************************************************/

    -- Variables
      l_clob clob := '';                -- clob output
      l_step pls_integer := 12000;      -- make sure you set a multiple of 3 not higher than 24573
      l_temp varchar2(32000);
      l_size number;
      l_pos number;
      l_remaining number;
      l_read number;
      l_outsize number;

    -- Logger
      l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.f_blob_to_clob_base64';
      l_params logger.tab_param;

begin

    -- Preparation checks  
      if p_blob is null then
        return null;
      end if;

    -- get length of blob
      l_size := dbms_lob.getlength(p_blob);

    -- start converting by loop
      l_pos := 0;
      while l_pos < l_size loop

          l_read := l_size - l_pos;
          if l_read > l_step then
              l_read := l_step;
          end if;

          -- convert the blob to clob
          l_clob := l_clob || replace(replace(utl_raw.cast_to_varchar2(utl_encode.base64_encode(dbms_lob.substr(p_blob, l_read, l_pos + 1))), chr(13)), chr(10));

          l_outsize := dbms_lob.getlength(l_clob);
          l_pos := l_pos + l_read;

      end loop;


    -- Set return value, clear the memory consumed by temporary lob and leave function
      return l_clob;



    -- Exception handler ******************************************************************************************************
      exception when others then
          logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
          raise;   
end;
/
  GRANT EXECUTE ON "DL_COMMON"."F_BLOB_TO_CLOB_BASE64" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_COMMON"."F_BLOB_TO_CLOB_BASE64" TO "DERMALOG_PROXY";
