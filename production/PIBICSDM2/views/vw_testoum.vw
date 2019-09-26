CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_TESTOUM" ("COUNT_SEQNO", "COUNTTNM", "COUNTENM") AS 
  select count_seqno,counttnm,countenm from country;
