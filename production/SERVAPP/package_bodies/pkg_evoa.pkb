CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."PKG_EVOA" IS
    --
    --
    FUNCTION get_visa_text (
        p_ip_address IN mscs_voa_checkpointlist.ipaddress%TYPE
    ) 
    RETURN mscs_voa_checkpoint.fixtext%TYPE IS
        l_visa_text mscs_voa_checkpoint.fixtext%TYPE;
    BEGIN

        SELECT vcp.fixtext
        INTO l_visa_text
        FROM mscs_voa_checkpoint vcp, mscs_voa_checkpointlist vcpl
        WHERE vcp.cp_seqno = vcpl.cp_seqno
        AND vcpl.ipaddress = p_ip_address;

        RETURN l_visa_text;

    END get_visa_text;
    --
    --
    --
    FUNCTION get_visa_number (
        p_ip_address IN mscs_voa_checkpointlist.ipaddress%TYPE
    ) 
    RETURN mscs_voa_checkpoint.visano%TYPE IS
        l_visa_no mscs_voa_checkpoint.visano%TYPE;
    BEGIN
        
        SELECT vcp.visano
        INTO l_visa_no
        FROM mscs_voa_checkpoint vcp, mscs_voa_checkpointlist vcpl
        WHERE vcp.cp_seqno = vcpl.cp_seqno
        AND vcpl.ipaddress = p_ip_address;

        RETURN l_visa_no;
    
    END get_visa_number;
    --
    --
    --
    PROCEDURE update_visa_number (
        p_ip_address IN mscs_voa_checkpointlist.ipaddress%TYPE,
        p_visa_no    IN mscs_voa_checkpoint.visano%TYPE
    ) 
    IS
        l_cp_seqno   mscs_voa_checkpoint.cp_seqno%TYPE;
        l_visa_no    mscs_voa_checkpoint.visano%TYPE;
    BEGIN
        
        SELECT vcp.cp_seqno, vcp.visano
        INTO l_cp_seqno, l_visa_no
        FROM mscs_voa_checkpoint vcp, mscs_voa_checkpointlist vcpl
        WHERE vcp.cp_seqno = vcpl.cp_seqno
        AND vcpl.ipaddress = p_ip_address;

        IF NVL(p_visa_no, 0) > 0 THEN
            UPDATE mscs_voa_checkpoint SET
                visano = p_visa_no
            WHERE cp_seqno = l_cp_seqno;
        END IF;
    
    END update_visa_number;
    --
    --
END PKG_EVOA;
/
  GRANT EXECUTE ON "SERVAPP"."PKG_EVOA" TO "DL_BORDERCONTROL";
