CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWTMPERSONALL" ("DEPTABBFMT3", "ถ่ายรูป", "ไม่ถ่ายรูป", "TOTAL") AS 
  select deptabbfmt3, sum(capture) ถ่ายรูป, sum(nocapture) ไม่ถ่ายรูป, sum(capture) + sum(nocapture) total from (
select b.deptabbfmt3,  decode(chkcapture, 'Y', '1', '0') capture, decode(chkcapture, 'N', '1', '0') nocapture 
from tmpersonex30 a, department b 
where a.dept_seqno =b.dept_seqno
union all
select b.deptabbfmt3,  decode(chkcapture, 'Y', '1', '0') capture, decode(chkcapture, 'N', '1', '0') nocapture
from tmpersonex90 a, department b 
where a.dept_seqno =b.dept_seqno
union all
select b.deptabbfmt3,  decode(chkcapture, 'Y', '1', '0') capture, decode(chkcapture, 'N', '1', '0') nocapture
from tmpersontowv15 a, department b 
where a.dept_seqno =b.dept_seqno and nationcd not in ('I02', 'U07', 'E05', 'U06', 'R03', 'B20', 'M16', 'T01', 'C10', 'B15', 'K06')
union all
select b.deptabbfmt3,  decode(chkcapture, 'Y', '1', '0') capture, decode(chkcapture, 'N', '1', '0') nocapture
from tmpersontowv30 a, department b  
where a.dept_seqno =b.dept_seqno and nationcd not in ('H04', 'B14', 'V03')
)
group by deptabbfmt3;
