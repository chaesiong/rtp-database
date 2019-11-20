CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."F_GET_PIBICS_IMG" 
    (
        p_image_type        IN VARCHAR2,
        p_pk_val            IN VARCHAR2,
        p_mvmnt_src         IN VARCHAR2 DEFAULT NULL,
        p_docno             IN VARCHAR2 DEFAULT NULL
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
    OR (image_type = p_image_type AND pk_value = p_pk_val AND NVL(mvmnt_src, '~') = NVL(p_mvmnt_src, '~') AND NVL(docno, '~') = NVL(p_docno, '~'));
    
    -- fetch
    IF p_image_type = 'PASSPORT' THEN
        IF p_docno IS NULL THEN -- for backward compatibility
            INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, image_blob)
            SELECT p_image_type, personid, imgpass FROM pibics.immigration@pibics_prod 
            WHERE personid = p_pk_val;
        ELSE
            -- 1: check in IMMIGRATION
            BEGIN
                INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, image_blob, docno)
                SELECT p_image_type, personid, imgpass, tdtno FROM pibics.immigration@pibics_prod 
                WHERE personid = p_pk_val
                AND tdtno = p_docno;
                
                IF SQL%ROWCOUNT = 0 THEN
                    RAISE NO_DATA_FOUND;
                END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    -- 2: check in IMMIGRATIONHIST
                    INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, image_blob, docno)
                    SELECT p_image_type, personid, imgpass, tdtno FROM pibics.immigrationhist@pibics_prod 
                    WHERE personid = p_pk_val
                    AND tdtno = p_docno
                    AND ROWNUM = 1;
            END;
        END IF;
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
                -- 1: check in TMINOUT
                BEGIN
                    INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, mvmnt_src, image_blob)
                    SELECT p_image_type, seqno, p_mvmnt_src, imginout
                    FROM pibics.tminout@pibics_prod
                    WHERE seqno = p_pk_val;
                    
                    IF SQL%ROWCOUNT = 0 THEN
                        RAISE NO_DATA_FOUND;
                    END IF;
                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        -- 2: check in TMMAIN_IN
                        BEGIN
                            INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, mvmnt_src, image_blob)
                            SELECT p_image_type, inseqno, p_mvmnt_src, inimg
                            FROM pibics.tmmain@pibics_prod
                            WHERE inseqno = p_pk_val;
                            
                            IF SQL%ROWCOUNT = 0 THEN
                                RAISE NO_DATA_FOUND;
                            END IF;
                        EXCEPTION
                            WHEN NO_DATA_FOUND THEN
                                -- 3: check in TMMAIN_OUT
                                INSERT INTO pibicsdm2.gtt_pibics_images (image_type, pk_value, mvmnt_src, image_blob)
                                SELECT p_image_type, outseqno, p_mvmnt_src, outimg
                                FROM pibics.tmmain@pibics_prod
                                WHERE outseqno = p_pk_val;
                        END;
                END;
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
    AND NVL(docno, '~') = NVL(p_docno, '~')
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
  GRANT EXECUTE ON "PIBICSDM2"."F_GET_PIBICS_IMG" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "PIBICSDM2"."F_GET_PIBICS_IMG" TO "PIBICSAPP";
  GRANT EXECUTE ON "PIBICSDM2"."F_GET_PIBICS_IMG" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."F_GET_PIBICS_IMG" TO "BIOSAADM";
