CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_COMMON"."PKG_UTIL" is
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0026';
  C_OBJECT_COPYRIGHT constant varchar2(255 char) := 'Copyright: DERMALOG Identification Systems GmbH, Hamburg - Germany, 2013-' || to_char(sysdate
                                                                                                                                          ,'yyyy');
  --
  -- If NOT initialized then call Init_PACKAGE() in every proc/func where Init_PACKAGE must be run before normal processing of it can be go!!!
  -- For example: "if (not g_PACKAGE_Initialized) then Init_PACKAGE(); end if;"
  g_PACKAGE_Initialized  boolean := false;
  g_PACKAGE_Initializing boolean := false;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    09.05.2016  Is_Equal*:Added
  *******************************************************************************/
  --
  function Is_Equal(p_Value_0 in varchar2
                   ,p_Value_1 in varchar2
                    --
                    ) return boolean deterministic is
    v_Result boolean;
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    v_Result := ((p_Value_0 is null and p_Value_1 is null)
                --
                or p_Value_0 = p_Value_1);
    return nvl(v_Result
              ,false);
  end Is_Equal;
  --
  function Is_Equal_(p_Value_0 in varchar2
                    ,p_Value_1 in varchar2
                     --
                     ) return pls_integer deterministic is
  begin
    return sys.diutil.bool_to_int(Is_Equal(p_Value_0
                                          ,p_Value_1));
  end Is_Equal_;
  --
  --
  function Is_Equal(p_Value_0 in number
                   ,p_Value_1 in number
                    --
                    ) return boolean deterministic is
    v_Result boolean;
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    v_Result := ((p_Value_0 is null and p_Value_1 is null)
                --
                or p_Value_0 = p_Value_1);
    return nvl(v_Result
              ,false);
  end Is_Equal;
  --
  function Is_Equal_(p_Value_0 in number
                    ,p_Value_1 in number
                     --
                     ) return pls_integer deterministic is
  begin
    return sys.diutil.bool_to_int(Is_Equal(p_Value_0
                                          ,p_Value_1));
  end Is_Equal_;
  --
  --
  function Is_Equal(p_Value_0 in date
                   ,p_Value_1 in date
                    --
                    ) return boolean deterministic is
    v_Result boolean;
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    v_Result := ((p_Value_0 is null and p_Value_1 is null)
                --
                or p_Value_0 = p_Value_1);
    return nvl(v_Result
              ,false);
  end Is_Equal;
  --
  function Is_Equal_(p_Value_0 in date
                    ,p_Value_1 in date
                     --
                     ) return pls_integer deterministic is
  begin
    return sys.diutil.bool_to_int(Is_Equal(p_Value_0
                                          ,p_Value_1));
  end Is_Equal_;
  --
  --
  function Is_Equal(p_Value_0 in timestamp
                   ,p_Value_1 in timestamp
                    --
                    ) return boolean deterministic is
    v_Result boolean;
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    v_Result := ((p_Value_0 is null and p_Value_1 is null)
                --
                or p_Value_0 = p_Value_1);
    return nvl(v_Result
              ,false);
  end Is_Equal;
  --
  function Is_Equal_(p_Value_0 in timestamp
                    ,p_Value_1 in timestamp
                     --
                     ) return pls_integer deterministic is
  begin
    return sys.diutil.bool_to_int(Is_Equal(p_Value_0
                                          ,p_Value_1));
  end Is_Equal_;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    09.02.2018  BIT_OR:Added
  *******************************************************************************/
  --
  /*
  --
  decode(bitand(ksppstvf,7),1,’MODIFIED’,4,’SYSTEM_MOD’,’FALSE’)

  select bin_to_num(1
                   ,0
                   ,0) as a
    from dual;
  --
  */
  --
  function BIT_OR(p_Value_1 in number
                 ,p_Value_2 in number
                  --
                  ) return number deterministic is
    --
    v_Result number;
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    v_Result := p_Value_1 + p_Value_2 - bitand(p_Value_1
                                              ,p_Value_2);
    --
    --
    return v_Result;
    --
  end BIT_OR;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    07.12.2015  BIT_XOR:Added
  * WWirns    09.02.2018  BIT_XOR:Wrongly implemented, does bit_or instead bit_xor
  *******************************************************************************/
  --
  function BIT_XOR(p_Value_1 in number
                  ,p_Value_2 in number
                   --
                   ) return number deterministic is
    --
    v_Result number;
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    v_Result := BIT_OR(p_Value_1
                      ,p_Value_2) - bitand(p_Value_1
                                          ,p_Value_2);
    --
    --
    return v_Result;
    --
  end BIT_XOR;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    09.02.2018  BIT_NOT:Added
  *******************************************************************************/
  --
  function BIT_NOT(p_Value in number
                   --
                   ) return number deterministic is
    --
    v_Result number;
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    v_Result := (0 - p_Value) - 1;
    --
    --
    return v_Result;
    --
  end BIT_NOT;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    02.01.2018  Escape4SQL:Added
  *******************************************************************************/
  --
  function Escape4SQL(p_Value in varchar2
                      --
                      ) return varchar2 deterministic is
    --
    v_Result varchar2(32767 char);
    --
  begin
    --
    --
    v_Result := p_Value;
    --
    -- Single quote
    v_Result := replace(v_Result
                       ,''''
                       ,''''''
                        --
                        );
    --
    -- Ampersand
    v_Result := replace(v_Result
                       ,chr(38)
                       ,'''||chr(38)||'''
                        --
                        );
    --
    -- Ascii 1 .. 31
    for i in 1 .. 31
    loop
      v_Result := replace(v_Result
                         ,chr(i)
                         ,'''||chr(' || trim(i) || ')||'''
                          --
                          );
    end loop;
    --
    --
    return v_Result;
    --
  end Escape4SQL;
  --
  --
  /**
  * Returns a SQL-Code and a SQL-Message usable for a call of Raise_application_error(...).
  * The SQL-Message contains also the error back trace and no duplicated SQL-CODE's.
  * If the SQL-Message does not already contains a SQL-Code from inside the application errorcode range,
  * so the SQL-Code from the parameter "p_Default_SQLCODE" is used.
  *
  * PARAMETERS
  *   o_SQLCODE
  *   o_SQLERRM
  *   p_Default_SQLCODE
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   Normally this procedure is used in an EXCEPTION-Block.
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Initially implemented
  * WWirns    13.01.2017  Support for UTL_HTTP.get_detailed_excp_support added
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  procedure FormatErrMsg(p_SQLCODE             in out nocopy number
                        ,p_SQLERRM             in out nocopy varchar2
                        ,p_Replacement_SQLCODE in number default -20000
                         --
                         ) is
    --
    v_b_Tmp                boolean;
    v_Generic_SQLCODE      number;
    v_Generic_SQLERRM      varchar2(4000);
    v_n_SQLCODE_in_SQLERRM number;
    v_vc_Error_Backtrace   varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    v_Generic_SQLCODE := sqlcode();
    v_Generic_SQLERRM := sqlerrm(); -- returns max. 512 bytes
    --
    --if (i_SQLCODE is not null and i_SQLERRM is not null)
    --then
    --  p_SQLCODE := i_SQLCODE;
    --  p_SQLERRM := i_SQLERRM;
    --else
    if (v_Generic_SQLCODE in (-29272
                             ,-29273
                             ,-29261
                             ,-29262
                             ,-29263
                             ,-29264
                             ,-29265
                             ,-29266
                             ,-29267
                             ,-29268
                             ,-29269
                             ,-29270
                             ,-29275
                             ,-29276
                             ,-24247))
    then
      UTL_HTTP.get_detailed_excp_support(v_b_Tmp);
      if (v_b_Tmp)
      then
        p_SQLCODE := UTL_HTTP.get_detailed_sqlcode();
        p_SQLERRM := UTL_HTTP.get_detailed_sqlerrm();
      else
        p_SQLCODE := v_Generic_SQLCODE;
        p_SQLERRM := v_Generic_SQLERRM;
      end if;
    else
      p_SQLCODE := v_Generic_SQLCODE;
      p_SQLERRM := v_Generic_SQLERRM;
    end if;
    --end if;
    --
    -- chr(79)||chr(82)||chr(65)||'-06512: at "DEMOGRAPHIC.PKG_WEBSERVICE_CLIENT", line 864'
    -- chr(79)||chr(82)||chr(65)||'-06512: in "DEMOGRAPHIC.PKG_WEBSERVICE_CLIENT", Zeile 864'
    v_vc_Error_Backtrace := DBMS_UTILITY.format_error_backtrace();
    --
    --v_vc_Error_Stack := DBMS_UTILITY.format_error_stack(); -- returns max. 2000 bytes
    --
    -- ----- PL/SQL Call Stack -----
    --     object      line  object
    --     handle    number  name
    -- 0x63887bc8       280  package body DEMOGRAPHIC.PKG_UTIL
    -- 0x639c5668       859  package body DEMOGRAPHIC.PKG_WEBSERVICE_CLIENT
    -- 0x8729db10         3  anonymous block
    --v_vc_Call_Stack := DBMS_UTILITY.format_call_stack();
    --
    --
    if (nvl(p_Replacement_SQLCODE
           ,-20000) not between (-20999) and (-20000))
    then
      -- Parameter i_Default_SQLCODE is not useable for call of Raise_application_error(...)!!!
      Raise_application_error(-20000
                             ,'Parameter i_Default_SQLCODE not between (-20999) and (-20000)!!!');
    end if;
    --
    -- Extract SQLCODE from inside SQLERRM
    if (regexp_like(p_SQLERRM
                   ,'^' || chr(79) || chr(82) || chr(65) || '-[0-9]{1,5}:.+$'
                   ,'im'))
    then
      begin
        v_n_SQLCODE_in_SQLERRM := standard.to_number(substr(p_SQLERRM
                                                           ,4
                                                           ,instr(p_SQLERRM
                                                                 ,':') - 4));
      exception
        when others then
          v_n_SQLCODE_in_SQLERRM := null;
      end;
    end if;
    --
    -- Set the right CODE and ERRM!!!
    if (v_n_SQLCODE_in_SQLERRM between (-20999) and (-20000))
    then
      -- SQLCODE from inside SQLERRM is in the range of the application error code, so use it again
      -- and crop it out from the SQLERRM!!!
      p_SQLCODE := v_n_SQLCODE_in_SQLERRM;
      p_SQLERRM := trim(substr(p_SQLERRM
                              ,instr(p_SQLERRM
                                    ,':') + 1));
    else
      -- SQLCODE from inside SQLERRM is an ORACLE specific error code, so let it in SQLERRM
      -- and use an application error code for SQLCODE!!!
      p_SQLCODE := nvl(p_Replacement_SQLCODE
                      ,-20000);
    end if;
    --
    -- If "FEB"(Error-Back-Trace Marker) does not already exists, so append it!!!
    if (instr(p_SQLERRM
             ,' FEB=>') = 0
       --
       and v_vc_Error_Backtrace is not null)
    then
      v_vc_Error_Backtrace := ' FEB=>'
                             --
                              || trim(regexp_replace(v_vc_Error_Backtrace
                                                    ,'(^' || chr(79) || chr(82) || chr(65) || '-)([0-9]{1,5}: )(.+".+"),([^0-9]+[0-9]+)$'
                                                    ,'\4 \3'
                                                    ,1
                                                    ,0
                                                    ,'i'));
      p_SQLERRM            := trim(p_SQLERRM || v_vc_Error_Backtrace);
    end if;
    --
  exception
    when others then
      -- Do not raise exception to the caller, because caller is normally already in an exception block!!!
      -- Perhaps log exception???
      -- Set out parameter to the generic SQL-Error!!!
      p_SQLCODE := v_Generic_SQLCODE;
      p_SQLERRM := v_Generic_SQLERRM;
      --
  end FormatErrMsg;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    03.03.2016  Added
  * WWirns    20.06.2016  Fix sometimes empty result
  * WWirns    19.07.2017  Arg "p_To_First_ORA_Pos" added
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  * WWirns    09.02.2018  Rename "p_To_First_ORA_Pos"  to "p_Is_Only_Topmost_Msg"
  *******************************************************************************/
  --
  function ShortErrMsg(p_SQLERRM             in varchar2
                      ,p_Is_Only_Topmost_Msg in pls_integer default 1
                       --
                       ) return varchar2 is
    --
    v_Result         varchar2(32767 char);
    v_Curr_O_R_A_Pos integer;
    v_Curr_FEB_Pos   integer;
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    v_Result := translate(p_SQLERRM
                         ,' ' || chr(13) || chr(10)
                         ,'   ');
    --
    -- 1. FEB_Pos
    v_Curr_FEB_Pos := regexp_instr(v_Result
                                  ,'FEB=>'
                                  ,1
                                  ,1
                                  ,0
                                  ,'i');
    --
    if (nvl(v_Curr_FEB_Pos
           ,0) > 0)
    then
      v_Result := substr(v_Result
                        ,1
                        ,v_Curr_FEB_Pos - 1);
    end if;
    --
    --
    v_Result := trim(v_Result);
    --
    --
    if (nvl(p_Is_Only_Topmost_Msg
           ,1) != 0)
    then
      --
      -- 1. O_R_A_Pos
      v_Curr_O_R_A_Pos := regexp_instr(srcstr      => v_Result
                                      ,pattern     => chr(79) || chr(82) || chr(65) || '-[0-9]{5}:'
                                      ,position    => 1
                                      ,occurrence  => 1
                                      ,returnparam => 0
                                      ,modifier    => 'i');
      --
      if (nvl(v_Curr_O_R_A_Pos
             ,0) > 0)
      then
        if (v_Curr_O_R_A_Pos = 1)
        then
          --
          -- 2. O_R_A_Pos
          v_Curr_O_R_A_Pos := regexp_instr(v_Result
                                          ,chr(79) || chr(82) || chr(65) || '-[0-9]{5}:'
                                          ,1
                                          ,2
                                          ,0
                                          ,'i');
          --
          if (nvl(v_Curr_O_R_A_Pos
                 ,0) > 0)
          then
            v_Result := substr(v_Result
                              ,1
                              ,v_Curr_O_R_A_Pos - 1);
          end if;
          --
        else
          --
          v_Result := substr(v_Result
                            ,1
                            ,v_Curr_O_R_A_Pos - 1);
          --
        end if;
        --
        v_Result := regexp_replace(v_Result
                                  ,'^' || chr(79) || chr(82) || chr(65) || '-[0-9]{5}: ?'
                                  ,''
                                  ,1
                                  ,0
                                  ,'i');
        --
      end if;
      --
      --
      v_Result := trim(v_Result);
      --
    end if;
    --
    --
    return v_Result;
    --
  end ShortErrMsg;

  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   io_LOB
  *
  *   i_Prevent_EXCE
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Initially implemented
  * WWirns    16.07.2015  Added p_Prevent_EXCE
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  procedure FreeTempLOB(p_LOB          in out nocopy blob
                       ,p_Set_NULL     in boolean default false
                       ,p_Prevent_EXCE in boolean default false
                        --
                        ) is
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (nvl(DBMS_LOB.IsTemporary(p_LOB)
           ,0) != 0)
    then
      DBMS_LOB.freetemporary(p_LOB);
      --
      if (nvl(p_Set_NULL
             ,false))
      then
        p_LOB := null;
      end if;
    end if;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      --
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
      end if;
      --
  end FreeTempLOB;
  --
  procedure FreeTempLOB(p_LOB          in out nocopy clob character set ANY_CS
                       ,p_Set_NULL     in boolean default false
                       ,p_Prevent_EXCE in boolean default false
                        --
                        ) is
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (nvl(DBMS_LOB.IsTemporary(p_LOB)
           ,0) != 0)
    then
      DBMS_LOB.freetemporary(p_LOB);
      --
      if (nvl(p_Set_NULL
             ,false))
      then
        p_LOB := null;
      end if;
    end if;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      --
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
      end if;
      --
  end FreeTempLOB;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Initially implemented
  * WWirns    16.07.2015  Added p_Divisible_by
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function SizeByMultipleOfChunk(p_Chunksize    in integer
                                ,p_Maxsize      in integer default 32767
                                ,p_Divisible_by in integer default 1
                                 --
                                 ) return integer is
    --
    --v_Chunksize    integer;
    v_Result       integer;
    v_Maxsize      integer;
    v_Divisible_by integer;
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_Chunksize is null)
    then
      return null;
    end if;
    --
    v_Maxsize      := nvl(p_Maxsize
                         ,32767);
    v_Divisible_by := nvl(p_Divisible_by
                         ,1);
    --
    if (v_Divisible_by > v_Maxsize)
    then
      v_Divisible_by := v_Maxsize;
    end if;
    --
    -- WWirns: Try to set Buffer-Size for the LOB data transfer to a multiple of its Chunk-Size!!!
    /*
    --
    -- WWirns: Variante 1:
    select max(t.SEQ_NUM) * v_p_Lob_ChunkSize
      into v_amount
      from (
            --
            select rownum as SEQ_NUM
              from dual
            connect by rownum <= 1000
            --
            ) t
     where (t.SEQ_NUM * v_p_Lob_ChunkSize) <= 32767;
    */
    --
    -- WWirns: Variante 2: How does it work by using "Gleichung nach X aufl��sen"???
    --
    -- WWirns: Variante 3:
    if (p_Chunksize > 1 and v_Divisible_by = 1)
    then
      --
      for i in 1 .. ceil(v_Maxsize / 2)
      loop
        --
        if ((i * p_Chunksize) > v_Maxsize)
        then
          --
          v_Result := (i - 1) * p_Chunksize;
          exit;
          --
        end if;
        --
      end loop;
      --
    else
      -- WWirns: The Chunk-Size is lower than 2 bytes, so ignore "Multiple of Chunk-Size" and set the Buffer-Size to its MAX-Value!!!
      v_Result := floor(v_Maxsize / (v_Divisible_by * p_Chunksize)) * (v_Divisible_by * p_Chunksize);
      if (v_Result not between 1 and v_Maxsize)
      then
        v_Result := floor(v_Maxsize / v_Divisible_by) * v_Divisible_by;
      end if;
      --
    end if;
    --
    --
    return v_Result;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      Raise_application_error(v_SQLCODE
                             ,v_SQLERRM);
      --
  end SizeByMultipleOfChunk;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Initially implemented
  * WWirns    16.07.2015  Added p_Divisible_by
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function BestLobBuffersize(p_LOB           in blob
                            ,p_MaxBuffersize in integer default 32767
                            ,p_Divisible_by  in integer default 1
                             --
                             ) return integer is
    --
  begin
    --
    -- Init-Check done by "SizeByMultipleOfChunk"
    --
    return SizeByMultipleOfChunk(DBMS_LOB.getchunksize(p_LOB)
                                ,p_MaxBuffersize
                                ,p_Divisible_by
                                 --
                                 );
    --
  end BestLobBuffersize;
  --
  function BestLobBuffersize(p_LOB           in clob character set ANY_CS
                            ,p_MaxBuffersize in integer default 32767
                            ,p_Divisible_by  in integer default 1
                             --
                             ) return integer is
    --
  begin
    --
    -- Init-Check done by "SizeByMultipleOfChunk"
    --
    return SizeByMultipleOfChunk(DBMS_LOB.getchunksize(p_LOB)
                                ,p_MaxBuffersize
                                ,p_Divisible_by
                                 --
                                 );
    --
  end BestLobBuffersize;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    13.07.2015  Added
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  procedure BLOB2CLOB(p_LOB          in blob
                     ,p_LOB_Result   in out nocopy clob character set ANY_CS
                     ,p_Amount       in integer default DBMS_LOB.LOBMAXSIZE
                     ,p_Dest_Offset  in out integer
                     ,p_Src_Offset   in out integer
                     ,p_Blob_Csid    in number default DBMS_LOB.DEFAULT_CSID
                     ,p_Lang_Context in out integer
                     ,p_Warning      out integer
                      --
                      ) is
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    p_dest_offset  := nvl(p_dest_offset
                         ,1);
    p_src_offset   := nvl(p_src_offset
                         ,1);
    p_lang_context := nvl(p_lang_context
                         ,DBMS_LOB.DEFAULT_LANG_CTX);
    p_warning      := null;
    --
    if (p_LOB_Result is not null)
    then
      DBMS_LOB.trim(p_LOB_Result
                   ,0);
    else
      DBMS_LOB.CREATETEMPORARY(p_LOB_Result
                              ,true);
    end if;
    begin
      -- Block for save Finally
      --
      DBMS_LOB.convertToClob(dest_lob     => p_LOB_Result
                            ,src_blob     => p_LOB
                            ,amount       => nvl(p_Amount
                                                ,DBMS_LOB.LOBMAXSIZE)
                            ,dest_offset  => p_dest_offset
                            ,src_offset   => p_src_offset
                            ,blob_csid    => nvl(p_blob_csid
                                                ,DBMS_LOB.DEFAULT_CSID)
                            ,lang_context => p_lang_context
                            ,warning      => p_warning
                             --
                             );
      --
      --warn_inconvertible_char    CONSTANT INTEGER    := 1;
      --no_warning         CONSTANT INTEGER   := 0;
      --
    exception
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        FreeTempLOB(p_LOB_Result
                   ,true
                   ,true);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
    end;
    --
  end BLOB2CLOB;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    13.07.2015  Added
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function BLOB2CLOB(p_LOB          in blob
                    ,p_Amount       in integer default DBMS_LOB.LOBMAXSIZE
                    ,p_Dest_Offset  in integer default 1
                    ,p_Src_Offset   in integer default 1
                    ,p_Blob_Csid    in number default DBMS_LOB.DEFAULT_CSID
                    ,p_Lang_Context in integer default DBMS_LOB.DEFAULT_LANG_CTX
                     --
                     ) return clob is
    --
    v_LOB          clob;
    v_dest_offset  integer;
    v_src_offset   integer;
    v_lang_context integer;
    v_warning      integer;
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_LOB is null)
    then
      return null;
    end if;
    --
    --
    v_dest_offset  := nvl(p_dest_offset
                         ,1);
    v_src_offset   := nvl(p_src_offset
                         ,1);
    v_lang_context := nvl(p_lang_context
                         ,DBMS_LOB.DEFAULT_LANG_CTX);
    v_warning      := null;
    --
    BLOB2CLOB(p_LOB
             ,v_LOB
             ,p_Amount
             ,v_dest_offset
             ,v_src_offset
             ,p_blob_csid
             ,v_lang_context
             ,v_warning
              --
              );
    --
    --
    return v_LOB;
    --
  end BLOB2CLOB;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   p_LOB
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   None
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    09.02.2018  Added
  *******************************************************************************/
  --
  function BLOB2HEX(p_LOB in blob
                    --
                    ) return clob is
    --
    v_Result  clob;
    v_HexData varchar2(32767);
    v_RawData raw(16384);
    v_Offset  integer := 1;
    --v_Lob_length number;
    -- WWirns: Decode with multiple of 2!!!
    v_Amount  integer := 16384;
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_LOB is null)
    then
      return null;
    end if;
    --
    --
    DBMS_LOB.createtemporary(v_Result
                            ,true
                            ,DBMS_LOB.session);
    --
    -- ToDo: BestLobBuffersize for reading or writing lob?
    v_Amount := BestLobBuffersize(p_LOB
                                 ,v_Amount
                                 ,2);
    --
    --
    begin
      --
      --
      DBMS_LOB.open(v_Result
                   ,DBMS_LOB.lob_readwrite);
      --
      --
      loop
        DBMS_LOB.read(p_LOB
                     ,v_Amount
                     ,v_Offset
                     ,v_RawData);
        v_Offset := v_Offset + v_Amount;
        --
        --
        v_HexData := RawToHex(v_RawData);
        --
        --
        DBMS_LOB.writeappend(v_Result
                            ,length(v_HexData)
                            ,v_HexData);
        --
      end loop;
      --
    exception
      when NO_DATA_FOUND then
        return v_Result;
        --
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        FreeTempLOB(v_Result
                   ,true
                   ,true);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
        --
    end;
    --
  end BLOB2HEX;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   p_LOB
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   None
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    24.07.2015  Initially implemented
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function HEX2BLOB(p_LOB in clob character set ANY_CS
                    --
                    ) return blob is
    --
    v_Result  blob;
    v_HexData varchar2(16384);
    v_RawData raw(16384);
    v_Offset  integer := 1;
    --v_Lob_length number;
    -- WWirns: Decode with multiple of 2!!!
    v_Amount  integer := 16384;
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_LOB is null)
    then
      return null;
    end if;
    --
    --
    DBMS_LOB.createtemporary(v_Result
                            ,true
                            ,DBMS_LOB.session);
    --
    -- ToDo: BestLobBuffersize for reading or writing lob?
    v_Amount := BestLobBuffersize(p_LOB
                                 ,v_Amount
                                 ,2);
    --
    --
    begin
      --
      --
      DBMS_LOB.open(v_Result
                   ,DBMS_LOB.lob_readwrite);
      --
      --
      loop
        DBMS_LOB.read(p_LOB
                     ,v_Amount
                     ,v_Offset
                     ,v_HexData);
        v_Offset := v_Offset + v_Amount;
        --
        --
        v_RawData := HexToRaw(v_HexData);
        --
        --
        DBMS_LOB.writeappend(v_Result
                            ,utl_raw.length(v_RawData)
                            ,v_RawData);
        --
      end loop;
      --
    exception
      when NO_DATA_FOUND then
        return v_Result;
        --
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        FreeTempLOB(v_Result
                   ,true
                   ,true);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
        --
    end;
    --
  end HEX2BLOB;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Added
  * WWirns    03.05.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  procedure CLOB2BLOB(p_LOB          in clob character set ANY_CS
                     ,p_LOB_Result   in out nocopy blob
                     ,p_Amount       in integer default DBMS_LOB.LOBMAXSIZE
                     ,p_Dest_Offset  in out integer
                     ,p_Src_Offset   in out integer
                     ,p_Blob_Csid    in number default DBMS_LOB.DEFAULT_CSID
                     ,p_Lang_Context in out integer
                     ,p_Warning      out integer
                      --
                      ) is
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    p_Dest_Offset  := nvl(p_Dest_Offset
                         ,1);
    p_Src_Offset   := nvl(p_Src_Offset
                         ,1);
    p_Lang_Context := nvl(p_Lang_Context
                         ,DBMS_LOB.DEFAULT_LANG_CTX);
    p_Warning      := null;
    --
    if (p_LOB_Result is not null)
    then
      DBMS_LOB.trim(p_LOB_Result
                   ,0);
    else
      DBMS_LOB.CREATETEMPORARY(p_LOB_Result
                              ,true);
    end if;
    begin
      -- Block for save Finally
      --
      DBMS_LOB.CONVERTTOBLOB(dest_lob     => p_LOB_Result
                            ,src_clob     => p_LOB
                            ,amount       => nvl(p_Amount
                                                ,DBMS_LOB.LOBMAXSIZE)
                            ,dest_offset  => p_Dest_Offset
                            ,src_offset   => p_Src_Offset
                            ,blob_csid    => nvl(p_Blob_Csid
                                                ,DBMS_LOB.DEFAULT_CSID)
                            ,lang_context => p_Lang_Context
                            ,warning      => p_Warning
                             --
                             );
      --
      --warn_inconvertible_char    CONSTANT INTEGER    := 1;
      --no_warning         CONSTANT INTEGER   := 0;
      --
    exception
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        FreeTempLOB(p_LOB_Result
                   ,true
                   ,true);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
    end;
    --
  end CLOB2BLOB;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Added
  * WWirns    03.05.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function CLOB2BLOB(p_LOB          in clob character set ANY_CS
                    ,p_Amount       in integer default DBMS_LOB.LOBMAXSIZE
                    ,p_Dest_Offset  in integer default 1
                    ,p_Src_Offset   in integer default 1
                    ,p_Blob_Csid    in number default DBMS_LOB.DEFAULT_CSID
                    ,p_Lang_Context in integer default DBMS_LOB.DEFAULT_LANG_CTX
                     --
                     ) return blob is
    --
    v_LOB          blob;
    v_dest_offset  integer;
    v_src_offset   integer;
    v_lang_context integer;
    v_warning      integer;
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_LOB is null)
    then
      return null;
    end if;
    --
    --
    v_dest_offset  := nvl(p_Dest_Offset
                         ,1);
    v_src_offset   := nvl(p_Src_Offset
                         ,1);
    v_lang_context := nvl(p_Lang_Context
                         ,DBMS_LOB.DEFAULT_LANG_CTX);
    v_warning      := null;
    --
    CLOB2BLOB(p_LOB
             ,v_LOB
             ,p_Amount
             ,v_dest_offset
             ,v_src_offset
             ,p_Blob_Csid
             ,v_lang_context
             ,v_warning
              --
              );
    --
    --
    return v_LOB;
    --
  end CLOB2BLOB;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   p_LOB
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    16.07.2015  Refactor
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  * WWirns    16.08.2018  Add overload
  *******************************************************************************/
  --
  function Encode_Base64(p_LOB in blob
                         --
                         ) return clob is
    --
    cl_Result clob;
    --
    raw_Buffer raw(32767);
    vc_Base64  varchar2(32767);
    p_Offset   integer := 1;
    -- WWirns:Encode with multiple of 3 and decode with multiple of 4!!!
    p_Amount integer := 4096 * 3;
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_LOB is null)
    then
      return null;
    end if;
    --
    --
    DBMS_LOB.createtemporary(cl_Result
                            ,true);
    --
    begin
      --
      --
      DBMS_LOB.open(cl_Result
                   ,DBMS_LOB.lob_readwrite);
      --
      --
      loop
        DBMS_LOB.read(p_LOB
                     ,p_Amount
                     ,p_Offset
                     ,raw_Buffer);
        p_Offset := p_Offset + p_Amount;
        --
        --
        vc_Base64 := UTL_RAW.cast_to_varchar2(utl_encode.base64_encode(raw_Buffer));
        --
        --
        DBMS_LOB.writeappend(cl_Result
                            ,length(vc_Base64)
                            ,vc_Base64);
        --
      end loop;
      --
    exception
      when NO_DATA_FOUND then
        return cl_Result;
        --
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        FreeTempLOB(cl_Result
                   ,true
                   ,true);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
        --
    end;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      Raise_application_error(v_SQLCODE
                             ,v_SQLERRM);
      --
  end Encode_Base64;
  --
  function Encode_Base64(p_LOB in clob character set ANY_CS
                         --
                         ) return clob is
  begin
    return Encode_Base64(CLOB2BLOB(p_LOB));
  end Encode_Base64;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   p_LOB
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Initially implemented
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  * WWirns    16.08.2018  Add overload
  *******************************************************************************/
  --
  function Decode_Base64(p_LOB in clob character set ANY_CS
                         --
                         ) return blob is
    --
    bl_Result  blob;
    vc_Base64  varchar2(32767);
    raw_Buffer raw(32767);
    p_Offset   integer := 1;
    -- WWirns:Decode with multiple of 4 and encode with multiple of 3!!!
    p_Amount integer := 4096 * 4;
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_LOB is null)
    then
      return null;
    end if;
    --
    --
    DBMS_LOB.createtemporary(bl_Result
                            ,true
                            ,DBMS_LOB.session);
    --
    -- WWirns:Set p_Amount to ((4 * chunksize) <= 32767)
    --
    begin
      --
      --
      DBMS_LOB.open(bl_Result
                   ,DBMS_LOB.lob_readwrite);
      --
      --
      loop
        DBMS_LOB.read(p_LOB
                     ,p_Amount
                     ,p_Offset
                     ,vc_Base64);
        p_Offset := p_Offset + p_Amount;
        --
        --
        raw_Buffer := utl_encode.base64_decode(UTL_RAW.cast_to_raw(vc_Base64));
        --
        --
        DBMS_LOB.writeappend(bl_Result
                            ,utl_raw.length(raw_Buffer)
                            ,raw_Buffer);
        --
      end loop;
      --
    exception
      when NO_DATA_FOUND then
        return bl_Result;
        --
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        FreeTempLOB(bl_Result
                   ,true
                   ,true);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
        --
    end;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      Raise_application_error(v_SQLCODE
                             ,v_SQLERRM);
      --
  end Decode_Base64;
  --
  function Decode_Base64$CL(p_LOB in clob character set ANY_CS
                            --
                            ) return clob is
  begin
    return BLOB2CLOB(Decode_Base64(p_LOB));
  end Decode_Base64$CL;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   io_Request
  *
  *   p_Prevent_EXCE
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Initially implemented
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  procedure FreeHttpRequest(p_Request      in out nocopy UTL_HTTP.req
                           ,p_Set_NULL     in boolean default false
                           ,p_Prevent_EXCE in boolean default false
                            --
                            ) is
    --
    v_Is_detailed_excp_support boolean;
    v_SQLCODE                  number;
    v_SQLERRM                  varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    UTL_HTTP.get_detailed_excp_support(v_Is_detailed_excp_support);
    --
    begin
      UTL_HTTP.end_request(p_Request);
    exception
      when UTL_HTTP.request_failed then
        -- WWirns: The request could already be ended, because open of the response does end the request implicit!!!
        --         In this case REQUEST_FAILED would be raised if get_detailed_excp_support is disabled!!!
        if (v_Is_detailed_excp_support)
        then
          raise;
        end if;
        --
      when UTL_HTTP.bad_argument then
        -- WWirns: The request could already be ended, because open of the response does end the request implicit!!!
        --         In this case BAD_ARGUMENT would be raised if get_detailed_excp_support is enabled!!!
        if (not v_Is_detailed_excp_support)
        then
          raise;
        end if;
    end;
    --
    if (nvl(p_Set_NULL
           ,false))
    then
      p_Request := null;
    end if;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      --
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
      end if;
      --
  end FreeHttpRequest;
  --
  procedure FreeHttpRequest(p_Response     in out nocopy UTL_HTTP.resp
                           ,p_Set_NULL     in boolean default false
                           ,p_Prevent_EXCE in boolean default false
                            --
                            ) is
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    UTL_HTTP.end_response(p_Response);
    --
    if (nvl(p_Set_NULL
           ,false))
    then
      p_Response := null;
    end if;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      --
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
      end if;
      --
  end FreeHttpRequest;
  --
  procedure FreeHttpRequest(p_Request      in out nocopy UTL_HTTP.req
                           ,p_Response     in out nocopy UTL_HTTP.resp
                           ,p_Set_NULL     in boolean default false
                           ,p_Prevent_EXCE in boolean default false
                            --
                            ) is
    --
  begin
    --
    -- Init-Check done by "FreeHttpRequest"
    --
    FreeHttpRequest(p_Request
                   ,p_Set_NULL
                   ,p_Prevent_EXCE
                    --
                    );
    --
    FreeHttpRequest(p_Response
                   ,p_Set_NULL
                   ,p_Prevent_EXCE
                    --
                    );
    --
  end FreeHttpRequest;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   io_Request
  *   p_LOB
  *   p_Content_Type
  *   p_Prevent_EXCE
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   This procedure is equal to DEMOGRAPHIC.PKG_CREATE_ENROLLMENT.SEND_HTTP_BODY(...)!!!
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    10.07.2015  Refactor procedure, because it has had a wrong loop condition
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  procedure HttpPostBody(p_Request      in out nocopy UTL_HTTP.req
                        ,p_LOB          in blob
                        ,p_Content_Type in varchar2 default 'application/octet-stream'
                        ,p_Prevent_EXCE in boolean default false
                         --
                         ) is
    --
    v_raw_data   raw(32767);
    v_Lob_length number;
    v_amount     integer := 32767;
    v_position   integer := 1;
    v_SQLCODE    number;
    v_SQLERRM    varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_LOB is null)
    then
      Raise_application_error(-20000
                             ,'Any IN-Parameter is NULL!!!');
    end if;
    --
    --
    v_Lob_length := DBMS_LOB.getlength(p_LOB);
    v_amount     := BestLobBuffersize(p_LOB
                                     ,32767);
    --
    --
    UTL_HTTP.set_header(p_Request
                       ,'Content-Type'
                       ,nvl(p_Content_Type
                           ,'application/octet-stream'));
    UTL_HTTP.set_header(p_Request
                       ,'Content-Length'
                       ,v_Lob_length);
    --
    --
    loop
      --
      begin
        DBMS_LOB.read(p_LOB
                     ,v_amount
                     ,v_position
                     ,v_raw_data);
      exception
        when NO_DATA_FOUND then
          -- WWirns: DBMS_LOB.read(...) raises NDF, because it does not deliver more bytes, normally it has reached EOF!
          -- WWirns: Exit the LOOP!!!
          exit;
      end;
      --
      v_position := v_position + v_amount;
      UTL_HTTP.write_raw(p_Request
                        ,v_raw_data);
      --
    end loop;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      --
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
      end if;
      --
  end HttpPostBody;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    08.07.2016  Compare*:Added
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function Compare(p_Value_0 in varchar2
                  ,p_Value_1 in varchar2
                   --
                   ) return pls_integer deterministic is
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    if (p_Value_0 < p_Value_1)
    then
      return(-1);
    elsif (p_Value_0 = p_Value_1)
    then
      return 0;
    elsif (p_Value_0 > p_Value_1)
    then
      return 1;
    elsif (p_Value_0 is null and p_Value_1 is not null)
    then
      return(-1);
    elsif (p_Value_0 is null and p_Value_1 is null)
    then
      return 0;
    elsif (p_Value_0 is not null and p_Value_1 is null)
    then
      return 1;
    else
      return null;
    end if;
  end Compare;
  --
  function Compare(p_Value_0 in number
                  ,p_Value_1 in number
                   --
                   ) return pls_integer deterministic is
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    if (p_Value_0 < p_Value_1)
    then
      return(-1);
    elsif (p_Value_0 = p_Value_1)
    then
      return 0;
    elsif (p_Value_0 > p_Value_1)
    then
      return 1;
    elsif (p_Value_0 is null and p_Value_1 is not null)
    then
      return(-1);
    elsif (p_Value_0 is null and p_Value_1 is null)
    then
      return 0;
    elsif (p_Value_0 is not null and p_Value_1 is null)
    then
      return 1;
    else
      return null;
    end if;
  end Compare;
  --
  function Compare(p_Value_0 in date
                  ,p_Value_1 in date
                   --
                   ) return pls_integer deterministic is
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    if (p_Value_0 < p_Value_1)
    then
      return(-1);
    elsif (p_Value_0 = p_Value_1)
    then
      return 0;
    elsif (p_Value_0 > p_Value_1)
    then
      return 1;
    elsif (p_Value_0 is null and p_Value_1 is not null)
    then
      return(-1);
    elsif (p_Value_0 is null and p_Value_1 is null)
    then
      return 0;
    elsif (p_Value_0 is not null and p_Value_1 is null)
    then
      return 1;
    else
      return null;
    end if;
  end Compare;
  --
  function Compare(p_Value_0 in timestamp
                  ,p_Value_1 in timestamp
                   --
                   ) return pls_integer deterministic is
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    if (p_Value_0 < p_Value_1)
    then
      return(-1);
    elsif (p_Value_0 = p_Value_1)
    then
      return 0;
    elsif (p_Value_0 > p_Value_1)
    then
      return 1;
    elsif (p_Value_0 is null and p_Value_1 is not null)
    then
      return(-1);
    elsif (p_Value_0 is null and p_Value_1 is null)
    then
      return 0;
    elsif (p_Value_0 is not null and p_Value_1 is null)
    then
      return 1;
    else
      return null;
    end if;
  end Compare;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    29.07.2015  to_Number:Added
  * WWirns    18.08.2015  to_Number:i_NLS_Param added
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function to_Number(p_Value        in varchar2
                    ,p_Format_Model in varchar2 default null
                    ,p_NLS_Param    in varchar2 default null
                    ,p_NVL_Value    in number default null
                    ,p_Prevent_EXCE in boolean default false
                     --
                     ) return number deterministic is
    --
    v_Result  number;
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_Format_Model is not null)
    then
      if (p_NLS_Param is not null)
      then
        v_Result := standard.to_number(p_Value
                                      ,p_Format_Model
                                      ,p_NLS_Param);
      else
        v_Result := standard.to_number(p_Value
                                      ,p_Format_Model);
      end if;
    else
      v_Result := standard.to_number(p_Value);
    end if;
    --
    --
    return nvl(v_Result
              ,nvl(p_NVL_Value
                  ,null));
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      --
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
      end if;
      --
      return nvl(p_NVL_Value
                ,null);
      --
  end to_Number;
  --
  function to_Number_(p_Value        in varchar2
                     ,p_Format_Model in varchar2 default null
                     ,p_NLS_Param    in varchar2 default null
                     ,p_NVL_Value    in number default null
                     ,p_Prevent_EXCE in pls_integer default 0
                      --
                      ) return number deterministic is
  begin
    return to_Number(p_Value
                    ,p_Format_Model
                    ,p_NLS_Param
                    ,p_NVL_Value
                    ,sys.diutil.int_to_bool(p_Prevent_EXCE)
                     --
                     );
  end to_Number_;
  --
  function to_Number_(p_Value        in varchar2
                     ,p_Format_Model in varchar2 default null
                     ,p_Prevent_EXCE in pls_integer default 0
                      --
                      ) return number deterministic is
  begin
    return to_Number(p_Value        => p_Value
                    ,p_Format_Model => p_Format_Model
                    ,p_Prevent_EXCE => sys.diutil.int_to_bool(p_Prevent_EXCE)
                     --
                     );
  end to_Number_;
  --
  function to_Number_(p_Value        in varchar2
                     ,p_Prevent_EXCE in pls_integer default 0
                      --
                      ) return number deterministic is
  begin
    return to_Number(p_Value        => p_Value
                    ,p_Prevent_EXCE => sys.diutil.int_to_bool(p_Prevent_EXCE)
                     --
                     );
  end to_Number_;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    29.07.2015  to_Date:Added
  * WWirns    18.08.2015  to_Date:i_NLS_Param added
  * WWirns    08.02.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function to_Date(p_Value        in varchar2
                  ,p_Format_Model in varchar2 default null
                  ,p_NLS_Param    in varchar2 default null
                  ,p_NVL_Value    in date default null
                  ,p_Prevent_EXCE in boolean default false
                   --
                   ) return date deterministic is
    --
    v_Result  date;
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_Format_Model is not null)
    then
      if (p_NLS_Param is not null)
      then
        v_Result := standard.to_date(p_Value
                                    ,p_Format_Model
                                    ,p_NLS_Param);
      else
        v_Result := standard.to_date(p_Value
                                    ,p_Format_Model);
      end if;
    else
      v_Result := standard.to_date(p_Value);
    end if;
    --
    --
    return nvl(v_Result
              ,nvl(p_NVL_Value
                  ,null));
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      --
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
      end if;
      --
      return nvl(p_NVL_Value
                ,null);
      --
  end to_Date;
  --
  function to_Date_(p_Value        in varchar2
                   ,p_Format_Model in varchar2 default null
                   ,p_NLS_Param    in varchar2 default null
                   ,p_NVL_Value    in date default null
                   ,p_Prevent_EXCE in pls_integer default 0
                    --
                    ) return date deterministic is
  begin
    return to_Date(p_Value
                  ,p_Format_Model
                  ,p_NLS_Param
                  ,p_NVL_Value
                  ,sys.diutil.int_to_bool(p_Prevent_EXCE)
                   --
                   );
  end to_Date_;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   p_LOB
  *
  * EXCEPTIONS
  *   None
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    15.08.2018  Multi_Replace:Added
  * WWirns    17.08.2018  Multi_Replace:Overload added
  *******************************************************************************/
  --
  function Multi_Replace(p_Value              in clob character set ANY_CS
                        ,p_SEARCH_DEFINITIONs in VT_SEARCH_DEFINITION
                         --
                         ) return clob is
    --
    cl_Result clob;
    --
    i                      integer;
    v_Offset_Value         integer;
    v_Offset_Result        integer;
    v_Curr_Find_Search_Idx integer;
    v_Curr_Find_Pos        integer;
    v_Curr_Find_Length     integer;
    v_Amount               integer;
    v_Pattern_From         varchar2(32767 char);
    v_Pattern_To           varchar2(32767 char);
    v_Pos_From             integer;
    v_Pos_To               integer;
    v_Skip_Idxs            TT_N;
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_Value is null)
    then
      return cl_Result;
    end if;
    --
    --
    DBMS_LOB.createtemporary(cl_Result
                            ,true);
    --
    begin
      --
      --
      v_Offset_Value  := 1;
      v_Offset_Result := 1;
      --
      --
      if (p_SEARCH_DEFINITIONs is null)
      then
        --
        return p_Value;
        --
      else
        --
        v_Skip_Idxs := TT_N();
        --
        loop
          --
          v_Curr_Find_Search_Idx := 0;
          v_Curr_Find_Pos        := 0;
          v_Curr_Find_Length     := 0;
          --
          i := p_SEARCH_DEFINITIONs.first;
          while (i is not null)
          loop
            --
            if (p_SEARCH_DEFINITIONs(i).Is_Pattern_Case_Sensitive() != 1)
            then
              Raise_application_error(-20000
                                     ,'Only case sensitive search is supported, defined at index[' || trim(i) || ']!');
            end if;
            --
            if (p_SEARCH_DEFINITIONs(i).POSITION != 1 or p_SEARCH_DEFINITIONs(i).OCCURENCE != 1)
            then
              Raise_application_error(-20000
                                     ,'Multiple replace does not support POSITION or OCCURENCE other than 1, defined at index[' || trim(i) || ']!');
            end if;
            --
            if (i not member of v_Skip_Idxs)
            then
              --
              -- Search string is not skipable, so search for it
              if (p_SEARCH_DEFINITIONs(i).Is_Pattern_RegExp() = 1)
              then
                --
                Raise_application_error(-20000
                                       ,'Pattern is "RegExp" is NOT supported, defined at index[' || trim(i) || ']!');
                --
              elsif (p_SEARCH_DEFINITIONs(i).Is_Pattern_Like() = 1)
              then
                --
                v_Pattern_From := regexp_replace(p_SEARCH_DEFINITIONs(i).PATTERN
                                                ,'^([^%]+)(%[^%]+)?$'
                                                ,'\1'
                                                ,1
                                                ,1
                                                ,'im'
                                                 --
                                                 );
                v_Pattern_To   := substr(regexp_replace(p_SEARCH_DEFINITIONs(i).PATTERN
                                                       ,'^([^%]+)(%[^%]+)?$'
                                                       ,'\2'
                                                       ,1
                                                       ,1
                                                       ,'im'
                                                        --
                                                        )
                                        ,2);
                --
              else
                --
                v_Pattern_From := p_SEARCH_DEFINITIONs(i).PATTERN;
                v_Pattern_To   := null;
                --
              end if;
              --
              v_Pos_From := dbms_lob.instr(lob_loc => p_Value
                                          ,pattern => v_Pattern_From
                                          ,offset  => v_Offset_Value
                                          ,nth     => 1
                                           --
                                           );
              --
              if (v_Pos_From = 0)
              then
                --
                -- Did not found the search string, so add i to v_Skip_Idxs, because further searches would it also not find.
                v_Skip_Idxs.extend();
                v_Skip_Idxs(v_Skip_Idxs.last) := i;
                --
              else
                --
                if (v_Pos_From < v_Curr_Find_Pos or v_Curr_Find_Pos = 0)
                then
                  --
                  if (v_Pattern_To is null)
                  then
                    --
                    v_Curr_Find_Search_Idx := i;
                    v_Curr_Find_Pos        := v_Pos_From;
                    v_Curr_Find_Length     := length(v_Pattern_From);
                    --
                  else
                    --
                    v_Pos_To := dbms_lob.instr(lob_loc => p_Value
                                              ,pattern => v_Pattern_To
                                              ,offset  => v_Pos_From + 1
                                              ,nth     => 1
                                               --
                                               );
                    --
                    if (v_Pos_To = 0)
                    then
                      --
                      -- Did not found the search string, so add i to v_Skip_Idxs, because further searches would it also not find.
                      v_Skip_Idxs.extend();
                      v_Skip_Idxs(v_Skip_Idxs.last) := i;
                      --
                    else
                      --
                      v_Curr_Find_Search_Idx := i;
                      v_Curr_Find_Pos        := v_Pos_From;
                      v_Curr_Find_Length     := v_Pos_To - v_Pos_From + length(v_Pattern_To);
                      --
                    end if;
                    --
                  end if;
                  --
                end if;
                --
              end if;
              --
            end if;
            --
            i := p_SEARCH_DEFINITIONs.next(i);
            --
          end loop;
          --
          -- Copy lob content from LOB to Result
          if (v_Curr_Find_Pos > 0)
          then
            --
            -- Did found search string at position i, so copy until the beginning of the search string
            v_Amount := v_Curr_Find_Pos - v_Offset_Value;
            --
            dbms_lob.copy(dest_lob    => cl_Result
                         ,src_lob     => p_Value
                         ,amount      => v_Amount
                         ,dest_offset => v_Offset_Result
                         ,src_offset  => v_Offset_Value
                          --
                          );
            --
            v_Offset_Result := v_Offset_Result + v_Amount;
            v_Offset_Value  := v_Offset_Value + v_Amount;
            --
            -- Copy the replacement
            if (p_SEARCH_DEFINITIONs(v_Curr_Find_Search_Idx).REPLACEMENT is not null)
            then
              dbms_lob.append(dest_lob => cl_Result
                             ,src_lob  => p_SEARCH_DEFINITIONs(v_Curr_Find_Search_Idx).REPLACEMENT
                              --
                              );
              --
              v_Offset_Result := v_Offset_Result + length(p_SEARCH_DEFINITIONs(v_Curr_Find_Search_Idx).REPLACEMENT);
            end if;
            --
            v_Offset_Value := v_Offset_Value + v_Curr_Find_Length;
            --
          else
            -- Did not found any search string, so copy the rest
            v_Amount := dbms_lob.getlength(p_Value) - v_Offset_Value + 1;
            dbms_lob.copy(dest_lob    => cl_Result
                         ,src_lob     => p_Value
                         ,amount      => v_Amount
                         ,dest_offset => v_Offset_Result
                         ,src_offset  => v_Offset_Value
                          --
                          );
            --
            exit;
            --
          end if;
          --
        end loop;
        --
      end if;
      --
    exception
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        FreeTempLOB(cl_Result
                   ,true
                   ,true);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
        --
    end;
    --
    --
    return cl_Result;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      Raise_application_error(v_SQLCODE
                             ,v_SQLERRM);
      --
  end Multi_Replace;
  --
  function Multi_Replace(p_Value              in varchar2
                        ,p_SEARCH_DEFINITIONs in VT_SEARCH_DEFINITION
                         --
                         ) return varchar2 is
    --
    cl_Result varchar2(32767 char);
    --
    i                      integer;
    v_Offset_Value         integer;
    v_Offset_Result        integer;
    v_Curr_Find_Search_Idx integer;
    v_Curr_Find_Pos        integer;
    v_Curr_Find_Length     integer;
    v_Amount               integer;
    v_Pattern_From         varchar2(32767 char);
    v_Pattern_To           varchar2(32767 char);
    v_Pos_From             integer;
    v_Pos_To               integer;
    v_Skip_Idxs            TT_N;
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_Value is null)
    then
      return cl_Result;
    end if;
    --
    --
    cl_Result := '';
    --
    --
    v_Offset_Value  := 1;
    v_Offset_Result := 1;
    --
    --
    if (p_SEARCH_DEFINITIONs is null)
    then
      --
      return p_Value;
      --
    else
      --
      v_Skip_Idxs := TT_N();
      --
      loop
        --
        v_Curr_Find_Search_Idx := 0;
        v_Curr_Find_Pos        := 0;
        v_Curr_Find_Length     := 0;
        --
        i := p_SEARCH_DEFINITIONs.first;
        while (i is not null)
        loop
          --
          if (p_SEARCH_DEFINITIONs(i).Is_Pattern_Case_Sensitive() != 1)
          then
            Raise_application_error(-20000
                                   ,'Only case sensitive search is supported, defined at index[' || trim(i) || ']!');
          end if;
          --
          if (p_SEARCH_DEFINITIONs(i).POSITION != 1 or p_SEARCH_DEFINITIONs(i).OCCURENCE != 1)
          then
            Raise_application_error(-20000
                                   ,'Multiple replace does not support POSITION or OCCURENCE other than 1, defined at index[' || trim(i) || ']!');
          end if;
          --
          if (i not member of v_Skip_Idxs)
          then
            --
            -- Search string is not skipable, so search for it
            if (p_SEARCH_DEFINITIONs(i).Is_Pattern_RegExp() = 1)
            then
              --
              Raise_application_error(-20000
                                     ,'Pattern is "RegExp" is NOT supported, defined at index[' || trim(i) || ']!');
              --
            elsif (p_SEARCH_DEFINITIONs(i).Is_Pattern_Like() = 1)
            then
              --
              v_Pattern_From := regexp_replace(p_SEARCH_DEFINITIONs(i).PATTERN
                                              ,'^([^%]+)(%[^%]+)?$'
                                              ,'\1'
                                              ,1
                                              ,1
                                              ,'im'
                                               --
                                               );
              v_Pattern_To   := substr(regexp_replace(p_SEARCH_DEFINITIONs(i).PATTERN
                                                     ,'^([^%]+)(%[^%]+)?$'
                                                     ,'\2'
                                                     ,1
                                                     ,1
                                                     ,'im'
                                                      --
                                                      )
                                      ,2);
              --
            else
              --
              v_Pattern_From := p_SEARCH_DEFINITIONs(i).PATTERN;
              v_Pattern_To   := null;
              --
            end if;
            --
            v_Pos_From := instr(STR1 => p_Value
                               ,STR2 => v_Pattern_From
                               ,POS  => v_Offset_Value
                               ,NTH  => 1
                                --
                                );
            --
            if (v_Pos_From = 0)
            then
              --
              -- Did not found the search string, so add i to v_Skip_Idxs, because further searches would it also not find.
              v_Skip_Idxs.extend();
              v_Skip_Idxs(v_Skip_Idxs.last) := i;
              --
            else
              --
              if (v_Pos_From < v_Curr_Find_Pos or v_Curr_Find_Pos = 0)
              then
                --
                if (v_Pattern_To is null)
                then
                  --
                  v_Curr_Find_Search_Idx := i;
                  v_Curr_Find_Pos        := v_Pos_From;
                  v_Curr_Find_Length     := length(v_Pattern_From);
                  --
                else
                  --
                  v_Pos_To := instr(STR1 => p_Value
                                   ,STR2 => v_Pattern_To
                                   ,POS  => v_Pos_From + 1
                                   ,NTH  => 1
                                    --
                                    );
                  --
                  if (v_Pos_To = 0)
                  then
                    --
                    -- Did not found the search string, so add i to v_Skip_Idxs, because further searches would it also not find.
                    v_Skip_Idxs.extend();
                    v_Skip_Idxs(v_Skip_Idxs.last) := i;
                    --
                  else
                    --
                    v_Curr_Find_Search_Idx := i;
                    v_Curr_Find_Pos        := v_Pos_From;
                    v_Curr_Find_Length     := v_Pos_To - v_Pos_From + length(v_Pattern_To);
                    --
                  end if;
                  --
                end if;
                --
              end if;
              --
            end if;
            --
          end if;
          --
          i := p_SEARCH_DEFINITIONs.next(i);
          --
        end loop;
        --
        -- Copy lob content from LOB to Result
        if (v_Curr_Find_Pos > 0)
        then
          --
          -- Did found search string at position i, so copy until the beginning of the search string
          v_Amount := v_Curr_Find_Pos - v_Offset_Value;
          --
          cl_Result := cl_Result || substr(STR1 => p_Value
                                          ,POS  => v_Offset_Value
                                          ,LEN  => v_Amount
                                           --
                                           );
          --
          v_Offset_Result := v_Offset_Result + v_Amount;
          v_Offset_Value  := v_Offset_Value + v_Amount;
          --
          -- Copy the replacement
          if (p_SEARCH_DEFINITIONs(v_Curr_Find_Search_Idx).REPLACEMENT is not null)
          then
            cl_Result := cl_Result || p_SEARCH_DEFINITIONs(v_Curr_Find_Search_Idx).REPLACEMENT;
            --
            v_Offset_Result := v_Offset_Result + length(p_SEARCH_DEFINITIONs(v_Curr_Find_Search_Idx).REPLACEMENT);
          end if;
          --
          v_Offset_Value := v_Offset_Value + v_Curr_Find_Length;
          --
        else
          -- Did not found any search string, so copy the rest
          v_Amount  := length(p_Value) - v_Offset_Value + 1;
          cl_Result := cl_Result || substr(STR1 => p_Value
                                          ,POS  => v_Offset_Value
                                          ,LEN  => v_Amount
                                           --
                                           );
          --
          exit;
          --
        end if;
        --
      end loop;
      --
    end if;
    --
    --
    return cl_Result;
    --
  exception
    when others then
      FormatErrMsg(v_SQLCODE
                  ,v_SQLERRM);
      Raise_application_error(v_SQLCODE
                             ,v_SQLERRM);
      --
  end Multi_Replace;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    16.08.2018  Copied from Project "NGA20708"
  *******************************************************************************/
  --
  function hash(p_Value in raw
               ,p_Typ   in pls_integer default DBMS_CRYPTO.HASH_SH1
                --
                ) return raw deterministic is
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_Value is null)
    then
      return null;
    else
      return DBMS_CRYPTO.Hash(p_Value
                             ,nvl(p_Typ
                                 ,DBMS_CRYPTO.HASH_SH1)
                              --
                              );
    end if;
    --
  end hash;
  --
  function hash(p_Value in blob
               ,p_Typ   in pls_integer default DBMS_CRYPTO.HASH_SH1
                --
                ) return raw deterministic is
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_Value is null)
    then
      return null;
    else
      return DBMS_CRYPTO.Hash(p_Value
                             ,nvl(p_Typ
                                 ,DBMS_CRYPTO.HASH_SH1)
                              --
                              );
    end if;
    --
  end hash;
  --
  function hash(p_Value in clob character set ANY_CS
               ,p_Typ   in pls_integer default DBMS_CRYPTO.HASH_SH1
                --
                ) return raw deterministic is
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    if (p_Value is null)
    then
      return null;
    else
      return DBMS_CRYPTO.Hash(p_Value
                             ,nvl(p_Typ
                                 ,DBMS_CRYPTO.HASH_SH1)
                              --
                              );
    end if;
    --
  end hash;
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    20.08.2018  Added
  *******************************************************************************/
  --
  procedure LOB2DIRECTORY(p_LOB       in clob
                         ,p_DIRECTORY in varchar2
                         ,p_Filename  in varchar2
                          --
                          ) is
    --
    v_FILE_TYPE UTL_FILE.FILE_TYPE;
    v_CharData  varchar2(32767);
    v_Offset    integer := 1;
    v_Amount    integer := 32767;
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    v_FILE_TYPE := UTL_FILE.fopen(p_DIRECTORY
                                 ,p_Filename
                                 ,'w');
    --
    begin
      --
      -- ToDo: BestLobBuffersize for reading or writing lob?
      v_Amount := BestLobBuffersize(p_LOB
                                   ,v_Amount
                                   ,2);
      -- + 1 is this needed?
      --v_Amount := v_Amount + 1;
      --
      --
      loop
        DBMS_LOB.read(p_LOB
                     ,v_Amount
                     ,v_Offset
                     ,v_CharData);
        v_Offset := v_Offset + v_Amount;
        --
        --
        UTL_FILE.put(v_FILE_TYPE
                    ,v_CharData);
        --
      end loop;
      --
    exception
      when NO_DATA_FOUND then
        UTL_FILE.fclose(v_FILE_TYPE);
        --
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        UTL_FILE.fclose(v_FILE_TYPE);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
        --
    end;
    --
  end LOB2DIRECTORY;
  --
  procedure LOB2DIRECTORY(p_LOB       in blob
                         ,p_DIRECTORY in varchar2
                         ,p_Filename  in varchar2
                          --
                          ) is
    --
    v_FILE_TYPE UTL_FILE.FILE_TYPE;
    v_RawData   raw(32767);
    v_Offset    integer := 1;
    v_Amount    integer := 32767;
    --
    v_SQLCODE number;
    v_SQLERRM varchar2(32767);
    --
  begin
    --
    --
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    --
    --
    v_FILE_TYPE := UTL_FILE.fopen(p_DIRECTORY
                                 ,p_Filename
                                 ,'wb');
    --
    begin
      --
      -- ToDo: BestLobBuffersize for reading or writing lob?
      v_Amount := BestLobBuffersize(p_LOB
                                   ,v_Amount
                                   ,2);
      -- + 1 is this needed?
      --v_Amount := v_Amount + 1;
      --
      --
      loop
        DBMS_LOB.read(p_LOB
                     ,v_Amount
                     ,v_Offset
                     ,v_RawData);
        v_Offset := v_Offset + v_Amount;
        --
        --
        UTL_FILE.put_raw(v_FILE_TYPE
                        ,v_RawData);
        --
      end loop;
      --
    exception
      when NO_DATA_FOUND then
        UTL_FILE.fclose(v_FILE_TYPE);
        --
      when others then
        FormatErrMsg(v_SQLCODE
                    ,v_SQLERRM);
        --
        -- Finally
        UTL_FILE.fclose(v_FILE_TYPE);
        --
        Raise_application_error(v_SQLCODE
                               ,v_SQLERRM);
        --
    end;
    --
  end LOB2DIRECTORY;
  --
  --
  -- *** Standard functions ***************************************************************************
  --
  --
  --
  --
  /**
  * ???
  *
  * PARAMETERS
  *   ???
  *
  * EXCEPTIONS
  *   ???
  *
  * NOTES
  *   ???
  *
  */
  --
  /*******************************************************************************
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    13.01.2016  Init_PACKAGE:Added
  *******************************************************************************/
  --
  procedure Init_PACKAGE is
    --
  begin
    --
    -- !!! Attention with call of other packages, because their init routines could be call back !!!
    -- !!! Try to avoid call of other packages here in this init block in order to prevent endless loops !!!
    --
    --
    -- Initial-Block
    if (not g_PACKAGE_Initializing)
    then
      --
      g_PACKAGE_Initializing := true;
      g_PACKAGE_Initialized  := false;
      --
      --
      /*
      g_PACKAGE_NAME := PKG_UTIL.Get_PLSQL_Unit4Caller();
      if (g_PACKAGE_NAME.VC02 != Get_OBJECT_NAME())
      then
        Raise_application_error(-20000
                               ,'Invalid PACKAGE_NAME.VC02[''' || g_PACKAGE_NAME.VC02 || '''] for OBJECT_NAME[''' || Get_OBJECT_NAME() || '''] detected!');
      end if;
      */
      --
      --
      Check_OBJECT_DEPENDENCE();
      --
      --
      /*
      Session_NLS_Save();
      --
      --
      Init_Sequential_03();
      Init_Sequential_14();
      */
      --
      --
      g_PACKAGE_Initialized  := true;
      g_PACKAGE_Initializing := false;
      --
    end if;
    --
    -- For example, below are calls into functions they itself calls me
    --
    --
    --
    --Create_CFGKEYS4JOBS$AT();
    --
    --
    --Update_JOBS$AT();
    --
  end Init_PACKAGE;
  --
  --
  --
  procedure Check_OBJECT_DEPENDENCE is
  begin
    -- WWirns: For example check ORACLE-Version
    -- or internal version via "Get_OBJECT_VERSION$VC()" of other package or object types
    -- or if column of table exists
    -- and so on...
    null;
    --
  end Check_OBJECT_DEPENDENCE;
  --
  --
  --
  function Get_PACKAGE_ID return simple_integer deterministic is
  begin
    return C_PACKAGE_ID;
  end;
  --
  function Get_OBJECT_NAME return varchar2 deterministic is
  begin
    return $$plsql_unit_owner || '.' || $$plsql_unit;
  end;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic is
  begin
    return C_OBJECT_COPYRIGHT;
  end;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic is
  begin
    return C_OBJECT_VERSION;
  end;
  --
  --
  --
  /* -- commented by MSCS. New version added below.
  function get_client_ip return varchar2 as
    l_ip varchar2(255) := null;
  begin
    l_ip := owa_util.get_cgi_env('x-real-ip');
    if l_ip is null then
      l_ip := owa_util.get_cgi_env('x-forwarded-for');
      l_ip := trim(regexp_replace(l_ip, '[,;].*', '')); -- only get first entry of comma separated list
    end if;
    if l_ip is null then
      l_ip := owa_util.get_cgi_env('remote_addr');
    end if;
    return l_ip;
  end get_client_ip;
  */
  --
  -- modified by MSCS
  --
  function get_client_ip return varchar2 as
    l_ips varchar2(32000) := null;
    l_ips_cnt number := 0;
    l_r_ip varchar2(255) := null;
    l_f_ip varchar2(255) := null;
    l_ip varchar2(255) := null;
  begin
    
    l_r_ip := owa_util.get_cgi_env('x-real-ip');
    l_ips := owa_util.get_cgi_env('x-forwarded-for');
    
    begin
        select ips, ips_count
        into l_f_ip, l_ips_cnt
        from
        (
            select the_level, trim(ips) as ips, count(*) over (partition by null) as ips_count
            
            from
            (
                select level the_level, regexp_substr(l_ips,'[^,]+', 1, level) ips
                from dual
                connect by regexp_substr(l_ips, '[^,]+', 1, level) is not null
            )
            where trim(ips) is not null
        )
        where the_level = 1;
    exception 
        when others then
            l_f_ip := null;
            l_ips_cnt := 0;
    end;
    
    if l_ips_cnt > 1 and l_f_ip is not null then
        l_ip := l_f_ip;
    end if;
    
    if l_ip is null then
        l_ip := l_r_ip;
    end if;
    
    if l_ip is null then
        l_ip := owa_util.get_cgi_env('remote_addr');
    end if;
    
    return l_ip;
  end get_client_ip;
--
--
--
begin
  --
  Init_PACKAGE();
  --
end PKG_UTIL;
/
  GRANT EXECUTE ON "DL_COMMON"."PKG_UTIL" TO PUBLIC;
  GRANT EXECUTE ON "DL_COMMON"."PKG_UTIL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_COMMON"."PKG_UTIL" TO "SERVAPP";
  GRANT EXECUTE ON "DL_COMMON"."PKG_UTIL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_COMMON"."PKG_UTIL" TO "BIOSUPPORT";
