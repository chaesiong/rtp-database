CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."NATIONVIEWOUT" ("NATIONCD", "COUNT", "NATIONENM") AS 
  SELECT   a.nationcd, COUNT ( * ) AS COUNT, b.nationenm
       FROM   tminout a, country b
      WHERE   (a.nationcd = b.countcd) AND (cardtype = '2')
              AND (TO_CHAR (inoutdte, 'yyyy-mm-dd') =
                      TO_CHAR (SYSDATE, 'yyyy-mm-dd'))
   GROUP BY   a.nationcd, b.nationenm
   ORDER BY   COUNT DESC ;
