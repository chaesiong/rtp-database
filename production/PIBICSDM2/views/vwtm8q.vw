CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWTM8Q" ("TM8_SEQNO", "TM8CHILD_SEQNO", "NUMBERTM8", "DOCDATEST", "DOC_DATE", "ALLNAME", "PASSPORTNO", "FAMILYNM", "FIRSTNM", "MIDDLENM", "REPS_PK", "FLAGTB", "TM6NO", "APPVSTSNM", "DOCTYPE", "PERMITDATE", "SEXNM", "NATIONAL_SEQNO", "DEPT_SEQNO", "APPVSTS", "OVISA_SEQNO", "PERMIT", "SEX", "SLIP", "SLIPNUM", "FEES_SEQNO", "TM8NO", "BIRTH_DATE", "DOCTPYENM", "YEAR", "SLIPNO", "DEPTNM", "CREATE_DATE", "CREATE_BY", "IPADDRESS", "REASONDESC", "EXTLIST_SEQNO", "ZONE_SEQNO", "ADDR", "ROAD", "PV_SEQNO", "AMP_SEQNO", "TMB_SEQNO", "TELEPHONE", "FLAG_QUEONLINE", "UPDATE_BY", "UPDATE_DATE", "AGE", "ARRIVE_DATE", "PD_SEQNO") AS 
  SELECT TM8_SEQNO,
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
          OVISA_SEQNO,
          PERMIT,
          SEX,
          SLIP,
          SLIPNUM,
          FEES_SEQNO,
          TM8NO,
          BIRTH_DATE,
          DOCTPYENM,
          YEAR,
          DECODE (
             REPLACE ('(1' || SLIPNUM || '/' || SLIP || '1)', '(1/1)', ' '),
             ' ', ' ',
             (SLIPNUM || '/' || SLIP))
             SLIPNO,
          deptnm,
          create_date,
          create_by,
          ipaddress,
          REASONDESC,
          EXTLIST_SEQNO,
          ZONE_SEQNO,
          ADDR,
          ROAD,
          PV_SEQNO,
          AMP_SEQNO,
          TMB_SEQNO,
          TELEPHONE,
          FLAG_QUEONLINE,
          UPDATE_BY,
          UPDATE_DATE,
          AGE,
          ARRIVE_DATE,
					PD_SEQNO
     FROM (SELECT TM8_SEQNO,
                  1 TM8CHILD_SEQNO,
                  REPLACE (
                     TM8NO || '/' || YEAR || ' (1/' || (CHILDNO + 1) || ')',
                     '(1/1)',
                     '')
                     NUMBERTM8,
                  TO_CHAR (DOC_DATE, 'dd/mm/yyyy') DOCDATEST,
                  DOC_DATE,
                  FAMILYNM || ' ' || FIRSTNM || ' ' || MIDDLENM ALLNAME,
                  PASSPORTNO,
                  FAMILYNM,
                  FIRSTNM,
                  MIDDLENM,
                  TM8_SEQNO REPS_PK,
                  'REPS_TM8' FLAGTB,
                  TM6NO,
                  DECODE (
                     APPVSTS,
                     'A', 'อนุญาต',
                     'N', 'ไม่อนุญาต',
                     'W', 'รอฟังผล',
                     'C', 'ยกเลิกคำขอ',
                     'R', 'สิ้นสุดการอนุญาต',
                     '')
                     APPVSTSNM,
                  DECODE (DOCTYPE, 'S', 'Single', 'Multiple') DOCTYPE,
                  TO_CHAR (ENDPERMIT_DATE, 'dd/mm/yyyy') PERMITDATE,
                  DECODE (SEX, 'F', 'FEMALE', 'MALE') SEXNM,
                  NATIONAL_SEQNO,
                  DEPT_SEQNO,
                  APPVSTS,
                  SEX,
                  GET_FSFEES (FEES_SEQNO, 'T') SLIP,
                  GET_FSFEES (FEES_SEQNO, 'E') SLIPNUM,
                  TM8NO,
                  BIRTH_DATE,
                  YEAR,
                  OVISATYPE_SEQNO OVISA_SEQNO,
                  FEES_SEQNO,
                  OPERMIT_SEQNO PERMIT,
                  GET_DOCTYPETM8 (TM8_SEQNO) DOCTPYENM,
                  GET_DEPTall (dept_seqno, 'D') deptnm,
                  create_date,
                  create_by,
                  ipaddress,
                  REASONDESC,
                  EXTLIST_SEQNO,
                  ZONE_SEQNO,
                  ADDR,
                  ROAD,
                  PV_SEQNO,
                  AMP_SEQNO,
                  TMB_SEQNO,
                  TELEPHONE,
                  FLAG_QUEONLINE,
                  UPDATE_BY,
                  UPDATE_DATE,
                  AGE,
                  ARRIVE_DATE,
									PD_SEQNO
             FROM REPS_TM8
           UNION ALL
           SELECT B.TM8_SEQNO,
                  B.TM8CHILD_SEQNO,
                  REPLACE (
                        GET_SEQNOREPSTM8 (B.TM8_SEQNO)
                     || ' ('
                     || GET_RUNOTM8 (B.TM8CHILD_SEQNO, B.TM8_SEQNO)
                     || '/'
                     || GET_CHILDNOTM8 (B.TM8_SEQNO)
                     || ')',
                     '(1/0)',
                     '')
                     NUMBERTM8,
                  GET_DOC_DATETM8 (B.TM8_SEQNO) DOCDATEST,
                  TO_DATE (GET_DOC_DATETM8 (B.TM8_SEQNO), 'dd/mm/yyyy')
                     DOC_DATE,
                  B.CFAMILYNM || ' ' || B.CFIRSTNM || ' ' || B.CMIDDLENM
                     ALLNAME,
                  GET_PASSTM8 (B.TM8_SEQNO) PASSPORTNO,
                  B.CFAMILYNM FAMILYNM,
                  B.CFIRSTNM FIRSTNM,
                  B.CMIDDLENM MIDDLENM,
                  B.TM8CHILD_SEQNO REPS_PK,
                  'REPS_TM8CHILD' FLAGTB,
                  B.TM6NO,
                  DECODE (
                     B.APPVSTSCHILD,
                     'A', 'อนุญาต',
                     'N', 'ไม่อนุญาต',
                     'W', 'รอฟังผล',
                     'C', 'ยกเลิกคำขอ',
                     'R', 'สิ้นสุดการอนุญาต',
                     '')
                     APPVSTSNM,
                  DECODE ( (GET_DOCTYPETM8 (B.TM8_SEQNO)),
                          'S', 'Single',
                          'Multiple')
                     DOCTYPE,
                  TO_CHAR (B.CPERMIT_DATE, 'dd/mm/yyyy') PERMITDATE,
                  DECODE (B.SEX, 'F', 'FEMALE', 'MALE') SEXNM,
                  B.NATION_SEQNO NATIONAL_SEQNO,
                  TO_NUMBER (GET_DEPTTM8 (B.TM8_SEQNO)) DEPT_SEQNO,
                  B.APPVSTSCHILD APPVSTS,
                  B.SEX,
                  GET_FSFEES (B.FEES_SEQNO, 'T') SLIP,
                  GET_FSFEES (B.FEES_SEQNO, 'E') SLIPNUM,
                  B.TM8NO,
                  B.CBIRTH_DATE BIRTH_DATE,
                  B.YEAR,
                  TO_NUMBER (GET_VISATYPETM8 (B.TM8_SEQNO)) OVISA_SEQNO,
                  B.FEES_SEQNO,
                  B.PERMIT_SEQNO PERMIT,
                  GET_DOCTYPETM8 (B.TM8_SEQNO) DOCTPYENM,
                  GET_DEPTALL (GET_DEPTTM8 (B.TM8_SEQNO), 'D') DEPTNM,
                  B.CREATE_DATE,
                  B.CREATE_BY,
                  B.IPADDRESS,
                  B.REASONCHILD REASONDESC,
                  NULL EXTLIST_SEQNO,
                  A.ZONE_SEQNO,
                  NULL ADDR,
                  NULL ROAD,
                  NULL PV_SEQNO,
                  NULL AMP_SEQNO,
                  NULL TMB_SEQNO,
                  NULL TELEPHONE,
                  A.FLAG_QUEONLINE,
                  B.UPDATE_BY,
                  B.UPDATE_DATE,
                  B.AGE,
                  A.ARRIVE_DATE,
									A.PD_SEQNO
             FROM REPS_TM8 A, REPS_TM8CHILD B
            WHERE B.TM8_SEQNO(+) = A.TM8_SEQNO);
  GRANT SELECT ON "PIBICSDM2"."VWTM8Q" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWTM8Q" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWTM8Q" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWTM8Q" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWTM8Q" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWTM8Q" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWTM8Q" TO "BIOSAADM";
