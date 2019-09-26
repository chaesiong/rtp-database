CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."IMMIGRATIONVIEW" ("PERSONID", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "BIRTHDTE", "SEX") AS 
  SELECT   personid,
            efirstnm,
            emiddlenm,
            efamilynm,
            birthdte,
            sex
     FROM   immigration
    WHERE   nationcd <> 'T03' ;
