CREATE TABLE PIBICS.IMMIGRATION (
    SHIFT_SEQNO NUMBER (22),
    ZONE_SEQNO NUMBER (22),
    PD_SEQNO NUMBER (22),
    PV_SEQNO NUMBER (22),
    RESNOYEAR VARCHAR2 (20),
    RESPVCD VARCHAR2 (3),
    RESCERTTYPE VARCHAR2 (4),
    VISATYPECD CHAR (4),
    DEPTCDORG CHAR (5),
    FLIGHTNUMBER VARCHAR2 (20),
    FLIGHTPREFIX VARCHAR2 (20),
    PASS_SEQNO NUMBER (22),
    CITIZENID VARCHAR2 (13),
    PERMIT_SEQNO NUMBER (22),
    COUNT_SEQNO NUMBER (22),
    DEPT_SEQNO NUMBER (22),
    VISATYPE_SEQNO NUMBER (22),
    CONV_SEQNO NUMBER (22),
    RPJSEQNO NUMBER (22),
    VERSION NUMBER (22),
    UPDATE_DATE TIMESTAMP(6),
    UPDATE_BY VARCHAR2 (20),
    CREATE_DATE TIMESTAMP(6),
    CREATE_BY VARCHAR2 (20),
    SEQNO VARCHAR2 (20),
    CONVREGNO VARCHAR2 (20),
    CONVCD CHAR (4),
    PERMITCD CHAR (4),
    NEWPERMIT DATE,
    PM_NONEXPDTE DATE,
    PM_NON_QUOTA VARCHAR2 (20),
    PM_EXEXPDTE DATE,
    PM_EXTENSION VARCHAR2 (20),
    PM_REEXPDTE DATE,
    PM_RE_ENTRY VARCHAR2 (20),
    TM2INOUT_SEQNO NUMBER (22),
    TM5_SEQNO NUMBER (22),
    STATUS CHAR (1),
    FLAGPASS NUMBER (22),
    DEPTCD CHAR (5),
    RESCERTNO VARCHAR2 (20),
    REMARK VARCHAR2 (1500),
    UPDTERM VARCHAR2 (30),
    UPDDTE DATE,
    UPDUSR VARCHAR2 (20),
    PASSPORTEXPDTE DATE,
    PASSPORTISU VARCHAR2 (60),
    PASSPORTDTE DATE,
    VISAEXPDTE DATE,
    VISATYPECDORG CHAR (4),
    TDTNO VARCHAR2 (20),
    TDTCD VARCHAR2 (4),
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
    PERSONID VARCHAR2 (20) NOT NULL,
    FLAGDUPPERSON CHAR (1),
    IMGINOUT BLOB,
    IMGPASS BLOB
);
CREATE INDEX IMMIGRATION_PK2 ON PIBICS.IMMIGRATION (PERSONID);
ALTER TABLE PIBICS.IMMIGRATION ADD CONSTRAINT IMMIGRATION_PK2 PRIMARY KEY (PERSONID) USING INDEX;