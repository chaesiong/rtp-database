CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_TMMAIN" AS

    gc_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';
    --
    -- P U B L I C
    --
    PROCEDURE prepare_control_table(p_batchsize IN NUMBER DEFAULT 100000) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope            logger_logs.scope%TYPE := gc_log_scope_prefix || 'merge_yyyymmdd';
        l_last_highest_tmrunno VARCHAR2(100);
        l_batchcount           INTEGER := 0;
    BEGIN
        logger.log('START'
                  ,l_log_scope);
        DELETE FROM dl_staging4pibics.cnt_tmmain;
        FOR r IN (SELECT tmrunno
                        ,trunc(coalesce(outdte
                                       ,indte)) AS indte_or_outdte_as_day
                        ,row_number() over(ORDER BY tmrunno DESC) AS rn
                  FROM tmmain@pibics
                  ORDER BY tmrunno DESC)
        LOOP
            l_batchcount := l_batchcount + 1;
            IF l_batchcount = 1 THEN
                l_last_highest_tmrunno := r.tmrunno;
                INSERT INTO dl_staging4pibics.cnt_tmmain
                    (highest_tmrunno_to_copy
                    ,higehst_tmrunno_inout_date_found)
                VALUES
                    (r.tmrunno
                    ,r.indte_or_outdte_as_day);

            END IF;
            IF l_batchcount = p_batchsize
               OR r.rn = SQL%ROWCOUNT THEN
                l_batchcount := 0;
                --    dbms_output.put_line(r.rn || ' is last line ');
                UPDATE dl_staging4pibics.cnt_tmmain
                SET lowest_tmrunno_to_copy          = r.tmrunno
                   ,lowest_tmrunno_inout_date_found = r.indte_or_outdte_as_day
                WHERE highest_tmrunno_to_copy = l_last_highest_tmrunno;
            END IF;
        END LOOP;
        COMMIT;
        logger.log('END'
                  ,l_log_scope);
    END prepare_control_table;

    PROCEDURE copy_to_staging(p_lowest_tmrunno_to_copy  IN cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                             ,p_highest_tmrunno_to_copy IN cnt_tmmain.highest_tmrunno_to_copy%TYPE) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope logger_logs.scope%TYPE := gc_log_scope_prefix || 'merge_yyyymmdd';
        l_cnt       NUMBER;
    BEGIN
        logger.log('START'
                  ,l_log_scope);
        MERGE INTO dl_staging4pibics.tmmain tgt
        USING (SELECT visabyrights
                     ,visadte
                     ,visaissue
                     ,visano
                     ,inpassportexpdte
                     ,inpassportisu
                     ,inpassportdte
                     ,inpermitdte
                     ,inpermitcd
                     ,invisatypecdorg
                     ,intm6no
                     ,intdtno
                     ,intdtcd
                     ,inconvregno
                     ,inconvcd
                     ,intravcd
                     ,indeptcd
                     ,indte
                     ,inseqno
                     ,nationcd
                     ,sex
                     ,efamilynm
                     ,emiddlenm
                     ,efirstnm
                     ,tfamilynm
                     ,tmiddlenm
                     ,tfirstnm
                     ,personid
                     ,tmrunno
                     ,flagfines
                     ,flagjoinpass
                     ,typedata
                     ,outdeptcdorg
                     ,indeptcdorg
                     ,outrpjseqno
                     ,inrpjseqno
                     ,pass_seqno
                     ,citizenid
                     ,outflightnumber
                     ,outflightprefix
                     ,inflightnumber
                     ,inflightprefix
                     ,outpermit_seqno
                     ,outdept_seqno
                     ,outvisatype_seqno
                     ,outconv_seqno
                     ,inpermit_seqno
                     ,count_seqno
                     ,indept_seqno
                     ,invisatype_seqno
                     ,inconv_seqno
                     ,outtm2inout_seqno
                     ,outtm5_seqno
                     ,outstatus
                     ,outpm_nonexpdte
                     ,outpm_non_quota
                     ,outpm_exexpdte
                     ,outpm_extension
                     ,outpm_reexpdte
                     ,outpm_re_entry
                     ,intm2inout_seqno
                     ,intm5_seqno
                     ,instatus
                     ,inpm_nonexpdte
                     ,inpm_non_quota
                     ,inpm_exexpdte
                     ,inpm_extension
                     ,inpm_reexpdte
                     ,inpm_re_entry
                     ,extid
                     ,outrescertno
                     ,inrescertno
                     ,flagmatch
                     ,outremark
                     ,inremark
                     ,outtargetno
                     ,intargetno
                     ,outintype
                     ,inintype
                     ,outvisaexpdte
                     ,invisaexpdte
                     ,birthdte
                     ,emsndxnm
                     ,elsndxnm
                     ,efsndxnm
                     ,tmsndxnm
                     ,tlsndxnm
                     ,tfsndxnm
                     ,matchprocessterm
                     ,matchprocessdte
                     ,matchprocessusr
                     ,outprocessterm
                     ,outprocessdte
                     ,outprocessusr
                     ,outupdterm
                     ,outupddte
                     ,outupdusr
                     ,outcredterm
                     ,outcredte
                     ,outcreusr
                     ,outchkpointno
                     ,outpassportexpdte
                     ,outpassportisu
                     ,outpassportdte
                     ,outpermitdte
                     ,outpermitcd
                     ,outvisatypecdorg
                     ,outtm6no
                     ,outtdtno
                     ,outtdtcd
                     ,outconvregno
                     ,outconvcd
                     ,outtravcd
                     ,outdeptcd
                     ,outdte
                     ,outseqno
                     ,appdte
                     ,inputxtndeptcd
                     ,xtntype
                     ,xtnaddress
                     ,xtndeptcd
                     ,inprocessterm
                     ,inprocessdte
                     ,inprocessusr
                     ,inupdterm
                     ,inupddte
                     ,inupdusr
                     ,incredterm
                     ,incredte
                     ,increusr
                     ,inchkpointno
                     ,pv_seqno
                     ,outshift_seqno
                     ,inshift_seqno
                     ,outzone_seqno
                     ,outpd_seqno
                     ,inzone_seqno
                     ,inpd_seqno
                     ,visarunday
                     ,outvisatypecd
                     ,invisatypecd
                     ,send_flag
                     ,inimg
                     ,outimg
                     ,imginout
               FROM tmmain@pibics
               WHERE tmrunno >= p_lowest_tmrunno_to_copy
               AND tmrunno <= p_highest_tmrunno_to_copy) src
        ON (src.tmrunno = tgt.tmrunno)
        WHEN NOT MATCHED THEN
            INSERT
                (visabyrights
                ,visadte
                ,visaissue
                ,visano
                ,inpassportexpdte
                ,inpassportisu
                ,inpassportdte
                ,inpermitdte
                ,inpermitcd
                ,invisatypecdorg
                ,intm6no
                ,intdtno
                ,intdtcd
                ,inconvregno
                ,inconvcd
                ,intravcd
                ,indeptcd
                ,indte
                ,inseqno
                ,nationcd
                ,sex
                ,efamilynm
                ,emiddlenm
                ,efirstnm
                ,tfamilynm
                ,tmiddlenm
                ,tfirstnm
                ,personid
                ,tmrunno
                ,flagfines
                ,flagjoinpass
                ,typedata
                ,outdeptcdorg
                ,indeptcdorg
                ,outrpjseqno
                ,inrpjseqno
                ,pass_seqno
                ,citizenid
                ,outflightnumber
                ,outflightprefix
                ,inflightnumber
                ,inflightprefix
                ,outpermit_seqno
                ,outdept_seqno
                ,outvisatype_seqno
                ,outconv_seqno
                ,inpermit_seqno
                ,count_seqno
                ,indept_seqno
                ,invisatype_seqno
                ,inconv_seqno
                ,outtm2inout_seqno
                ,outtm5_seqno
                ,outstatus
                ,outpm_nonexpdte
                ,outpm_non_quota
                ,outpm_exexpdte
                ,outpm_extension
                ,outpm_reexpdte
                ,outpm_re_entry
                ,intm2inout_seqno
                ,intm5_seqno
                ,instatus
                ,inpm_nonexpdte
                ,inpm_non_quota
                ,inpm_exexpdte
                ,inpm_extension
                ,inpm_reexpdte
                ,inpm_re_entry
                ,extid
                ,outrescertno
                ,inrescertno
                ,flagmatch
                ,outremark
                ,inremark
                ,outtargetno
                ,intargetno
                ,outintype
                ,inintype
                ,outvisaexpdte
                ,invisaexpdte
                ,birthdte
                ,emsndxnm
                ,elsndxnm
                ,efsndxnm
                ,tmsndxnm
                ,tlsndxnm
                ,tfsndxnm
                ,matchprocessterm
                ,matchprocessdte
                ,matchprocessusr
                ,outprocessterm
                ,outprocessdte
                ,outprocessusr
                ,outupdterm
                ,outupddte
                ,outupdusr
                ,outcredterm
                ,outcredte
                ,outcreusr
                ,outchkpointno
                ,outpassportexpdte
                ,outpassportisu
                ,outpassportdte
                ,outpermitdte
                ,outpermitcd
                ,outvisatypecdorg
                ,outtm6no
                ,outtdtno
                ,outtdtcd
                ,outconvregno
                ,outconvcd
                ,outtravcd
                ,outdeptcd
                ,outdte
                ,outseqno
                ,appdte
                ,inputxtndeptcd
                ,xtntype
                ,xtnaddress
                ,xtndeptcd
                ,inprocessterm
                ,inprocessdte
                ,inprocessusr
                ,inupdterm
                ,inupddte
                ,inupdusr
                ,incredterm
                ,incredte
                ,increusr
                ,inchkpointno
                ,pv_seqno
                ,outshift_seqno
                ,inshift_seqno
                ,outzone_seqno
                ,outpd_seqno
                ,inzone_seqno
                ,inpd_seqno
                ,visarunday
                ,outvisatypecd
                ,invisatypecd
                ,send_flag)
            VALUES
                (src.visabyrights
                ,src.visadte
                ,src.visaissue
                ,src.visano
                ,src.inpassportexpdte
                ,src.inpassportisu
                ,src.inpassportdte
                ,src.inpermitdte
                ,src.inpermitcd
                ,src.invisatypecdorg
                ,src.intm6no
                ,src.intdtno
                ,src.intdtcd
                ,src.inconvregno
                ,src.inconvcd
                ,src.intravcd
                ,src.indeptcd
                ,src.indte
                ,src.inseqno
                ,src.nationcd
                ,src.sex
                ,src.efamilynm
                ,src.emiddlenm
                ,src.efirstnm
                ,src.tfamilynm
                ,src.tmiddlenm
                ,src.tfirstnm
                ,src.personid
                ,src.tmrunno
                ,src.flagfines
                ,src.flagjoinpass
                ,src.typedata
                ,src.outdeptcdorg
                ,src.indeptcdorg
                ,src.outrpjseqno
                ,src.inrpjseqno
                ,src.pass_seqno
                ,src.citizenid
                ,src.outflightnumber
                ,src.outflightprefix
                ,src.inflightnumber
                ,src.inflightprefix
                ,src.outpermit_seqno
                ,src.outdept_seqno
                ,src.outvisatype_seqno
                ,src.outconv_seqno
                ,src.inpermit_seqno
                ,src.count_seqno
                ,src.indept_seqno
                ,src.invisatype_seqno
                ,src.inconv_seqno
                ,src.outtm2inout_seqno
                ,src.outtm5_seqno
                ,src.outstatus
                ,src.outpm_nonexpdte
                ,src.outpm_non_quota
                ,src.outpm_exexpdte
                ,src.outpm_extension
                ,src.outpm_reexpdte
                ,src.outpm_re_entry
                ,src.intm2inout_seqno
                ,src.intm5_seqno
                ,src.instatus
                ,src.inpm_nonexpdte
                ,src.inpm_non_quota
                ,src.inpm_exexpdte
                ,src.inpm_extension
                ,src.inpm_reexpdte
                ,src.inpm_re_entry
                ,src.extid
                ,src.outrescertno
                ,src.inrescertno
                ,src.flagmatch
                ,src.outremark
                ,src.inremark
                ,src.outtargetno
                ,src.intargetno
                ,src.outintype
                ,src.inintype
                ,src.outvisaexpdte
                ,src.invisaexpdte
                ,src.birthdte
                ,src.emsndxnm
                ,src.elsndxnm
                ,src.efsndxnm
                ,src.tmsndxnm
                ,src.tlsndxnm
                ,src.tfsndxnm
                ,src.matchprocessterm
                ,src.matchprocessdte
                ,src.matchprocessusr
                ,src.outprocessterm
                ,src.outprocessdte
                ,src.outprocessusr
                ,src.outupdterm
                ,src.outupddte
                ,src.outupdusr
                ,src.outcredterm
                ,src.outcredte
                ,src.outcreusr
                ,src.outchkpointno
                ,src.outpassportexpdte
                ,src.outpassportisu
                ,src.outpassportdte
                ,src.outpermitdte
                ,src.outpermitcd
                ,src.outvisatypecdorg
                ,src.outtm6no
                ,src.outtdtno
                ,src.outtdtcd
                ,src.outconvregno
                ,src.outconvcd
                ,src.outtravcd
                ,src.outdeptcd
                ,src.outdte
                ,src.outseqno
                ,src.appdte
                ,src.inputxtndeptcd
                ,src.xtntype
                ,src.xtnaddress
                ,src.xtndeptcd
                ,src.inprocessterm
                ,src.inprocessdte
                ,src.inprocessusr
                ,src.inupdterm
                ,src.inupddte
                ,src.inupdusr
                ,src.incredterm
                ,src.incredte
                ,src.increusr
                ,src.inchkpointno
                ,src.pv_seqno
                ,src.outshift_seqno
                ,src.inshift_seqno
                ,src.outzone_seqno
                ,src.outpd_seqno
                ,src.inzone_seqno
                ,src.inpd_seqno
                ,src.visarunday
                ,src.outvisatypecd
                ,src.invisatypecd
                ,src.send_flag);
        l_cnt := SQL%ROWCOUNT;
        UPDATE dl_staging4pibics.cnt_tmmain
        SET copied_cnt_staging = l_cnt
           ,copied_at_staging  = SYSDATE
        WHERE highest_tmrunno_to_copy = p_highest_tmrunno_to_copy;

        COMMIT;
        logger.log('END TMMAIN , cnt:  ' || l_cnt
                  ,l_log_scope);
    END copy_to_staging;
BEGIN
    pkg_utils.get_and_use_logger_preferences;
END pkg_tmmain;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TMMAIN" TO "DL_STAGING4PIBICS_INTF";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TMMAIN" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TMMAIN" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_TMMAIN" TO "BIOSUPPORT";
