CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PRC_CONTINENT" (
    v_dstart VARCHAR2,
    v_dend VARCHAR2,
    v_tstart VARCHAR2,
    v_tend VARCHAR2
)
AS 
BEGIN
  DECLARE
    v_dstart1 VARCHAR2(150);
    v_dend1 VARCHAR2(150);
    var_rows NUMBER;
    BEGIN
        --v_dstart1 := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd') || v_tstart || '00';
        --v_dend1 := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd') || v_tend || '00';
        v_dstart1 := v_dstart || v_tstart || '00';
        v_dend1 := v_tstart || v_tend || '00';

        DBMS_OUTPUT.PUT_LINE('v_dstart=' || v_dstart);
        DBMS_OUTPUT.PUT_LINE('v_dend=' || v_dend);        
        DBMS_OUTPUT.PUT_LINE('-----');
        --NULL;

        MERGE INTO SERVAPP.MSCS_CONTINENT DM
          USING (SELECT * 
             FROM pibicsdm2.CONTINENT
             WHERE (CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
              AND CREATE_DATE < TO_DATE(v_dend,'yyyymmdd'))
              OR UPDATE_DATE IS NULL) P
          ON (DM.CONTINENT_SEQNO = P.CONTINENT_SEQNO)
         WHEN MATCHED 
         THEN 
          UPDATE SET      DM.CONTINENTCD = P.CONTINENTCD,
             DM.CONTINENTTNM = P.CONTINENTTNM,
             DM.CONTINENTENM = P.CONTINENTENM,
             DM.ACTFLAG = P.ACTFLAG,
             DM.CREATE_BY = P.CREATE_BY,
             DM.CREATE_DATE = P.CREATE_DATE,
             DM.UPDATE_BY = P.UPDATE_BY,
             DM.UPDATE_DATE = P.UPDATE_DATE,
             DM.VERSION = P.VERSION
         WHEN NOT MATCHED 
         THEN 
          INSERT (     DM.CONTINENT_SEQNO,
             DM.CONTINENTCD,
             DM.CONTINENTTNM,
             DM.CONTINENTENM,
             DM.ACTFLAG,
             DM.CREATE_BY,
             DM.CREATE_DATE,
             DM.UPDATE_BY,
             DM.UPDATE_DATE,
             DM.VERSION) 
          VALUES (     P.CONTINENT_SEQNO,
             P.CONTINENTCD,
             P.CONTINENTTNM,
             P.CONTINENTENM,
             P.ACTFLAG,
             P.CREATE_BY,
             P.CREATE_DATE,
             P.UPDATE_BY,
             P.UPDATE_DATE,
             P.VERSION);



         var_rows := SQL%ROWCOUNT;

         --INSERT INTO IMPORT_LOG
          --VALUES ('CONTINENT_C', var_rows, SYSDATE);
        DBMS_OUTPUT.PUT_LINE('CONTINENT_C = ' || var_rows || ' = ' || SYSDATE);

         COMMIT;



         MERGE INTO SERVAPP.MSCS_CONTINENT DM
          USING (SELECT * 
             FROM pibicsdm2.CONTINENT
             WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd')
              AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
          ON (DM.CONTINENT_SEQNO = P.CONTINENT_SEQNO)
         WHEN MATCHED 
         THEN 
          UPDATE SET      DM.CONTINENTCD = P.CONTINENTCD,
             DM.CONTINENTTNM = P.CONTINENTTNM,
             DM.CONTINENTENM = P.CONTINENTENM,
             DM.ACTFLAG = P.ACTFLAG,
             DM.CREATE_BY = P.CREATE_BY,
             DM.CREATE_DATE = P.CREATE_DATE,
             DM.UPDATE_BY = P.UPDATE_BY,
             DM.UPDATE_DATE = P.UPDATE_DATE,
             DM.VERSION = P.VERSION
         WHEN NOT MATCHED 
         THEN 
          INSERT (     DM.CONTINENT_SEQNO,
             DM.CONTINENTCD,
             DM.CONTINENTTNM,
             DM.CONTINENTENM,
             DM.ACTFLAG,
             DM.CREATE_BY,
             DM.CREATE_DATE,
             DM.UPDATE_BY,
             DM.UPDATE_DATE,
             DM.VERSION) 
        VALUES (     P.CONTINENT_SEQNO,
             P.CONTINENTCD,
             P.CONTINENTTNM,
             P.CONTINENTENM,
             P.ACTFLAG,
             P.CREATE_BY,
             P.CREATE_DATE,
             P.UPDATE_BY,
             P.UPDATE_DATE,
             P.VERSION);



         var_rows := SQL%ROWCOUNT;

         --INSERT INTO IMPORT_LOG
          --VALUES ('CONTINENT_U', var_rows, SYSDATE);
         DBMS_OUTPUT.PUT_LINE('CONTINENT_U = ' || var_rows || ' = ' || SYSDATE);

         COMMIT;


        EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            DBMS_OUTPUT.PUT_LINE('EXCEPTION = NO_DATA_FOUND');
          --NULL;
         WHEN OTHERS
         THEN
         -- Consider logging the error and then re-raise
          RAISE;

    END;
END PRC_CONTINENT;

/
