CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."PERSONVIEW" ("TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "TNAME", "EFAMILYNM", "EMIDDLENM", "EFIRSTNM", "ENAME", "CITIZENID", "IDCARD", "BIRTHDTE", "SEX", "NATIONICAO", "NATIONCD", "NATIONTNM", "PASSPORTNO", "PASSPORTDTE", "PASSPORTEXPDTE", "EDMEXP_DATE", "CREATE_BY", "CREATE_DEPT", "GO_COUNTRY", "EDMISSUE_DATE", "EDMEXP_DATE_1", "EDMISSUE_BY", "NQISSUE_DATE", "NQEXP_DATE", "NQISSUE_BY") AS 
  SELECT   tfirstnm,
            tmiddlenm,
            tfamilynm,
            tfirstnm || ' ' || tfamilynm tname,
            efamilynm,
            emiddlenm,
            efirstnm,
            efamilynm || ' ' || emiddlenm || ' ' || efirstnm ename,
            citizenid,
            citizenid idcard,
            birthdte,
            DECODE (sex,
                    'M',
                    'ชาย',
                    'F',
                    'หญิง')
               sex,
            'THA' nationicao,
            nationcd,
            'ไทย' nationtnm,
            passportno,
            PASSPORTDTE,
            PASSPORTEXPDTE,
            NULL EDMEXP_DATE,
            '' create_by,
            '' create_dept,
            '' go_country,
            NULL edmissue_date,
            NULL edmexp_date,
            '' edmissue_by,
            NULL nqissue_date,
            NULL nqexp_date,
            '' nqissue_by
     FROM   thaipassport
   UNION ALL
   SELECT   tfirstnm,
            tmiddlenm,
            tfamilynm,
            tfirstnm || ' ' || tfamilynm tname,
            efamilynm,
            emiddlenm,
            efirstnm,
            efamilynm || ' ' || emiddlenm || ' ' || efirstnm ename,
               DECODE (RESCERTTYPE_SEQNO,
                       1,
                       '15',
                       2,
                       '16',
                       3,
                       '17',
                       4,
                       '17')
            || rcno_pvcd
            || rcno_runningno
            || rcno_year
               citizenid,
               DECODE (RESCERTTYPE_SEQNO,
                       1,
                       'ตม.15 ',
                       2,
                       'ตม.16 ',
                       3,
                       'ตม.17 ',
                       4,
                       'ตม.17 ')
            || '('
            || rcno_pvcd
            || ')'
            || rcno_runningno
            || '/'
            || rcno_year
               idcard,
            a.BIRTH_DATE birthdte,
            DECODE (a.sex,
                    'M',
                    'ชาย',
                    'F',
                    'หญิง')
               sex,
            get_NationsAbbBySeq (nation_seqno) nationicao,
            GET_NATIONSBYSEQ (nation_seqno, 'S') nationcd,
            GET_NATIONSBYSEQ (nation_seqno, 'T') nationtnm,
            passportno,
            PASSPORT_DATE PASSPORTDTE,
            PASSPORTEXP_DATE PASSPORTEXPDTE,
            EDMEXP_DATE,
            get_RankNm (a.create_by, 'S') || ' ' || B.NAME || ' ' || B.SNAME
               create_by,
            GET_DEPTNAME (B.DEPT_SEQNO, 'T') create_dept,
            (SELECT   GET_COUNTRYNM (COUNT_SEQNO, 'T')
               FROM   EDNQ_TM13
              WHERE   tm13_seqno = A.TM13_SEQNO)
               go_country,
            edmissue_date,
            edmexp_date,
            edmissue_by,
            nqissue_date,
            edmexp_date nqexp_date,
            nqissue_by
     FROM   ednq_person a, hr_profile b
    WHERE   A.CREATE_BY = b.PID(+) ;
  GRANT SELECT ON "PIBICSDM2"."PERSONVIEW" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."PERSONVIEW" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."PERSONVIEW" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."PERSONVIEW" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."PERSONVIEW" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."PERSONVIEW" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."PERSONVIEW" TO "BIOSAADM";
