CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_COUNTRY" ("COUNTRY_FULL") AS 
  select nationenm||'-'|| nationtnm as country_full 
from country
order by count_seqno;
