CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."F_GET_PIBICS_IMG" 
    (
        p_image_type        IN VARCHAR2,
        p_pk_val            IN VARCHAR2,
        p_mvmnt_src         IN VARCHAR2 DEFAULT NULL
    )
RETURN BLOB
AS
    l_blob      blob;

    l_sql_err_code  NUMBER;
    l_sql_err_msg   VARCHAR2(4000);
BEGIN

    -- param check
    IF 
        NVL(p_image_type, '~') NOT IN ('PASSPORT', 'MOVEMENT')
        OR TRIM(p_pk_val) IS NULL
        OR (p_image_type = 'MOVEMENT' AND p_mvmnt_src IS NULL)
    THEN
        RETURN NULL;
    END IF;

    -- reset for the session
    DELETE FROM pibicsdm2.gtt_pibics_images
    WHERE created_at <= SYSDATE - 15/24/60 -- 15 mins
    OR (image_type = p_image_type AND pk_value = p_pk_val AND NVL(mvmnt_src, '~') = NVL(p_mvmnt_src, '~'));

    -- fetch
    IF p_image_type = 'PASSPORT' THEN
        INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, image_blob)
        SELECT p_image_type, personid, imgpass FROM pibics.immigration@pibics_prod 
        WHERE personid = p_pk_val;
    ELSIF p_image_type = 'MOVEMENT' THEN
        CASE p_mvmnt_src
            WHEN 'TMINOUT_MA' THEN
                --
                INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, mvmnt_src, image_blob)
                SELECT p_image_type, seqno, p_mvmnt_src, imginout
                FROM pibics.tminout_ma@pibics_prod
                WHERE seqno = p_pk_val;
                --
            WHEN 'TMINOUT' THEN
                --
                INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, mvmnt_src, image_blob)
                SELECT p_image_type, seqno, p_mvmnt_src, imginout
                FROM pibics.tminout@pibics_prod
                WHERE seqno = p_pk_val;
                --
            WHEN 'TMMAIN_IN' THEN
                --
                INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, mvmnt_src, image_blob)
                SELECT p_image_type, tmrunno, p_mvmnt_src, inimg
                FROM pibics.tmmain@pibics_prod
                WHERE tmrunno = p_pk_val;
                --
            WHEN 'TMMAIN_OUT' THEN
                --
                INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, mvmnt_src, image_blob)
                SELECT p_image_type, tmrunno, p_mvmnt_src, outimg
                FROM pibics.tmmain@pibics_prod
                WHERE tmrunno = p_pk_val;
                --
            ELSE
                RETURN NULL;
        END CASE;
    END IF;

    -- get the locator
    SELECT image_blob
    INTO l_blob
    FROM pibicsdm2.gtt_pibics_images
    WHERE image_type = p_image_type 
    AND pk_value = p_pk_val
    AND NVL(mvmnt_src, '~') = NVL(p_mvmnt_src, '~')
    AND ROWNUM = 1;

    -- DEV temp only
    /*INSERT INTO pibicsdm2.xxtmp_mps (msg)
    VALUES ('LENGTH: ' || dbms_lob.getlength(l_blob));*/

    -- preserve on commit; close dblink transaction
    COMMIT;

    -- return
    RETURN l_blob;

EXCEPTION
    WHEN OTHERS THEN
        -- DEV temp only --
        /*l_sql_err_msg := SUBSTR(SQLERRM, 1, 4000);
        --
        INSERT INTO pibicsdm2.xxtmp_mps (msg)
        VALUES (l_sql_err_msg);*/
        -- DEV temp only --
        --
        COMMIT;
        --
        RETURN NULL;

END F_GET_PIBICS_IMG;
/
