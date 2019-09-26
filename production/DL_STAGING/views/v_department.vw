CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_DEPARTMENT" ("DEPT_SEQNO", "DEPTCD", "DEPTLEVEL", "DEPTENM", "DEPTTNM", "ADDR", "ADDNO", "PV_SEQNO", "AMP_SEQNO", "TMB_SEQNO", "ZIPCODE", "TELNO", "FAX", "EMAIL", "URLDEPT", "ADEPTTYPE", "CONV_SEQNO", "ACTFLAG", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "CONVCD", "ABBRNM", "REL_CODE", "ORG_CODE", "DETAINEE_FLAG", "ORG_SEQNO", "CHECKPOINT", "DEPTABBFMT1", "DEPTABBFMT2", "CASINO_FLAG", "SPOTSEQNO", "OLDDEPTCD", "DEPTLINE", "FIELD_DEFAULT", "TWOSECTION", "QEXT_ACTFLAG", "QEXT_TYPE", "QEXT_NOTE", "QREPS_ACTFLAG", "QREPS_TYPE", "QREPS_NOTE", "DEPT_TITLE_DOC", "TEL_TITLE_DOC", "DEPTABBFMT3", "COUNT_SEQNO", "QFN90_ACTFLAG", "QFN90_TYPE", "QFN90_NOTE", "FLAG_FINES_STAFF", "DEPTABBFMT4", "VOA_ONLINE_FLAG", "IMGDIR") AS 
  SELECT
    DEPT_SEQNO,
    DEPTCD,
    DEPTLEVEL,
    DEPTENM,
    DEPTTNM,
    ADDR,
    ADDNO,
    PV_SEQNO,
    AMP_SEQNO,
    TMB_SEQNO,
    ZIPCODE,
    TELNO,
    FAX,
    EMAIL,
    URLDEPT,
    ADEPTTYPE,
    CONV_SEQNO,
    ACTFLAG,
    CREATE_BY,
    CREATE_DATE,
    UPDATE_BY,
    UPDATE_DATE,
    VERSION,
    CONVCD,
    ABBRNM,
    REL_CODE,
    ORG_CODE,
    DETAINEE_FLAG,
    ORG_SEQNO,
    CHECKPOINT,
    DEPTABBFMT1,
    DEPTABBFMT2,
    CASINO_FLAG,
    SPOTSEQNO,
    OLDDEPTCD,
    DEPTLINE,
    FIELD_DEFAULT,
    TWOSECTION,
    QEXT_ACTFLAG,
    QEXT_TYPE,
    QEXT_NOTE,
    QREPS_ACTFLAG,
    QREPS_TYPE,
    QREPS_NOTE,
    DEPT_TITLE_DOC,
    TEL_TITLE_DOC,
    DEPTABBFMT3,
    COUNT_SEQNO,
    QFN90_ACTFLAG,
    QFN90_TYPE,
    QFN90_NOTE,
    FLAG_FINES_STAFF,
    DEPTABBFMT4,
    VOA_ONLINE_FLAG,
    IMGDIR
FROM pibicsdm2.department;
  GRANT SELECT ON "DL_STAGING"."V_DEPARTMENT" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_DEPARTMENT" TO "APEX_USER_MANAGEMENT";
