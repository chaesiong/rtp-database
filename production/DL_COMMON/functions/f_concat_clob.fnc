CREATE OR REPLACE EDITIONABLE FUNCTION "DL_COMMON"."F_CONCAT_CLOB" (  p_clob_1 clob           -- first clob content for concatination
                                                     , p_clob_2 clob         -- second clob content for concatination
                                                  ) return clob is


    /*******************************************************************************
    * This function returns a concatinated clob
    * 
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * MLanger   24.11.2018  Initial
    * 
    *******************************************************************************/

    -- Variables
      l_clob_out clob;                              -- output clob
      l_buffer  pls_integer := 32767;               -- maximal length of each part string
      l_start pls_integer := 1;                     -- start characte to reading the content of second clob
      l_clob_part varchar2(32767 char);             -- auxiliary variable to store the interim result

    -- Logger
      l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.f_concat_clob';
      l_params logger.tab_param;

begin

    -- Preparation checks
      -- if one of both clob are empty then return the other (not empty clob)
      -- when both are empty return null
      if p_clob_1 is null then 
          if p_clob_2 is null then
              return null;
          else
              return p_clob_2;
          end if;
      else
          if p_clob_2 is null then
              return p_clob_1;
          end if;
      end if;



    -- create a temporaray clob
      dbms_lob.createtemporary(l_clob_out, false, dbms_lob.call);

    -- load the first clob content into the output variable
      l_clob_out := p_clob_1;

    -- slice the second clob in part which have max. size of the buffer (32767)
      for i in 1..ceil(dbms_lob.getlength(p_clob_2) / l_buffer) loop

          -- get the interim result of the second clob
          l_clob_part := dbms_lob.substr(p_clob_2, l_buffer, l_start);
          dbms_lob.writeappend(l_clob_out, length(l_clob_part), l_clob_part);
          l_start := l_start + l_buffer;

      end loop;

    -- end of function - Return the concatinated clob
      return l_clob_out;

    -- Exception handler ******************************************************************************************************
      exception when others then
          logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
          raise;

end;
/
  GRANT EXECUTE ON "DL_COMMON"."F_CONCAT_CLOB" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_COMMON"."F_CONCAT_CLOB" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_COMMON"."F_CONCAT_CLOB" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_COMMON"."F_CONCAT_CLOB" TO "BIOSUPPORT";
