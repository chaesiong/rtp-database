CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWEDNQ_EXPDTE" ("EDNQPERSON_SEQNO", "NATIONCD", "CPASSPORTNO", "CPASSPORTEXP_DATE", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "TFAMILYNM", "RCNO_RUNNINGNO", "RCNO_YEAR", "TFIRSTNM", "TMIDDLENM", "BIRTH_DATE", "SEX", "CERTOFRESIDENCE_SEQNO", "PERMIT_DATE", "RESCERTTYPE", "RCNO_PVCD", "RESCERTNO", "FLAGPERMIT", "RESCERTTYPE_SEQNO", "DEPTISSUEDRCNAME", "NATIONENM", "PERMIT_SEQNO", "TM13NO", "TM13STS", "TM22STS", "TM22TYPE", "FLAGUPDATEEDNQ", "STATUSEDNQ", "TM22_SEQNO", "ISSUE_DATE") AS 
  SELECT   a.EDNQPERSON_SEQNO,
            get_CountCD (a.nation_seqno) nationcd,
            a.passportno cpassportno,
            TO_CHAR (a.passportexp_date, 'dd/mm/yyyy') cpassportexp_date,
            a.efamilynm,
            a.efirstnm,
            a.emiddlenm,
            a.tfamilynm,
            a.rcno_runningno,
            a.rcno_year,
            a.tfirstnm,
            a.tmiddlenm,
            a.birth_date,
            a.sex,
            a.CERTOFRESIDENCE_SEQNO,
            TO_CHAR (a.EDMEXP_DATE, 'dd/mm/yyyy') permit_date,
            get_CRSRescertType (a.rescerttype_seqno) rescerttype,
            a.rcno_pvcd,
            a.rcno_runningno || '/' || a.rcno_year rescertno,
            (CASE
                WHEN TO_NUMBER (TO_CHAR (a.EDMEXP_DATE, 'yyyymmdd')) <
                        TO_NUMBER (TO_CHAR (SYSDATE, 'yyyymmdd'))
                THEN
                   'PERMITEXPIRE'
             END)
               flagpermit,
            a.rescerttype_seqno,
            get_DeptIssueDrcName ('0'||a.rcno_pvcd) deptissuedrcname,
            (SELECT   nationenm
               FROM   country
              WHERE   count_seqno = a.nation_seqno)
               nationenm,
            a.PERMIT_SEQNO,
            a.TM13NO,
            a.TM13STS,
            a.TM22STS,
            DECODE (a.TM22TYPE,
                    'S',
                    'Single',
                    'M',
                    'Multiple')
               TM22TYPE,
            get_StatusUpdateEdnq (
               a.TM22TYPE,
               TO_NUMBER (TO_CHAR (EDMEXP_DATE, 'yyyymmdd'))
            )
               flagupdateednq,
            STATUSEDNQ,
						a.tm22_seqno,
						a.nqissue_date issue_date
     FROM   ednq_person a
    WHERE   (1 = 1);
