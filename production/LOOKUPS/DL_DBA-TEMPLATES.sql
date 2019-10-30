
REM INSERTING into DL_DBA.TEMPLATES
SET DEFINE OFF;
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('73E2DA692D0D1BB7E0530101007FACB5','en_US','Lookup control file',26,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.675115000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\[schemaname].[objectname]-control.sql',TO_CLOB('--*** Sequences ***
@@DataObjects/Sequence/"[schemaname]"."[objectname]"$SEQ00.sql
--*** Tables ***
@@DataObjects/Table/"[schemaname]"."[objectname]".sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$HIS.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$I18N.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$I18N$HIS.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$TAG.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$TAG$HIS.sql
--*** References ***
@@DataObjects/ForeignKey/')
|| TO_CLOB('"[schemaname]"."[objectname]"-ref.sql
@@DataObjects/ForeignKey/"[schemaname]"."[objectname]"$I18N-ref.sql
@@DataObjects/ForeignKey/"[schemaname]"."[objectname]"$TAG-ref.sql
--*** Views ***
@@DataObjects/View/"[schemaname]"."[objectname]"#I18N.sql
@@DataObjects/View/"[schemaname]"."[objectname]"$LC.sql
@@DataObjects/View/"[schemaname]"."[objectname]"#TAG.sql
--*** Triggers ***
@@Code/Trigger/"[schemaname]"."[objectname]"$TIUD0.sql
@@Code/Trigger/"[schemaname]"."[objectname]"$I18N$TIUD0.sql
@@Code')
|| TO_CLOB('/Trigger/"[schemaname]"."[objectname]"$TAG$TIUD0.sql
--*** Indexes ***
@@DataObjects/Table/"[schemaname]"."[objectname]"-idx.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$HIS-idx.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$I18N-idx.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$I18N$HIS-idx.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$TAG-idx.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$TAG$HIS-idx.sql
--*** Data-Loads ***
@@DataObjects/Table/"[schemana')
|| TO_CLOB('me]"."[objectname]"-load.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$I18N-load.sql
@@DataObjects/Table/"[schemaname]"."[objectname]"$TAG-load.sql'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC45063E0530101007FFBE7','en_US','Lookup table I18N indexes',19,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.617270000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$I18N-idx.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    29.11.2017  Tablespace clause added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
create index "[schem')
|| TO_CLOB('aname]"."[objectname]"$I18N$IX02 on "[schemaname]"."[objectname]"$I18N(DISPLAY_VALUE)
--
tablespace "[tablespace-idx]";
--
--
create index "[schemaname]"."[objectname]"$I18N$IX03 on "[schemaname]"."[objectname]"$I18N(OWNER)
--
tablespace "[tablespace-idx]";
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC55063E0530101007FFBE7','en_US','Lookup table I18N history indexes',20,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.624599000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$I18N$HIS-idx.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    29.11.2017  Tablespace clause added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
create index "[schem')
|| TO_CLOB('aname]"."[objectname]"$I18N$HIS$IX00 on "[schemaname]"."[objectname]"$I18N$HIS(KEY_VALUE
                                                                                                  ,LOCALE
                                                                                                  ,DML_AT)
--
tablespace "[tablespace-idx]";
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC75063E0530101007FFBE7','en_US','Lookup table TAGs history indexes',22,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.639813000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$TAG$HIS-idx.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    05.04.2018  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
create index "[schemaname]"."[objectname]"$TAG$HIS$IX00 on "[scheman')
|| TO_CLOB('ame]"."[objectname]"$TAG$HIS(KEY_VALUE
                                                                                                ,OWNER
                                                                                                ,TAG
                                                                                                ,DML_AT)
--
tablespace "[tablespace-idx]";
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC65063E0530101007FFBE7','en_US','Lookup table TAGs indexes',21,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.632207000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$TAG-idx.sql','--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    05.04.2018  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
--
--
--',1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CCB5063E0530101007FFBE7','en_US','DB-User',1,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.368049000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','DB_USER:Source\DataObjects\User\[USER_NAME].sql',TO_CLOB('--
--
select sysdate
  from dual;
--
--
set serveroutput on;
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
*
*/
--
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* WWirns    13.08.2018  Added
****************************************************************************')
|| TO_CLOB('***/
--
--
declare
  C_USERNAME       constant varchar2(30 char) := upper(nvl(DL_DBA.PKG_MODULE_INSTALL.Get_CURR_INST_ARG(''"[MODULE_NAME]"''
                                                                                                      ,''V_MOD_THIS_0_UN''
                                                                                                      ,true)
                                                          ,''"[expr]"''));
  C_PASSWORD       constant varchar2(30 char) := nvl(DL_D')
|| TO_CLOB('BA.PKG_MODULE_INSTALL.Get_CURR_INST_ARG(''"[MODULE_NAME]"''
                                                                                                ,''V_MOD_THIS_0_PW''
                                                                                                ,true)
                                                    ,''"[expr]"'');
  C_DEF_TAPLESPACE constant varchar2(30 char) := upper(nvl(DL_DBA.PKG_MODULE_INSTALL.Get_CURR_INST_ARG(''"[MODULE_NAME]"''
                                     ')
|| TO_CLOB('                                                                 ,''C_MOD_THIS_0_DEFAULT_TBLSPC''
                                                                                                      ,true)
                                                          ,''"[expr]"''));
begin
  --
  -- Create the user
  for R0 in (select *
               from dual
              where not exists (select null
                       from all_users
                      where username = C_USERNAME))
  loop
  ')
|| TO_CLOB('  begin
      if (C_PASSWORD is null)
      then
        Raise_application_error(-20000
                               ,''No password "***" (arg. 1 of this script) for the creation of user "'' || C_USERNAME || ''" delivered!'');
      end if;
      execute immediate ''create user '' || C_USERNAME || '' identified by "'' || C_PASSWORD || ''" account unlock'';
    exception
      when others then
        if (sqlcode != -01920)
        then
          raise;
        end if;
    end;
    exit;
  end loop;
  --')
|| TO_CLOB('
  -- Set default tablespace settings of the user
  for R0 in (select 1
               from DUAL
              where not exists (select null
                       from DBA_TABLESPACES
                      where TABLESPACE_NAME = C_DEF_TAPLESPACE))
  loop
    Raise_application_error(-20000
                           ,''The tablespace "'' || C_DEF_TAPLESPACE || ''" does not exists!'');
  end loop;
  execute immediate ''alter user '' || C_USERNAME || '' default tablespace '' || C_DEF_TAPLESPACE;
  execut')
|| TO_CLOB('e immediate ''alter user '' || C_USERNAME || '' quota unlimited on '' || C_DEF_TAPLESPACE;
  --
  begin
    execute immediate ''alter user '' || C_USERNAME || '' quota unlimited on '' || C_DEF_TAPLESPACE || ''_IDX'';
  exception
    when others then
      if (sqlcode != -00959)
      then
        raise;
      end if;
  end;
  begin
    execute immediate ''alter user '' || C_USERNAME || '' quota unlimited on '' || C_DEF_TAPLESPACE || ''_LOB'';
  exception
    when others then
      if (sqlcode != -00959)
      t')
|| TO_CLOB('hen
        raise;
      end if;
  end;
  --
  -- Grant inherit privileges
  /*
  case SYS_CONTEXT(''USERENV''
              ,''SESSION_USER'')
    when ''SYS'' then
      execute immediate ''grant inherit privileges on user sys to '' || C_USERNAME;
      execute immediate ''grant inherit privileges on user system to '' || C_USERNAME;
    when ''SYSTEM'' then
      execute immediate ''grant inherit privileges on user system to '' || C_USERNAME;
    else
      null;
  end case;
  */
  --
  -- Grant roles
  --e')
|| TO_CLOB('xecute immediate ''grant connect to '' || C_USERNAME;
  --execute immediate ''grant resource to '' || C_USERNAME;
  --
  -- Grant system privileges 
  --execute immediate ''grant create procedure to '' || C_USERNAME;
  --execute immediate ''grant create sequence to '' || C_USERNAME;
  --
end;
/
--
commit;
--
--
set serveroutput off;
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC85063E0530101007FFBE7','en_US','Lookup table loads',23,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.648591000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]-load.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    02.01.2018  Delete statement added
* WWirns    16.04.2018  Add column OWNER
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************')
|| TO_CLOB('************/
--
--
/*
--
select STMT
  from (
        --
        select case
                   when (mod(rownum
                            ,1000) = 1) then
                    ''  select''
                   else
                    ''  union all select''
                 end
                --
                --
                 || '' unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.KEY_VALUE)) || '''''')''
                --
                 || case
                   when (mod(rownum
       ')
|| TO_CLOB('                     ,1000) = 1) then
                    '' as KEY_VALUE''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.LOCALE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as LOCALE''
                   else
                    ''''
                 e')
|| TO_CLOB('nd
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.DISPLAY_VALUE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as DISPLAY_VALUE''
                   else
                    ''''
                 end
                --
                --
                 || '', '' || nvl(trim(t1.DISPLAY_ORDER)
                             ')
|| TO_CLOB('  ,''null'')
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as DISPLAY_ORDER''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.IS_ACTIVE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1')
|| TO_CLOB(') then
                    '' as IS_ACTIVE''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.NOTICE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as NOTICE''
                   else
                    ''''
                 end
                --
         ')
|| TO_CLOB('       --
                 || '', '' || nvl(trim(t1.NUM_VALUE)
                               ,''null'')
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as NUM_VALUE''
                   else
                    ''''
                 end
                --
                --
                 || '', '' || nvl(trim(t1.ROW_FLAG_MASK)
                               ,''null'')
                --
                 |')
|| TO_CLOB('| case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as ROW_FLAG_MASK''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.OWNER)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as OWNER''
             ')
|| TO_CLOB('      else
                    ''''
                 end
                -- LOOP-n:
                --
                --
                -- IF:Number
                 || '', '' || nvl(trim(t1."[columnname-n]")
                               ,''null'')
                -- ELSIF:Date
                 || '', to_date('''''' || to_char(t1."[columnname-n]"
                                             ,''YYYYMMDD'') || '''''', ''''YYYYMMDD'''')''
                -- ELSIF:Varchar
                 || '', unistr('''''' || asciis')
|| TO_CLOB('tr(DL_COMMON.PKG_UTIL.Escape4SQL(t1."[columnname-n]")) || '''''')''
                -- ELSE:
                 || '', ??? t1."[columnname-n]" ???''
                -- END IF:
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as "[columnname-n]"''
                   else
                    ''''
                 end
                -- END LOOP:
                --
                --
                 || '' from du')
|| TO_CLOB('al'' as STMT
               ,rownum as ROW_NUM
          from (
                 --
                 select t.*
                   from "[schemaname]"."[objectname]" t
                  order by t.KEY_VALUE
                           ,t.LOCALE
                 --
                 ) t1
        --
        )
 where ROW_NUM between 1 and 1000
--
;
--
*/
--
--
--
-- *** Part 01 **********************************************************************************************
--
--
delete from "[schemaname')
|| TO_CLOB(']"."[objectname]" dest
 where bitand(dest.ROW_FLAG_MASK
             ,1) = 1
   and not exists (select null
          from (
               --
                 -- NoFormat Start
                 --
                 select 
                 --
                 -- NoFormat End
               --
               ) src
         where src.KEY_VALUE = dest.KEY_VALUE);
--
--
merge into "[schemaname]"."[objectname]" dest
using (
--
  -- NoFormat Start
  --
  select 
  --
  -- NoFormat End
--
) src
on (src')
|| TO_CLOB('.KEY_VALUE = dest.KEY_VALUE)
when matched then
  update
     set dest.LOCALE        = src.LOCALE
        ,dest.DISPLAY_VALUE = src.DISPLAY_VALUE
        ,dest.DISPLAY_ORDER = src.DISPLAY_ORDER
         --,dest.IS_ACTIVE = case when (bitand(dest.ROW_FLAG_MASK,1) = 1) then src.IS_ACTIVE else dest.IS_ACTIVE end
        ,dest.NOTICE        = src.NOTICE
        ,dest.NUM_VALUE     = src.NUM_VALUE
        ,dest.ROW_FLAG_MASK = src.ROW_FLAG_MASK
        ,dest.OWNER         = src.OWNER
         -- LOOP-')
|| TO_CLOB('n:
        ,dest."[columnname-n]" = src."[columnname-n]"
  -- END LOOP:
   where 1 = 1
     and (
         --
          DL_COMMON.PKG_UTIL.Is_Equal_(dest.LOCALE
                                      ,src.LOCALE) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.DISPLAY_VALUE
                                         ,src.DISPLAY_VALUE) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.DISPLAY_ORDER
                                         ,src.DISPLAY_ORDER) = 0
        ')
|| TO_CLOB(' --
         --or DL_COMMON.PKG_UTIL.Is_Equal_(dest.IS_ACTIVE,src.IS_ACTIVE) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.NOTICE
                                         ,src.NOTICE) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.NUM_VALUE
                                         ,src.NUM_VALUE) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.ROW_FLAG_MASK
                                         ,src.ROW_FLAG_MASK) = 0
         --
          or DL')
|| TO_CLOB('_COMMON.PKG_UTIL.Is_Equal_(dest.OWNER
                                         ,src.OWNER) = 0
         -- LOOP-n:
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest."[columnname-n]"
                                          ,src."[columnname-n]") = 0
         -- END LOOP:
         --
         )
when not matched then
  insert
    (KEY_VALUE
    ,LOCALE
    ,DISPLAY_VALUE
    ,DISPLAY_ORDER
    ,NOTICE
    ,NUM_VALUE
    ,ROW_FLAG_MASK
    ,OWNER
     -- LOOP-n:
    ,"[columnname-n]"
    ')
|| TO_CLOB(' -- END LOOP:
     --
     )
  values
    (src.KEY_VALUE
    ,src.LOCALE
    ,src.DISPLAY_VALUE
    ,src.DISPLAY_ORDER
    ,src.NOTICE
    ,src.NUM_VALUE
    ,src.ROW_FLAG_MASK
    ,src.OWNER
     -- LOOP-n:
    ,src."[columnname-n]"
     -- END LOOP:
     --
     );
--
commit;
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CCC5063E0530101007FFBE7','en_US','DB-User post',2,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.445787000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','DB_USER:Source\DataObjects\User\[USER_NAME]-post.sql',TO_CLOB('--
--
select sysdate
  from dual;
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
*
*/
--
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* WWirns    13.08.2018  Added
*******************************************************************************/
--
--
declare
  C_USER')
|| TO_CLOB('NAME constant varchar2(30 char) := upper(nvl(DL_DBA.PKG_MODULE_INSTALL.Get_CURR_INST_ARG(''"[MODULE_NAME]"''
                                                                                                ,''V_MOD_THIS_0_UN''
                                                                                                ,true)
                                                    ,''"[expr]"''));
begin
  DL_COMMON.INST_DB_OBJ4LOGGER(p_TO_SCHEMA => C_USERNAME
                               --
           ')
|| TO_CLOB('                    );
end;
/
--
commit;
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CB25063E0530101007FFBE7','en_US','Lookup sequence',1,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.464073000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Sequence\[schemaname].[objectname]$SEQ00.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    04.10.2017  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
create sequence "[schemaname]"."[objectname]"$SEQ00 minvalue 1 maxvalue')
|| TO_CLOB(' 999999999999999999999999999 start
  with 1 increment by 1 cache 20;
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CB95063E0530101007FFBE7','en_US','Lookup table FK',8,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.523141000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\ForeignKey\[schemaname].[objectname]-ref.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    13.03.2018  Move grants to GRANT/XX.sql
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
alter table "[sc')
|| TO_CLOB('hemaname]"."[objectname]" add constraint "[objectname]"$FK00 foreign key(OWNER) references DL_COMMON.OWNERS(KEY_VALUE);
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CBE5063E0530101007FFBE7','en_US','Lookup table TAGs view',13,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.560695000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\View\[schemaname].[objectname]#TAG.sql',TO_CLOB('--
--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    05.04.2018  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST
*******************************************************************************/
--
--')
|| TO_CLOB('
create or replace force view "[schemaname]"."[objectname]"#TAG as
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY_USER
        ,t1.INS_BY_HOST
        ,t1.DML_AT
        ,t1.DML_BY_USER
        ,t1.DML_BY_HOST
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t1.OWNER
        ,t2.TAG
        ,t2.NOTICE        as NOTICE$TAG
        ,t2.INS_AT    ')
|| TO_CLOB('    as INS_AT$TAG
        ,t2.INS_BY_USER   as INS_BY_USER$TAG
        ,t2.INS_BY_HOST   as INS_BY_HOST$TAG
        ,t2.DML_AT        as DML_AT$TAG
        ,t2.DML_BY_USER   as DML_BY_USER$TAG
        ,t2.DML_BY_HOST   as DML_BY_HOST$TAG
        ,t2.DML_TYPE      as DML_TYPE$TAG
        ,t2.ROW_FLAG_MASK as ROW_FLAG_MASK$TAG
        ,t2.OWNER         as OWNER$TAG
        ,t1.rowid         as "[objectname]"$RI
         ,t2.rowid         as "[objectname]"$TAG$RI
    from "[schemaname]"."[objectnam')
|| TO_CLOB('e]" t1
    left join "[schemaname]"."[objectname]"$TAG t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
--
--
--'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC25063E0530101007FFBE7','en_US','Lookup table indexes',17,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.602964000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]-idx.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    29.11.2017  Tablespace clause added
* WWirns    10.04.2018  Add column OWNER
* WWirns    13.08.2018  Refactor with usage of more placeholders
******************************************************************')
|| TO_CLOB('*************/
--
--
create index "[schemaname]"."[objectname]"$IX00 on "[schemaname]"."[objectname]"(DISPLAY_VALUE
                                                                                ,DISPLAY_ORDER)
--
tablespace "[tablespace-idx]";
--
--
create index "[schemaname]"."[objectname]"$IX01 on "[schemaname]"."[objectname]"(OWNER)
--
tablespace "[tablespace-idx]";
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CBA5063E0530101007FFBE7','en_US','Lookup table I18N FK',9,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.530349000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\ForeignKey\[schemaname].[objectname]$I18N-ref.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
alter table "[schemaname]"."[objectname]"$I18N add constraint "[obje')
|| TO_CLOB('ctname]"$I18N$FK00 foreign key(KEY_VALUE) references "[schemaname]"."[objectname]"(KEY_VALUE) on delete cascade;
--
alter table "[schemaname]"."[objectname]"$I18N add constraint "[objectname]"$I18N$FK01 foreign key(LOCALE) references DL_COMMON.LOCALES(KEY_VALUE);
--
--
alter table "[schemaname]"."[objectname]"$I18N add constraint "[objectname]"$I18N$FK02 foreign key(OWNER) references DL_COMMON.OWNERS(KEY_VALUE);
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CBB5063E0530101007FFBE7','en_US','Lookup table TAGs FK',10,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.537544000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\ForeignKey\[schemaname].[objectname]$TAG-ref.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    05.04.2018  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
alter table "[schemaname]"."[objectname]"$TAG add constraint "[objec')
|| TO_CLOB('tname]"$TAG$FK00 foreign key(KEY_VALUE) references "[schemaname]"."[objectname]"(KEY_VALUE) on delete cascade;
--
alter table "[schemaname]"."[objectname]"$TAG add constraint "[objectname]"$TAG$FK01 foreign key(OWNER) references DL_COMMON.OWNERS(KEY_VALUE);
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CCD5063E0530101007FFBE7','en_US','DB-User post install',3,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.455213000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','DB_USER:Source\DataObjects\User\[USER_NAME]-post-install.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
set serveroutput on;
--
--
/*******************************************************************************
* ???
*
*
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    13.08.2018  Added (Requires module "DermalogOraDbCommon"!)
*******************************************************************************/
--
--
begin
  if (DL_DBA.PKG_DDL_UTIL.Is_Parallel_Execution())
  then
    ex')
|| TO_CLOB('ecute immediate ''alter SESSION FORCE PARALLEL DDL PARALLEL'';
    execute immediate ''alter SESSION FORCE PARALLEL DML PARALLEL'';
    execute immediate ''alter SESSION FORCE PARALLEL QUERY PARALLEL'';
  end if;
end;
/
--
commit;
--
--
declare
  C_USERNAME           constant varchar2(30 char) := upper(nvl(DL_DBA.PKG_MODULE_INSTALL.Get_CURR_INST_ARG(''"[MODULE_NAME]"''
                                                                                                          ,''V_MOD_THIS_0_UN''
           ')
|| TO_CLOB('                                                                                               ,true)
                                                              ,''"[expr]"''));
  C_DEF_TAPLESPACE     constant varchar2(30 char) := upper(nvl(DL_DBA.PKG_MODULE_INSTALL.Get_CURR_INST_ARG(''"[MODULE_NAME]"''
                                                                                                          ,''C_MOD_THIS_0_DEFAULT_TBLSPC''
                                                           ')
|| TO_CLOB('                                               ,true)
                                                              ,''"[expr]"''));
  C_DEF_TAPLESPACE4IDX constant varchar2(30 char) := C_DEF_TAPLESPACE || ''_IDX'';
  C_DEF_TAPLESPACE4LOB constant varchar2(30 char) := C_DEF_TAPLESPACE || ''_LOB'';
begin
  --
  -- Ensure CHAR semantic
  --
  DL_DBA.PKG_DDL_UTIL.Ensure_Char_Semantic$AT(p_TBLS_OF_OWNER => DL_COMMON.OT_DB_OWNER(C_USERNAME)
                                             ,p_ONLY_TBLS     => D')
|| TO_CLOB('L_COMMON.VT_DB_OBJECT(DL_COMMON.OT_DB_OBJECT(''$$$DOES_NOT_EXISTS$$$'')
                                                                                        --
                                                                                        )
                                              --,p_ONLY_TAB_COLS in DL_COMMON.VT_DB_TAB_COL default null
                                              --,p_EXCL_TBLS     in DL_COMMON.VT_DB_OBJECT default null
                                        ')
|| TO_CLOB('      --,p_EXCL_TAB_COLS in DL_COMMON.VT_DB_TAB_COL default null
                                              --,p_CHAR_SEMANTIC in varchar2 default ''C''
                                              --
                                              );
  --
  -- Move tables into tablespace
  --
  DL_DBA.PKG_DDL_UTIL.Move_Table2TBLSPC$AT(p_TBLSPC        => DL_COMMON.OT_DB_TBLSPC(C_DEF_TAPLESPACE)
                                          ,p_TBLS_OF_OWNER => DL_COMMON.OT_DB_OWNER(C_USERNAME)
      ')
|| TO_CLOB('                                     --
                                           );
  --
  -- Move lobs into tablespace
  --
  DL_DBA.PKG_DDL_UTIL.Move_LOB2TBLSPC$AT(p_TBLSPC        => DL_COMMON.OT_DB_TBLSPC(C_DEF_TAPLESPACE4LOB)
                                        ,p_TBLS_OF_OWNER => DL_COMMON.OT_DB_OWNER(C_USERNAME)
                                         --
                                         );
  --
  -- Move indexes into tablespace
  --
  DL_DBA.PKG_DDL_UTIL.Move_Index2TBLSPC$AT')
|| TO_CLOB('(p_TBLSPC        => DL_COMMON.OT_DB_TBLSPC(C_DEF_TAPLESPACE4IDX)
                                          ,p_IDXS_OF_OWNER => DL_COMMON.OT_DB_OWNER(C_USERNAME)
                                           --
                                           );
  --
  -- Rebuild indexes
  --
  DL_DBA.PKG_DDL_UTIL.Rebuild_Indexes$AT(p_IDXS_OF_OWNER => DL_COMMON.OT_DB_OWNER(C_USERNAME)
                                         --
                                         );
  --
  -- Recompile
  --
  DL_DBA.')
|| TO_CLOB('PKG_DDL_UTIL.Recompile(p_SCHEMA              => DL_COMMON.OT_DB_OWNER(C_USERNAME)
                               ,p_IS_DEPENDED_SCHEMAS => 0
                                --
                                );
  --
end;
/
--
commit;
--
--
set serveroutput off;
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CCA5063E0530101007FFBE7','en_US','Lookup table TAGs loads',25,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.667122000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$TAG-load.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    05.04.2018  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
/*
--
select STMT
  from (
        --
        select case
          ')
|| TO_CLOB('         when (mod(rownum
                            ,1000) = 1) then
                    ''  select''
                   else
                    ''  union all select''
                 end
                --
                --
                 || '' unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.KEY_VALUE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as KEY_VALUE''
              ')
|| TO_CLOB('     else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.OWNER)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as OWNER''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_')
|| TO_CLOB('COMMON.PKG_UTIL.Escape4SQL(t1.TAG)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as TAG''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.NOTICE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                 ')
|| TO_CLOB('           ,1000) = 1) then
                    '' as NOTICE''
                   else
                    ''''
                 end
                --
                --
                 || '', '' || nvl(trim(t1.ROW_FLAG_MASK)
                               ,''null'')
                --
                 || case
                   when (rownum = 1) then
                    '' as ROW_FLAG_MASK''
                   else
                    ''''
                 end
                -- LOOP-n:
                -')
|| TO_CLOB('-
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1."[columnname-n]")) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as "[columnname-n]"''
                   else
                    ''''
                 end
                -- END LOOP:
                --
                --
                 || '' from dual'' as STMT
               ,rownum as RO')
|| TO_CLOB('W_NUM
          from (
                 --
                 select t.*
                   from "[schemaname]"."[objectname]"$TAG t
                  order by t.KEY_VALUE
                           ,t.OWNER
                           ,t.TAG
                 --
                 ) t1
        --
        )
 where ROW_NUM between 1 and 1000
--
;
--
*/
--
--
--
-- *** Part 01 **********************************************************************************************
--
--
-- !!! "delete from "[schem')
|| TO_CLOB('aname]"."[objectname]"$TAG" is not needed because of "foreign key cascade" !!!
--
--
merge into "[schemaname]"."[objectname]"$TAG dest
using (
--
  -- NoFormat Start
  --
  select
  --
  -- NoFormat End
--
) src
on (src.KEY_VALUE = dest.KEY_VALUE and src.OWNER = dest.OWNER and src.TAG = dest.TAG)
when matched then
  update
     set dest.NOTICE        = src.NOTICE
        ,dest.ROW_FLAG_MASK = src.ROW_FLAG_MASK
         -- LOOP-n:
        ,dest."[columnname-n]" = src."[columnname-n]"
  -- END LOO')
|| TO_CLOB('P:
   where 1 = 1
     and (
         --
          DL_COMMON.PKG_UTIL.Is_Equal_(dest.NOTICE
                                      ,src.NOTICE) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.ROW_FLAG_MASK
                                         ,src.ROW_FLAG_MASK) = 0
         -- LOOP-n:
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest."[columnname-n]"
                                          ,src."[columnname-n]") = 0
         -- END LOOP:
         --
         )
when ')
|| TO_CLOB('not matched then
  insert
    (KEY_VALUE
    ,OWNER
    ,TAG
    ,NOTICE
    ,ROW_FLAG_MASK
     -- LOOP-n:
    ,"[columnname-n]"
     -- END LOOP:
     --
     )
  values
    (src.KEY_VALUE
    ,src.OWNER
    ,src.TAG
    ,src.NOTICE
    ,src.ROW_FLAG_MASK
     -- LOOP-n:
    ,src."[columnname-n]"
     -- END LOOP:
     --
     );
--
commit;
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CB45063E0530101007FFBE7','en_US','Lookup table history',3,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.482664000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$HIS.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    29.11.2017  Tablespace clause added
* WWirns    04.04.2018  INS_* columns added
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HO')
|| TO_CLOB('ST
*******************************************************************************/
--
--
create table "[schemaname]"."[objectname]"$HIS(KEY_VALUE varchar2(32 char) not null
                                              ,LOCALE varchar2(5 char)
                                              ,DISPLAY_VALUE varchar2(128 char)
                                              ,DISPLAY_ORDER integer
                                              ,IS_ACTIVE varchar2(1 char)
                                ')
|| TO_CLOB('              ,INS_AT date not null
                                              ,INS_BY_USER varchar2(255 char) not null
                                              ,INS_BY_HOST varchar2(255 char) not null
                                              ,DML_AT timestamp not null
                                              ,DML_BY_USER varchar2(255 char) not null
                                              ,DML_BY_HOST varchar2(255 char) not null
                                           ')
|| TO_CLOB('   ,DML_TYPE varchar2(1 char) not null
                                              ,NOTICE varchar2(4000 char)
                                              ,NUM_VALUE number(32)
                                              ,ROW_FLAG_MASK number(6)
                                              ,OWNER varchar2(128 char)
                                               --
                                               )
--
tablespace "[tablespace-dat]";
--
--
comment on table "[schemaname]"."[obj')
|| TO_CLOB('ectname]"$HIS is ''Historical rows of table "[schemaname]"."[objectname]"'';
--
--
alter table "[schemaname]"."[objectname]"$HIS add constraint "[objectname]"$HIS$CK00 check(DML_TYPE in (''I''
                                                                                                       ,''U''
                                                                                                       ,''D''));
--
--
--'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CB55063E0530101007FFBE7','en_US','Lookup table I18N',4,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.491149000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$I18N.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
*
* 
*
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    29.11.2017  Tablespace clause added
* WWirns    04.04.2018  INS_* columns added
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST')
|| TO_CLOB('
*******************************************************************************/
--
--
create table "[schemaname]"."[objectname]"$I18N(KEY_VALUE varchar2(32 char) not null
                                               ,LOCALE varchar2(5 char) not null
                                               ,DISPLAY_VALUE varchar2(128 char) not null
                                               ,INS_AT        date default on null sysdate not null
                                               ,INS_BY_U')
|| TO_CLOB('SER   varchar2(255 char) default on null user not null
                                               ,INS_BY_HOST   varchar2(255 char) default on null SYS_CONTEXT(''USERENV''
                                                                                                            ,''HOST''
                                                                                                            ,255) not null
                                               ,DML_AT        timestamp default on null')
|| TO_CLOB(' systimestamp not null
                                               ,DML_BY_USER   varchar2(255 char) default on null user not null
                                               ,DML_BY_HOST   varchar2(255 char) default on null SYS_CONTEXT(''USERENV''
                                                                                                            ,''HOST''
                                                                                                            ,255) not null
        ')
|| TO_CLOB('                                       ,DML_TYPE      varchar2(1 char) default on null ''I'' not null
                                               ,NOTICE varchar2(4000 char)
                                               ,ROW_FLAG_MASK number(6) default 0 not null
                                               ,OWNER varchar2(128 char)
                                                --
                                                )
--
tablespace "[tablespace-dat]";
--
--
comment on table "[s')
|| TO_CLOB('chemaname]"."[objectname]"$I18N is ''Additional localized rows of table "[schemaname]"."[objectname]"'';
--
--
comment on column "[schemaname]"."[objectname]"$I18N.KEY_VALUE is ''Key value, links to table "[schemaname]"."[objectname]"'';
--
comment on column "[schemaname]"."[objectname]"$I18N.LOCALE is ''Localisation of all character columns of the row, links to table DL_COMMON.LOCALES'';
--
comment on column "[schemaname]"."[objectname]"$I18N.DISPLAY_VALUE is '''';
--
comment on column "[schemaname]"."')
|| TO_CLOB('[objectname]"$I18N.INS_AT is ''Inserted at'';
--
comment on column "[schemaname]"."[objectname]"$I18N.INS_BY_USER is ''Inserted by'';
--
comment on column "[schemaname]"."[objectname]"$I18N.INS_BY_HOST is ''Inserted by'';
--
comment on column "[schemaname]"."[objectname]"$I18N.DML_AT is ''Last executed DML at'';
--
comment on column "[schemaname]"."[objectname]"$I18N.DML_BY_USER is ''Last executed DML by'';
--
comment on column "[schemaname]"."[objectname]"$I18N.DML_BY_HOST is ''Last executed DML by'';
--
c')
|| TO_CLOB('omment on column "[schemaname]"."[objectname]"$I18N.DML_TYPE is ''Last executed DML-Action: ''''I'''' => Insert, ''''U'''' => Update, ''''D'''' => Delete'';
--
comment on column "[schemaname]"."[objectname]"$I18N.NOTICE is '''';
--
comment on column "[schemaname]"."[objectname]"$I18N.ROW_FLAG_MASK is ''Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !'';
--
comment on column "[schemaname]"."[objectname]"$I18N.OW')
|| TO_CLOB('NER is ''Owner of the row, links to table DL_COMMON.OWNERS'';
--
--
alter table "[schemaname]"."[objectname]"$I18N add constraint "[objectname]"$I18N$PK primary key(KEY_VALUE
                                                                                                ,LOCALE)
  using index
--
tablespace "[tablespace-idx]";
--
--
alter table "[schemaname]"."[objectname]"$I18N add constraint "[objectname]"$I18N$CK00 check(LOCALE != ''en_US'');
--
alter table "[schemaname]"."[objectname]"$I18N add c')
|| TO_CLOB('onstraint "[objectname]"$I18N$CK01 check(DML_TYPE in (''I''
                                                                                                         ,''U''));
--
--
--'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC05063E0530101007FFBE7','en_US','Lookup table I18N trigger',15,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.582815000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\Code\Trigger\[schemaname].[objectname]$I18N$TIUD0.sql',TO_CLOB('create or replace trigger "[schemaname]"."[objectname]"$I18N$TIUD0
  for insert or update or delete on "[schemaname]"."[objectname]"$I18N
  compound trigger
--
  --
  /*******************************************************************************
  * 
  * 
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  --------------------------------------------------')
|| TO_CLOB('-----*
  * WWirns    27.09.2017  Added
  * WWirns    23.02.2018  Add columns INS_AT and INS_BY
  * WWirns    04.04.2018  INS_* columns added
  * WWirns    10.04.2018  Add column OWNER
  * WWirns    13.08.2018  Add procedure L_Check_Row4DML
  * WWirns    13.08.2018  Refactor with usage of more placeholders
  * WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST
  *******************************************************************************/
  --
  --
  v_DML_TYPE char(1);
  --
  --
')
|| TO_CLOB('  /**
  * Checks the Trigger Transaction method to get the transaction type
  * Sets the global trigger variable "l_dml_type"
  * 
  * Raises an error if no type can be extracted
  */
  procedure L_Set_DML_TYPE(p_Prevent_EXCE in boolean default false) is
  begin
    if (INSERTING())
    then
      v_DML_TYPE := ''I'';
    elsif (UPDATING())
    then
      v_DML_TYPE := ''U'';
    elsif (DELETING())
    then
      v_DML_TYPE := ''D'';
    else
      if (not nvl(p_Prevent_EXCE
                 ,false))
')
|| TO_CLOB('      then
        Raise_application_error(-20000
                               ,''Could not determine a value for v_DML_TYPE!'');
      end if;
    end if;
  end L_Set_DML_TYPE;
  --
  --
  /**
  * Checks if the primary key value of the table has changed
  *
  * @return BOOLEAN: True = value has changed, False = value has not changed
  */
  function L_Has_PK_Value_Changed return boolean is
  begin
    if (:new.KEY_VALUE != :old.KEY_VALUE or :new.LOCALE != :old.LOCALE)
    then
      return true;')
|| TO_CLOB('
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  --
  /**
  * Checks if the foreign key value of the table is valid and can be found in the parent table
  * Raises errors if the value cannot be found
  */
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_KEY_VALUE in "[objectname]"$I18N.KEY_VALUE%type
                               ,p_LOCALE    in "[objectname]"$I18N.LOCALE%type
')
|| TO_CLOB('                               ,o_OWNER     in "[objectname]"$I18N.OWNER%type
                               ,n_OWNER     in "[objectname]"$I18N.OWNER%type
                               -- LOOP-FK-Column-n:
                               --,o_"[fk-columnname-n]" in "[objectname]"$I18N."[fk-columnname-n]"%type
                               --,n_"[fk-columnname-n]" in "[objectname]"$I18N."[fk-columnname-n]"%type
                               -- END LOOP-FK-Column-n:
                            ')
|| TO_CLOB('   --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_OWNER is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_OWNER
                                                               ,o_OWNER))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.OWNERS t
         where t.KEY_VALUE = n_OWNER;
        if (v_vc_Tmp != ''Y'')
        then
          Raise_application_error(-20000
                  ')
|| TO_CLOB('               ,''The OWNER['''''' || n_OWNER || ''''''] is not active! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']/LOCALE['''''' || p_LOCALE || ''''''], DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,''The OWNER['''''' || n_OWNER || ''''''] does not exist! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']/LOCALE['''''' || p_LOCALE || ''''''], DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end;
    end if;')
|| TO_CLOB('
    -- LOOP-FK-Column-n:
    ----
    ----
    --if (n_"[fk-columnname-n]" is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_"[fk-columnname-n]"
    --                                                                          ,o_"[fk-columnname-n]"))
    --then
    --  begin
    --    select t.IS_ACTIVE
    --      into v_vc_Tmp
    --      from "[fk-schemaname-n]"."[fk-objectname-n]" t
    --     where t.KEY_VALUE = n_"[fk-columnname-n]";
    --    if (v_vc_Tmp != ''Y'')
    --    then
    --    ')
|| TO_CLOB('  Raise_application_error(-20000
    --                             , ''The "[fk-columnname-n]"['''''' || n_"[fk-columnname-n]" || ''''''] is not active! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']/LOCALE['''''' || p_LOCALE || '''''']''
    --                              --
    --                               || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
    --    end if;
    --  exception
    --    when NO_DATA_FOUND then
    --      Raise_application_error(-20000
    --                             , ''The "[fk')
|| TO_CLOB('-columnname-n]"['''''' || n_"[fk-columnname-n]" || ''''''] does not exist! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']/LOCALE['''''' || p_LOCALE || '''''']''
    --                              --
    --                               || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
    --  end;
    --end if;
    -- END LOOP-FK-Column-n:
    --
  end L_Check_FK_Content;
  --
  --
  procedure L_Check_Row4DML is
  begin
    --
    if (v_DML_TYPE = ''I'')
    then
      --
      null;
      --
    elsif (v_DML_TYPE = ''U''')
|| TO_CLOB(')
    then
      --
      if (bitand(:old.ROW_FLAG_MASK
                ,16) = 16)
      then
        -- 16 => prevent update
        Raise_application_error(-20000
                               , ''The row is not updatable! For KEY_VALUE['''''' || :old.KEY_VALUE || '''''']/LOCALE['''''' || :old.LOCALE || '''''']''
                                --
                                 || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end if;
      --
    else
      -- ''D''
      if (bitand(:old.ROW_FLAG_MASK
  ')
|| TO_CLOB('              ,32) = 32)
      then
        -- 32 => prevent delete            
        Raise_application_error(-20000
                               , ''The row is not deletable! For KEY_VALUE['''''' || :old.KEY_VALUE || '''''']/LOCALE['''''' || :old.LOCALE || '''''']''
                                --
                                 || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end if;
      --
    end if;
    --
  end L_Check_Row4DML;
  --
  -- BEGIN: NOT GENERATED AREA
  --

  --
  -- END: NOT GEN')
|| TO_CLOB('ERATED AREA
  --
  --
  --
  /** ======================================================
  * BEFORE STATEMENT EVENT
  *
  * Extract the dml-type variable
  * =======================================================
  */
  before statement is
  begin
    --
    L_Set_DML_TYPE(true);
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
  end before statement;
  --
  --
  /** ======================================================
  * BEFORE EACH ROW EV')
|| TO_CLOB('ENT
  * =======================================================
  */
  before each row is
  begin
    --
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    L_Check_Row4DML();
    --
    if (v_DML_TYPE = ''I'')
    then
      --
      :new.INS_AT      := sysdate;
      :new.INS_BY_USER := DL_COMMON.PKG_SESSION.Get_BY_User();
      :new.INS_BY_HOST := DL_COMMON.PKG_SESSION.Get_BY_Host();
      :new.DML_AT ')
|| TO_CLOB('     := systimestamp;
      :new.DML_BY_USER := DL_COMMON.PKG_SESSION.Get_BY_User();
      :new.DML_BY_HOST := DL_COMMON.PKG_SESSION.Get_BY_Host();
      :new.DML_TYPE    := v_DML_TYPE;
      --
    elsif (v_DML_TYPE = ''U'')
    then
      --
      :new.INS_AT      := :old.INS_AT;
      :new.INS_BY_USER := :old.INS_BY_USER;
      :new.INS_BY_HOST := :old.INS_BY_HOST;
      :new.DML_AT      := systimestamp;
      :new.DML_BY_USER := DL_COMMON.PKG_SESSION.Get_BY_User();
      :new.DML_BY_HOST := DL')
|| TO_CLOB('_COMMON.PKG_SESSION.Get_BY_Host();
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :new.DML_TYPE := ''I'';
      else
        :new.DML_TYPE := v_DML_TYPE;
      end if;
      --
    else
      -- ''D''
      null;
      --
    end if;
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
  end before each row;
  --
  --
  /** ========================================')
|| TO_CLOB('==============
  * AFTER EACH ROW EVENT
  * =======================================================
  */
  after each row is
  begin
    --
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
    if (v_DML_TYPE = ''I'')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:new.LOCALE
  ')
|| TO_CLOB('                      ,null
                        ,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,null
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
    elsif (v_DML_TYPE = ''U'')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:new.LOCALE
                        ,:old.OWNER
                        ,:new')
|| TO_CLOB('.OWNER
                         -- LOOP-FK-Column-n:
                         --,:old."[fk-columnname-n]"
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
      insert into "[objectname]"$I18N$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.INS_AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
        ,:old.DML_AT
    ')
|| TO_CLOB('    ,:old.DML_BY_USER
        ,:old.DML_BY_HOST
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into "[objectname]"$I18N$HIS
          (KEY_VALUE
          ,LOCALE
          ,INS_AT
          ,INS_BY_USER
          ,INS_BY_HOST
          ,DML_AT
          ,DML_BY_USER
          ,DML_BY_HOS')
|| TO_CLOB('T
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,:old.LOCALE
          ,:old.INS_AT
          ,:old.INS_BY_USER
          ,:old.INS_BY_HOST
          ,systimestamp
          ,DL_COMMON.PKG_SESSION.Get_BY_User()
          ,DL_COMMON.PKG_SESSION.Get_BY_Host()
          ,''D''
           --
           );
      end if;
      --
    else
      -- ''D''
      insert into "[objectname]"$I18N$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
')
|| TO_CLOB('        ,:old.INS_AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
        ,:old.DML_AT
        ,:old.DML_BY_USER
        ,:old.DML_BY_HOST
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      insert into "[objectname]"$I18N$HIS
        (KEY_VALUE
        ,LOCALE
        ,INS_AT
        ,INS_BY_USER
        ,INS_BY_HOST
        ,DML_AT
        ,DML_BY_USER
        ,DML_BY_HOST
        ,DML_TYPE)
      values
    ')
|| TO_CLOB('    (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.INS_AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
        ,systimestamp
        ,DL_COMMON.PKG_SESSION.Get_BY_User()
        ,DL_COMMON.PKG_SESSION.Get_BY_Host()
        ,''D''
         --
         );
      --
    end if;
    --
  end after each row;
  --
  --
  /** ======================================================
  * AFTER STATEMENT
  * =======================================================
  */
  after statement is
  begin
  ')
|| TO_CLOB('  --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
    v_DML_TYPE := null;
    --
  end after statement;
  --
end "[objectname]"$I18N$TIUD0;
/'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CBF5063E0530101007FFBE7','en_US','Lookup table trigger',14,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.571286000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\Code\Trigger\[schemaname].[objectname]$TIUD0.sql',TO_CLOB('create or replace trigger "[schemaname]"."[objectname]"$TIUD0
  for insert or update or delete on "[schemaname]"."[objectname]"
  compound trigger
--
  --
  /*******************************************************************************
  * 
  * 
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------
  * WWirns    27.09.2017  Added
  * WWirns    06.10.2017  Changes because of surrogate keys
  * WWirns    09.11.2017  Added FK-C')
|| TO_CLOB('ontent check
  * WWirns    04.04.2018  INS_* columns added
  * WWirns    10.04.2018  Add column OWNER
  * WWirns    08.08.2018  Add procedure L_Check_Row4DML
  * WWirns    13.08.2018  Refactor with usage of more placeholders
  * WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST
  *******************************************************************************/
  --
  --
  v_DML_TYPE char(1);
  --
  --
  /**
  * Checks the Trigger Transaction method to get the transaction type
  * Se')
|| TO_CLOB('ts the global trigger variable "l_dml_type"
  * 
  * Raises an error if no type can be extracted
  */
  procedure L_Set_DML_TYPE(p_Prevent_EXCE in boolean default false) is
  begin
    if (INSERTING())
    then
      v_DML_TYPE := ''I'';
    elsif (UPDATING())
    then
      v_DML_TYPE := ''U'';
    elsif (DELETING())
    then
      v_DML_TYPE := ''D'';
    else
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(-20000
                               ,')
|| TO_CLOB('''Could not determine a value for v_DML_TYPE!'');
      end if;
    end if;
  end L_Set_DML_TYPE;
  --
  --
  /**
  * Checks if the primary key value of the table has changed
  *
  * @return BOOLEAN: True = value has changed, False = value has not changed
  */
  function L_Has_PK_Value_Changed return boolean is
  begin
    --
    if (:new.KEY_VALUE != :old.KEY_VALUE
       --
       -- LOOP-PK-Column-n: PK is a surrogate key and any natural PK exists also as a unique constraints/indexes!
       --')
|| TO_CLOB('or :new."[pk-columnname-n]" != :old."[pk-columnname-n]"
       -- END LOOP-PK-Column-n:
       --
       )
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  --
  /**
  * Checks if the foreign key value of the table is valid and can be found in the parent table
  * Raises errors if the value cannot be found
  */
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Con')
|| TO_CLOB('tent(p_KEY_VALUE in "[objectname]".KEY_VALUE%type
                               -- LOOP-PK-Column-n:
                               --,p_"[pk-columnname-n]" in "[objectname]"."[pk-columnname-n]"%type
                               -- END LOOP-PK-Column-n:
                               ,o_OWNER in "[objectname]".OWNER%type
                               ,n_OWNER in "[objectname]".OWNER%type
                               -- LOOP-FK-Column-n:
                               --,o_"[fk-columnname-n')
|| TO_CLOB(']" in "[objectname]"."[fk-columnname-n]"%type
                               --,n_"[fk-columnname-n]" in "[objectname]"."[fk-columnname-n]"%type
                               -- END LOOP-FK-Column-n:
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_OWNER is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_OWNER
                                                               ,o_OWNER))
    then
      b')
|| TO_CLOB('egin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.OWNERS t
         where t.KEY_VALUE = n_OWNER;
        if (v_vc_Tmp != ''Y'')
        then
          Raise_application_error(-20000
                                 , ''The OWNER['''''' || n_OWNER || ''''''] is not active! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']''
                                  -- LOOP-PK-Column-n:
                                  ----
                                  --|| ''/"[pk-columnname-n]"['''''' || :')
|| TO_CLOB('old."[pk-columnname-n]" || '''''']''
                                  -- END LOOP-PK-Column-n:
                                  --
                                   || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 , ''The OWNER['''''' || n_OWNER || ''''''] does not exist! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']''
                                  -- LOOP-PK-Column-n:
    ')
|| TO_CLOB('                              ----
                                  --|| ''/"[pk-columnname-n]"['''''' || :old."[pk-columnname-n]" || '''''']''
                                  -- END LOOP-PK-Column-n:
                                  --
                                   || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end;
    end if;
    -- LOOP-FK-Column-n:
    ----
    ----
    --if (n_"[fk-columnname-n]" is not null and not DL_COMMON.PKG_UTIL.Is_Equal(n_"[fk-columnname-n]"
    --             ')
|| TO_CLOB('                                                             ,o_"[fk-columnname-n]"))
    --then
    --  begin
    --    select t.IS_ACTIVE
    --      into v_vc_Tmp
    --      from "[fk-schemaname-n]"."[fk-objectname-n]" t
    --     where t.KEY_VALUE = n_"[fk-columnname-n]";
    --    if (v_vc_Tmp != ''Y'')
    --    then
    --      Raise_application_error(-20000
    --                             , ''The "[fk-columnname-n]"['''''' || n_"[fk-columnname-n]" || ''''''] is not active! For KEY_VALUE['''''' ')
|| TO_CLOB('|| p_KEY_VALUE || '''''']''
    --                              -- LOOP-PK-Column-n:
    --                              ----
    --                              --|| ''/"[pk-columnname-n]"['''''' || :old."[pk-columnname-n]" || '''''']''
    --                              -- END LOOP-PK-Column-n:
    --                              --
    --                               || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
    --    end if;
    --  exception
    --    when NO_DATA_FOUND then
    --      Raise_appl')
|| TO_CLOB('ication_error(-20000
    --                             , ''The "[fk-columnname-n]"['''''' || n_"[fk-columnname-n]" || ''''''] does not exist! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']''
    --                              -- LOOP-PK-Column-n:
    --                              ----
    --                              --|| ''/"[pk-columnname-n]"['''''' || :old."[pk-columnname-n]" || '''''']''
    --                              -- END LOOP-PK-Column-n:
    --                              --
    --              ')
|| TO_CLOB('                 || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
    --  end;
    --end if;
    -- END LOOP-FK-Column-n:
    --
  end L_Check_FK_Content;
  --
  --
  procedure L_Check_Row4DML is
  begin
    --
    if (v_DML_TYPE = ''I'')
    then
      --
      null;
      --
    elsif (v_DML_TYPE = ''U'')
    then
      --
      if (bitand(:old.ROW_FLAG_MASK
                ,16) = 16)
      then
        -- 16 => prevent update
        Raise_application_error(-20000
                               , ''Th')
|| TO_CLOB('e row is not updatable! For KEY_VALUE['''''' || :old.KEY_VALUE || '''''']''
                                -- LOOP-PK-Column-n:
                                ----
                                --|| ''/"[pk-columnname-n]"['''''' || :old."[pk-columnname-n]" || '''''']''
                                -- END LOOP-PK-Column-n:
                                --
                                 || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end if;
      --
    else
      -- ''D''
      if (bitand(:old.ROW_')
|| TO_CLOB('FLAG_MASK
                ,32) = 32)
      then
        -- 32 => prevent delete            
        Raise_application_error(-20000
                               , ''The row is not deletable! For KEY_VALUE['''''' || :old.KEY_VALUE || '''''']''
                                -- LOOP-PK-Column-n:
                                ----
                                --|| ''/"[pk-columnname-n]"['''''' || :old."[pk-columnname-n]" || '''''']''
                                -- END LOOP-PK-Column-n:
                 ')
|| TO_CLOB('               --
                                 || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end if;
      --
    end if;
    --
  end L_Check_Row4DML;
  --
  -- BEGIN: NOT GENERATED AREA
  --

  --
  -- END: NOT GENERATED AREA
  --
  --
  --
  /** ======================================================
  * BEFORE STATEMENT EVENT
  *
  * Extract the dml-type variable
  * =======================================================
  */
  before statement is
  begin
    --
    L_Set_DML_TYPE(t')
|| TO_CLOB('rue);
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
  end before statement;
  --
  --
  /** ======================================================
  * BEFORE EACH ROW EVENT
  * =======================================================
  */
  before each row is
  begin
    --
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    L_Check_Row4DML();
    -')
|| TO_CLOB('-
    if (v_DML_TYPE = ''I'')
    then
      --
      -- Begin:PK is a surrogate key
      if (:new.KEY_VALUE is null)
      then
        --
        -- BEGIN: NOT GENERATED AREA
        --
      
        --:new.KEY_VALUE := SYS_GUID();
        --:new.KEY_VALUE := "[schemaname]"."[objectname]"$SEQ00.NextVal;
      
        --
        -- END: NOT GENERATED AREA
        --
      end if;
      -- End:PK is a surrogate key
      --
      :new.INS_AT      := sysdate;
      :new.INS_BY_USER := DL_COMMON.')
|| TO_CLOB('PKG_SESSION.Get_BY_User();
      :new.INS_BY_HOST := DL_COMMON.PKG_SESSION.Get_BY_Host();
      :new.DML_AT      := systimestamp;
      :new.DML_BY_USER := DL_COMMON.PKG_SESSION.Get_BY_User();
      :new.DML_BY_HOST := DL_COMMON.PKG_SESSION.Get_BY_Host();
      :new.DML_TYPE    := v_DML_TYPE;
      --
    elsif (v_DML_TYPE = ''U'')
    then
      --
      :new.INS_AT      := :old.INS_AT;
      :new.INS_BY_USER := :old.INS_BY_USER;
      :new.INS_BY_HOST := :old.INS_BY_HOST;
      :new.DML_AT      ')
|| TO_CLOB(':= systimestamp;
      :new.DML_BY_USER := DL_COMMON.PKG_SESSION.Get_BY_User();
      :new.DML_BY_HOST := DL_COMMON.PKG_SESSION.Get_BY_Host();
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :new.DML_TYPE := ''I'';
      else
        :new.DML_TYPE := v_DML_TYPE;
      end if;
      --
    else
      -- ''D''
      null;
      --
    end if;
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT ')
|| TO_CLOB('GENERATED AREA
    --
    --
  end before each row;
  --
  --
  /** ======================================================
  * AFTER EACH ROW EVENT
  * =======================================================
  */
  after each row is
  begin
    --
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
    if (v_DML_T')
|| TO_CLOB('YPE = ''I'')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                         -- LOOP-PK-Column-n:
                         --,:new."[pk-columnname-n]"
                         -- END LOOP-PK-Column-n:
                        ,null
                        ,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,null
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
      ')
|| TO_CLOB('                   );
      --
    elsif (v_DML_TYPE = ''U'')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                         -- LOOP-PK-Column-n:
                         --,:new."[pk-columnname-n]"
                         -- END LOOP-PK-Column-n:
                        ,:old.OWNER
                        ,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,:old."[fk-columnname-n]"
                         --,:new."[fk-columnname-n]"
         ')
|| TO_CLOB('                -- END LOOP-FK-Column-n:
                         --
                         );
      --
      insert into "[objectname]"$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.INS_AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
        ,:old.DML_AT
        ,:old.DML_BY_USER
        ,:old.DML_BY_HOST
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.NUM_VALUE
     ')
|| TO_CLOB('   ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into "[objectname]"$HIS
          (KEY_VALUE
          ,INS_AT
          ,INS_BY_USER
          ,INS_BY_HOST
          ,DML_AT
          ,DML_BY_USER
          ,DML_BY_HOST
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,:old.INS_AT
          ,:old.INS_BY_USER
     ')
|| TO_CLOB('     ,:old.INS_BY_HOST
          ,systimestamp
          ,DL_COMMON.PKG_SESSION.Get_BY_User()
          ,DL_COMMON.PKG_SESSION.Get_BY_Host()
          ,''D''
           --
           );
      end if;
      --
    else
      -- ''D''
      insert into "[objectname]"$HIS
      values
        (:old.KEY_VALUE
        ,:old.LOCALE
        ,:old.DISPLAY_VALUE
        ,:old.DISPLAY_ORDER
        ,:old.IS_ACTIVE
        ,:old.INS_AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
        ,:old.DML_AT
  ')
|| TO_CLOB('      ,:old.DML_BY_USER
        ,:old.DML_BY_HOST
        ,:old.DML_TYPE
        ,:old.NOTICE
        ,:old.NUM_VALUE
        ,:old.ROW_FLAG_MASK
        ,:old.OWNER
         --
         );
      --
      insert into "[objectname]"$HIS
        (KEY_VALUE
        ,INS_AT
        ,INS_BY_USER
        ,INS_BY_HOST
        ,DML_AT
        ,DML_BY_USER
        ,DML_BY_HOST
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
        ,:old.INS_AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
')
|| TO_CLOB('        ,systimestamp
        ,DL_COMMON.PKG_SESSION.Get_BY_User()
        ,DL_COMMON.PKG_SESSION.Get_BY_Host()
        ,''D''
         --
         );
      --
    end if;
    --
  end after each row;
  --
  --
  /** ======================================================
  * AFTER STATEMENT
  * =======================================================
  */
  after statement is
  begin
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
    v_DML_TYPE')
|| TO_CLOB(' := null;
    --
  end after statement;
  --
end "[objectname]"$TIUD0;
/'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC15063E0530101007FFBE7','en_US','Lookup table TAGs trigger',16,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.594125000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\Code\Trigger\[schemaname].[objectname]$TAG$TIUD0.sql',TO_CLOB('create or replace trigger "[schemaname]"."[objectname]"$TAG$TIUD0
  for insert or update or delete on "[schemaname]"."[objectname]"$TAG
  compound trigger
--
  --
  /*******************************************************************************
  * 
  * 
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------
  * WWirns    05.04.2018  Added
  * WWirns    10.04.2018  Add column OWNER
  * WWirns    13.08.2018  Add procedure L_Che')
|| TO_CLOB('ck_Row4DML
  * WWirns    13.08.2018  Refactor with usage of more placeholders
  * WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST
  *******************************************************************************/
  --
  --
  v_DML_TYPE char(1);
  --
  --
  /**
  * Checks the Trigger Transaction method to get the transaction type
  * Sets the global trigger variable "l_dml_type"
  * 
  * Raises an error if no type can be extracted
  */
  procedure L_Set_DML_TYPE(p_Prevent_EXCE in ')
|| TO_CLOB('boolean default false) is
  begin
    if (INSERTING())
    then
      v_DML_TYPE := ''I'';
    elsif (UPDATING())
    then
      v_DML_TYPE := ''U'';
    elsif (DELETING())
    then
      v_DML_TYPE := ''D'';
    else
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(-20000
                               ,''Could not determine a value for v_DML_TYPE!'');
      end if;
    end if;
  end L_Set_DML_TYPE;
  --
  --
  /**
  * Checks if the primary key value')
|| TO_CLOB(' of the table has changed
  *
  * @return BOOLEAN: True = value has changed, False = value has not changed
  */
  function L_Has_PK_Value_Changed return boolean is
  begin
    if (:new.KEY_VALUE != :old.KEY_VALUE or :new.OWNER != :old.OWNER or :new.TAG != :old.TAG)
    then
      return true;
    else
      return false;
    end if;
  end L_Has_PK_Value_Changed;
  --
  --
  /**
  * Checks if the foreign key value of the table is valid and can be found in the parent table
  * Raises errors if the')
|| TO_CLOB(' value cannot be found
  */
  -- !!! Do not check LOCALE, because the static value is already checked by a check constraint !!!
  --
  procedure L_Check_FK_Content(p_KEY_VALUE in "[objectname]"$TAG.KEY_VALUE%type
                               ,p_OWNER     in "[objectname]"$TAG.OWNER%type
                               ,p_TAG       in "[objectname]"$TAG.TAG%type
                               ,o_OWNER     in "[objectname]"$TAG.OWNER%type
                               ,n_OWNER     in "[objectnam')
|| TO_CLOB('e]"$TAG.OWNER%type
                               -- LOOP-FK-Column-n:
                               --,o_"[fk-columnname-n]" in "[objectname]"$TAG."[fk-columnname-n]"%type
                               --,n_"[fk-columnname-n]" in "[objectname]"$TAG."[fk-columnname-n]"%type
                               -- END LOOP-FK-Column-n:
                               --
                               ) is
    --
    v_vc_Tmp varchar2(1 char);
    --
  begin
    --
    --
    if (n_OWNER is not null an')
|| TO_CLOB('d not DL_COMMON.PKG_UTIL.Is_Equal(n_OWNER
                                                               ,o_OWNER))
    then
      begin
        select t.IS_ACTIVE
          into v_vc_Tmp
          from DL_COMMON.OWNERS t
         where t.KEY_VALUE = n_OWNER;
        if (v_vc_Tmp != ''Y'')
        then
          Raise_application_error(-20000
                                 ,''The OWNER['''''' || n_OWNER || ''''''] is not active! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']/OWNER['''''' || p_OWNER || '''''']/TAG[')
|| TO_CLOB(''''''' || p_TAG || ''''''], DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
        end if;
      exception
        when NO_DATA_FOUND then
          Raise_application_error(-20000
                                 ,''The OWNER['''''' || n_OWNER || ''''''] does not exist! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']/OWNER['''''' || p_OWNER || '''''']/TAG['''''' || p_TAG || ''''''], DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end;
    end if;
    -- LOOP-FK-Column-n:
    ----
    ----
    --if (n_"[fk-columnname-n]" is not null and n')
|| TO_CLOB('ot DL_COMMON.PKG_UTIL.Is_Equal(n_"[fk-columnname-n]"
    --                                                                          ,o_"[fk-columnname-n]"))
    --then
    --  begin
    --    select t.IS_ACTIVE
    --      into v_vc_Tmp
    --      from "[fk-schemaname-n]"."[fk-objectname-n]" t
    --     where t.KEY_VALUE = n_"[fk-columnname-n]";
    --    if (v_vc_Tmp != ''Y'')
    --    then
    --      Raise_application_error(-20000
    --                             , ''The "[fk-columnname-n]')
|| TO_CLOB('"['''''' || n_"[fk-columnname-n]" || ''''''] is not active! For KEY_VALUE['''''' || p_KEY_VALUE || '''''']/OWNER['''''' || p_OWNER || '''''']/TAG['''''' || p_TAG || '''''']''
    --                              --
    --                               || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
    --    end if;
    --  exception
    --    when NO_DATA_FOUND then
    --      Raise_application_error(-20000
    --                             , ''The "[fk-columnname-n]"['''''' || n_"[fk-columnname-n]" || ''''''] does not exist! F')
|| TO_CLOB('or KEY_VALUE['''''' || p_KEY_VALUE || '''''']/OWNER['''''' || p_OWNER || '''''']/TAG['''''' || p_TAG || '''''']''
    --                              --
    --                               || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
    --  end;
    --end if;
    -- END LOOP-FK-Column-n:
    --
  end L_Check_FK_Content;
  --
  --
  procedure L_Check_Row4DML is
  begin
    --
    if (v_DML_TYPE = ''I'')
    then
      --
      null;
      --
    elsif (v_DML_TYPE = ''U'')
    then
      --
      if (bitand(:old.ROW_F')
|| TO_CLOB('LAG_MASK
                ,16) = 16)
      then
        -- 16 => prevent update
        Raise_application_error(-20000
                               , ''The row is not updatable! For KEY_VALUE['''''' || :old.KEY_VALUE || '''''']/OWNER['''''' || :old.OWNER || '''''']/TAG['''''' || :old.TAG || '''''']''
                                --
                                 || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end if;
      --
    else
      -- ''D''
      if (bitand(:old.ROW_FLAG_MASK
                ,32) = ')
|| TO_CLOB('32)
      then
        -- 32 => prevent delete            
        Raise_application_error(-20000
                               , ''The row is not deletable! For KEY_VALUE['''''' || :old.KEY_VALUE || '''''']/OWNER['''''' || :old.OWNER || '''''']/TAG['''''' || :old.TAG || '''''']''
                                --
                                 || '', DML_TYPE['''''' || v_DML_TYPE || ''''''].'');
      end if;
      --
    end if;
    --
  end L_Check_Row4DML;
  --
  -- BEGIN: NOT GENERATED AREA
  --

  --
  -- END: NO')
|| TO_CLOB('T GENERATED AREA
  --
  --
  --
  /** ======================================================
  * BEFORE STATEMENT EVENT
  *
  * Extract the dml-type variable
  * =======================================================
  */
  before statement is
  begin
    --
    L_Set_DML_TYPE(true);
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
  end before statement;
  --
  --
  /** ======================================================
  * BEFORE EACH R')
|| TO_CLOB('OW EVENT
  * =======================================================
  */
  before each row is
  begin
    --
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    L_Check_Row4DML();
    --
    if (v_DML_TYPE = ''I'')
    then
      --
      :new.INS_AT      := sysdate;
      :new.INS_BY_USER := DL_COMMON.PKG_SESSION.Get_BY_User();
      :new.INS_BY_HOST := DL_COMMON.PKG_SESSION.Get_BY_Host();
      :new.DM')
|| TO_CLOB('L_AT      := systimestamp;
      :new.DML_BY_USER := DL_COMMON.PKG_SESSION.Get_BY_User();
      :new.DML_BY_HOST := DL_COMMON.PKG_SESSION.Get_BY_Host();
      :new.DML_TYPE    := v_DML_TYPE;
      --
    elsif (v_DML_TYPE = ''U'')
    then
      --
      :new.INS_AT      := :old.INS_AT;
      :new.INS_BY_USER := :old.INS_BY_USER;
      :new.INS_BY_HOST := :old.INS_BY_HOST;
      :new.DML_AT      := systimestamp;
      :new.DML_BY_USER := DL_COMMON.PKG_SESSION.Get_BY_User();
      :new.DML_BY_HOST ')
|| TO_CLOB(':= DL_COMMON.PKG_SESSION.Get_BY_Host();
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here an INSERT!
        :new.DML_TYPE := ''I'';
      else
        :new.DML_TYPE := v_DML_TYPE;
      end if;
      --
    else
      -- ''D''
      null;
      --
    end if;
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
  end before each row;
  --
  --
  /** ===================================')
|| TO_CLOB('===================
  * AFTER EACH ROW EVENT
  * =======================================================
  */
  after each row is
  begin
    --
    if (v_DML_TYPE is null)
    then
      -- This case can occur for example on MERGE-Statements!
      L_Set_DML_TYPE();
    end if;
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
    if (v_DML_TYPE = ''I'')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:new.OWNE')
|| TO_CLOB('R
                        ,:new.TAG
                        ,null
                        ,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,null
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
    elsif (v_DML_TYPE = ''U'')
    then
      --
      L_Check_FK_Content(:new.KEY_VALUE
                        ,:new.OWNER
                        ,:ne')
|| TO_CLOB('w.TAG
                        ,:old.OWNER
                        ,:new.OWNER
                         -- LOOP-FK-Column-n:
                         --,:old."[fk-columnname-n]"
                         --,:new."[fk-columnname-n]"
                         -- END LOOP-FK-Column-n:
                         --
                         );
      --
      insert into "[objectname]"$TAG$HIS
      values
        (:old.KEY_VALUE
        ,:old.OWNER
        ,:old.TAG
        ,:old.NOTICE
        ,:old.INS_')
|| TO_CLOB('AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
        ,:old.DML_AT
        ,:old.DML_BY_USER
        ,:old.DML_BY_HOST
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      if (L_Has_PK_Value_Changed())
      then
        -- UPDATE on PK-Columns is not allowed, so fake here a DELETE!
        insert into "[objectname]"$TAG$HIS
          (KEY_VALUE
          ,OWNER
          ,TAG
          ,INS_AT
          ,INS_BY_USER
          ,INS_BY_HOST
          ')
|| TO_CLOB(',DML_AT
          ,DML_BY_USER
          ,DML_BY_HOST
          ,DML_TYPE)
        values
          (:old.KEY_VALUE
          ,:old.OWNER
          ,:old.TAG
          ,:old.INS_AT
          ,:old.INS_BY_USER
          ,:old.INS_BY_HOST
          ,systimestamp
          ,DL_COMMON.PKG_SESSION.Get_BY_User()
          ,DL_COMMON.PKG_SESSION.Get_BY_Host()
          ,''D''
           --
           );
      end if;
      --
    else
      -- ''D''
      insert into "[objectname]"$TAG$HIS
      values
   ')
|| TO_CLOB('     (:old.KEY_VALUE
        ,:old.OWNER
        ,:old.TAG
        ,:old.NOTICE
        ,:old.INS_AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
        ,:old.DML_AT
        ,:old.DML_BY_USER
        ,:old.DML_BY_HOST
        ,:old.DML_TYPE
        ,:old.ROW_FLAG_MASK
         --
         );
      --
      insert into "[objectname]"$TAG$HIS
        (KEY_VALUE
        ,OWNER
        ,TAG
        ,INS_AT
        ,INS_BY_USER
        ,INS_BY_HOST
        ,DML_AT
        ,DML_BY_USER
       ')
|| TO_CLOB(' ,DML_BY_HOST
        ,DML_TYPE)
      values
        (:old.KEY_VALUE
        ,:old.OWNER
        ,:old.TAG
        ,:old.INS_AT
        ,:old.INS_BY_USER
        ,:old.INS_BY_HOST
        ,systimestamp
        ,DL_COMMON.PKG_SESSION.Get_BY_User()
        ,DL_COMMON.PKG_SESSION.Get_BY_Host()
        ,''D''
         --
         );
      --
    end if;
    --
  end after each row;
  --
  --
  /** ======================================================
  * AFTER STATEMENT
  * =========================')
|| TO_CLOB('==============================
  */
  after statement is
  begin
    --
    -- BEGIN: NOT GENERATED AREA
    --
  
    --
    -- END: NOT GENERATED AREA
    --
    --
    v_DML_TYPE := null;
    --
  end after statement;
  --
end "[objectname]"$TAG$TIUD0;
/'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC95063E0530101007FFBE7','en_US','Lookup table I18N loads',24,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.658139000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$I18N-load.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    02.01.2018  Delete statement added
* WWirns    09.04.2018  Add column ROW_FLAG_MASK
* WWirns    16.04.2018  Add column OWNER
* WWirns    13.08.2018  Refactor with usage of more placeholders
******************')
|| TO_CLOB('*************************************************************/
--
--
/*
--
select STMT
  from (
        --
        select case
                   when (mod(rownum
                            ,1000) = 1) then
                    ''  select''
                   else
                    ''  union all select''
                 end
                --
                --
                 || '' unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.KEY_VALUE)) || '''''')''
                --
                 ||')
|| TO_CLOB(' case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as KEY_VALUE''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.LOCALE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as LOCALE''
                ')
|| TO_CLOB('   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.DISPLAY_VALUE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as DISPLAY_VALUE''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' |')
|| TO_CLOB('| asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.NOTICE)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as NOTICE''
                   else
                    ''''
                 end
                --
                --
                 || '', '' || nvl(trim(t1.ROW_FLAG_MASK)
                               ,''null'')
                --
                 || case
                   when (mod(rownum')
|| TO_CLOB('
                            ,1000) = 1) then
                    '' as ROW_FLAG_MASK''
                   else
                    ''''
                 end
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1.OWNER)) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as OWNER''
                   else
                    ''''
        ')
|| TO_CLOB('         end
                -- LOOP-n:
                --
                --
                 || '', unistr('''''' || asciistr(DL_COMMON.PKG_UTIL.Escape4SQL(t1."[columnname-n]")) || '''''')''
                --
                 || case
                   when (mod(rownum
                            ,1000) = 1) then
                    '' as "[columnname-n]"''
                   else
                    ''''
                 end
                -- END LOOP:
                --
                --
            ')
|| TO_CLOB('     || '' from dual'' as STMT
               ,rownum as ROW_NUM
          from (
                 --
                 select t.*
                   from "[schemaname]"."[objectname]"$I18N t
                  order by t.KEY_VALUE
                           ,t.LOCALE
                 --
                 ) t1
        --
        )
 where ROW_NUM between 1 and 1000
--
;
--
*/
--
--
--
-- *** Part 01 **********************************************************************************************
--
--
--')
|| TO_CLOB(' !!! "delete from "[schemaname]"."[objectname]"$I18N" is not needed because of "foreign key cascade" !!!
--
--
merge into "[schemaname]"."[objectname]"$I18N dest
using (
--
  -- NoFormat Start
  --
  select
  --
  -- NoFormat End
--
) src
on (src.KEY_VALUE = dest.KEY_VALUE and src.LOCALE = dest.LOCALE)
when matched then
  update
     set dest.DISPLAY_VALUE = src.DISPLAY_VALUE
        ,dest.NOTICE        = src.NOTICE
        ,dest.ROW_FLAG_MASK = src.ROW_FLAG_MASK
        ,dest.OWNER         = sr')
|| TO_CLOB('c.OWNER
         -- LOOP-n:
        ,dest."[columnname-n]" = src."[columnname-n]"
  -- END LOOP:
   where 1 = 1
     and (
         --
          DL_COMMON.PKG_UTIL.Is_Equal_(dest.DISPLAY_VALUE
                                      ,src.DISPLAY_VALUE) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.NOTICE
                                         ,src.NOTICE) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.ROW_FLAG_MASK
                                         ,src.RO')
|| TO_CLOB('W_FLAG_MASK) = 0
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest.OWNER
                                         ,src.OWNER) = 0
         -- LOOP-n:
         --
          or DL_COMMON.PKG_UTIL.Is_Equal_(dest."[columnname-n]"
                                          ,src."[columnname-n]") = 0
         -- END LOOP:
         --
         )
when not matched then
  insert
    (KEY_VALUE
    ,LOCALE
    ,DISPLAY_VALUE
    ,NOTICE
    ,ROW_FLAG_MASK
    ,OWNER
     -- LOOP-n:
    ,"[columnnam')
|| TO_CLOB('e-n]"
     -- END LOOP:
     --
     )
  values
    (src.KEY_VALUE
    ,src.LOCALE
    ,src.DISPLAY_VALUE
    ,src.NOTICE
    ,src.ROW_FLAG_MASK
    ,src.OWNER
     -- LOOP-n:
    ,src."[columnname-n]"
     -- END LOOP:
     --
     );
--
commit;
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CBD5063E0530101007FFBE7','en_US','Lookup table I18N view',12,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.553193000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\View\[schemaname].[objectname]$LC.sql',TO_CLOB('--
--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    04.04.2018  INS_* columns added
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST
******************************************')
|| TO_CLOB('*************************************/
--
--
create or replace view "[schemaname]"."[objectname]"$LC as
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY_USER
        ,t1.INS_BY_HOST
        ,t1.DML_AT
        ,t1.DML_BY_USER
        ,t1.DML_BY_HOST
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NOTICE  ')
|| TO_CLOB('      as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,null             as ROW_FLAG_MASK$I18N
        ,t1.OWNER
        ,null             as OWNER$I18N
        ,t1.rowid         as "[objectname]"$RI
         ,null             as "[objectname]"$I18N$RI
    from "[schemaname]"."[objectname]" t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t2.DISPLAY_VALUE
  ')
|| TO_CLOB('      ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY_USER
        ,t1.INS_BY_HOST
        ,t1.DML_AT
        ,t1.DML_BY_USER
        ,t1.DML_BY_HOST
        ,t1.DML_TYPE
        ,t2.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t2.ROW_FLAG_MASK as ROW_FLAG_MASK$I18N
        ,t1.OWNER
        ,t2.OWNER         as OWNER$I18N
        ,t1.rowid         as "[objectna')
|| TO_CLOB('me]"$RI
         ,t2.rowid         as "[objectname]"$I18N$RI
    from "[schemaname]"."[objectname]" t1
    left join "[schemaname]"."[objectname]"$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
--
--
--'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CC35063E0530101007FFBE7','en_US','Lookup table history indexes',18,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.610133000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$HIS-idx.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    29.11.2017  Tablespace clause added
* WWirns    13.08.2018  Refactor with usage of more placeholders
*******************************************************************************/
--
--
create index "[schem')
|| TO_CLOB('aname]"."[objectname]"$HIS$IX00 on "[schemaname]"."[objectname]"$HIS(KEY_VALUE
                                                                                        ,DML_AT)
--
tablespace "[tablespace-idx]";
--
--
--'),1,2,4);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CB75063E0530101007FFBE7','en_US','Lookup table TAGs',6,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.507477000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$TAG.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
*
* 
*
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    05.04.2018  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST
*******************************************************************************/
--
--
crea')
|| TO_CLOB('te table "[schemaname]"."[objectname]"$TAG(KEY_VALUE varchar2(32 char) not null
                                              ,OWNER varchar2(128 char) not null
                                              ,TAG varchar2(128 char) not null
                                              ,NOTICE varchar2(4000 char)
                                              ,INS_AT        date default on null sysdate not null
                                              ,INS_BY_USER   varchar2(255 char) default')
|| TO_CLOB(' on null user not null
                                              ,INS_BY_HOST   varchar2(255 char) default on null SYS_CONTEXT(''USERENV''
                                                                                                           ,''HOST''
                                                                                                           ,255) not null
                                              ,DML_AT        timestamp default on null systimestamp not null
             ')
|| TO_CLOB('                                 ,DML_BY_USER   varchar2(255 char) default on null user not null
                                              ,DML_BY_HOST   varchar2(255 char) default on null SYS_CONTEXT(''USERENV''
                                                                                                           ,''HOST''
                                                                                                           ,255) not null
                                              ,D')
|| TO_CLOB('ML_TYPE      varchar2(1 char) default on null ''I'' not null
                                              ,ROW_FLAG_MASK number(6) default 0 not null
                                               --
                                               )
--
tablespace "[tablespace-dat]";
--
--
comment on table "[schemaname]"."[objectname]"$TAG is ''Any User-/Process-Tags for rows of table "[schemaname]"."[objectname]"'';
--
--
comment on column "[schemaname]"."[objectname]"$TAG.KEY_VALUE is ''Key value, l')
|| TO_CLOB('inks to table "[schemaname]"."[objectname]"'';
--
comment on column "[schemaname]"."[objectname]"$TAG.OWNER is ''Owner of the row, links to table DL_COMMON.OWNERS'';
--
comment on column "[schemaname]"."[objectname]"$TAG.TAG is ''Free defined tag only valid in context of the owner'';
--
comment on column "[schemaname]"."[objectname]"$TAG.NOTICE is '''';
--
comment on column "[schemaname]"."[objectname]"$TAG.INS_AT is ''Inserted at'';
--
comment on column "[schemaname]"."[objectname]"$TAG.INS_BY_USER is ''')
|| TO_CLOB('Inserted by'';
--
comment on column "[schemaname]"."[objectname]"$TAG.INS_BY_HOST is ''Inserted by'';
--
comment on column "[schemaname]"."[objectname]"$TAG.DML_AT is ''Last executed DML at'';
--
comment on column "[schemaname]"."[objectname]"$TAG.DML_BY_USER is ''Last executed DML by'';
--
comment on column "[schemaname]"."[objectname]"$TAG.DML_BY_HOST is ''Last executed DML by'';
--
comment on column "[schemaname]"."[objectname]"$TAG.DML_TYPE is ''Last executed DML-Action: ''''I'''' => Insert, ''''U'''' => Upda')
|| TO_CLOB('te, ''''D'''' => Delete'';
--
comment on column "[schemaname]"."[objectname]"$TAG.ROW_FLAG_MASK is ''Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !'';
--
--
alter table "[schemaname]"."[objectname]"$TAG add constraint "[objectname]"$TAG$PK primary key(KEY_VALUE
                                                                                              ,OWNER
                                      ')
|| TO_CLOB('                                                        ,TAG)
  using index
--
tablespace "[tablespace-idx]";
--
--
alter table "[schemaname]"."[objectname]"$TAG add constraint "[objectname]"$TAG$CK01 check(DML_TYPE in (''I''
                                                                                                       ,''U''));
--
--
--'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CBC5063E0530101007FFBE7','en_US','Lookup table I18N view',11,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.545077000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\View\[schemaname].[objectname]#I18N.sql',TO_CLOB('--
--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
* 
* 
* 
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    04.04.2018  INS_* columns added
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST
******************************************')
|| TO_CLOB('*************************************/
--
--
create or replace view "[schemaname]"."[objectname]"#I18N as
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY_USER
        ,t1.INS_BY_HOST
        ,t1.DML_AT
        ,t1.DML_BY_USER
        ,t1.DML_BY_HOST
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NOTICE')
|| TO_CLOB('        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,null             as ROW_FLAG_MASK$I18N
        ,t1.OWNER
        ,null             as OWNER$I18N
        ,t1.rowid         as "[objectname]"$RI
         ,null             as "[objectname]"$I18N$RI
    from "[schemaname]"."[objectname]" t1
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE        as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE as DISPLAY_VALUE$DLC
        ,t1.DISP')
|| TO_CLOB('LAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY_USER
        ,t1.INS_BY_HOST
        ,t1.DML_AT
        ,t1.DML_BY_USER
        ,t1.DML_BY_HOST
        ,t1.DML_TYPE
        ,t2.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t2.ROW_FLAG_MASK as ROW_FLAG_MASK$I18N
        ,t1.OWNER
        ,t2.OWNER         as OWNER$I18N
        ,t1.rowid         as "[objectname]"$RI
         ,t2.rowid         as "[objectname]"$I18N$RI
')
|| TO_CLOB('    from "[schemaname]"."[objectname]" t1
   inner join "[schemaname]"."[objectname]"$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
--
--
--'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CB85063E0530101007FFBE7','en_US','Lookup table TAGs history',7,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.515750000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$TAG$HIS.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
*
* 
*
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    05.04.2018  Added
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST
*******************************************************************************/
--
--
crea')
|| TO_CLOB('te table "[schemaname]"."[objectname]"$TAG$HIS(KEY_VALUE varchar2(32 char) not null
                                                  ,OWNER varchar2(128 char) not null
                                                  ,TAG varchar2(128 char) not null
                                                  ,NOTICE varchar2(4000 char)
                                                  ,INS_AT date not null
                                                  ,INS_BY_USER varchar2(255 char) not null
       ')
|| TO_CLOB('                                           ,INS_BY_HOST varchar2(255 char) not null
                                                  ,DML_AT timestamp not null
                                                  ,DML_BY_USER varchar2(255 char) not null
                                                  ,DML_BY_HOST varchar2(255 char) not null
                                                  ,DML_TYPE varchar2(1 char) not null
                                                  ,ROW_FLAG_MASK number')
|| TO_CLOB('(6)
                                                   --
                                                   )
--
tablespace "[tablespace-dat]";
--
--
comment on table "[schemaname]"."[objectname]"$TAG$HIS is ''Historical rows of table "[schemaname]"."[objectname]"$TAGS'';
--
--
alter table "[schemaname]"."[objectname]"$TAG$HIS add constraint "[objectname]"$TAG$HIS$CK00 check(DML_TYPE in (''I''
                                                                                                          ')
|| TO_CLOB('     ,''U''
                                                                                                               ,''D''));
--
--
--'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CB35063E0530101007FFBE7','en_US','Lookup table',2,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.473924000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname].sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
*
*
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    29.11.2017  Tablespace clause added
* WWirns    04.04.2018  INS_* columns added
* WWirns    10.04.2018  Add column OWNER
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Rep')
|| TO_CLOB('lace *_BY with *_BY_USER and *_BY_HOST
*******************************************************************************/
--
--
create table "[schemaname]"."[objectname]"(KEY_VALUE     varchar2(32 char) default on null SYS_GUID() not null
                                          ,LOCALE        varchar2(5 char) default on null ''en_US'' not null
                                          ,DISPLAY_VALUE varchar2(128 char) not null
                                          ,DISPLAY_ORDER integer
      ')
|| TO_CLOB('                                    ,IS_ACTIVE     varchar2(1 char) default on null ''Y'' not null
                                          ,INS_AT        date default on null sysdate not null
                                          ,INS_BY_USER   varchar2(255 char) default on null user not null
                                          ,INS_BY_HOST   varchar2(255 char) default on null SYS_CONTEXT(''USERENV''
                                                                                        ')
|| TO_CLOB('               ,''HOST''
                                                                                                       ,255) not null
                                          ,DML_AT        timestamp default on null systimestamp not null
                                          ,DML_BY_USER   varchar2(255 char) default on null user not null
                                          ,DML_BY_HOST   varchar2(255 char) default on null SYS_CONTEXT(''USERENV''
                                  ')
|| TO_CLOB('                                                                     ,''HOST''
                                                                                                       ,255) not null
                                          ,DML_TYPE      varchar2(1 char) default on null ''I'' not null
                                          ,NOTICE varchar2(4000 char)
                                          ,NUM_VALUE number(32)
                                          ,ROW_FLAG_MASK number(6) d')
|| TO_CLOB('efault 0 not null
                                          ,OWNER varchar2(128 char)
                                           --
                                           )
--
tablespace "[tablespace-dat]";
--
--
comment on table "[schemaname]"."[objectname]" is '''';
--
--
comment on column "[schemaname]"."[objectname]".KEY_VALUE is ''Key value (Primary key)'';
--
comment on column "[schemaname]"."[objectname]".LOCALE is ''Localisation of all character columns of the row, links to table DL_COMMO')
|| TO_CLOB('N.LOCALES'';
--
comment on column "[schemaname]"."[objectname]".DISPLAY_VALUE is '''';
--
comment on column "[schemaname]"."[objectname]".DISPLAY_ORDER is '''';
--
comment on column "[schemaname]"."[objectname]".IS_ACTIVE is '''';
--
comment on column "[schemaname]"."[objectname]".INS_AT is ''Inserted at'';
--
comment on column "[schemaname]"."[objectname]".INS_BY_USER is ''Inserted by'';
--
comment on column "[schemaname]"."[objectname]".INS_BY_HOST is ''Inserted by'';
--
comment on column "[schemaname]"."[')
|| TO_CLOB('objectname]".DML_AT is ''Last executed DML at'';
--
comment on column "[schemaname]"."[objectname]".DML_BY_USER is ''Last executed DML by'';
--
comment on column "[schemaname]"."[objectname]".DML_BY_HOST is ''Last executed DML by'';
--
comment on column "[schemaname]"."[objectname]".DML_TYPE is ''Last executed DML-Action: ''''I'''' => Insert, ''''U'''' => Update, ''''D'''' => Delete'';
--
comment on column "[schemaname]"."[objectname]".NOTICE is '''';
--
comment on column "[schemaname]"."[objectname]".NUM_VALUE is ''N')
|| TO_CLOB('umerical key value (Unique key)'';
--
comment on column "[schemaname]"."[objectname]".ROW_FLAG_MASK is ''Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !'';
--
comment on column "[schemaname]"."[objectname]".OWNER is ''Owner of the row, links to table DL_COMMON.OWNERS'';
--
--
alter table "[schemaname]"."[objectname]" add constraint "[objectname]"$PK primary key(KEY_VALUE)
  using index
--
tablespa')
|| TO_CLOB('ce "[tablespace-idx]";
--
--
alter table "[schemaname]"."[objectname]" add constraint "[objectname]"$UQ00 unique(NUM_VALUE)
  using index
--
tablespace "[tablespace-idx]";
--
--
alter table "[schemaname]"."[objectname]" add constraint "[objectname]"$CK00 check(KEY_VALUE = upper(KEY_VALUE));
--
alter table "[schemaname]"."[objectname]" add constraint "[objectname]"$CK01 check(LOCALE = ''en_US'');
--
alter table "[schemaname]"."[objectname]" add constraint "[objectname]"$CK02 check(IS_ACTIVE in (''Y''')
|| TO_CLOB('
                                                                                                ,''N''));
--
alter table "[schemaname]"."[objectname]" add constraint "[objectname]"$CK03 check(DML_TYPE in (''I''
                                                                                               ,''U''));
--
--
--'),1,2,5);
Insert into DL_DBA.TEMPLATES (KEY_VALUE,LOCALE,DISPLAY_VALUE,DISPLAY_ORDER,IS_ACTIVE,INS_AT,INS_BY,DML_AT,DML_BY,DML_TYPE,NOTICE,NUM_VALUE,ROW_FLAG_MASK,OWNER,TEMPLATE_KEY,TEMPLATE_VAL,MAJOR,MINOR,PATCH) values ('7367B4380CB65063E0530101007FFBE7','en_US','Lookup table I18N history',5,'Y',to_timestamp('23-NOV-18','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001',to_timestamp('23-NOV-18 10.07.38.499440000 PM','DD-MON-RR HH.MI.SSXFF AM'),'oracle @sqlplus@tibpbio-db001 (TNS V1-V3) - tibpbio-db001','U',null,null,33,'DL_DBA','LOOKUP:Source\DataObjects\Table\[schemaname].[objectname]$I18N$HIS.sql',TO_CLOB('--
select sysdate
  from dual;
--
--
/*******************************************************************************
* ???
*
* 
*
* Author    Date        Description
* --------  ----------  -------------------------------------------------------*
* WWirns    27.09.2017  Added
* WWirns    29.11.2017  Tablespace clause added
* WWirns    04.04.2018  INS_* columns added
* WWirns    13.08.2018  Refactor with usage of more placeholders
* WWirns    30.08.2018  Replace *_BY with *_BY_USER and *_BY_HOST')
|| TO_CLOB('
*******************************************************************************/
--
--
create table "[schemaname]"."[objectname]"$I18N$HIS(KEY_VALUE varchar2(32 char) not null
                                                   ,LOCALE varchar2(5 char) not null
                                                   ,DISPLAY_VALUE varchar2(128 char)
                                                   ,INS_AT date not null
                                                   ,INS_BY_USER varchar2(255 cha')
|| TO_CLOB('r) not null
                                                   ,INS_BY_HOST varchar2(255 char) not null
                                                   ,DML_AT timestamp not null
                                                   ,DML_BY_USER varchar2(255 char) not null
                                                   ,DML_BY_HOST varchar2(255 char) not null
                                                   ,DML_TYPE varchar2(1 char) not null
                                               ')
|| TO_CLOB('    ,NOTICE varchar2(4000 char)
                                                   ,ROW_FLAG_MASK number(6)
                                                   ,OWNER varchar2(128 char)
                                                    --
                                                    )
--
tablespace "[tablespace-dat]";
--
--
comment on table "[schemaname]"."[objectname]"$I18N$HIS is ''Historical rows of table "[schemaname]"."[objectname]"$I18N'';
--
--
alter table "[schemaname]"."[objectnam')
|| TO_CLOB('e]"$I18N$HIS add constraint "[objectname]"$I18N$HIS$CK00 check(DML_TYPE in (''I''
                                                                                                                 ,''U''
                                                                                                                 ,''D''));
--
--
--'),1,2,5);

29 rows selected. 

