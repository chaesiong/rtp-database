CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTNONAUTHERIZED" ("OTNONAUTHSEQNO", "NONAUTHPERSONSEQNO", "PROFILE_SEQNO", "ESTIMATEYEAR", "ESTIMATEMONTH", "DEPT_SEQNO", "LEVEL_SEQNO", "OTRATE") AS 
  SELECT b.otnonauthseqno,
          a.nonauthpersonseqno,
          a.profile_seqno,
          b.estimateyear,
          b.estimatemonth,
          b.dept_seqno,
          get_levelseqnoformhr_ot (a.profile_seqno) level_seqno,
          a.otrate
     FROM OT_NONAUTHPERSON a, OT_NONAUTHORIZED b
    WHERE b.otnonauthseqno = a.otnonauthseqno;
