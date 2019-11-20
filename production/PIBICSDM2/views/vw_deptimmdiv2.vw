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
  GRANT SELECT ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_DEPTIMMDIV2" TO "BIOSAADM";
