CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_DEPTFN" ("DEPT_SEQNO", "DEPTABBFMT4", "PV_SEQNO", "PV_DESC") AS 
  select DEPT_SEQNO,get_DEPTABBFMT4(dept_seqno) DEPTABBFMT4,
DECODE (DEPT_SEQNO, 14, 140, get_ProvinceFromDept(dept_seqno,'')) PV_SEQNO,
get_ProvinceFromDept(dept_seqno,'T') PV_DESC
from (
select dept_seqno
from tambon
where dept_seqno is not null
union all
select 14 dept_seqno from dual)
group by dept_seqno;
