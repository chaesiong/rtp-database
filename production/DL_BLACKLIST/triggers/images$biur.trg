CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."IMAGES$BIUR" BEFORE
    INSERT OR UPDATE ON dl_blacklist.images
    FOR EACH ROW
BEGIN
    IF
        inserting
    THEN
        :new.CREATED_BY := dl_common.pkg_session.get_audit_user ();
        :new.CREATED_AT := systimestamp;
        :new.LAST_UPDATED_BY := dl_common.pkg_session.get_audit_user ();
        :new.LAST_UPDATED_AT := systimestamp;
        :new.dml_type := 'I';
    ELSIF updating THEN
        :new.CREATED_BY :=:old.CREATED_BY;
        :new.CREATED_AT :=:old.CREATED_AT;
        :new.LAST_UPDATED_BY := dl_common.pkg_session.get_audit_user ();
        :new.LAST_UPDATED_AT := systimestamp;
        :new.dml_type := 'U';
    END IF;
END;
/
ALTER TRIGGER "DL_BLACKLIST"."IMAGES$BIUR" ENABLE;
