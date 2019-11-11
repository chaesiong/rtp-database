CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_USER_MANAGEMENT"."DROP_DB_OBJ" (p_FROM_SCHEMA   in varchar2
                                                          ,p_Drop_Objects  in boolean default true
                                                          ,p_Create_Prefix in varchar2 default null
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
  * WWirns    22.08.2018  Added
  * WWirns    23.08.2018  Overwork the rights
  *******************************************************************************/
  --
begin
  --
  --
  if (nvl(p_Drop_Objects
         ,true))
  then
    DROP_DB_OBJ$AICU(p_FROM_SCHEMA
                    ,p_Create_Prefix
                     --
                     );
  end if;
  --
  --
  DROP_DB_OBJ$AIDF(p_FROM_SCHEMA);
  --
end DROP_DB_OBJ;
/
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DROP_DB_OBJ" TO PUBLIC;
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DROP_DB_OBJ" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DROP_DB_OBJ" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DROP_DB_OBJ" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_USER_MANAGEMENT"."DROP_DB_OBJ" TO "BIOSAADM";
