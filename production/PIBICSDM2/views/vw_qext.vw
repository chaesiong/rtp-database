CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_QEXT" ("PV_SEQNO", "DEPTLEVEL", "DEPT_SEQNO", "ZONE_SEQNO", "DEPTENM", "ADDR", "TELNO", "QEXT_TYPE", "QEXT_NOTE", "DEPT_ACTFLAG", "ZONE_ACTFLAG") AS 
  select A.PV_SEQNO,a.deptlevel,a.dept_seqno,b.zone_seqno,a.deptenm||decode(b.zone_seqno,null,'','/'||b.zonenm) deptenm,decode(b.zone_seqno,null,a.addr,b.addr) addr,
decode(b.zone_seqno,null,a.telno,b.telno) telno,
decode(decode(b.zone_seqno,null,a.qext_type,b.qext_type),'N','ปกติเท่านั้น','S','กฎหมายพิเศษ (boi) เท่านั้น','A','ทุกประเภท') qext_type,
decode(b.zone_seqno,null,a.qext_note,b.qext_note) qext_note,a.actflag dept_actflag,b.actflag zone_actflag
from department a,zone b
where a.dept_seqno=b.dept_seqno(+)
and (a.actflag='Y' and (b.actflag is null or b.actflag = 'Y'))
and decode(b.zone_seqno,null,A.QEXT_ACTFLAG,B.QEXT_ACTFLAG)='Y'
and a.deptlevel in (2,3)
order by a.dept_seqno;