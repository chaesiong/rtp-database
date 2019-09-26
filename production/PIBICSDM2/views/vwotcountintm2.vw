CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTCOUNTINTM2" ("NUMINTM2") AS 
  SELECT   COUNT (A.DEPT_SEQNO) NUMINTM2
     FROM   HR_PROFILE A, DEPARTMENT B
    WHERE   A.DEPT_SEQNO = B.DEPT_SEQNO
            AND (   B.DEPT_SEQNO = 3
                 OR B.REL_CODE = 3
                 OR rel_code IN (SELECT   dept_seqno
                                   FROM   department
                                  WHERE   rel_code = 3)) ;
