CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTDEPTINTM2" ("DEPT_SEQNO") AS 
  SELECT   dept_seqno
     FROM   department
    WHERE      dept_seqno = 3
            OR rel_code = 3
            OR rel_code IN (SELECT   dept_seqno
                              FROM   department
                             WHERE   rel_code = 3) ;
