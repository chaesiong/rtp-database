CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_INV_MASTER" ("PASSPORTNO", "PK", "TFULL", "EFULL", "TFIRSTNM", "TFAMILYNM", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "NATIONCD", "FLAG") AS 
  SELECT   TDTNO PASSPORTNO,
            PERSONID PK,
            TFIRSTNM || ' ' || TFAMILYNM TFULL,
            EFIRSTNM || ' ' || EMIDDLENM || ' ' || EFAMILYNM EFULL,
            TFIRSTNM,
            TFAMILYNM,
            EFIRSTNM,
            EMIDDLENM,
            EFAMILYNM,
            NATIONCD,
            'IMM' flag
     FROM   IMMIGRATION
   UNION
   SELECT   PASSPORTNO,
            CITIZENID PK,
            TFIRSTNM || ' ' || TFAMILYNM TFULL,
            EFIRSTNM || ' ' || EMIDDLENM || ' ' || EFAMILYNM EFULL,
            TFIRSTNM,
            TFAMILYNM,
            EFIRSTNM,
            EMIDDLENM,
            EFAMILYNM,
            NATIONCD,
            'THAI' flag
     FROM   THAIPASSPORT
    WHERE   PASSPORTNO NOT IN (SELECT   TDTNO FROM IMMIGRATION) ;
