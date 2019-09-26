CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWTMOUTEXT" ("OUTPM_EXTENSION", "OUTPM_EXEXPDTE", "OUTDTE") AS 
  select outpm_extension, outpm_exexpdte, outdte from tmmain where (outdte is not null and indte is null) and outpm_extension is not null;
