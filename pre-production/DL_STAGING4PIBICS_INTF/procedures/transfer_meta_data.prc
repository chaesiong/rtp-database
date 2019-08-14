CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."TRANSFER_META_DATA" (p_process IN VARCHAR2) AUTHID DEFINER IS

    l_tag VARCHAR2(100 CHAR) := 'METADATA_SYNC_' || p_process || '  / ' ||
                                to_char(SYSDATE
                                       ,'YYYYMMDDHH24SS');
    l_cnt PLS_INTEGER;
BEGIN

    dbms_application_info.set_client_info(client_info => l_tag);
    dl_staging4pibics.pkg_operating.merge_transcode_table(p_process_name => p_process);

    SELECT coalesce(COUNT(*)
                   ,0)
    INTO l_cnt
    FROM dl_staging4pibics_intf.ops_sync_processes
    WHERE staging_table_name = p_process
    AND shall_be_processed = 'Y';
    IF l_cnt <> 0 THEN
        dl_staging4pibics_intf.pkg_operating.merge_transcode_table(p_process_name => p_process);
    END IF;
    dbms_output.put_line(l_tag);
END transfer_meta_data;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."TRANSFER_META_DATA" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."TRANSFER_META_DATA" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."TRANSFER_META_DATA" TO "TRAINEE";
