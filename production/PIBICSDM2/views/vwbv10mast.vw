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
