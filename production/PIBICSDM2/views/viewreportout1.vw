CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEWREPORTOUT1" ("YM", "ARREST", "PERMIT", "STS", "TDCD", "AGCCONT", "REASONCD", "REC", "RECEXPIRE") AS 
  WITH wl AS (  SELECT   TO_CHAR (credte, 'yyyymm') AS ym,
                          arrest,
                          permit,
                          sts,
                          tdcd,
                          agccont,
                          reasoncd,
                          COUNT ( * ) AS rec
                   FROM   watchlist
                  WHERE   operref = '03'
               GROUP BY   TO_CHAR (credte, 'yyyymm'),
                          arrest,
                          permit,
                          sts,
                          tdcd,
                          agccont,
                          reasoncd),
       wlexpire AS (  SELECT   TO_CHAR (credte, 'yyyymm') AS ym,
                               arrest,
                               permit,
                               sts,
                               tdcd,
                               agccont,
                               reasoncd,
                               COUNT ( * ) AS rec
                        FROM   watchlist
                       WHERE   warrexpdte < SYSDATE
                    GROUP BY   TO_CHAR (credte, 'yyyymm'),
                               arrest,
                               permit,
                               sts,
                               tdcd,
                               agccont,
                               reasoncd)
   SELECT   w."YM",
            w."ARREST",
            w."PERMIT",
            w."STS",
            w."TDCD",
            w."AGCCONT",
            w."REASONCD",
            w."REC",
            we.rec AS recexpire
     FROM      wl w
            LEFT JOIN
               wlexpire we
            ON     w.ym = we.ym
               AND w.arrest = we.arrest
               AND w.permit = we.permit
               AND w.sts = we.sts
               AND w.tdcd = we.tdcd
               AND w.agccont = we.agccont
               AND w.reasoncd = we.reasoncd
               AND w.rec = we.rec ;
