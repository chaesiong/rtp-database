CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_USER_MANAGEMENT"."INST_DB_OBJ" (p_TO_SCHEMA      in varchar2
                                                          ,p_Create_Objects in boolean default true
                                                          ,p_Create_Prefix  in varchar2 default null
                                                           --
                                                           ) authid current_user is
  --
  --
  /*******************************************************************************
  * ???
  *
  *
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * WWirns    30.07.2018  Added
  * WWirns    21.08.2018  Added ORG_UNITS
  * WWirns    23.08.2018  Overwork the rights
  *******************************************************************************/
  --
begin
  --
  /*
  --
  --
  select t.*
    from DBA_TAB_PRIVS t
   where 1 = 1
     and t.GRANTOR = 'DL_USER_MANAGEMENT'
     and t.GRANTEE = 'APEX_USER_MANAGEMENT'
  --
  ;
  --
  --
  select t.*
    from DBA_SYNONYMS t
   where 1 = 1
     and t.TABLE_OWNER = 'DL_USER_MANAGEMENT'
     and t.OWNER = 'APEX_USER_MANAGEMENT'
  --
  ;
  --
  --
  --
  select t.*
    from DBA_TAB_PRIVS t
   where 1 = 1
     and t.GRANTOR = 'DL_USER_MANAGEMENT'
     and t.GRANTEE != 'APEX_USER_MANAGEMENT'
  --
  ;
  --
  --
  select t.*
    from DBA_SYNONYMS t
   where 1 = 1
     and t.TABLE_OWNER = 'DL_USER_MANAGEMENT'
     and t.OWNER != 'APEX_USER_MANAGEMENT'
  --
  ;
  --
  */
  --
  INST_DB_OBJ$AIDF(p_TO_SCHEMA);
  --
  --
  if (nvl(p_Create_Objects
         ,true))
  then
    INST_DB_OBJ$AICU(p_TO_SCHEMA
                    ,p_Create_Prefix
                     --
                     );
  end if;
  --
end INST_DB_OBJ;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ" TO PUBLIC;
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."INST_DB_OBJ" TO "BIOSUPPORT";
