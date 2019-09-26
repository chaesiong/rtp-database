CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_DEPTIMMDIV2" ("DEPT_SEQNO", "DEPTABBFMT3", "REL_CODE", "DEPTSEQNOL1", "DEPTCARDTYPE") AS 
  select dept_seqno, deptabbfmt3, rel_code, COALESCE(deptseqnol1, '') deptseqnol1, decode(dept_seqno, 92, '1', 93, '2', 94, '1', null) deptcardtype
from (
select 
dept_seqno, deptabbfmt3, rel_code, get_deptseqnolevel1(dept_seqno) deptseqnol1
from department 
where ((dept_seqno = 3 or rel_code = 3) or rel_code in (select dept_seqno from department where rel_code = 3))
and actflag = 'Y' and checkpoint = 'Y'
union all
select 
dept_seqno, deptabbfmt3, rel_code, null deptseqnol1
from department where dept_seqno not in  (
select 
dept_seqno
from department 
where ((dept_seqno = 3 or rel_code = 3) or rel_code in (select dept_seqno from department where rel_code = 3))
and actflag = 'Y' and checkpoint = 'Y') and actflag = 'Y' );
