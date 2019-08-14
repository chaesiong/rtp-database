CREATE OR REPLACE EDITIONABLE TRIGGER "DL_COMMON"."MODULE_VERSIONS$TIUD0" 
  instead of insert or update or delete on DL_COMMON.MODULE_VERSIONS
  for each row
declare
  --
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    07.12.2017  Added
  * WWirns    12.07.2018  Changed from table to view
  *******************************************************************************/
  --
begin
  --
  --
  if (INSERTING())
  then
    --
    insert into DL_DBA.MODULE_INSTALLS
      (KEY_VALUE
      ,TITLE
      ,REMARK
      ,MAJOR
      ,MINOR
      ,PATCH
      ,ADDITIONAL_VERSION_NUMBER
      ,START_INVALID_DB_OBJECTS
      ,END_INVALID_DB_OBJECTS
      ,END_EXIT_CODE
       --
       )
    values
      (:new.KEY_VALUE
      ,:new.TITLE
      ,:new.REMARK
      ,:new.MAJOR
      ,:new.MINOR
      ,:new.PATCH
      ,:new.ADDITIONAL_VERSION_NUMBER
      ,nvl(:new.START_INVALID_DB_OBJECTS
          ,-1)
      ,nvl(:new.END_INVALID_DB_OBJECTS
          ,-1)
      ,nvl(:new.END_EXIT_CODE
          ,-1)
       --
       );
    --
  elsif (UPDATING())
  then
    --
    update DL_DBA.MODULE_INSTALLS u
       set u.KEY_VALUE                 = :new.KEY_VALUE
          ,u.TITLE                     = :new.TITLE
          ,u.REMARK                    = :new.REMARK
          ,u.MAJOR                     = :new.MAJOR
          ,u.MINOR                     = :new.MINOR
          ,u.PATCH                     = :new.PATCH
          ,u.ADDITIONAL_VERSION_NUMBER = :new.ADDITIONAL_VERSION_NUMBER
          ,u.START_INVALID_DB_OBJECTS  = nvl(:new.START_INVALID_DB_OBJECTS
                                            ,:old.START_INVALID_DB_OBJECTS)
          ,u.END_INVALID_DB_OBJECTS    = nvl(:new.END_INVALID_DB_OBJECTS
                                            ,:old.END_INVALID_DB_OBJECTS)
          ,u.END_EXIT_CODE             = nvl(:new.END_EXIT_CODE
                                            ,:old.END_EXIT_CODE)
     where u.KEY_VALUE = :old.KEY_VALUE;
    --
  elsif (DELETING())
  then
    --
    delete from DL_DBA.MODULE_INSTALLS d
     where d.KEY_VALUE = :old.KEY_VALUE;
    --
  else
    --
    Raise_application_error(-20000
                           ,'Could not determine a value for v_DML_TYPE!');
    --
  end if;
  --
end MODULE_VERSIONS$TIUD0;
/
ALTER TRIGGER "DL_COMMON"."MODULE_VERSIONS$TIUD0" ENABLE;
