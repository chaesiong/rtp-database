CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_CHNGREPORT4_CFA" ("COUNT_SORT", "COUNT_SEQNO", "NATIONTNM") AS 
  SELECT 
decode(count_seqno,80,1,89,2,78,3,176,4,177,5,201,6,149,7,125,8,117,9) count_sort,
count_seqno, nationtnm
       FROM country
      WHERE count_seqno IN (80, 89, 78, 176, 177, 201, 149, 125, 117)
   ORDER BY count_sort;
