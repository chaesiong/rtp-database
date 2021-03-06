CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTSUM" ("SUMOTMONEY", "SUMZEROTWOPER", "SUMZEROEIGHTPER", "TWOPER", "TOCTWOPER") AS 
  SELECT   SUM (otmoney) sumotmoney,
            SUM (zerotwoper) sumzerotwoper,
            SUM (zeroeightper) sumzeroeightper,
            SUM (twoper) twoper,
            SUM (toctwoper) toctwoper
     FROM   (  SELECT   c.estimateyear,
                        c.estimatemonth,
                        GET_DEPTNAME (b.dept_seqno, 'T') deptnm,
                        b.level_seqno,
                           GET_RANKNAME (b.rank_seqno, 'A')
                        || b.name
                        || '  '
                        || b.sname
                           fullname,
                        a.otrate * (  SELECT   rateper FROM vwotrateper) otmoney,
                        (a.otrate * (  SELECT   rateper FROM vwotrateper) / 100)
                        * 0.2
                           zerotwoper,
                        (a.otrate * (  SELECT   rateper FROM vwotrateper) / 100)
                        * 0.8
                           zeroeightper,
                        (a.otrate * (  SELECT   rateper FROM vwotrateper) / 100)
                        * 2
                           twoper,
                        (a.otrate * (  SELECT   rateper FROM vwotrateper) / 100)
                        * 2
                           toctwoper
                 FROM   ot_rate a,
                        hr_profile b,
                        ot_otslip c,
                        department d
                WHERE       A.POSLEVEL_SEQNO = B.LEVEL_SEQNO
                        AND b.dept_seqno = d.dept_seqno
                        AND (    D.dept_seqno != 3
                             AND D.rel_code != 3
                             AND D.rel_code NOT IN (SELECT   dept_seqno
                                                      FROM   department
                                                     WHERE   rel_code = 3)
                             OR (D.REL_CODE IS NULL AND D.DEPT_SEQNO != 3))
             GROUP BY   B.PROFILE_SEQNO,
                        c.estimateyear,
                        c.estimatemonth,
                        b.name,
                        b.sname,
                        a.otrate,
                        b.level_seqno,
                        b.rank_seqno,
                        b.dept_seqno
             ORDER BY   b.level_seqno) ;
  GRANT SELECT ON "PIBICSDM2"."VWOTSUM" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUM" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUM" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUM" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUM" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUM" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWOTSUM" TO "BIOSAADM";
