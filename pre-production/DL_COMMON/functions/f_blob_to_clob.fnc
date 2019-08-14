CREATE OR REPLACE EDITIONABLE FUNCTION "DL_COMMON"."F_BLOB_TO_CLOB" ( p_blob blob ) return clob is

    /*******************************************************************************
    * This function converts a blob to a clob by using the standard functionality dbms_lob.converttoclob 
    * 
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * MLanger   24.11.2018  Initial
    * 
    *******************************************************************************/

    -- Variables
      l_clob         clob;
      l_result       clob;
      l_dest_offsset integer := 1;
      l_src_offsset  integer := 1;
      l_lang_context integer := dbms_lob.default_lang_ctx;
      l_warning      integer;


    -- Logger
      l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.f_concat_clob';
      l_params logger.tab_param;

begin


    -- Preparation checks  
      if p_blob is null then
         return null;
      end if;

    -- create a temporary clob
      dbms_lob.createTemporary( lob_loc => l_clob, cache => true );

    -- convert blob to a clob using the standard functionality dbms_lob.converttoclob 
      dbms_lob.converttoclob( dest_lob        => l_clob
                              , src_blob      => p_blob
                              , amount        => dbms_lob.lobmaxsize
                              , dest_offset   => l_dest_offsset
                              , src_offset    => l_src_offsset
                              , blob_csid     => dbms_lob.default_csid
                              , lang_context  => l_lang_context
                              , warning       => l_warning
                            );

    -- Set return value, clear the memory consumed by temporary lob and leave function
      l_result := l_clob;
      dbms_lob.freetemporary(l_clob);
      return l_result;



    -- Exception handler ******************************************************************************************************
      exception when others then
          logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
          raise;    

end;
/
  GRANT EXECUTE ON "DL_COMMON"."F_BLOB_TO_CLOB" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_COMMON"."F_BLOB_TO_CLOB" TO "DERMALOG_PROXY";
