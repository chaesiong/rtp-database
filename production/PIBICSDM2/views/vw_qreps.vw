CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_QREPS" ("PV_SEQNO", "DEPTLEVEL", "DEPT_SEQNO", "ZONE_SEQNO", "DEPTENM", "ADDR", "TELNO", "QREPS_TYPE", "QREPS_NOTE", "DEPT_ACTFLAG", "ZONE_ACTFLAG") AS 
  select A.PV_SEQNO,a.deptlevel,a.dept_seqno,b.zone_seqno,a.deptenm||decode(b.zone_seqno,null,'','/'||b.zonenm) deptenm,decode(b.zone_seqno,null,a.addr,b.addr) addr,
decode(b.zone_seqno,null,a.telno,b.telno) telno,
decode(decode(b.zone_seqno,null,a.qreps_type,b.qreps_type),'N','ปกติเท่านั้น','S','กฎหมายพิเศษ (boi) เท่านั้น','A','ทุกประเภท') qreps_type,
decode(b.zone_seqno,null,a.qreps_note,b.qreps_note) qreps_note,a.actflag dept_actflag,b.actflag zone_actflag
from department a,zone b
where a.dept_seqno=b.dept_seqno(+)
and (a.actflag='Y' and (b.actflag is null or b.actflag = 'Y'))
and decode(b.zone_seqno,null,A.Qreps_ACTFLAG,B.Qreps_ACTFLAG)='Y'
and a.deptlevel in (2,3)
order by a.dept_seqno;
  GRANT SELECT ON "PIBICSDM2"."VW_QREPS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_QREPS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_QREPS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_QREPS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_QREPS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_QREPS" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_QREPS" TO "BIOSAADM";
