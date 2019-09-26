CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_IMMOVS" ("IOVSEQNO", "PERSONID", "TM6NO", "INOUTDTE", "CARDTYPE", "TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "BIRTHDTE", "NATIONCD", "TDTCD", "TDTNO", "VISATYPECD", "VISAEXPDTE", "PASSPORTDTE", "PASSPORTEXPDTE", "UPDUSR", "UPDDTE", "UPDTERM", "REMARK", "STATUS", "TM5_SEQNO", "TM2INOUT_SEQNO", "CONVCD", "CONVREGNO", "SEQNO", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "CONV_SEQNO", "VISATYPE_SEQNO", "DEPT_SEQNO", "COUNT_SEQNO", "PERMIT_SEQNO", "FLIGHTPREFIX", "FLIGHTNUMBER", "DEPTCD", "EXTPERSON_SEQNO", "EXTPERMITDTE", "EXTFLAG", "CHNGPERSON_SEQNO", "CHNGPERMITDTE", "CHNGFLAG", "RQSPERSON_SEQNO", "RQSPERMITDTE", "RQSFLAG", "FNPERSON_SEQNO", "ALIEN_SEQNO", "PROCESSDTE", "AGE", "SYSDTE", "LASTDTE") AS 
  SELECT a."IOVSEQNO",
          a."PERSONID",
          a."TM6NO",
          a."INOUTDTE",
          a."CARDTYPE",
          a."TFIRSTNM",
          a."TMIDDLENM",
          a."TFAMILYNM",
          a."EFIRSTNM",
          a."EMIDDLENM",
          a."EFAMILYNM",
          a."SEX",
          a."BIRTHDTE",
          a."NATIONCD",
          a."TDTCD",
          a."TDTNO",
          a."VISATYPECD",
          a."VISAEXPDTE",
          a."PASSPORTDTE",
          a."PASSPORTEXPDTE",
          a."UPDUSR",
          a."UPDDTE",
          a."UPDTERM",
          a."REMARK",
          a."STATUS",
          a."TM5_SEQNO",
          a."TM2INOUT_SEQNO",
          a."CONVCD",
          a."CONVREGNO",
          a."SEQNO",
          a."CREATE_BY",
          a."CREATE_DATE",
          a."UPDATE_BY",
          a."UPDATE_DATE",
          a."VERSION",
          a."CONV_SEQNO",
          a."VISATYPE_SEQNO",
          a."DEPT_SEQNO",
          a."COUNT_SEQNO",
          a."PERMIT_SEQNO",
          a."FLIGHTPREFIX",
          a."FLIGHTNUMBER",
          a."DEPTCD",
          a."EXTPERSON_SEQNO",
          a."EXTPERMITDTE",
          a."EXTFLAG",
          a."CHNGPERSON_SEQNO",
          a."CHNGPERMITDTE",
          a."CHNGFLAG",
          a."RQSPERSON_SEQNO",
          a."RQSPERMITDTE",
          a."RQSFLAG",
          a."FNPERSON_SEQNO",
          a."ALIEN_SEQNO",
          a."PROCESSDTE",
          get_cal_age (birthdte) age,
          TRUNC (SYSDATE) sysdte,
          TRUNC (get_lastovsvisaexp (iovseqno)) lastdte
     FROM immoverstay a
    WHERE a.nationcd IS NOT NULL
          AND a.count_seqno IS NOT NULL      
          AND a.dept_seqno IS NOT NULL
          AND a.inoutdte IS NOT NULL
          AND a.visaexpdte IS NOT NULL
          AND a.visatype_seqno IS NOT NULL
          AND a.visatype_seqno NOT IN (10, 9, 19)
          AND a.visatype_seqno IN (SELECT visatype_seqno
                                     FROM visatype
                                    WHERE actflag = 'Y')
          --and tdtno not in (select tdtno from vwv03)
          --AND count_seqno = 96;;
