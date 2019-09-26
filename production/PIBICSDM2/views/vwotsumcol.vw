CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTSUMCOL" ("ESTIMATEYEAR", "ESTIMATEMONTH", "OTMONEY", "ZEROTWOPER", "ZEROEIGHTPER", "TWOPER", "TOCTWOPER", "POLICEDEATH", "CREMATION", "TAXRATE", "WATER", "DEPTSEQNO") AS 
  SELECT   estimateyear,
              estimatemonth,
              TRIM (TO_CHAR (SUM (OTmoney), '999,999,999.99')) OTmoney,
              TRIM (TO_CHAR (SUM (zerotwoper), '999,999,999.99')) zerotwoper,
              TRIM (TO_CHAR (SUM (zeroeightper), '999,999,999.99'))
                 zeroeightper,
              TRIM (TO_CHAR (SUM (twoper), '999,999,999.99')) twoper,
              TRIM (TO_CHAR (SUM (toctwoper), '999,999,999.99')) toctwoper,
              TRIM (TO_CHAR (SUM (policedeath), '999,999,999.99')) policedeath,
              TRIM (TO_CHAR (SUM (cremation), '999,999,999.99')) cremation,
              TRIM (TO_CHAR (SUM (taxrate), '999,999,999.99')) taxrate,
              TRIM (TO_CHAR (SUM (water), '999,999,999.99')) water,
              deptseqno
       FROM   (  SELECT   C.ESTIMATEYEAR,
                          C.ESTIMATEMONTH,
                          GET_DEPTNAME (B.DEPT_SEQNO, 'T') DEPTNM,
                          B.LEVEL_SEQNO,
                             GET_RANKNAME (B.RANK_SEQNO, 'A')
                          || B.NAME
                          || '  '
                          || B.SNAME
                             FULLNAME,
                          B.DEPT_SEQNO deptseqno,
                          get_otrate (C.ESTIMATEYEAR,
                                      C.ESTIMATEMONTH,
                                      b.profile_seqno)
                             OTRATE,
                          D.DEPT_SEQNO DEPT_SEQNO,
                          B.RANK_SEQNO RANK_SEQNO,
                          B.PROFILE_SEQNO PROFILE_SEQNO,
                          B.NAME,
                          B.SNAME,
                          TO_CHAR(ROUND (
                                     get_otrate (C.ESTIMATEYEAR,
                                                 C.ESTIMATEMONTH,
                                                 b.profile_seqno)
                                     * GET_OTPERMONEY (C.ESTIMATEYEAR,
                                                       C.ESTIMATEMONTH),
                                     2
                                  ))
                             OTMONEY,
                          TO_CHAR(ROUND (
                                     (get_otrate (C.ESTIMATEYEAR,
                                                  C.ESTIMATEMONTH,
                                                  b.profile_seqno)
                                      * GET_OTPERMONEY (C.ESTIMATEYEAR,
                                                        C.ESTIMATEMONTH)
                                      / 100)
                                     * 0.2,
                                     2
                                  ))
                             ZEROTWOPER,
                          TO_CHAR(ROUND (
                                     (get_otrate (C.ESTIMATEYEAR,
                                                  C.ESTIMATEMONTH,
                                                  b.profile_seqno)
                                      * GET_OTPERMONEY (C.ESTIMATEYEAR,
                                                        C.ESTIMATEMONTH)
                                      / 100)
                                     * 0.8,
                                     2
                                  ))
                             ZEROEIGHTPER,
                          TO_CHAR(ROUND (
                                     (get_otrate (C.ESTIMATEYEAR,
                                                  C.ESTIMATEMONTH,
                                                  b.profile_seqno)
                                      * GET_OTPERMONEY (C.ESTIMATEYEAR,
                                                        C.ESTIMATEMONTH)
                                      / 100)
                                     * 2,
                                     2
                                  ))
                             TWOPER,
                          TO_CHAR(ROUND (
                                     (get_otrate (C.ESTIMATEYEAR,
                                                  C.ESTIMATEMONTH,
                                                  b.profile_seqno)
                                      * GET_OTPERMONEY (C.ESTIMATEYEAR,
                                                        C.ESTIMATEMONTH)
                                      / 100)
                                     * GET_OTNONTM2 (B.DEPT_SEQNO,
                                                     B.LEVEL_SEQNO,
                                                     'T'),
                                     2
                                  ))
                             TOCTWOPER,
                          TO_CHAR(ROUND (
                                     DECODE (
                                        B.C_TYPE,
                                        1,
                                        (E.POLICEDEATHAMOUNT * E.COMMISSIONFUND),
                                        2,
                                        (E.POLICEDEATHAMOUNT * E.WARRANTFUND),
                                        (E.POLICEDEATHAMOUNT * E.EMPLOYEEFUND)
                                     ),
                                     2
                                  ))
                             POLICEDEATH,
                          TO_CHAR(ROUND (
                                     DECODE (B.CREMATION,
                                             'Y',
                                             E.RELATIONAMOUNT * E.RELATIONFUND,
                                             '0.00'),
                                     2
                                  ))
                             CREMATION,
                          TO_CHAR (
                             ROUND (DECODE (F.TAXRATE, NULL, 0.00, F.TAXRATE), 2)
                          )
                             TAXRATE,
                          TO_CHAR(ROUND (
                                     DECODE (
                                        GET_OTWATER (C.ESTIMATEYEAR,
                                                     C.ESTIMATEMONTH,
                                                     B.CARD_ID),
                                        NULL,
                                        0,
                                        GET_OTWATER (C.ESTIMATEYEAR,
                                                     C.ESTIMATEMONTH,
                                                     B.CARD_ID)
                                     ),
                                     2
                                  ))
                             WATER
                   FROM   OT_RATE A,
                          HR_PROFILE B,
                          OT_OTSLIP C,
                          DEPARTMENT D,
                          OT_POLICEDUE E,
                          OT_TAX F
                  WHERE       1 = 1
                          AND A.POSLEVEL_SEQNO = B.LEVEL_SEQNO
                          AND B.DEPT_SEQNO = D.DEPT_SEQNO
                          AND (C.ESTIMATEYEAR = E.ESTIMATEYEAR
                               AND C.ESTIMATEMONTH = E.ESTIMATEMONTH)
                          AND B.LEVEL_SEQNO = F.POSLEVEL_SEQNO(+)
               GROUP BY   B.PROFILE_SEQNO,
                          C.ESTIMATEYEAR,
                          C.ESTIMATEMONTH,
                          B.NAME,
                          B.SNAME,
                          A.OTRATE,
                          B.LEVEL_SEQNO,
                          B.RANK_SEQNO,
                          B.DEPT_SEQNO,
                          F.TAXRATE,
                          B.CARD_ID,
                          E.RELATIONAMOUNT,
                          E.RELATIONFUND,
                          E.WARRANTFUND,
                          E.POLICEDEATHAMOUNT,
                          E.COMMISSIONFUND,
                          E.EMPLOYEEFUND,
                          B.C_TYPE,
                          B.CREMATION,
                          D.REL_CODE,
                          D.DEPT_SEQNO,
                          B.RANK_SEQNO,
                          B.RANK_SEQNO
               ORDER BY   TO_NUMBER (B.LEVEL_SEQNO))
   GROUP BY   estimateyear, estimatemonth, deptseqno ;
