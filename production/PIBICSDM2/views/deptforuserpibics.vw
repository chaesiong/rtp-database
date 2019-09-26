CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."DEPTFORUSERPIBICS" ("DEPTSEQ", "DEPTCD", "DEPTABBFMT1", "DEPTABBFMT2", "RLC", "DEPTLEVEL", "DLD", "CHECKPOINT", "DEPTNAMELEVEL1", "DEPTNAMELEVEL2", "DEPTNAMELEVEL3", "DEPTTNM") AS 
  select deptseq, deptcd, deptabbfmt1, deptabbfmt2, rlc,deptlevel, dld, checkpoint,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, depttnm 
from (
    select dept_seqno deptseq, deptcd, deptabbfmt1, deptabbfmt2, dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld, checkpoint, depttnm 
    from department where deptlevel = 4 and actflag ='Y'
    union
    select dept_seqno deptseq, deptcd, deptabbfmt1, deptabbfmt2, dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld, checkpoint, depttnm  
    from department where deptlevel = 0 and actflag ='Y'
    union
    select dept_seqno deptseq, deptcd, deptabbfmt1, deptabbfmt2, dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld, checkpoint, depttnm 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt1,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld, checkpoint, depttnm  
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt1,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld, checkpoint, depttnm  
    from department d where deptlevel = 3 and actflag ='Y'
    );
