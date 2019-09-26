CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_WLLOGSYSTEM" ("SYSTEM_CODE", "SYSTEM_NAME") AS 
  SELECT system_code, system_name
     FROM fw_system
    WHERE flagwllog = 'Y'
   UNION ALL
   SELECT 'BOI' system_code, 'BOI' system_name
     FROM fw_system
    WHERE ROWNUM = 1
   UNION ALL
   SELECT 'PASSLOST' system_code, 'PASSLOST' system_name
     FROM fw_system
    WHERE ROWNUM = 1;
