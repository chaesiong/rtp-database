CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."TESTEDIT" 
(
  PARAM1 IN VARCHAR2 
) AS 
CPSEQ NUMBER;
BEGIN
    MERGE INTO VOA_CHECKPOINT t1
    USING
    (
    -- For more complicated queries you can use WITH clause here
      SELECT 1 AS VERSION,CURRENT_TIMESTAMP AS UPDATE_DATE,
      v.* FROM json_table(PARAM1  FORMAT JSON, '$'
         COLUMNS (           
           CP_SEQNO         NUMBER  PATH '$.recordInfo.cpSeqno',
           CP_NO            NUMBER  PATH '$.recordInfo.cpNo',
           DEPT_SEQNO       NUMBER  PATH '$.recordInfo.deptSeqno',
           FIXTEXT          VARCHAR2    PATH '$.recordInfo.fixText',
           VISANO           VARCHAR2    PATH '$.recordInfo.visaNo',
           UPDATE_BY        VARCHAR2    PATH '$.headerInfo.userID'
           ))v
    )t2
    ON(t1.CP_SEQNO = t2.CP_SEQNO)
    WHEN MATCHED THEN UPDATE SET
    t1.CP_NO = t2.CP_NO,
    t1.FIXTEXT = t2.FIXTEXT,
    t1.VISANO = t2.VISANO,
    t1.UPDATE_BY = t2.UPDATE_BY,
    t1.UPDATE_DATE = t2.UPDATE_DATE;   

    SELECT i.CP_SEQNO INTO CPSEQ
            FROM json_table(PARAM1  FORMAT JSON, '$'
             COLUMNS (
               CP_SEQNO   NUMBER  PATH '$.recordInfo.cpSeqno'
            )) i;

            COMMIT;
END TESTEDIT;

/
  GRANT EXECUTE ON "SERVAPP"."TESTEDIT" TO "BIOSAADM";
