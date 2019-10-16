CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWFORREVOKE" ("TM8_SEQNO", "TM8CHILD_SEQNO", "NUMBERTM8", "DOCDATEST", "DOC_DATE", "ALLNAME", "PASSPORTNO", "FAMILYNM", "FIRSTNM", "MIDDLENM", "REPS_PK", "FLAGTB", "TM6NO", "APPVSTSNM", "DOCTYPE", "PERMITDATE", "SEXNM", "NATIONAL_SEQNO", "DEPT_SEQNO", "APPVSTS", "SEX", "SLIP", "SLIPNUM", "TM8NO", "BIRTH_DATE", "YEAR", "SLIPNO") AS 
  SELECT   TM8_SEQNO,
            TM8CHILD_SEQNO,
            NUMBERTM8,
            DOCDATEST,
            DOC_DATE,
            ALLNAME,
            PASSPORTNO,
            FAMILYNM,
            FIRSTNM,
            MIDDLENM,
            REPS_PK,
            FLAGTB,
            TM6NO,
            APPVSTSNM,
            DOCTYPE,
            PERMITDATE,
            SEXNM,
            NATIONAL_SEQNO,
            DEPT_SEQNO,
            APPVSTS,
            SEX,
            SLIP,
            SLIPNUM,
            TM8NO,
            BIRTH_DATE,
            YEAR,
            DECODE (
               REPLACE ('(1' || slip || '/' || slipnum || '1)', '(1/1)', ' '),
               ' ',
               ' ',
               (slip || '/' || slipnum)
            )
               slipno
     FROM   (  SELECT   tm8_seqno,
                        1 tm8child_seqno,
                        REPLACE (
                              tm8no
                           || '/'
                           || year
                           || ' (1/'
                           || (childno + 1)
                           || ')',
                           '(1/1)',
                           ''
                        )
                           NUMBERTM8,
                        TO_CHAR (doc_date, 'dd/mm/yyyy') docdatest,
                        doc_date,
                        familynm || ' ' || firstnm || ' ' || middlenm ALLNAME,
                        passportno,
                        familynm,
                        firstnm,
                        middlenm,
                        tm8_seqno reps_pk,
                        'REPS_TM8' flagtb,
                        TM6NO,
                        DECODE (appvsts,
                                'A', 'อนุญาต',
                                'N', 'ไม่อนุญาต',
                                'W', 'รอฟังผล',
                                'C', 'ยกเลิกคำขอ',
                                'เพิกถอน')
                           APPVSTSNM,
                        DECODE (doctype, 'S', 'Single', 'Multiple') DOCTYPE,
                        TO_CHAR (endpermit_date, 'dd/mm/yyyy') PERMITDATE,
                        DECODE (sex, 'F', 'FEMALE', 'MALE') SEXNM,
                        NATIONAL_SEQNO,
                        dept_seqno,
                        APPVSTS,
                        SEX,
                        get_Fsfees (fees_seqno, 'T') SLIP,
                        get_Fsfees (fees_seqno, 'E') slipnum,
                        tm8no,
                        birth_date,
                        year
                 FROM   REPS_TM8
             ORDER BY   tm8_seqno) ;