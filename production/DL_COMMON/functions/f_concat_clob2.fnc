CREATE OR REPLACE EDITIONABLE FUNCTION "DL_COMMON"."F_CONCAT_CLOB2" (  p_clob_01 clob                       -- first clob content for concatination
                                                     , p_clob_02 clob                      -- second clob content for concatination
                                                     , p_clob_03 clob default null         -- optional clob content for concatination  
                                                     , p_clob_04 clob default null         -- optional clob content for concatination  
                                                     , p_clob_05 clob default null         -- optional clob content for concatination  
                                                     , p_clob_06 clob default null         -- optional clob content for concatination   
                                                     , p_clob_07 clob default null         -- optional clob content for concatination  
                                                     , p_clob_08 clob default null         -- optional clob content for concatination  
                                                     , p_clob_09 clob default null         -- optional clob content for concatination  
                                                     , p_clob_10 clob default null         -- optional clob content for concatination  
                                                     , p_clob_11 clob default null         -- optional clob content for concatination  
                                                     , p_clob_12 clob default null         -- optional clob content for concatination  
                                                     , p_clob_13 clob default null         -- optional clob content for concatination  
                                                     , p_clob_14 clob default null         -- optional clob content for concatination  
                                                     , p_clob_15 clob default null         -- optional clob content for concatination  
                                                  ) return clob is


    /*******************************************************************************
    * This function returns a concatinated clobs up to 15 single clobs
    * 
    * Author    Date        Description
    * --------  ----------  -------------------------------------------------------*
    * MLanger   24.11.2018  Initial
    * 
    *******************************************************************************/

    -- Variables
      l_clob clob;                                  -- auxiliary clob
      l_clob_out clob;                              -- output clob
      l_buffer  pls_integer := 32767;               -- maximal length of each part string
      l_start pls_integer := 1;                     -- start characte to reading the content of second clob
      l_clob_part varchar2(32767 char);             -- auxiliary variable to store the interim result

    -- Logger
      l_scope logger_logs.scope%TYPE := lower($$plsql_unit_owner) || '.f_concat_clob2';
      l_params logger.tab_param;

begin

    -- Preparation checks
      -- if one of both clob are empty then return the other (not empty clob)
      -- when both are empty return null
      if p_clob_01 is null then 
          if p_clob_02 is null then
              return null;
          else
              return p_clob_02;
          end if;
      else
          if p_clob_02 is null then
              return p_clob_01;
          end if;
      end if;



    -- create a temporaray clob
      dbms_lob.createtemporary(l_clob_out, false, dbms_lob.call);

    -- load the first clob content into the output variable
      l_clob_out := p_clob_01;


    -- slicing each input clobs (if is not null) in part which have max. size of the buffer (32767)
      for i in 2..15 loop      

          select  case i  when 2 then p_clob_02
                          when 3 then p_clob_03
                          when 4 then p_clob_04
                          when 5 then p_clob_05
                          when 6 then p_clob_06
                          when 7 then p_clob_07
                          when 8 then p_clob_08
                          when 9 then p_clob_09
                          when 10 then p_clob_10
                          when 11 then p_clob_11
                          when 12 then p_clob_12
                          when 13 then p_clob_13
                          when 14 then p_clob_14
                          when 15 then p_clob_15
                  end into l_clob
          from    dual;

          if l_clob is not null then 
              l_start := 1;
              for i in 1..ceil(dbms_lob.getlength(l_clob) / l_buffer) loop
                  -- get the interim result of the second clob
                  l_clob_part := dbms_lob.substr(l_clob, l_buffer, l_start);
                  dbms_lob.writeappend(l_clob_out, length(l_clob_part), l_clob_part);
                  l_start := l_start + l_buffer;
              end loop;    
          end if;

      end loop;



    -- end of function - Return the concatinated clob
      return l_clob_out;

    -- Exception handler ******************************************************************************************************
      exception when others then
          logger.log_error(l_scope || ': ERROR', l_scope, null, l_params);
          raise;

end;
/
  GRANT EXECUTE ON "DL_COMMON"."F_CONCAT_CLOB2" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_COMMON"."F_CONCAT_CLOB2" TO "DERMALOG_PROXY";
