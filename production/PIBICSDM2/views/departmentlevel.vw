CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."DEPARTMENTLEVEL" ("DEPTSEQ", "DEPTCD", "DEPTTNM", "DEPTABBFMT1", "DEPTABBFMT2", "RLC", "DEPTLEVEL", "DLD", "CHECKPOINT", "DEPTNAMELEVEL1", "DEPTNAMELEVEL2", "DEPTNAMELEVEL3", "DEPTABBFMT3", "CONVCD", "DEPTABB1", "DEPTABB2", "DEPTABB3", "REL_CODE") AS 
  SELECT deptseq,
          deptcd,
          depttnm,
          deptabbfmt1,
          deptabbfmt2,
          rlc,
          deptlevel,
          dld,
          checkpoint,
          get_deptnamelevel1 (deptseq, 'T') deptnamelevel1,
          get_deptnamelevel2 (deptseq, 'T') deptnamelevel2,
          get_deptnamelevel3 (deptseq, 'T') deptnamelevel3,
          DEPTABBFMT3,
          CONVCD,
          get_DeptAbbLevel1 (deptseq, 'T') deptabb1,
          get_DeptAbbLevel2 (deptseq, 'T') deptabb2,
          get_DeptAbbLevel3 (deptseq, 'T') deptabb3,
          rel_code
     FROM (SELECT dept_seqno deptseq,
                  deptcd,       
                  depttnm,
                  deptabbfmt1,
                  deptabbfmt2,
                  dept_seqno rlc,
                  TO_NUMBER (deptlevel) deptlevel,
                  deptlevel dld,
                  checkpoint,
                  DEPTABBFMT3,
                  CONVCD                
                  , rel_code
             FROM department
            WHERE deptlevel = 1 AND actflag = 'Y'
           UNION
           SELECT dept_seqno deptseq,
                  deptcd,          
                  depttnm,
                  deptabbfmt1,
                  deptabbfmt2,
                  rel_code rlc,
                  (rel_code * 1000000) + (dept_seqno * 1000) deptlevel,
                  deptlevel dld,
                  checkpoint,
                  DEPTABBFMT3,
                  CONVCD          
                            , rel_code
             FROM department
            WHERE deptlevel = 2 AND actflag = 'Y'
           UNION
           SELECT dept_seqno deptseq,
                  deptcd,    
                  depttnm,
                  deptabbfmt1,
                  deptabbfmt2,
                  (SELECT rel_code
                     FROM department
                    WHERE dept_seqno = d.rel_code)
                     rlc,
                    ( (SELECT rel_code
                         FROM department
                        WHERE dept_seqno = d.rel_code)
                     * 1000000)
                  + (rel_code * 1000)
                  + dept_seqno
                     deptlevel,
                  deptlevel dld,
                  checkpoint,
                  DEPTABBFMT3,
                  CONVCD, rel_code
             FROM department d
            WHERE deptlevel = 3 AND actflag = 'Y');
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."DEPARTMENTLEVEL" TO "BIOSAADM";
