CREATE TABLE PIBICS.TMINOUT_MA (
    CONV_SEQNO NUMBER (22),
    NEWPERMIT DATE,
    PERMITCD CHAR (4),
    RPJSEQNO NUMBER (22),
    VERSION NUMBER (22),
    UPDATE_DATE TIMESTAMP(6),
    UPDATE_BY VARCHAR2 (20),
    CREATE_DATE TIMESTAMP(6),
    CREATE_BY VARCHAR2 (20),
    TM2INOUT_SEQNO NUMBER (22),
    TM5_SEQNO NUMBER (22),
    STATUS CHAR (1),
    PM_NONEXPDTE DATE,
    PM_NON_QUOTA VARCHAR2 (20),
    PM_EXEXPDTE DATE,
    PM_EXTENSION VARCHAR2 (20),
    PM_REEXPDTE DATE,
    PM_RE_ENTRY VARCHAR2 (20),
    RESCERTNO VARCHAR2 (20),
    REMARK VARCHAR2 (1500),
    EMSNDXNM VARCHAR2 (60),
    ELSNDXNM VARCHAR2 (60),
    EFSNDXNM VARCHAR2 (60),
    TMSNDXNM VARCHAR2 (60),
    TLSNDXNM VARCHAR2 (60),
    TFSNDXNM VARCHAR2 (60),
    PERSONID VARCHAR2 (20),
    ISPROCESS CHAR (1),
    UPDTERM VARCHAR2 (30),
    UPDDTE DATE,
    UPDUSR VARCHAR2 (20),
    CREDTERM VARCHAR2 (30),
    CREDTE DATE,
    CREUSR VARCHAR2 (20),
    CHKPOINTNO CHAR (3),
    INTYPE CHAR (1),
    TARGETNO VARCHAR2 (7),
    PASSPORTEXPDTE DATE,
    PASSPORTISU VARCHAR2 (60),
    PASSPORTDTE DATE,
    VISAEXPDTE DATE,
    VISATYPECD CHAR (4),
    TDTNO VARCHAR2 (20),
    TDTCD VARCHAR2 (4),
    CONVREGNO VARCHAR2 (20),
    CONVCD CHAR (4),
    TRAVCD CHAR (4),
    DEPTCD VARCHAR2 (5),
    NATIONCD CHAR (3),
    BIRTHDTE VARCHAR2 (10),
    SEX CHAR (1),
    EFAMILYNM VARCHAR2 (60),
    EMIDDLENM VARCHAR2 (60),
    EFIRSTNM VARCHAR2 (60),
    TFAMILYNM VARCHAR2 (60),
    TMIDDLENM VARCHAR2 (60),
    TFIRSTNM VARCHAR2 (60),
    CARDTYPE CHAR (1),
    INOUTDTE DATE,
    TM6NO VARCHAR2 (20),
    SEQNO VARCHAR2 (100) NOT NULL,
    PD_SEQNO NUMBER (22),
    PV_SEQNO NUMBER (22),
    PASS_SEQNO NUMBER (22),
    CITIZENID VARCHAR2 (13),
    PERMIT_SEQNO NUMBER (22),
    COUNT_SEQNO NUMBER (22),
    DEPT_SEQNO NUMBER (22),
    VISATYPE_SEQNO NUMBER (22),
    ZONE_SEQNO NUMBER (22),
    SHIFT_SEQNO NUMBER (22),
    TYPEDATA VARCHAR2 (20),
    DEPTCDORG CHAR (5),
    RESNOYEAR VARCHAR2 (20),
    RESPVCD VARCHAR2 (3),
    RESCERTTYPE VARCHAR2 (4),
    FLAGFINES CHAR (1),
    FLIGHTNUMBER VARCHAR2 (20),
    FLIGHTPREFIX VARCHAR2 (20),
    FLAGJOINPASS CHAR (1),
    FLAGMATCH CHAR (1),
    IMGINOUT BLOB
);
CREATE INDEX SEQNO_PK ON PIBICS.TMINOUT_MA (SEQNO);
ALTER TABLE PIBICS.TMINOUT_MA ADD CONSTRAINT SEQNO_PK PRIMARY KEY (SEQNO) USING INDEX;