CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEW_TAMBON90" ("TMP_SEQNO", "TMP_NAME", "ORI_SEQNO", "ORI_NAME") AS 
  select "TMP_SEQNO","TMP_NAME","ORI_SEQNO","ORI_NAME" from (
select t.tmb_seqno as tmp_seqno, a.amp_desc||T.TMB_DESC as tmp_name
from tambon90_tmp t
left join ampur90_tmp a
on t.amp_seqno = a.amp_seqno ) atmp , (
select t.tmb_seqno as ori_seqno , a.amp_desc||t.tmb_desc as ori_name
from tambon t
left join ampur a
on t.amp_seqno = a.amp_seqno ) btmp
where atmp.tmp_name = btmp.ori_name;
