CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_LA_PERSON" ("PERSON_SEQNO", "FLAG_SEQNO", "SUFFIX_SEQNO", "EFIRSTNM", "EFAMILYNM", "EMIDDLENM", "BIRTHDATE", "NATION_SEQNO", "SEX", "OCC_SEQNO", "TL38", "IMGPERSON", "TM6NO", "ARRIVED_BY", "ARRIVED_DATE", "ARRIVED_DEPT", "IMGPASS", "PASSPORTNO", "PASSPORT_ISSUEAT", "PASSPORT_ISSUEDATE", "PASSPORT_EXPDATE", "VISANO", "VISA_SEQNO", "VISA_DATE", "VISA_EXPDATE", "CREATE_BY", "APPLY_DATE", "CDEPT_SEQNO", "CZONE_SEQNO") AS 
  SELECT a.PERSON_SEQNO,
          DECODE (b.movestamphist_seqno,
                  NULL, TO_CHAR (a.person_seqno),
                  'M' || b.movestamphist_seqno)
             FLAG_SEQNO,
          a.SUFFIX_SEQNO,
          a.EFIRSTNM,
          a.EFAMILYNM,
          a.EMIDDLENM,
          a.BIRTHDATE,
          a.NATION_SEQNO,
          a.SEX,
          a.OCC_SEQNO,
          a.TL38,
          a.IMGPERSON,
          a.TM6NO,
          a.ARRIVED_BY,
          a.ARRIVED_DATE,
          a.ARRIVED_DEPT,
          DECODE (b.movestamphist_seqno, NULL, a.imgpass, b.imgpass) IMGPASS,
          DECODE (b.PASSPORTNO, NULL, a.PASSPORTNO, b.PASSPORTNO) PASSPORTNO,
          DECODE (b.PASSPORT_ISSUEAT,
                  NULL, a.PASSPORT_ISSUEAT,
                  b.PASSPORT_ISSUEAT)
             PASSPORT_ISSUEAT,
          DECODE (b.PASSPORT_ISSUEDATE,
                  NULL, a.PASSPORT_ISSUEDATE,
                  b.PASSPORT_ISSUEDATE)
             PASSPORT_ISSUEDATE,
          DECODE (
             b.movestamphist_seqno,
             NULL, GET_LAEXTEND_EXPIRY (a.person_seqno,
                                        a.PASSPORT_EXPDATE,
                                        'P'),
             GET_LAEXTEND_EXPIRY ('M' || b.movestamphist_seqno,
                                  b.PASSPORT_EXPDATE,
                                  'P'))
             PASSPORT_EXPDATE,
          a.VISANO,
          a.VISA_SEQNO,
          a.VISA_DATE,
          DECODE (
             b.movestamphist_seqno,
             NULL, GET_LAEXTEND_EXPIRY (a.person_seqno, a.VISA_EXPDATE, 'V'),
             GET_LAEXTEND_EXPIRY ('M' || b.movestamphist_seqno,
                                  a.VISA_EXPDATE,
                                  'V'))
             VISA_EXPDATE,
          a.create_by,
          A.CREATE_DATE APPLY_DATE,
          A.CDEPT_SEQNO,
          A.CZONE_SEQNO
     FROM la_person a,
          --Data Movestamphist
          (SELECT movestamphist_seqno,
                  person_seqno,
                  IMGPASS,
                  PASSPORTNO,
                  PASSPORT_ISSUEAT,
                  PASSPORT_ISSUEDATE,
                  PASSPORT_EXPDATE
             FROM la_movestamphist aa
            WHERE actflag = 'Y'
                  AND movestamphist_seqno =
                         (SELECT MAX (bb.movestamphist_seqno)
                            FROM la_movestamphist bb
                           WHERE bb.person_seqno = aa.person_seqno)) b
    WHERE a.actflag = 'Y' AND a.person_seqno = b.person_seqno(+);
