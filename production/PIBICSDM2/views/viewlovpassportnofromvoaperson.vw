CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEWLOVPASSPORTNOFROMVOAPERSON" ("PASSPORTNO", "FULLNAME", "PERSON_SEQNO", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "BIRTH_DATE", "NATION_SEQNO", "PASSPORT_ISSUEDATE", "PASSPORT_EXPDATE", "PASSPORT_PLACE", "FROMCOUNTRY", "CONV_SEQNO", "CONVNO", "PERADD", "THAIREF", "BUILDING", "ADDR", "ROAD", "PV_SEQNO", "AMP_SEQNO", "TMB_SEQNO", "POSTCODE", "VERSION", "OCC_SEQNO", "TEL", "SEXCD", "SEXNM", "NATIONTNM", "NATIONCD", "FROMCOUNTRYTNM", "FROMCOUNTRYCD", "CONVCD", "CONVTNM", "PVCD", "PV_DESC", "AMPCD", "AMP_DESC", "TMBCD", "TMB_DESC", "OCCNM", "OCCCD") AS 
  SELECT   V.PASSPORTNO,
            V.EFAMILYNM || ' ' || V.EFIRSTNM || ' ' || V.EMIDDLENM FULLNAME,
            V.PERSON_SEQNO,
            V.EFIRSTNM,
            V.EMIDDLENM,
            V.EFAMILYNM,
            V.BIRTH_DATE,
            V.NATION_SEQNO,
            TO_CHAR (V.PASSPORT_ISSUEDATE, 'DD/MM/YYYY') PASSPORT_ISSUEDATE,
            TO_CHAR (V.PASSPORT_EXPDATE, 'DD/MM/YYYY') PASSPORT_EXPDATE,
            V.PASSPORT_PLACE,
            V.FROMCOUNTRY,
            V.CONV_SEQNO,
            V.CONVNO,
            V.PERADD,
            V.THAIREF,
            V.BUILDING,
            V.ADDR,
            V.ROAD,
            V.PV_SEQNO,
            V.AMP_SEQNO,
            V.TMB_SEQNO,
            V.POSTCODE,
            V.VERSION,
            V.OCC_SEQNO,
            V.TEL,
            V.SEX SEXCD,
            CASE
               WHEN (V.SEX = 'F') THEN 'หญิง'
               WHEN (V.SEX = 'M') THEN 'ชาย'
            END
               SEXNM,
            (SELECT   NATIONENM
               FROM   COUNTRY C1
              WHERE   C1.COUNT_SEQNO = V.NATION_SEQNO)
               NATIONTNM,
            (SELECT   COUNTCD
               FROM   COUNTRY C2
              WHERE   C2.COUNT_SEQNO = V.NATION_SEQNO)
               NATIONCD,
            (SELECT   NATIONENM
               FROM   COUNTRY C3
              WHERE   C3.COUNT_SEQNO = V.FROMCOUNTRY)
               FROMCOUNTRYTNM,
            (SELECT   COUNTCD
               FROM   COUNTRY C4
              WHERE   C4.COUNT_SEQNO = V.FROMCOUNTRY)
               FROMCOUNTRYCD,
            (SELECT   SUBSTR (CONVCD, 4)
               FROM   CONVEYANCE CON1
              WHERE   CON1.CONV_SEQNO = V.CONV_SEQNO)
               CONVCD,
            (SELECT   CONVTNM
               FROM   CONVEYANCE CON2
              WHERE   CON2.CONV_SEQNO = V.CONV_SEQNO)
               CONVTNM,
            (SELECT   PVCD
               FROM   PROVINCE P1
              WHERE   P1.PV_SEQNO = V.PV_SEQNO)
               PVCD,
            (SELECT   PV_DESC
               FROM   PROVINCE P2
              WHERE   P2.PV_SEQNO = V.PV_SEQNO)
               PV_DESC,
            (SELECT   AMPCD
               FROM   AMPUR A1
              WHERE   A1.AMP_SEQNO = V.AMP_SEQNO)
               AMPCD,
            (SELECT   AMP_DESC
               FROM   AMPUR A2
              WHERE   A2.AMP_SEQNO = V.AMP_SEQNO)
               AMP_DESC,
            (SELECT   TMBCD
               FROM   TAMBON T1
              WHERE   T1.TMB_SEQNO = V.TMB_SEQNO)
               TMBCD,
            (SELECT   TMB_DESC
               FROM   TAMBON T2
              WHERE   T2.TMB_SEQNO = V.TMB_SEQNO)
               TMB_DESC,
            (SELECT   OCCTNM
               FROM   OCCUPATION OCC
              WHERE   OCC.OCC_SEQNO = V.OCC_SEQNO)
               OCCNM,
            (SELECT   SUBSTR (OCCCD, 4)
               FROM   OCCUPATION OCC
              WHERE   OCC.OCC_SEQNO = V.OCC_SEQNO)
               OCCCD
     FROM   VOA_PERSON V ;
