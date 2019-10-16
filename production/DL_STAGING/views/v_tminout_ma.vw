CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_TMINOUT_MA" ("SEQNO", "TM6NO", "INOUTDTE", "CARDTYPE", "TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "BIRTHDTE", "NATIONCD", "DEPTCD", "TRAVCD", "CONVCD", "CONVREGNO", "TDTCD", "TDTNO", "VISATYPECD", "VISAEXPDTE", "PASSPORTDTE", "PASSPORTISU", "PASSPORTEXPDTE", "TARGETNO", "INTYPE", "CHKPOINTNO", "CREUSR", "CREDTE", "CREDTERM", "UPDUSR", "UPDDTE", "UPDTERM", "ISPROCESS", "PERSONID", "TFSNDXNM", "TLSNDXNM", "TMSNDXNM", "EFSNDXNM", "ELSNDXNM", "EMSNDXNM", "REMARK", "RESCERTNO", "PM_RE_ENTRY", "PM_REEXPDTE", "PM_EXTENSION", "PM_EXEXPDTE", "PM_NON_QUOTA", "PM_NONEXPDTE", "STATUS", "TM5_SEQNO", "TM2INOUT_SEQNO", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "RPJSEQNO", "PERMITCD", "NEWPERMIT", "CONV_SEQNO", "VISATYPE_SEQNO", "DEPT_SEQNO", "COUNT_SEQNO", "PERMIT_SEQNO", "CITIZENID", "PASS_SEQNO", "FLIGHTPREFIX", "FLIGHTNUMBER", "TYPEDATA", "DEPTCDORG", "FLAGJOINPASS", "FLAGFINES", "RESCERTTYPE", "RESPVCD", "RESNOYEAR", "PV_SEQNO", "PD_SEQNO", "ZONE_SEQNO", "SHIFT_SEQNO", "FLAGMATCH") AS 
  SELECT
    SEQNO,
    TM6NO,
    INOUTDTE,
    CARDTYPE,
    TFIRSTNM,
    TMIDDLENM,
    TFAMILYNM,
    EFIRSTNM,
    EMIDDLENM,
    EFAMILYNM,
    SEX,
    BIRTHDTE,
    NATIONCD,
    DEPTCD,
    TRAVCD,
    CONVCD,
    CONVREGNO,
    TDTCD,
    TDTNO,
    VISATYPECD,
    VISAEXPDTE,
    PASSPORTDTE,
    PASSPORTISU,
    PASSPORTEXPDTE,
    TARGETNO,
    INTYPE,
    CHKPOINTNO,
    CREUSR,
    CREDTE,
    CREDTERM,
    UPDUSR,
    UPDDTE,
    UPDTERM,
    ISPROCESS,
    PERSONID,
    TFSNDXNM,
    TLSNDXNM,
    TMSNDXNM,
    EFSNDXNM,
    ELSNDXNM,
    EMSNDXNM,
    REMARK,
    RESCERTNO,
    PM_RE_ENTRY,
    PM_REEXPDTE,
    PM_EXTENSION,
    PM_EXEXPDTE,
    PM_NON_QUOTA,
    PM_NONEXPDTE,
    STATUS,
    TM5_SEQNO,
    TM2INOUT_SEQNO,
    CREATE_BY,
    CREATE_DATE,
    UPDATE_BY,
    UPDATE_DATE,
    VERSION,
    RPJSEQNO,
    PERMITCD,
    NEWPERMIT,
    CONV_SEQNO,
    VISATYPE_SEQNO,
    DEPT_SEQNO,
    COUNT_SEQNO,
    PERMIT_SEQNO,
    CITIZENID,
    PASS_SEQNO,
    FLIGHTPREFIX,
    FLIGHTNUMBER,
    TYPEDATA,
    DEPTCDORG,
    FLAGJOINPASS,
    FLAGFINES,
    RESCERTTYPE,
    RESPVCD,
    RESNOYEAR,
    PV_SEQNO,
    PD_SEQNO,
    ZONE_SEQNO,
    SHIFT_SEQNO,
    FLAGMATCH
FROM pibicsdm2_ro.tminout_ma;
  GRANT SELECT ON "DL_STAGING"."V_TMINOUT_MA" TO "DL_BORDERCONTROL";