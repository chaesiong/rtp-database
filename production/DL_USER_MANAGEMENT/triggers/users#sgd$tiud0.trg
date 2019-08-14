CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."USERS#SGD$TIUD0" 
  instead of insert or update or delete on DL_USER_MANAGEMENT.USERS#SGD
declare
  --
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    01.08.2018  Added
  * MStahl    24.08.2018  Added phone number
  *******************************************************************************/
  --
  v_DML_TYPE char(1);
  v_ID       USERS.ID%type;
  --
  --
  --
  procedure L_Set_DML_TYPE(p_Prevent_EXCE in boolean default false) is
  begin
    if (INSERTING())
    then
      v_DML_TYPE := 'I';
    elsif (UPDATING())
    then
      v_DML_TYPE := 'U';
    elsif (DELETING())
    then
      v_DML_TYPE := 'D';
    else
      if (not nvl(p_Prevent_EXCE
                 ,false))
      then
        Raise_application_error(-20000
                               ,'Could not determine a value for v_DML_TYPE!');
      end if;
    end if;
  end L_Set_DML_TYPE;
  --
begin
  --
  --
  L_Set_DML_TYPE(true);
  --
  --
  case v_DML_TYPE
    when 'I' then
      -- 'I'
      insert into USERS i
        (ID
        ,USERNAME
        ,FIRST_NAME
        ,LAST_NAME
        ,MAIL_ADDRESS
        ,PHONE_NUMBER
        ,STATE
        ,PW_HASH
        ,PW_SALT
        ,PW_ITERATION_COUNT
        ,PW_EXPIRATION_DATE
        ,PW_MUST_BE_CHANGED
        ,LOCALE
        ,INS_AT
        ,INS_BY
        ,DML_AT
        ,DML_BY
        ,DML_TYPE
        ,ROW_FLAG_MASK
        ,TAG
        ,PW_EXPIRE
        )
      values
        (:new.ID
        ,:new.USERNAME
        ,:new.FIRST_NAME
        ,:new.LAST_NAME
        ,:new.MAIL_ADDRESS
        ,:new.PHONE_NUMBER
        ,:new.STATE
        ,:new.PW_HASH
        ,:new.PW_SALT
        ,:new.PW_ITERATION_COUNT
        ,:new.PW_EXPIRATION_DATE
        ,:new.PW_MUST_BE_CHANGED
        ,:new.LOCALE
        ,:new.INS_AT
        ,:new.INS_BY
        ,:new.DML_AT
        ,:new.DML_BY
        ,:new.DML_TYPE
        ,:new.ROW_FLAG_MASK
        ,:new.TAG
        ,1
         --
         )
      returning i.ID into v_ID;
      --
      insert into USERS$SGD i
        (ID
         ,LAST_LOGIN
         ,BAD_PASSWORD_COUNT
         ,SET_EXPIRED
        )
      values
        (v_ID
        ,:new.LAST_LOGIN
        ,:new.BAD_PASSWORD_COUNT
        ,:new.SET_EXPIRED
         --
         );
      --
    when 'U' then
      -- 'U'
      update USERS u
         set u.ID                 = :new.ID
            ,u.USERNAME           = :new.USERNAME
            ,u.FIRST_NAME         = :new.FIRST_NAME
            ,u.LAST_NAME          = :new.LAST_NAME
            ,u.MAIL_ADDRESS       = :new.MAIL_ADDRESS
            ,u.PHONE_NUMBER       = :new.PHONE_NUMBER
            ,u.STATE              = :new.STATE
            ,u.PW_HASH            = :new.PW_HASH
            ,u.PW_SALT            = :new.PW_SALT
            ,u.PW_ITERATION_COUNT = :new.PW_ITERATION_COUNT
            ,u.PW_EXPIRATION_DATE = :new.PW_EXPIRATION_DATE
            ,u.PW_MUST_BE_CHANGED = :new.PW_MUST_BE_CHANGED
            ,u.ROW_FLAG_MASK      = :new.ROW_FLAG_MASK
            ,u.TAG                = :new.TAG
       where u.ID = :old.ID;
      --
      update USERS$SGD u
         set u.LAST_LOGIN         = :new.LAST_LOGIN
            ,u.BAD_PASSWORD_COUNT = :new.BAD_PASSWORD_COUNT
            ,u.SET_EXPIRED        = :new.SET_EXPIRED
       where u.ID = :old.ID;
      --
    else
      -- 'D'
      delete from USERS d
       where d.ID = :old.ID;
      --
  end case;
  --
end USERS#SGD$TIUD0;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."USERS#SGD$TIUD0" ENABLE;
