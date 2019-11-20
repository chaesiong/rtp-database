CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWBV10MAST" ("NAME_TYPE", "SEX", "NAT", "DOB", "POB", "PP_NO", "ENT_TYPE", "WAR_NO", "WAR_DATE", "OPER", "WLCD") AS 
  SELECT DECODE (nationcd, 'T03', 'T', 'E') name_type,
          DECODE (sex,  'M', 'ช',  'F', 'ญ') sex,
          nationcd nat,
          birthdte dob,
          birthplace pob,
          REPLACE (
             CASE a.wlcd
                WHEN a.wlcd
                THEN
                   (SELECT docno
                      FROM wlindicatecard b
                     WHERE     a.wlcd = b.wlcd
                           AND b.idccd = '0020'
                           AND ROWNUM = 1)
             END,
             ' ',
             '')
             pp_no,
          reasoncd ent_type,
          warrno war_no,
          TO_CHAR (warrdte, 'yyyymmdd') war_date,
          get_Operref_BV10MAST (operref) oper,
          a.wlcd
     FROM watchlist a
    WHERE a.OPERREF = '02' and flagcheckpoint is null;
  GRANT SELECT ON "PIBICSDM2"."VWBV10MAST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWBV10MAST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWBV10MAST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWBV10MAST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWBV10MAST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWBV10MAST" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWBV10MAST" TO "BIOSAADM";
