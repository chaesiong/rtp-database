CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."NATIONVIEWIN" ("NATIONCD", "COUNT", "NATIONENM") AS 
  SELECT   a.nationcd, COUNT ( * ) AS COUNT, b.nationenm
       FROM   tminout a, country b
      WHERE   (a.nationcd = b.countcd) AND (cardtype = '1')
              AND (TO_CHAR (inoutdte, 'yyyy-mm-dd') =
                      TO_CHAR (SYSDATE, 'yyyy-mm-dd'))
   GROUP BY   a.nationcd, b.nationenm
   ORDER BY   COUNT DESC ;
  GRANT SELECT ON "PIBICSDM2"."NATIONVIEWIN" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."NATIONVIEWIN" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."NATIONVIEWIN" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."NATIONVIEWIN" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."NATIONVIEWIN" TO "BIOSAADM";
