CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."FACE_QUALITY_TYPES$BIUR" BEFORE
    INSERT OR UPDATE ON dl_blacklist.face_quality_types
    FOR EACH ROW
BEGIN
    IF
        inserting
    THEN
        :new.ins_by := dl_common.pkg_session.get_audit_user ();
        :new.ins_at := systimestamp;
        :new.dml_by := dl_common.pkg_session.get_audit_user ();
        :new.dml_at := systimestamp;
        :new.dml_type := 'I';
    ELSIF updating THEN
        :new.ins_by :=:old.ins_by;
        :new.ins_at :=:old.ins_at;
        :new.dml_by := dl_common.pkg_session.get_audit_user ();
        :new.dml_at := systimestamp;
        :new.dml_type := 'U';
    END IF;
END;
/
ALTER TRIGGER "DL_BLACKLIST"."FACE_QUALITY_TYPES$BIUR" ENABLE;
