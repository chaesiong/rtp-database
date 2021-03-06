CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_QFN90" ("PV_SEQNO", "DEPTLEVEL", "DEPT_SEQNO", "ZONE_SEQNO", "DEPTENM", "ADDR", "TELNO", "QFN90_TYPE", "QFN90_NOTE", "DEPT_ACTFLAG", "ZONE_ACTFLAG") AS 
  SELECT A.PV_SEQNO,
            a.deptlevel,
            a.dept_seqno,
            b.zone_seqno,
            a.deptenm || DECODE (b.zone_seqno, NULL, '', '/' || b.zonenm)
               deptenm,
            DECODE (b.zone_seqno, NULL, a.addr, b.addr) addr,
            DECODE (b.zone_seqno, NULL, a.telno, b.telno) telno,
            DECODE (
               DECODE (b.zone_seqno, NULL, a.qfn90_type, b.qfn90_type),
               'N', 'ปกติเท่านั้น',
               'S', 'กฎหมายพิเศษ (boi) เท่านั้น',
               'A', 'ทุกประเภท')
               qfn90_type,
            DECODE (b.zone_seqno, NULL, a.qfn90_note, b.qfn90_note) qfn90_note,
            a.actflag dept_actflag,
            b.actflag zone_actflag
       FROM department a, zone b
      WHERE a.dept_seqno = b.dept_seqno(+)
            AND (a.actflag = 'Y' AND (b.actflag IS NULL OR b.actflag = 'Y'))
            AND DECODE (b.zone_seqno, NULL, A.Qfn90_ACTFLAG, B.Qfn90_ACTFLAG) =
                   'Y'
            AND a.deptlevel IN (2, 3)
   ORDER BY a.dept_seqno;
  GRANT SELECT ON "PIBICSDM2"."VW_QFN90" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_QFN90" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_QFN90" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_QFN90" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_QFN90" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_QFN90" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_QFN90" TO "BIOSAADM";
