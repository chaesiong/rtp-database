CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_INOUT_PROD" 
AS
    l_rowcount  NUMBER := 0;
    
    -- internal procs
    procedure logit(p_str in varchar2, p_num in number) as
        PRAGMA AUTONOMOUS_TRANSACTION;
    begin
        insert into import_log (table_name, num_row, impdate)
        values (SUBSTR(p_str, 1, 30), p_num, SYSDATE);
        commit;
    exception
        when others then
            null;
    end logit;
    --
BEGIN

    --========================--
    -- TMINOUT_1HR_PROD start --
    --========================--
    DECLARE
        l_tab  VARCHAR2(30) := 'TMINOUT_1HR_PROD';
    BEGIN
        logit(l_tab || '_START', 0);
        
        -- delete
        DELETE FROM pibicsdm2.tminout_1hr_prod;
        
        -- insert
        INSERT INTO pibicsdm2.tminout_1hr_prod
        (
            seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex
            , birthdte, nationcd, deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte
            , passportisu, passportexpdte, targetno, intype, chkpointno, creusr, credte, credterm, updusr, upddte
            , updterm, isprocess, personid, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark
            , rescertno, pm_re_entry, pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status
            , tm5_seqno, tm2inout_seqno, create_by, create_date, update_by, update_date, version, rpjseqno, permitcd
            , newpermit, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno
            , flightprefix, flightnumber, typedata, deptcdorg, flagjoinpass, flagfines, rescerttype, respvcd, resnoyear
            , pv_seqno, pd_seqno, zone_seqno, shift_seqno
        )
        SELECT 
            seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex
            , birthdte, nationcd, deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte
            , passportisu, passportexpdte, targetno, intype, chkpointno, creusr, credte, credterm, updusr, upddte
            , updterm, isprocess, personid, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark
            , rescertno, pm_re_entry, pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status
            , tm5_seqno, tm2inout_seqno, create_by, create_date, update_by, update_date, version, rpjseqno, permitcd
            , newpermit, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno
            , flightprefix, flightnumber, typedata, deptcdorg, flagjoinpass, flagfines, rescerttype, respvcd, resnoyear
            , pv_seqno, pd_seqno, zone_seqno, shift_seqno
        FROM pibicsdm2.v_tminout_1hr_prod_src;
        
        l_rowcount := SQL%ROWCOUNT;
        
        logit(l_tab || '_END', l_rowcount);
        
        -- save
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            logit(l_tab || '_ERR', -1);
            ROLLBACK;
            NULL;
    END;
    --========================--
    -- TMINOUT_1HR_PROD end --
    --========================--

    --========================--
    -- TMINOUT_MA_1HR_PROD start --
    --========================--
    DECLARE
        l_tab  VARCHAR2(30) := 'TMINOUT_MA_1HR_PROD';
    BEGIN
        logit(l_tab || '_START', 0);
        
        -- delete
        DELETE FROM pibicsdm2.tminout_ma_1hr_prod;
        
        -- insert
        INSERT INTO pibicsdm2.tminout_ma_1hr_prod
        (
            seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex
            , birthdte, nationcd, deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte
            , passportisu, passportexpdte, targetno, intype, chkpointno, creusr, credte, credterm, updusr, upddte, updterm
            , isprocess, personid, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark, rescertno, pm_re_entry
            , pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status, tm5_seqno, tm2inout_seqno
            , create_by, create_date, update_by, update_date, version, rpjseqno, permitcd, newpermit, conv_seqno, visatype_seqno
            , dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, flightnumber, typedata, deptcdorg
            , flagjoinpass, flagfines, rescerttype, respvcd, resnoyear, pv_seqno, pd_seqno, zone_seqno, shift_seqno, flagmatch
        )
        SELECT 
            seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex
            , birthdte, nationcd, deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte
            , passportisu, passportexpdte, targetno, intype, chkpointno, creusr, credte, credterm, updusr, upddte, updterm
            , isprocess, personid, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark, rescertno, pm_re_entry
            , pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status, tm5_seqno, tm2inout_seqno
            , create_by, create_date, update_by, update_date, version, rpjseqno, permitcd, newpermit, conv_seqno, visatype_seqno
            , dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, flightnumber, typedata, deptcdorg
            , flagjoinpass, flagfines, rescerttype, respvcd, resnoyear, pv_seqno, pd_seqno, zone_seqno, shift_seqno, flagmatch
        FROM pibicsdm2.v_tminout_ma_1hr_prod_src;
        
        l_rowcount := SQL%ROWCOUNT;
        
        logit(l_tab || '_END', l_rowcount);
        
        -- save
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            logit(l_tab || '_ERR', -1);
            ROLLBACK;
            NULL;
    END;
    --========================--
    -- TMINOUT_MA_1HR_PROD end --
    --========================--
    
    --========================--
    -- TMMAIN_IN_1HR_PROD start --
    --========================--
    DECLARE
        l_tab  VARCHAR2(30) := 'TMMAIN_IN_1HR_PROD';
    BEGIN
        logit(l_tab || '_START', 0);
        
        -- delete
        DELETE FROM pibicsdm2.tmmain_in_1hr_prod;
        
        -- insert
        INSERT INTO pibicsdm2.tmmain_in_1hr_prod
        (
            tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno
            , indte, indeptcd, intravcd, inconvcd, inconvregno, intdtcd, intdtno, intm6no, invisatypecdorg, inpermitcd
            , inpermitdte, inpassportdte, inpassportisu, inpassportexpdte, visano, visaissue, visadte, visabyrights
            , inchkpointno, increusr, incredte, incredterm, inupdusr, inupddte, inupdterm, inprocessusr, inprocessdte
            , inprocessterm, xtndeptcd, xtnaddress, xtntype, inputxtndeptcd, appdte, outseqno, outdte, outdeptcd, outtravcd
            , outconvcd, outconvregno, outtdtcd, outtdtno, outtm6no, outvisatypecdorg, outpermitcd, outpermitdte, outpassportdte
            , outpassportisu, outpassportexpdte, outchkpointno, outcreusr, outcredte, outcredterm, outupdusr, outupddte
            , outupdterm, outprocessusr, outprocessdte, outprocessterm, matchprocessusr, matchprocessdte, matchprocessterm
            , tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype
            , outintype, intargetno, outtargetno, inremark, outremark, flagmatch, inrescertno, outrescertno, extid, inpm_re_entry
            , inpm_reexpdte, inpm_extension, inpm_exexpdte, inpm_non_quota, inpm_nonexpdte, instatus, intm5_seqno, intm2inout_seqno
            , outpm_re_entry, outpm_reexpdte, outpm_extension, outpm_exexpdte, outpm_non_quota, outpm_nonexpdte, outstatus
            , outtm5_seqno, outtm2inout_seqno, inconv_seqno, invisatype_seqno, indept_seqno, count_seqno, inpermit_seqno
            , outconv_seqno, outvisatype_seqno, outdept_seqno, outpermit_seqno, inflightprefix, inflightnumber, outflightprefix
            , outflightnumber, citizenid, pass_seqno, inrpjseqno, outrpjseqno, indeptcdorg, outdeptcdorg, typedata, flagjoinpass
            , flagfines, invisatypecd, outvisatypecd, send_flag, visarunday, pv_seqno, inpd_seqno, inzone_seqno, outpd_seqno
            , outzone_seqno, inshift_seqno, outshift_seqno
        )
        SELECT 
            tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno
            , indte, indeptcd, intravcd, inconvcd, inconvregno, intdtcd, intdtno, intm6no, invisatypecdorg, inpermitcd
            , inpermitdte, inpassportdte, inpassportisu, inpassportexpdte, visano, visaissue, visadte, visabyrights
            , inchkpointno, increusr, incredte, incredterm, inupdusr, inupddte, inupdterm, inprocessusr, inprocessdte
            , inprocessterm, xtndeptcd, xtnaddress, xtntype, inputxtndeptcd, appdte, outseqno, outdte, outdeptcd, outtravcd
            , outconvcd, outconvregno, outtdtcd, outtdtno, outtm6no, outvisatypecdorg, outpermitcd, outpermitdte, outpassportdte
            , outpassportisu, outpassportexpdte, outchkpointno, outcreusr, outcredte, outcredterm, outupdusr, outupddte
            , outupdterm, outprocessusr, outprocessdte, outprocessterm, matchprocessusr, matchprocessdte, matchprocessterm
            , tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype
            , outintype, intargetno, outtargetno, inremark, outremark, flagmatch, inrescertno, outrescertno, extid, inpm_re_entry
            , inpm_reexpdte, inpm_extension, inpm_exexpdte, inpm_non_quota, inpm_nonexpdte, instatus, intm5_seqno, intm2inout_seqno
            , outpm_re_entry, outpm_reexpdte, outpm_extension, outpm_exexpdte, outpm_non_quota, outpm_nonexpdte, outstatus
            , outtm5_seqno, outtm2inout_seqno, inconv_seqno, invisatype_seqno, indept_seqno, count_seqno, inpermit_seqno
            , outconv_seqno, outvisatype_seqno, outdept_seqno, outpermit_seqno, inflightprefix, inflightnumber, outflightprefix
            , outflightnumber, citizenid, pass_seqno, inrpjseqno, outrpjseqno, indeptcdorg, outdeptcdorg, typedata, flagjoinpass
            , flagfines, invisatypecd, outvisatypecd, send_flag, visarunday, pv_seqno, inpd_seqno, inzone_seqno, outpd_seqno
            , outzone_seqno, inshift_seqno, outshift_seqno
        FROM pibicsdm2.v_tmmain_in_1hr_prod_src;
        
        l_rowcount := SQL%ROWCOUNT;
        
        logit(l_tab || '_END', l_rowcount);
        
        -- save
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            logit(l_tab || '_ERR', -1);
            ROLLBACK;
            NULL;
    END;
    --========================--
    -- TMMAIN_IN_1HR_PROD end --
    --========================--

    --========================--
    -- TMMAIN_OUT_1HR_PROD start --
    --========================--
    DECLARE
        l_tab  VARCHAR2(30) := 'TMMAIN_OUT_1HR_PROD';
    BEGIN
        logit(l_tab || '_START', 0);
        
        -- delete
        DELETE FROM pibicsdm2.tmmain_out_1hr_prod;
        
        -- insert
        INSERT INTO pibicsdm2.tmmain_out_1hr_prod
        (
            tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno
            , indte, indeptcd, intravcd, inconvcd, inconvregno, intdtcd, intdtno, intm6no, invisatypecdorg, inpermitcd
            , inpermitdte, inpassportdte, inpassportisu, inpassportexpdte, visano, visaissue, visadte, visabyrights
            , inchkpointno, increusr, incredte, incredterm, inupdusr, inupddte, inupdterm, inprocessusr, inprocessdte
            , inprocessterm, xtndeptcd, xtnaddress, xtntype, inputxtndeptcd, appdte, outseqno, outdte, outdeptcd, outtravcd
            , outconvcd, outconvregno, outtdtcd, outtdtno, outtm6no, outvisatypecdorg, outpermitcd, outpermitdte, outpassportdte
            , outpassportisu, outpassportexpdte, outchkpointno, outcreusr, outcredte, outcredterm, outupdusr, outupddte
            , outupdterm, outprocessusr, outprocessdte, outprocessterm, matchprocessusr, matchprocessdte, matchprocessterm
            , tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype
            , outintype, intargetno, outtargetno, inremark, outremark, flagmatch, inrescertno, outrescertno, extid, inpm_re_entry
            , inpm_reexpdte, inpm_extension, inpm_exexpdte, inpm_non_quota, inpm_nonexpdte, instatus, intm5_seqno, intm2inout_seqno
            , outpm_re_entry, outpm_reexpdte, outpm_extension, outpm_exexpdte, outpm_non_quota, outpm_nonexpdte, outstatus
            , outtm5_seqno, outtm2inout_seqno, inconv_seqno, invisatype_seqno, indept_seqno, count_seqno, inpermit_seqno
            , outconv_seqno, outvisatype_seqno, outdept_seqno, outpermit_seqno, inflightprefix, inflightnumber, outflightprefix
            , outflightnumber, citizenid, pass_seqno, inrpjseqno, outrpjseqno, indeptcdorg, outdeptcdorg, typedata, flagjoinpass
            , flagfines, invisatypecd, outvisatypecd, send_flag, visarunday, pv_seqno, inpd_seqno, inzone_seqno, outpd_seqno
            , outzone_seqno, inshift_seqno, outshift_seqno
        )
        SELECT 
            tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno
            , indte, indeptcd, intravcd, inconvcd, inconvregno, intdtcd, intdtno, intm6no, invisatypecdorg, inpermitcd
            , inpermitdte, inpassportdte, inpassportisu, inpassportexpdte, visano, visaissue, visadte, visabyrights
            , inchkpointno, increusr, incredte, incredterm, inupdusr, inupddte, inupdterm, inprocessusr, inprocessdte
            , inprocessterm, xtndeptcd, xtnaddress, xtntype, inputxtndeptcd, appdte, outseqno, outdte, outdeptcd, outtravcd
            , outconvcd, outconvregno, outtdtcd, outtdtno, outtm6no, outvisatypecdorg, outpermitcd, outpermitdte, outpassportdte
            , outpassportisu, outpassportexpdte, outchkpointno, outcreusr, outcredte, outcredterm, outupdusr, outupddte
            , outupdterm, outprocessusr, outprocessdte, outprocessterm, matchprocessusr, matchprocessdte, matchprocessterm
            , tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype
            , outintype, intargetno, outtargetno, inremark, outremark, flagmatch, inrescertno, outrescertno, extid, inpm_re_entry
            , inpm_reexpdte, inpm_extension, inpm_exexpdte, inpm_non_quota, inpm_nonexpdte, instatus, intm5_seqno, intm2inout_seqno
            , outpm_re_entry, outpm_reexpdte, outpm_extension, outpm_exexpdte, outpm_non_quota, outpm_nonexpdte, outstatus
            , outtm5_seqno, outtm2inout_seqno, inconv_seqno, invisatype_seqno, indept_seqno, count_seqno, inpermit_seqno
            , outconv_seqno, outvisatype_seqno, outdept_seqno, outpermit_seqno, inflightprefix, inflightnumber, outflightprefix
            , outflightnumber, citizenid, pass_seqno, inrpjseqno, outrpjseqno, indeptcdorg, outdeptcdorg, typedata, flagjoinpass
            , flagfines, invisatypecd, outvisatypecd, send_flag, visarunday, pv_seqno, inpd_seqno, inzone_seqno, outpd_seqno
            , outzone_seqno, inshift_seqno, outshift_seqno
        FROM pibicsdm2.v_tmmain_out_1hr_prod_src;
        
        l_rowcount := SQL%ROWCOUNT;
        
        logit(l_tab || '_END', l_rowcount);
        
        -- save
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            logit(l_tab || '_ERR', -1);
            ROLLBACK;
            NULL;
    END;
    --========================--
    -- TMMAIN_OUT_1HR_PROD end --
    --========================--
  
END P_INOUT_PROD;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_INOUT_PROD" TO "BIOSAADM";
