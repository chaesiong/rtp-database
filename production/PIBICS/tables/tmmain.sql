CREATE TABLE PIBICS.TMMAIN (
    VISABYRIGHTS CHAR (1),
    VISADTE DATE,
    VISAISSUE VARCHAR2 (60),
    VISANO VARCHAR2 (20),
    INPASSPORTEXPDTE DATE,
    INPASSPORTISU VARCHAR2 (60),
    INPASSPORTDTE DATE,
    INPERMITDTE DATE,
    INPERMITCD CHAR (4),
    INVISATYPECDORG CHAR (4),
    INTM6NO VARCHAR2 (20),
    INTDTNO VARCHAR2 (20),
    INTDTCD VARCHAR2 (4),
    INCONVREGNO VARCHAR2 (20),
    INCONVCD CHAR (4),
    INTRAVCD CHAR (4),
    INDEPTCD CHAR (5),
    INDTE DATE,
    INSEQNO VARCHAR2 (100),
    NATIONCD CHAR (3),
    SEX CHAR (1),
    EFAMILYNM VARCHAR2 (60),
    EMIDDLENM VARCHAR2 (60),
    EFIRSTNM VARCHAR2 (60),
    TFAMILYNM VARCHAR2 (60),
    TMIDDLENM VARCHAR2 (60),
    TFIRSTNM VARCHAR2 (60),
    PERSONID VARCHAR2 (20),
    TMRUNNO VARCHAR2 (100) NOT NULL,
    FLAGFINES CHAR (1),
    FLAGJOINPASS CHAR (1),
    TYPEDATA VARCHAR2 (20),
    OUTDEPTCDORG CHAR (5),
    INDEPTCDORG CHAR (5),
    OUTRPJSEQNO NUMBER (22),
    INRPJSEQNO NUMBER (22),
    PASS_SEQNO NUMBER (22),
    CITIZENID VARCHAR2 (13),
    OUTFLIGHTNUMBER VARCHAR2 (20),
    OUTFLIGHTPREFIX VARCHAR2 (20),
    INFLIGHTNUMBER VARCHAR2 (20),
    INFLIGHTPREFIX VARCHAR2 (20),
    OUTPERMIT_SEQNO NUMBER (22),
    OUTDEPT_SEQNO NUMBER (22),
    OUTVISATYPE_SEQNO NUMBER (22),
    OUTCONV_SEQNO NUMBER (22),
    INPERMIT_SEQNO NUMBER (22),
    COUNT_SEQNO NUMBER (22),
    INDEPT_SEQNO NUMBER (22),
    INVISATYPE_SEQNO NUMBER (22),
    INCONV_SEQNO NUMBER (22),
    OUTTM2INOUT_SEQNO NUMBER (22),
    OUTTM5_SEQNO NUMBER (22),
    OUTSTATUS CHAR (1),
    OUTPM_NONEXPDTE DATE,
    OUTPM_NON_QUOTA VARCHAR2 (20),
    OUTPM_EXEXPDTE DATE,
    OUTPM_EXTENSION VARCHAR2 (20),
    OUTPM_REEXPDTE DATE,
    OUTPM_RE_ENTRY VARCHAR2 (20),
    INTM2INOUT_SEQNO NUMBER (22),
    INTM5_SEQNO NUMBER (22),
    INSTATUS CHAR (1),
    INPM_NONEXPDTE DATE,
    INPM_NON_QUOTA VARCHAR2 (20),
    INPM_EXEXPDTE DATE,
    INPM_EXTENSION VARCHAR2 (20),
    INPM_REEXPDTE DATE,
    INPM_RE_ENTRY VARCHAR2 (20),
    EXTID NUMBER (22),
    OUTRESCERTNO VARCHAR2 (20),
    INRESCERTNO VARCHAR2 (20),
    FLAGMATCH CHAR (1),
    OUTREMARK VARCHAR2 (1500),
    INREMARK VARCHAR2 (1500),
    OUTTARGETNO CHAR (6),
    INTARGETNO CHAR (6),
    OUTINTYPE CHAR (1),
    ININTYPE CHAR (1),
    OUTVISAEXPDTE DATE,
    INVISAEXPDTE DATE,
    BIRTHDTE VARCHAR2 (10),
    EMSNDXNM VARCHAR2 (60),
    ELSNDXNM VARCHAR2 (60),
    EFSNDXNM VARCHAR2 (60),
    TMSNDXNM VARCHAR2 (60),
    TLSNDXNM VARCHAR2 (60),
    TFSNDXNM VARCHAR2 (60),
    MATCHPROCESSTERM VARCHAR2 (30),
    MATCHPROCESSDTE DATE,
    MATCHPROCESSUSR VARCHAR2 (30),
    OUTPROCESSTERM VARCHAR2 (30),
    OUTPROCESSDTE DATE,
    OUTPROCESSUSR VARCHAR2 (30),
    OUTUPDTERM VARCHAR2 (30),
    OUTUPDDTE DATE,
    OUTUPDUSR VARCHAR2 (20),
    OUTCREDTERM VARCHAR2 (30),
    OUTCREDTE DATE,
    OUTCREUSR VARCHAR2 (20),
    OUTCHKPOINTNO VARCHAR2 (10),
    OUTPASSPORTEXPDTE DATE,
    OUTPASSPORTISU VARCHAR2 (60),
    OUTPASSPORTDTE DATE,
    OUTPERMITDTE DATE,
    OUTPERMITCD CHAR (4),
    OUTVISATYPECDORG CHAR (4),
    OUTTM6NO VARCHAR2 (20),
    OUTTDTNO VARCHAR2 (20),
    OUTTDTCD VARCHAR2 (4),
    OUTCONVREGNO VARCHAR2 (20),
    OUTCONVCD CHAR (4),
    OUTTRAVCD CHAR (4),
    OUTDEPTCD CHAR (5),
    OUTDTE DATE,
    OUTSEQNO VARCHAR2 (100),
    APPDTE DATE,
    INPUTXTNDEPTCD CHAR (5),
    XTNTYPE CHAR (2),
    XTNADDRESS VARCHAR2 (60),
    XTNDEPTCD CHAR (5),
    INPROCESSTERM VARCHAR2 (30),
    INPROCESSDTE DATE,
    INPROCESSUSR VARCHAR2 (30),
    INUPDTERM VARCHAR2 (30),
    INUPDDTE DATE,
    INUPDUSR VARCHAR2 (20),
    INCREDTERM VARCHAR2 (30),
    INCREDTE DATE,
    INCREUSR VARCHAR2 (20),
    INCHKPOINTNO VARCHAR2 (10),
    PV_SEQNO NUMBER (22),
    OUTSHIFT_SEQNO NUMBER (22),
    INSHIFT_SEQNO NUMBER (22),
    OUTZONE_SEQNO NUMBER (22),
    OUTPD_SEQNO NUMBER (22),
    INZONE_SEQNO NUMBER (22),
    INPD_SEQNO NUMBER (22),
    VISARUNDAY NUMBER (22),
    OUTVISATYPECD CHAR (4),
    INVISATYPECD CHAR (4),
    SEND_FLAG VARCHAR2 (1),
    INIMG BLOB,
    OUTIMG BLOB,
    IMGINOUT BLOB
);
CREATE INDEX TMRUNNO_PK ON PIBICS.TMMAIN (TMRUNNO);
ALTER TABLE PIBICS.TMMAIN ADD CONSTRAINT TMRUNNO_PK PRIMARY KEY (TMRUNNO) USING INDEX;