CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."BLACKLIST_CASES$BIUR" 
    BEFORE INSERT OR UPDATE ON DL_BLACKLIST.BLACKLIST_CASES
    FOR EACH ROW
BEGIN
    IF inserting THEN
        :new.ins_by   := coalesce(:new.ins_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.ins_at   := coalesce(:new.ins_at
                                 ,systimestamp);
        :new.dml_by   := coalesce(:new.dml_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.dml_at   := coalesce(:new.dml_at
                                 ,systimestamp);
        :new.dml_type := 'I';
        -- call dl_blacklist.pkg_utils.create_a_case_id if case_id is null
        -- otherwise take the given value because we assume that it is a pibics load
        IF :new.case_number IS NULL THEN
            :new.case_number := pkg_utils.create_a_case_number();
        END IF;
    ELSIF updating THEN
        :new.ins_by   := :old.ins_by;
        :new.ins_at   := :old.ins_at;
        :new.dml_by   := coalesce(:new.dml_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.dml_at   := coalesce(:new.dml_at
                                 ,systimestamp);
        :new.dml_type := 'U';
    END IF;
END;
/
ALTER TRIGGER "DL_BLACKLIST"."BLACKLIST_CASES$BIUR" ENABLE;
