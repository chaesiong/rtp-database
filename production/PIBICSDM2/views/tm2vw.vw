CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."TM2VW" ("TM2_SEQNO", "CONV_SEQNO", "IODTE", "CARDTYPE", "CONVNM", "CONVNATIONCD", "CONVREGNO", "CONVOWNER", "TM2DEPT", "IOCOUNTCD", "IOPORTNM", "TM5_SEQNO", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "TM2NO", "TM2DTE", "TM2USR", "FLIGHTNO", "CONVCODE", "IONOTE", "IODEPT", "IODEPTTH", "AMOUNT_CRW", "AMOUNT_PSG", "AMOUNT_IO", "AMOUNT_T", "AMOUNT_S", "CONVTYPE_SEQNO", "ACTFLAG", "TM2MAIN_SEQNO", "NOTE") AS 
  SELECT '' || TM2_SEQNO TM2_SEQNO,
          CONV_SEQNO,
          IODTE,
          CARDTYPE,
          CONVNM,
          CONVNATIONCD,
          CONVREGNO,
          CONVOWNER,
          TM2DEPT,
          IOCOUNTCD,
          IOPORTNM,
          TM5_SEQNO,
          CREATE_BY,
          CREATE_DATE,
          UPDATE_BY,
          UPDATE_DATE,
          VERSION,
          TM2NO,
          TM2DTE,
          TM2USR,
          FLIGHTNO,
          CONVCODE,
          IONOTE,
          IODEPT,
          IODEPTTH,
          AMOUNT_CRW,
          AMOUNT_PSG,
          AMOUNT_IO,
          AMOUNT_T,
          AMOUNT_S,
          CONVTYPE_SEQNO,
          ACTFLAG,
          TM2MAIN_SEQNO,
          NOTE
     FROM TM2
   UNION ALL
   SELECT 'C' || seqno,
          4,
          inoutdate,
          cardtype,
             (SELECT branddesc
                FROM carbrand
               WHERE seqno = nio.carbrand)
          || ' ('
          || (SELECT typedesc
                FROM cartype
               WHERE seqno = nio.cartype)
          || ') ',
          docnat,
          convregno,
          '',
          dept_seqno,
          (SELECT count_seqno
             FROM department
            WHERE dept_seqno = nio.dept_seqno),
          '',
          NULL,
          CREATE_BY,
          CREATE_DATE,
          UPDATE_BY,
          UPDATE_DATE,
          VERSION,
          TM2NO,
          inoutdate,
          CREATE_BY,
          '',
          '',
          remark,
          NULL,
          dept_seqno,
          (SELECT COUNT (*)
             FROM ntm2ref a, NTM2REFTYPE b
            WHERE     A.RELATION_CAR = B.SEQNO
                  AND B.REFTYPE = 'C'
                  AND ntm2inout_seqno = nio.seqno),
          (SELECT COUNT (*)
             FROM ntm2ref a, NTM2REFTYPE b
            WHERE     A.RELATION_CAR = B.SEQNO
                  AND B.REFTYPE = 'P'
                  AND ntm2inout_seqno = nio.seqno),
          0,
          0,
          (SELECT COUNT (*)
             FROM ntm2ref a, NTM2REFTYPE b
            WHERE     A.RELATION_CAR = B.SEQNO
                  AND B.REFTYPE = 'P'
                  AND ntm2inout_seqno = nio.seqno),
          NULL,
          'Y',
          NULL,
          ''
     FROM ntm2inout nio;
