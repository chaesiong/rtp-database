CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_USERGOTOEJB2" ("USER_ID", "PROGRAM_ID") AS 
  SELECT   FW_LOG.USER_ID, FW_LOG.PROGRAM_ID
     FROM   FW_LOG
    WHERE   FW_LOG.ACTION = 'call'
            AND LOGINDATE IN (  SELECT   MAX (FW_LOG.LOGINDATE)
                                  FROM   FW_LOG
                                 WHERE   ACTION = 'call'
                              GROUP BY   FW_LOG.USER_ID)
            AND FW_LOG.PROGRAM_ID IN
                     (SELECT   FW_PROGRAMLIST.PROGRAM_ID
                        FROM   FW_PROGRAMLIST
                       WHERE   FW_PROGRAMLIST.SYSTEM_CODE IN
                                     ('INOUT',
                                      'WL',
                                      'THP',
                                      'CWIP',
                                      'ADMINLOGS')) ;
