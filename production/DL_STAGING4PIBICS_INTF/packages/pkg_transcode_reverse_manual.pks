CREATE OR REPLACE EDITIONABLE PACKAGE "DL_STAGING4PIBICS_INTF"."PKG_TRANSCODE_REVERSE_MANUAL" AS

    FUNCTION get_conveyance_seqno_with_seqno (p_key_value IN trcd_conveyance.key_value%TYPE)
    RETURN trcd_conveyance.seqno%TYPE;

END pkg_transcode_reverse_manual;
/
