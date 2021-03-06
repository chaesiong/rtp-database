CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTTWOPERNON" ("ESTIMATEYEAR", "ESTIMATEMONTH", "DEPTNM", "LEVEL_SEQNO", "FULLNAME", "OTMONEY", "DEPT_SEQNO", "TOCTWOPER") AS 
  SELECT   c.estimateyear,
              c.estimatemonth,
              GET_DEPTNAME (b.dept_seqno, 'T') deptnm,
              b.level_seqno,
              GET_RANKNAME (b.rank_seqno, 'A') || b.name || '  ' || b.sname
                 fullname,
              ROUND (
                 GET_OTRATE (C.ESTIMATEYEAR, C.ESTIMATEMONTH, B.PROFILE_SEQNO)
                 * GET_OTPERMONEY (c.estimateyear, c.estimatemonth),
                 2
              )
                 otmoney,
              b.dept_seqno dept_seqno,
              ROUND (
                 (GET_OTRATE (C.ESTIMATEYEAR, C.ESTIMATEMONTH, B.PROFILE_SEQNO)
                  * GET_OTPERMONEY (c.estimateyear, c.estimatemonth)
                  / 100)
                 * get_OtNonTm2 (b.dept_seqno, b.level_seqno, 'T'),
                 2
              )
                 toctwoper
       FROM   ot_rate a,
              hr_profile b,
              ot_otslip c,
              department d,
              ot_policedue e
      WHERE   A.POSLEVEL_SEQNO = B.LEVEL_SEQNO AND b.dept_seqno = d.dept_seqno
              AND (c.estimateyear = e.estimateyear
                   AND C.ESTIMATEMONTH = e.estimatemonth)
   GROUP BY   B.PROFILE_SEQNO,
              c.estimateyear,
              c.estimatemonth,
              b.name,
              b.sname,
              a.otrate,
              b.level_seqno,
              b.rank_seqno,
              b.dept_seqno,
              e.relationamount,
              E.RELATIONFUND,
              E.WARRANTFUND,
              e.policedeathamount,
              e.commissionfund,
              E.EMPLOYEEFUND,
              b.c_type,
              b.cremation,
              d.rel_code
   ORDER BY   TO_NUMBER (b.level_seqno) ;
  GRANT SELECT ON "PIBICSDM2"."VWOTTWOPERNON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWOTTWOPERNON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWOTTWOPERNON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWOTTWOPERNON" TO "BIOSAADM";
