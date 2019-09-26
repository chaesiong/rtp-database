CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."CONTMMAIN" ("CONVTNM", "CONVENM", "NAME") AS 
  SELECT   convtnm, convenm, travcd || convcd AS name FROM conveyance ;
