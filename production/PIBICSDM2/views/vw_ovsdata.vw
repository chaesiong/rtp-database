CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_OVSDATA" ("EXTOVS_SEQNO", "PV_SEQNO", "PV_DESC_EN", "AMP_SEQNO", "AMP_DESC_EN", "TMB_SEQNO", "TMB_DESC_EN") AS 
  select EXTOVS_SEQNO, a.pv_seqno, p.pv_desc_en, a.amp_seqno, am.amp_desc_en,
a.tmb_seqno, t.tmb_desc_en
from processot a, province p, ampur am, tambon t 
where a.pv_seqno = p.pv_seqno 
and a.amp_seqno = am.amp_seqno 
and a.tmb_seqno = t.tmb_seqno;
