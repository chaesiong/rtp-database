CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."OCCUPATIONVIEW" ("OCCCD", "OCCTNM", "OCCENM") AS 
  SELECT   TO_NUMBER (occcd) || '' || '000' AS occcd, occtnm, occenm
     FROM   occupation ;
