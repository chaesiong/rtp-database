CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_BPDEPTDEFAULT" ("COUNT_SEQNO", "COUNTCD", "NATIONENM", "NATIONTNM", "BPDOCSEQNO", "BPDOCDESC", "TYPEPERMIT", "TYPEPERMITDESC", "PERMITDAYS", "ROWNUM") AS 
  SELECT FOO."COUNT_SEQNO",
					FOO."COUNTCD",
          FOO."NATIONENM",
					FOO."NATIONTNM",
          FOO."BPDOCSEQNO",
          FOO."BPDOCDESC",
          FOO."TYPEPERMIT",
          FOO."TYPEPERMITDESC",
          DECODE (ROWNUM,
                  '1', '730',
                  '2', '15',
                  '3', '30',
                  '4', '15',
                  '5', '0',
                  '6', '0',
                  '7', '0',
                  '8', '0')
             PERMITDAYS,
			ROWNUM "ROWNUM"
     FROM (  SELECT C.COUNT_SEQNO,
										C.COUNTCD,
                    C.NATIONENM,
										C.NATIONTNM,
                    B.BPDOCSEQNO,
                    B.BPDOCDESC,
                    D.TYPEPERMIT,
                    D.TYPEPERMITDESC
               FROM COUNTRY C,
                    BPDOCTYPE B,
                    (SELECT 'C' TYPEPERMIT,
                            'ทำบัตรผ่านแดน'
                               TYPEPERMITDESC
                       FROM DUAL
                     UNION
                     SELECT 'T' TYPEPERMIT,
                            'ตรวจอนุญาตผ่านแดน'
                               TYPEPERMITDESC
                       FROM DUAL) D
              WHERE C.COUNT_SEQNO IN (0, 200)
           ORDER BY C.COUNT_SEQNO, D.TYPEPERMIT, B.BPDOCCD) FOO;
