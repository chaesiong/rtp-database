CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTNONCOUNTNUMRATE" ("COUNTHR", "LEVEL_SEQNO", "OTRATE", "SUMRATENON", "ESTIMATEYEAR", "ESTIMATEMONTH") AS 
  SELECT   COUNT (level_seqno) counthr,
              level_seqno,
              otrate,
              COUNT (level_seqno) * otrate sumratenon,
              estimateyear,
              estimatemonth
       FROM   VWOTNONAUTHERIZED
   GROUP BY   level_seqno,
              otrate,
              estimateyear,
              estimatemonth ;
