CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_FINES_STAFF" ("PROFILE_SEQNO", "USER_ID", "POS", "RANKNAME", "NAME", "SNAME", "DEPT_SEQNO", "FLAG_FINES_STAFF") AS 
  select a.profile_seqno, b.user_id, get_poslevelname(level_seqno) pos, GET_RANKNAME(rank_seqno, 'A') rankname, name, sname, a.dept_seqno, flag_fines_staff 
from hr_profile a, fw_user b, department d
where a.profile_seqno = b.person_id
and a.dept_seqno = d.dept_seqno
and a.status_tm = 'Y'
and d.flag_fines_staff = 'Y'
--and dept_seqno in (
--select dept_seqno from department where (rel_code  = 16 or dept_seqno = 16) or rel_code in (select dept_seqno from department where rel_code  = 16))
and level_seqno between 11 and 12
--and e.group_id in (34, 72)
and b.user_id not in ('angkarn','arsom','apipon','ittipon','krittaya','sumet.c','prapan');
