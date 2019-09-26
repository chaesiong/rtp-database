CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_CHNGREPORT4_AMS" ("COUNT_SORT", "COUNT_SEQNO", "NATIONTNM") AS 
  SELECT 
decode(count_seqno,46,1,44,2,21,3,160,4,7,5) count_sort,
count_seqno, nationtnm
       FROM country
      WHERE count_seqno IN (46, 44, 21, 160, 7)
   ORDER BY count_sort;
