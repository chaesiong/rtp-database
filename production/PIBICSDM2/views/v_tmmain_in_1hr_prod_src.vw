CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_TMMAIN_IN_1HR_PROD_SRC" ("TMRUNNO", "PERSONID", "TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "NATIONCD", "INSEQNO", "INDTE", "INDEPTCD", "INTRAVCD", "INCONVCD", "INCONVREGNO", "INTDTCD", "INTDTNO", "INTM6NO", "INVISATYPECDORG", "INPERMITCD", "INPERMITDTE", "INPASSPORTDTE", "INPASSPORTISU", "INPASSPORTEXPDTE", "VISANO", "VISAISSUE", "VISADTE", "VISABYRIGHTS", "INCHKPOINTNO", "INCREUSR", "INCREDTE", "INCREDTERM", "INUPDUSR", "INUPDDTE", "INUPDTERM", "INPROCESSUSR", "INPROCESSDTE", "INPROCESSTERM", "XTNDEPTCD", "XTNADDRESS", "XTNTYPE", "INPUTXTNDEPTCD", "APPDTE", "OUTSEQNO", "OUTDTE", "OUTDEPTCD", "OUTTRAVCD", "OUTCONVCD", "OUTCONVREGNO", "OUTTDTCD", "OUTTDTNO", "OUTTM6NO", "OUTVISATYPECDORG", "OUTPERMITCD", "OUTPERMITDTE", "OUTPASSPORTDTE", "OUTPASSPORTISU", "OUTPASSPORTEXPDTE", "OUTCHKPOINTNO", "OUTCREUSR", "OUTCREDTE", "OUTCREDTERM", "OUTUPDUSR", "OUTUPDDTE", "OUTUPDTERM", "OUTPROCESSUSR", "OUTPROCESSDTE", "OUTPROCESSTERM", "MATCHPROCESSUSR", "MATCHPROCESSDTE", "MATCHPROCESSTERM", "TFSNDXNM", "TLSNDXNM", "TMSNDXNM", "EFSNDXNM", "ELSNDXNM", "EMSNDXNM", "BIRTHDTE", "INVISAEXPDTE", "OUTVISAEXPDTE", "ININTYPE", "OUTINTYPE", "INTARGETNO", "OUTTARGETNO", "INREMARK", "OUTREMARK", "FLAGMATCH", "INRESCERTNO", "OUTRESCERTNO", "EXTID", "INPM_RE_ENTRY", "INPM_REEXPDTE", "INPM_EXTENSION", "INPM_EXEXPDTE", "INPM_NON_QUOTA", "INPM_NONEXPDTE", "INSTATUS", "INTM5_SEQNO", "INTM2INOUT_SEQNO", "OUTPM_RE_ENTRY", "OUTPM_REEXPDTE", "OUTPM_EXTENSION", "OUTPM_EXEXPDTE", "OUTPM_NON_QUOTA", "OUTPM_NONEXPDTE", "OUTSTATUS", "OUTTM5_SEQNO", "OUTTM2INOUT_SEQNO", "INCONV_SEQNO", "INVISATYPE_SEQNO", "INDEPT_SEQNO", "COUNT_SEQNO", "INPERMIT_SEQNO", "OUTCONV_SEQNO", "OUTVISATYPE_SEQNO", "OUTDEPT_SEQNO", "OUTPERMIT_SEQNO", "INFLIGHTPREFIX", "INFLIGHTNUMBER", "OUTFLIGHTPREFIX", "OUTFLIGHTNUMBER", "CITIZENID", "PASS_SEQNO", "INRPJSEQNO", "OUTRPJSEQNO", "INDEPTCDORG", "OUTDEPTCDORG", "TYPEDATA", "FLAGJOINPASS", "FLAGFINES", "INVISATYPECD", "OUTVISATYPECD", "SEND_FLAG", "VISARUNDAY", "PV_SEQNO", "INPD_SEQNO", "INZONE_SEQNO", "OUTPD_SEQNO", "OUTZONE_SEQNO", "INSHIFT_SEQNO", "OUTSHIFT_SEQNO") AS 
  SELECT 
        TMRUNNO,
        PERSONID,
        TFIRSTNM,
        TMIDDLENM,
        TFAMILYNM,
        EFIRSTNM,
        EMIDDLENM,
        EFAMILYNM,
        SEX,
        NATIONCD,
        INSEQNO,
        INDTE,
        INDEPTCD,
        INTRAVCD,
        INCONVCD,
        INCONVREGNO,
        INTDTCD,
        INTDTNO,
        INTM6NO,
        INVISATYPECDORG,
        INPERMITCD,
        INPERMITDTE,
        INPASSPORTDTE,
        INPASSPORTISU,
        INPASSPORTEXPDTE,
        VISANO,
        VISAISSUE,
        VISADTE,
        VISABYRIGHTS,
        INCHKPOINTNO,
        INCREUSR,
        INCREDTE,
        INCREDTERM,
        INUPDUSR,
        INUPDDTE,
        INUPDTERM,
        INPROCESSUSR,
        INPROCESSDTE,
        INPROCESSTERM,
        XTNDEPTCD,
        XTNADDRESS,
        XTNTYPE,
        INPUTXTNDEPTCD,
        APPDTE,
        OUTSEQNO,
        OUTDTE,
        OUTDEPTCD,
        OUTTRAVCD,
        OUTCONVCD,
        OUTCONVREGNO,
        OUTTDTCD,
        OUTTDTNO,
        OUTTM6NO,
        OUTVISATYPECDORG,
        OUTPERMITCD,
        OUTPERMITDTE,
        OUTPASSPORTDTE,
        OUTPASSPORTISU,
        OUTPASSPORTEXPDTE,
        OUTCHKPOINTNO,
        OUTCREUSR,
        OUTCREDTE,
        OUTCREDTERM,
        OUTUPDUSR,
        OUTUPDDTE,
        OUTUPDTERM,
        OUTPROCESSUSR,
        OUTPROCESSDTE,
        OUTPROCESSTERM,
        MATCHPROCESSUSR,
        MATCHPROCESSDTE,
        MATCHPROCESSTERM,
        TFSNDXNM,
        TLSNDXNM,
        TMSNDXNM,
        EFSNDXNM,
        ELSNDXNM,
        EMSNDXNM,
        BIRTHDTE,
        INVISAEXPDTE,
        OUTVISAEXPDTE,
        ININTYPE,
        OUTINTYPE,
        INTARGETNO,
        OUTTARGETNO,
        INREMARK,
        OUTREMARK,
        FLAGMATCH,
        INRESCERTNO,
        OUTRESCERTNO,
        EXTID,
        INPM_RE_ENTRY,
        INPM_REEXPDTE,
        INPM_EXTENSION,
        INPM_EXEXPDTE,
        INPM_NON_QUOTA,
        INPM_NONEXPDTE,
        INSTATUS,
        INTM5_SEQNO,
        INTM2INOUT_SEQNO,
        OUTPM_RE_ENTRY,
        OUTPM_REEXPDTE,
        OUTPM_EXTENSION,
        OUTPM_EXEXPDTE,
        OUTPM_NON_QUOTA,
        OUTPM_NONEXPDTE,
        OUTSTATUS,
        OUTTM5_SEQNO,
        OUTTM2INOUT_SEQNO,
        INCONV_SEQNO,
        INVISATYPE_SEQNO,
        INDEPT_SEQNO,
        COUNT_SEQNO,
        INPERMIT_SEQNO,
        OUTCONV_SEQNO,
        OUTVISATYPE_SEQNO,
        OUTDEPT_SEQNO,
        OUTPERMIT_SEQNO,
        INFLIGHTPREFIX,
        INFLIGHTNUMBER,
        OUTFLIGHTPREFIX,
        OUTFLIGHTNUMBER,
        CITIZENID,
        PASS_SEQNO,
        INRPJSEQNO,
        OUTRPJSEQNO,
        INDEPTCDORG,
        OUTDEPTCDORG,
        TYPEDATA,
        FLAGJOINPASS,
        FLAGFINES,
        INVISATYPECD,
        OUTVISATYPECD,
        SEND_FLAG,
        VISARUNDAY,
        PV_SEQNO,
        INPD_SEQNO,
        INZONE_SEQNO,
        OUTPD_SEQNO,
        OUTZONE_SEQNO,
        INSHIFT_SEQNO,
        OUTSHIFT_SEQNO
    FROM pibics.tmmain@pibics_prod prd
    WHERE prd.indte IS NOT NULL
    AND TO_CHAR(prd.incredte, 'yyyymmddhh24mi') >= TO_CHAR(SYSDATE - 1/24, 'yyyymmddhh24mi')
    AND NOT EXISTS
    (
        SELECT NULL
        FROM pibicsdm2.tmmain
        WHERE tmrunno = prd.tmrunno
    );
