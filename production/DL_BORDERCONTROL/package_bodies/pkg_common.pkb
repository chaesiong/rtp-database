CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_COMMON" is
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for common logic in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: C. Funke $<br/>
  * @date    $Date:  24/10/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */
  --
  -- Part1: Major-Version
  -- Part2: Minor-Version
  -- Part3:
  -- Part4: Patch-Version
  --
  -- !!! INCREMENT THIS VERSIONS STRING ON EACH CHANGE INSIDE THE PACKAGE !!!
  --
  c_scope_prefix        CONSTANT VARCHAR2(31) := lower($$plsql_unit) || '.';
  --
  C_PACKAGE_ID       constant simple_integer := -1; --PKG_CONSTS.C_PID$DEMO$REPORT4CENT;
  C_OBJECT_VERSION   constant varchar2(19) := '1.0.0011';
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.GETPARAMETER" and partial refactor
  *******************************************************************************/
  --
  function Get_Parameter(p_NAME in varchar2
                         --
                         ) return varchar2 is
    --
    v_Result varchar2(255);
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    v_Result := null;
    --
    begin
      select t.VALUE
        into v_Result
        from parameters t
       where upper(t.NAME) = upper(p_NAME);
    exception
      when NO_DATA_FOUND then
        v_Result := null;
    end;
    --
    return v_Result;
    --
  end Get_Parameter;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.PARSE_DATE" and partial refactor
  *******************************************************************************/
  --
  function Parse_Date(p_DATETEXT       in varchar2
                     ,p_MUST_BE_PAST   in number default 0
                     ,p_MUST_BE_FUTURE in number default 0
                     ,p_YEARLIMIT      in number default 0
                     ,p_REVERSEDATE    in number default 0
                      --
                      ) return date as
    --
    v_Result            date := null;
    v_Datetext          varchar2(200);
    v_Is_Must_be_future boolean := false;
    v_Is_Must_be_past   boolean := false;
    v_Is_Reversedate    boolean := false;
    v_century           number := to_number(substr(TO_CHAR(sysdate
                                                          ,'YYYY')
                                                  ,1
                                                  ,2));
    v_Tmp_Date          date := null;
    v_yearlimit         number := p_YEARLIMIT;
    v_concat            varchar2(200);
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    v_Datetext := trim(p_DATETEXT);
    --
    if (v_Datetext is null)
    then
      return null;
    end if;
    --
    v_Is_Must_be_future := p_MUST_BE_FUTURE <> 0;
    v_Is_Must_be_past   := p_MUST_BE_PAST <> 0;
    v_Is_Reversedate    := p_REVERSEDATE <> 0;
    --
    -- only ddmmyy or dd/mm/yyyy allowed
    if (length(v_Datetext) <> 6 and length(v_Datetext) <> 10)
    then
      --
      return null;
      --
    elsif (length(v_Datetext) = 6)
    then
      --
      if (v_yearlimit > 100)
      then
        v_yearlimit := 0;
      end if;
      --
      if (v_Is_Must_be_past and v_Is_Must_be_future)
      then
        return null;
      elsif (v_Is_Must_be_past)
      then
        --
        v_concat := substr(v_Datetext
                          ,1
                          ,4)
                   --
                    || (v_century - 0)
                   --
                    || substr(v_Datetext
                             ,5
                             ,2);
        --
        if (v_Is_Reversedate)
        then
          v_concat := substr(v_Datetext
                            ,5
                            ,2)
                     --
                      || substr(v_Datetext
                               ,3
                               ,2)
                     --
                      || (v_century - 0)
                     --
                      || substr(v_Datetext
                               ,1
                               ,2);
        end if;
        --
        v_concat := replace(v_concat
                           ,'XXXX'
                           ,'3112');
        --
        if instr(v_concat
                ,'X') = 0
        then
          v_Tmp_Date := TO_DATE(v_concat
                               ,'DDMMYYYY');
          if (v_Tmp_Date <= trunc(sysdate) and (v_yearlimit = 0 or v_Tmp_Date >= trunc(add_months(sysdate
                                                                                                 ,-v_yearlimit * 12))))
          then
            v_Result := v_Tmp_Date;
            return v_Result;
          end if;
        end if;
        --
        v_concat := substr(v_Datetext
                          ,1
                          ,4)
                   --
                    || (v_century - 1)
                   --
                    || substr(v_Datetext
                             ,5
                             ,2);
        --
        if (v_Is_Reversedate)
        then
          v_concat := substr(v_Datetext
                            ,5
                            ,2)
                     --
                      || substr(v_Datetext
                               ,3
                               ,2)
                     --
                      || (v_century - 1)
                     --
                      || substr(v_Datetext
                               ,1
                               ,2);
        end if;
        --
        v_concat := replace(v_concat
                           ,'XXXX'
                           ,'3112');
        --
        if (instr(v_concat
                 ,'X') = 0)
        then
          v_Tmp_Date := TO_DATE(v_concat
                               ,'DDMMYYYY');
          if (v_Result is null
             --
             and v_Tmp_Date <= trunc(sysdate)
             --
             and (
             --
              v_yearlimit = 0
             --
              or v_Tmp_Date >= trunc(add_months(sysdate
                                                    ,-v_yearlimit * 12))
             --
             )
             --
             )
          then
            v_Result := v_Tmp_Date;
            return v_Result;
          end if;
        end if;
        --
      elsif (v_Is_Must_be_future)
      then
        --
        v_concat := substr(v_Datetext
                          ,1
                          ,4)
                   --
                    || (v_century + 0)
                   --
                    || substr(v_Datetext
                             ,5
                             ,2);
        --
        if (v_Is_Reversedate)
        then
          v_concat := substr(v_Datetext
                            ,5
                            ,2)
                     --
                      || substr(v_Datetext
                               ,3
                               ,2)
                     --
                      || (v_century + 0)
                     --
                      || substr(v_Datetext
                               ,1
                               ,2);
        end if;
        --
        --v_concat := replace(v_concat, 'XXXX', '3112');
        --
        v_Tmp_Date := TO_DATE(v_concat
                             ,'DDMMYYYY');
        --
        if (v_Tmp_Date >= trunc(sysdate)
           --
           and (
           --
            v_yearlimit = 0
           --
            or v_Tmp_Date <= trunc(add_months(sysdate
                                                  ,v_yearlimit * 12))
           --
           )
           --
           )
        then
          v_Result := v_Tmp_Date;
          return v_Result;
        end if;
        --
        v_concat := substr(v_Datetext
                          ,1
                          ,4)
                   --
                    || (v_century + 1)
                   --
                    || substr(v_Datetext
                             ,5
                             ,2);
        --
        if (v_Is_Reversedate)
        then
          v_concat := substr(v_Datetext
                            ,5
                            ,2)
                     --
                      || substr(v_Datetext
                               ,3
                               ,2)
                     --
                      || (v_century + 1)
                     --
                      || substr(v_Datetext
                               ,1
                               ,2);
        end if;
        --
        --v_concat := replace(v_concat, 'XXXX', '3112');
        --
        v_Tmp_Date := TO_DATE(v_concat
                             ,'DDMMYYYY');
        --
        if (v_Result is null
           --
           and v_Tmp_Date >= trunc(sysdate)
           --
           and (
           --
            v_yearlimit = 0
           --
            or v_Tmp_Date <= trunc(add_months(sysdate
                                                  ,v_yearlimit * 12))
           --
           )
           --
           )
        then
          v_Result := v_Tmp_Date;
          return v_Result;
        end if;
        --
      end if;
      --
    elsif (length(v_Datetext) = 10)
    then
      --
      v_Result := TO_DATE(v_Datetext
                         ,'DD/MM/YYYY');
      --
      if (v_Is_Must_be_past and v_Is_Must_be_future)
      then
        --
        return null;
        --
      elsif (v_Is_Must_be_past)
      then
        --
        if (
           --
            (
            --
             v_yearlimit <> 0
            --
             and v_Result < add_months(trunc(sysdate)
                                      ,-v_yearlimit * 12)
            --
            )
           --
            or (v_Result > trunc(sysdate))
           --
           )
        then
          --
          return null;
          --
        end if;
        --
      elsif (v_Is_Must_be_future)
      then
        --
        if (
           --
            (
            --
             v_yearlimit <> 0
            --
             and v_Result > add_months(trunc(sysdate)
                                      ,v_yearlimit * 12)
            --
            )
           --
            or (v_Result < trunc(sysdate))
           --
           )
        then
          --
          return null;
          --
        end if;
        --
      end if;
      --
    end if;
    --
    return v_Result;
    --
  end Parse_Date;
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
  * WWirns    13.11.2017  XX:Moved here from standalone "FUNCTION DL_BORDERCONTROL.RESOLVEHOST" and partial refactor
  *******************************************************************************/
  --
  function Resolve_Host(p_IP_ADDR in varchar2
                        --
                        ) return varchar2 is
    --
    v_Result varchar2(255) := null;
    --
  begin
    --
    /*
    if (not g_PACKAGE_Initialized)
    then
      Init_PACKAGE();
    end if;
    */
    --
    begin
      v_Result := substr(regexp_replace(UTL_INADDR.get_host_name(p_IP_ADDR)
                                       ,'\.[^0-9].*$')
                        ,1
                        ,15);
    exception
      when others then
        if (sqlcode = -29257)
        then
          -- Could not resolve host name for IP
          v_Result := p_IP_ADDR;
        else
          raise;
        end if;
    end;
    --
    return v_Result;
    --
  end Resolve_Host;
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
  * WWirns    06.02.2018  XX:Added
  *******************************************************************************/
  --
  function Get_Borderpost4NAME(p_NAME         in BORDERPOSTS.NAME%type
                              ,p_Only_ACTIVE  in pls_integer default 1
                              ,p_Prevent_EXCE in pls_integer default 0
                               --
                               ) return BORDERPOSTS.KEY_VALUE%type RESULT_CACHE RELIES_ON(BORDERPOSTS) is
    --
    v_Result    BORDERPOSTS.KEY_VALUE%type;
    v_IS_ACTIVE BORDERPOSTS.IS_ACTIVE%type;
    --
  begin
    --
    --
    begin
      select t0.KEY_VALUE
            ,t0.IS_ACTIVE
        into v_Result
            ,v_IS_ACTIVE
        from DL_BORDERCONTROL.BORDERPOSTS t0
       where upper(t0.NAME) = upper(p_NAME);
    exception
      when NO_DATA_FOUND then
        Raise_application_error(-20000
                               ,'The borderpost with the p_NAME[''' || p_NAME || '''] does not exist!');
    end;
    --
    --
    if (nvl(p_Only_ACTIVE
           ,1) != 0 and v_IS_ACTIVE != 'Y')
    then
      Raise_application_error(-20000
                             ,'The borderpost with the KEY_VALUE[''' || v_Result || '''] and the p_NAME[''' || p_NAME || '''] is not active!');
    end if;
    --
    --
    return v_Result;
    --
  exception
    when others then
      if (nvl(p_Prevent_EXCE
             ,0) != 0)
      then
        return null;
      else
        raise;
      end if;
      --
  end Get_Borderpost4NAME;
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
  * WWirns    06.02.2018  XX:Added
  *******************************************************************************/
  --
  function Get_Borderpost4TERM_NAME(p_NAME         in TERMINALS.NAME%type
                                   ,p_Only_ACTIVE  in pls_integer default 1
                                   ,p_Prevent_EXCE in pls_integer default 0
                                    --
                                    ) return BORDERPOSTS.KEY_VALUE%type RESULT_CACHE RELIES_ON(BORDERPOSTS, TERMINALS) is
    --
    v_Result    BORDERPOSTS.KEY_VALUE%type;
    v_IS_ACTIVE BORDERPOSTS.IS_ACTIVE%type;
    --
  begin
    --
    --
    begin
      select t0.KEY_VALUE
            ,t0.IS_ACTIVE
        into v_Result
            ,v_IS_ACTIVE
        from DL_BORDERCONTROL.BORDERPOSTS t0
       inner join DL_BORDERCONTROL.TERMINALS t1
          on (t0.KEY_VALUE = t1.BORDER_POST)
       where upper(t1.NAME) = upper(p_NAME);
    exception
      when NO_DATA_FOUND then
        Raise_application_error(-20000
                               ,'The borderpost of the belonging terminal with the p_NAME[''' || p_NAME || '''] does not exist!');
    end;
    --
    --
    if (nvl(p_Only_ACTIVE
           ,1) != 0 and v_IS_ACTIVE != 'Y')
    then
      Raise_application_error(-20000
                             ,'The borderpost with the KEY_VALUE[''' || v_Result || '''] of the belonging terminal with the p_NAME[''' || p_NAME || '''] is not active!');
    end if;
    --
    --
    return v_Result;
    --
  exception
    when others then
      if (nvl(p_Prevent_EXCE
             ,0) != 0)
      then
        return null;
      else
        raise;
      end if;
      --
  end Get_Borderpost4TERM_NAME;
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
  * WWirns    06.02.2018  XX:Added
  *******************************************************************************/
  --
  function Get_Borderpost4TERM_IPADDR(p_IPADDRESS    in TERMINALS.IPADDRESS%type
                                     ,p_Only_ACTIVE  in pls_integer default 1
                                     ,p_Prevent_EXCE in pls_integer default 0
                                      --
                                      ) return BORDERPOSTS.KEY_VALUE%type RESULT_CACHE RELIES_ON(BORDERPOSTS, TERMINALS) is
    --
    v_Result    BORDERPOSTS.KEY_VALUE%type;
    v_IS_ACTIVE BORDERPOSTS.IS_ACTIVE%type;
    --
  begin
    --
    --
    begin
      select t0.KEY_VALUE
            ,t0.IS_ACTIVE
        into v_Result
            ,v_IS_ACTIVE
        from DL_BORDERCONTROL.BORDERPOSTS t0
       inner join DL_BORDERCONTROL.TERMINALS t1
          on (t0.KEY_VALUE = t1.BORDER_POST)
       where upper(t1.IPADDRESS) = upper(p_IPADDRESS);
    exception
      when NO_DATA_FOUND then
        Raise_application_error(-20000
                               ,'The borderpost of the belonging terminal with the p_IPADDRESS[''' || p_IPADDRESS || '''] does not exist!');
    end;
    --
    --
    if (nvl(p_Only_ACTIVE
           ,1) != 0 and v_IS_ACTIVE != 'Y')
    then
      Raise_application_error(-20000
                             ,'The borderpost with the KEY_VALUE[''' || v_Result || '''] of the belonging terminal with the p_IPADDRESS[''' || p_IPADDRESS || '''] is not active!');
    end if;
    --
    --
    return v_Result;
    --
  exception
    when others then
      if (nvl(p_Prevent_EXCE
             ,0) != 0)
      then
        return null;
      else
        raise;
      end if;
      --
  end Get_Borderpost4TERM_IPADDR;
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
  * WWirns    0702.2018  XX:Added
  *******************************************************************************/
  --
  function Get_Borderpost4TERM_ID(p_ID           in TERMINALS.ID%type
                                 ,p_Only_ACTIVE  in pls_integer default 1
                                 ,p_Prevent_EXCE in pls_integer default 0
                                  --
                                  ) return BORDERPOSTS.KEY_VALUE%type RESULT_CACHE RELIES_ON(BORDERPOSTS, TERMINALS) is
    --
    v_Result    BORDERPOSTS.KEY_VALUE%type;
    v_IS_ACTIVE BORDERPOSTS.IS_ACTIVE%type;
    --
  begin
    --
    --
    begin
      select t0.KEY_VALUE
            ,t0.IS_ACTIVE
        into v_Result
            ,v_IS_ACTIVE
        from DL_BORDERCONTROL.BORDERPOSTS t0
       inner join DL_BORDERCONTROL.TERMINALS t1
          on (t0.KEY_VALUE = t1.BORDER_POST)
       where t1.ID = p_ID;
    exception
      when NO_DATA_FOUND then
        Raise_application_error(-20000
                               ,'The borderpost of the belonging terminal with the p_ID[''' || p_ID || '''] does not exist!');
    end;
    --
    --
    if (nvl(p_Only_ACTIVE
           ,1) != 0 and v_IS_ACTIVE != 'Y')
    then
      Raise_application_error(-20000
                             ,'The borderpost with the KEY_VALUE[''' || v_Result || '''] of the belonging terminal with the p_ID[''' || p_ID || '''] is not active!');
    end if;
    --
    --
    return v_Result;
    --
  exception
    when others then
      if (nvl(p_Prevent_EXCE
             ,0) != 0)
      then
        return null;
      else
        raise;
      end if;
      --
  end Get_Borderpost4TERM_ID;
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
  * MSCS      19.07.2019  XX:Added:borrowed from DL_BLACKLIST
  *                       Allowed Formats: 
  *                       1. DDMMRR or RRMMDD (reversed)
  *                       2. DD/MM/YYYY
  *******************************************************************************/
  --
  FUNCTION Get_Partial_Date(p_DATETEXT          IN VARCHAR2
                            ,p_MUST_BE_PAST     IN NUMBER DEFAULT 0
                            ,p_MUST_BE_FUTURE   IN NUMBER DEFAULT 0
                            ,p_YEARLIMIT        IN NUMBER DEFAULT 0
                            ,p_REVERSEDATE      IN NUMBER DEFAULT 0
                            ,p_Prevent_EXCE     IN PLS_INTEGER DEFAULT 0
                           ) RETURN DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE
  IS
    --
    v_Result            DL_BORDERCONTROL.CT_PARTIAL_DATE_TYPE;
    v_Result_Date       DATE;
    v_Datetext          VARCHAR2(200);
    v_Datetext_len      NUMBER;
    v_Datetext_tmp      VARCHAR2(200);
    v_Is_Reversedate    BOOLEAN := FALSE;
    v_Is_Must_be_past   BOOLEAN := FALSE;
    v_Is_Must_be_future BOOLEAN := FALSE;
    v_century           NUMBER := TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE, 'YYYY'), 1, 2));
    v_century_factor    NUMBER := 0; -- can be 0, -1 or +1
    v_sys_YYYYMM        NUMBER := TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMM'));
    v_sys_YYYY          NUMBER := TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'));
    v_Datetext_YYYYMM   NUMBER;
    v_Datetext_YYYY     NUMBER;
    v_YY_tmp            VARCHAR2(2);
    v_YYYY_tmp          VARCHAR2(4);
    v_MM_tmp            VARCHAR2(2);
    v_YYYYMM_tmp        VARCHAR2(6);
    --
  BEGIN
    
    v_Datetext := UPPER(TRIM(p_DATETEXT));
    v_Datetext_len := NVL(LENGTH(v_Datetext), 0);
    v_Is_Reversedate := p_REVERSEDATE <> 0;
    v_Is_Must_be_past := p_MUST_BE_PAST <> 0;
    v_Is_Must_be_future := p_MUST_BE_FUTURE <> 0;
    
    DBMS_OUTPUT.PUT_LINE('v_Datetext:' || v_Datetext);
    DBMS_OUTPUT.PUT_LINE('v_Datetext_len:' || v_Datetext_len);
    DBMS_OUTPUT.PUT_LINE('v_Is_Reversedate:' || p_REVERSEDATE);
  
    -- return if null or not of expected length
    IF 
        v_Datetext IS NULL 
        OR (v_Datetext_len <> 6 AND v_Datetext_len <> 10)
    THEN
        RETURN v_Result;
        DBMS_OUTPUT.PUT_LINE('NULL_OR_BAD_LENGTH');
    END IF;
    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('STEP_1');
        -- 1: valid date processing
        
        IF 
            INSTR(v_Datetext, 'X') > 0 
            OR INSTR(v_Datetext, '<') > 0
        THEN
            -- dont send to Parse_Date. It will replace the char. Raise here.
            RAISE_APPLICATION_ERROR(-20010, 'Partial Date');
        END IF;
        
        v_Result_Date   := Parse_Date
                            (p_DATETEXT       => v_Datetext
                            ,p_MUST_BE_PAST   => p_MUST_BE_PAST
                            ,p_MUST_BE_FUTURE => p_MUST_BE_FUTURE
                            ,p_YEARLIMIT      => p_YEARLIMIT
                            ,p_REVERSEDATE    => p_REVERSEDATE
                            --
                            );
        
        IF v_Result_Date IS NOT NULL THEN
            v_Result := CT_PARTIAL_DATE_TYPE(EXTRACT(DAY FROM v_Result_Date), EXTRACT(MONTH FROM v_Result_Date), EXTRACT(YEAR FROM v_Result_Date));
        ELSE
            -- Raise if null date received from Parse_Date
            RAISE_APPLICATION_ERROR(-20020, 'Invalid or NULL Date');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('STEP_2');
            BEGIN
                -- 2: Partial date processing
                --
                -- 2.1: RRMMDD or DDMMRR (convert to DDMMYYYY for 2.2.1)
                IF v_Datetext_len = 6 THEN
                    IF (v_Is_Reversedate) THEN
                        -- RRMMDD
                        --
                        -- if year is not complete, raise.
                        v_YY_tmp := SUBSTR(v_Datetext, 1, 2);
                        IF INSTR(v_YY_tmp, 'X') > 0 OR INSTR(v_YY_tmp, '<') > 0 THEN
                            DBMS_OUTPUT.PUT_LINE('Partial Year Not Allowed');
                            RAISE_APPLICATION_ERROR(-20040, 'Partial Year Not Allowed');
                        END IF;
                        --
                        -- check for past/future date, if possible
                        v_MM_tmp := SUBSTR(v_Datetext, 3, 2);
                        IF INSTR(v_MM_tmp, 'X') = 0 AND INSTR(v_MM_tmp, '<') = 0 THEN
                            -- can use month and year
                            v_YYYYMM_tmp := (v_century + v_century_factor) || v_YY_tmp || v_MM_tmp;
                            DBMS_OUTPUT.PUT_LINE('v_YYYYMM_tmp: ' || v_YYYYMM_tmp);
                            v_Datetext_YYYYMM := TO_NUMBER(v_YYYYMM_tmp);
                            IF (v_Is_Must_be_past) THEN
                                -- reduce century by factor 1 if generated date (YYYYMM) is more than sysdate (YYYYMM)
                                IF v_Datetext_YYYYMM > v_sys_YYYYMM THEN
                                    v_century_factor := -1;
                                END IF;
                            ELSIF (v_Is_Must_be_future) THEN
                                -- increase century by factor 1 if generated date (YYYYMM) is less than sysdate (YYYYMM)
                                IF v_Datetext_YYYYMM < v_sys_YYYYMM THEN
                                    v_century_factor := +1;
                                END IF;
                            END IF;
                        ELSE
                            -- use only year
                            v_YYYY_tmp := (v_century + v_century_factor) || v_YY_tmp;
                            DBMS_OUTPUT.PUT_LINE('v_YYYY_tmp: ' || v_YYYY_tmp);
                            v_Datetext_YYYY := TO_NUMBER(v_YYYY_tmp);
                            IF (v_Is_Must_be_past) THEN
                                -- reduce century by factor 1 if generated date (YYYY) is more than sysdate (YYYY)
                                IF v_Datetext_YYYY > v_sys_YYYY THEN
                                    v_century_factor := -1;
                                END IF;
                            ELSIF (v_Is_Must_be_future) THEN
                                -- increase century by factor 1 if generated date (YYYY) is more than sysdate (YYYY)
                                IF v_Datetext_YYYY < v_sys_YYYY THEN
                                    v_century_factor := +1;
                                END IF;
                            END IF;
                        END IF;
                        --
                        v_Datetext_tmp := SUBSTR(v_Datetext, 5, 2) || SUBSTR(v_Datetext, 3, 2) || (v_century + v_century_factor) || SUBSTR(v_Datetext, 1, 2);
                    ELSE
                        -- DDMMRR
                        --
                        -- if year is not complete, raise.
                        v_YY_tmp := SUBSTR(v_Datetext, 5, 2);
                        IF INSTR(v_YY_tmp, 'X') > 0 OR INSTR(v_YY_tmp, '<') > 0 THEN
                            RAISE_APPLICATION_ERROR(-20050, 'Partial Year Not Allowed');
                        END IF;
                        --
                        -- check for past/future date, if possible
                        v_MM_tmp := SUBSTR(v_Datetext, 3, 2);
                        IF INSTR(v_MM_tmp, 'X') = 0 AND INSTR(v_MM_tmp, '<') = 0 THEN
                            -- can use month and year
                            v_YYYYMM_tmp := (v_century + v_century_factor) || v_YY_tmp || v_MM_tmp;
                            DBMS_OUTPUT.PUT_LINE('v_YYYYMM_tmp: ' || v_YYYYMM_tmp);
                            v_Datetext_YYYYMM := TO_NUMBER(v_YYYYMM_tmp);
                            IF (v_Is_Must_be_past) THEN
                                -- reduce century by factor 1 if generated date (YYYYMM) is more than sysdate (YYYYMM)
                                IF v_Datetext_YYYYMM > v_sys_YYYYMM THEN
                                    v_century_factor := -1;
                                END IF;
                            ELSIF (v_Is_Must_be_future) THEN
                                -- increase century by factor 1 if generated date (YYYYMM) is less than sysdate (YYYYMM)
                                IF v_Datetext_YYYYMM < v_sys_YYYYMM THEN
                                    v_century_factor := +1;
                                END IF;
                            END IF;
                        ELSE
                            -- use only year
                            v_YYYY_tmp := (v_century + v_century_factor) || v_YY_tmp;
                            DBMS_OUTPUT.PUT_LINE('v_YYYY_tmp: ' || v_YYYY_tmp);
                            v_Datetext_YYYY := TO_NUMBER(v_YYYY_tmp);
                            IF (v_Is_Must_be_past) THEN
                                -- reduce century by factor 1 if generated date (YYYY) is more than sysdate (YYYY)
                                IF v_Datetext_YYYY > v_sys_YYYY THEN
                                    v_century_factor := -1;
                                END IF;
                            ELSIF (v_Is_Must_be_future) THEN
                                -- increase century by factor 1 if generated date (YYYY) is more than sysdate (YYYY)
                                IF v_Datetext_YYYY < v_sys_YYYY THEN
                                    v_century_factor := +1;
                                END IF;
                            END IF;
                        END IF;
                        --
                        v_Datetext_tmp := SUBSTR(v_Datetext, 1, 2) || SUBSTR(v_Datetext, 3, 2) || (v_century + v_century_factor) || SUBSTR(v_Datetext, 5, 2);
                    END IF;
                -- 2.2: DD/MM/YYYY
                ELSIF v_Datetext_len = 10 THEN
                    v_Datetext_tmp := v_Datetext;
                END IF;
                
                DBMS_OUTPUT.PUT_LINE('v_Datetext_tmp 2.1:' || v_Datetext_tmp);
                
                -- remove slash, if present
                v_Datetext_tmp := REGEXP_REPLACE(v_Datetext_tmp ,'\/', '');
                
                -- formatted to DDMMYYYY for all
                
                -- if year is not complete, raise.
                v_YYYY_tmp := SUBSTR(v_Datetext_tmp, 5, 4);
                IF INSTR(v_YYYY_tmp, 'X') > 0 OR INSTR(v_YYYY_tmp, '<') > 0 THEN
                    RAISE_APPLICATION_ERROR(-20060, 'Partial Year Not Allowed');
                END IF;
                
                -- replace << and XX with 00 and remove non-digits
                v_Datetext_tmp := REGEXP_REPLACE(REGEXP_REPLACE(v_Datetext_tmp,'(<<)|(XX)', '00') ,'[^[:digit:]]+', '');
                
                DBMS_OUTPUT.PUT_LINE('v_Datetext_tmp:' || v_Datetext_tmp);
                
                -- 2.2.1: DD/MM/YYYY (converted to DDMMYYYY)
                v_Result := CT_PARTIAL_DATE_TYPE( TO_NUMBER(SUBSTR(v_Datetext_tmp, 1, 2), '00'), TO_NUMBER(SUBSTR(v_Datetext_tmp, 3, 2), '00'), TO_NUMBER(SUBSTR(v_Datetext_tmp, 5, 4), '0000'));
            
            EXCEPTION
                WHEN OTHERS THEN
                    IF (NVL(p_Prevent_EXCE, 0) != 0) THEN
                        NULL;
                    ELSE
                        RAISE;
                    END IF;
            END;
    END;
    
    RETURN v_Result;
    
  EXCEPTION
    WHEN OTHERS THEN
      IF (NVL(p_Prevent_EXCE, 0) != 0) THEN
        RETURN v_Result;
      ELSE
        RAISE;
      END IF;
      --
  END Get_Partial_Date;
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
      Check_OBJECT_DEPENDENCE();
      --
      --
      null;
      --
      --
      g_PACKAGE_Initialized  := true;
      g_PACKAGE_Initializing := false;
      --
    end if;
    --
    -- For example, below are calls into functions they itself calls me
    --
    null;
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
function get_module_version(p_modulename in varchar2) return varchar2 as
    l_version varchar2(200);
  begin
    select pkg_common.get_parameter('APP_VERSION_' || upper(trim(p_modulename))) into l_version from dual;
    return l_version;
  end get_module_version;

function get_release_version return varchar2 as
    l_version varchar2(200);
  begin
    select pkg_common.get_parameter('RELEASE_VERSION') into l_version from dual;
    return l_version;
  end get_release_version;

procedure print_loginversion_html(p_modulename in varchar2) as
  begin
    for c_row in (select pkg_common.get_module_version(p_modulename) module_version, pkg_common.get_release_version() release_version from dual) loop
        htp.prn(replace(replace(get_parameter('TMPL_LOGINVERSION'), '#RELEASE_VERSION#', replace(c_row.release_version, '<', '&lt;')), '#MODULE_VERSION#', replace(c_row.module_version, '<', '&lt;')));
        exit;
    end loop;
  end print_loginversion_html;

function tolerant_to_date(p_datetext in varchar2
                           ,p_format   in varchar2
                      --
                      ) return date as
  begin
    return to_date(p_datetext, p_format);
  exception when others then
    return null;
  end tolerant_to_date;

  /*******************************************************************************
   * Author    Date        Description
   * --------  ----------  -------------------------------------------------------*
   * CHageman  06.07.2018  Added
   *******************************************************************************/
  /**
   * Returns the value of form no from table ENTRY_FORMS by the give PK (key_value)
   *
   * @param i_key_value PK of table ENTRY_FORMS
   * @return entry_forms.form_no Number of form (e.g. TM6 number)
   */
  FUNCTION get_entry_form_no_by_pk (i_key_value IN entry_forms.key_value%TYPE)
  RETURN entry_forms.form_no%TYPE
  IS

    l_scope logger_logs.scope%type := c_scope_prefix || 'get_entry_form_no_by_pk';
    l_params logger.tab_param;
    --
    l_result entry_forms.form_no%TYPE;

  BEGIN

    logger.append_param(l_params, 'i_key_value', i_key_value);
    logger.log('GET ENTRY FORM NO BY PK: start', l_scope, null, l_params);

    IF i_key_value IS NOT NULL
    THEN

      SELECT form_no
        INTO l_result
        FROM entry_forms
      WHERE key_value = i_key_value;

    END IF;

    logger.append_param(l_params, 'l_result', l_result);
    logger.log('GET ENTRY FORM NO BY PK: done', l_scope, null, l_params);

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS
    THEN
      logger.log_error('GET ENTRY FORM NO BY PK: unhandled exeption', l_scope, null, l_params);
      RAISE;
  END get_entry_form_no_by_pk;

begin
  --
  Init_PACKAGE();
  --
end PKG_COMMON;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_COMMON" TO PUBLIC;
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_COMMON" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_COMMON" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_COMMON" TO "BIOSUPPORT";
