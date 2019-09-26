CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEW_AMPUR90" ("ORI_SEQNO", "TMP90_SEQNO", "ORI_DESC", "TMP90_DESC") AS 
  select a.amp_seqno ori_seqno,t.amp_seqno tmp90_seqno, a.amp_desc ori_desc, t.amp_desc tmp90_desc  
from ampur90_tmp t
left join  ampur a
on t.amp_desc = a.amp_desc;
