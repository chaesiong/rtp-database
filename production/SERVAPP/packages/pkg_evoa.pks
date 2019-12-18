CREATE OR REPLACE EDITIONABLE PACKAGE "SERVAPP"."PKG_EVOA" IS
    --
    --
    FUNCTION get_visa_text (
        p_ip_address IN mscs_voa_checkpointlist.ipaddress%TYPE
    ) 
    RETURN mscs_voa_checkpoint.fixtext%TYPE;
    --
    --
    --
    FUNCTION get_visa_number (
        p_ip_address IN mscs_voa_checkpointlist.ipaddress%TYPE
    ) 
    RETURN mscs_voa_checkpoint.visano%TYPE;
    --
    --
    --
    PROCEDURE update_visa_number (
        p_ip_address IN mscs_voa_checkpointlist.ipaddress%TYPE,
        p_visa_no    IN mscs_voa_checkpoint.visano%TYPE
    );
    --
    --
END PKG_EVOA;
/
