CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWOTRATE" ("LEVEL_SEQNO", "NUMPERSON", "OTRATE", "NUMRATE", "ACTFLAG") AS 
  SELECT   LEVEL_SEQNO,
              COUNT (LEVEL_SEQNO) numperson,
              b.otrate,
              COUNT (LEVEL_SEQNO) * b.otrate numrate,
              B.ACTFLAG
       FROM   HR_PROFILE A, ot_rate b
      WHERE   (LEVEL_SEQNO = B.POSLEVEL_SEQNO) AND b.actflag = 'ACTIVE'
   GROUP BY   LEVEL_SEQNO, b.otrate, B.ACTFLAG ;
