CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_DL_HISTORY" IS

    -- Author  : MTheis
    -- Created : 2019-02-18
    -- Purpose : Utilities for Reporting the History Data

    FUNCTION get_changes_history_from_table (
        i_table_name    VARCHAR2,
        i_column_list   CLOB,
        i_key_value     VARCHAR2
    ) RETURN CLOB;

    FUNCTION get_changes_history_from_blacklist_table (
        i_table_name    VARCHAR2,
        i_column_list   VARCHAR2,
        i_key_value     VARCHAR2
    ) RETURN CLOB;

END pkg_dl_history;
/
