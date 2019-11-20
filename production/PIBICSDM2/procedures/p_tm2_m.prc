CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_TM2_M" (v_dstart varchar2,v_dend varchar2)
IS

   var_rows   NUMBER;
   vstdate date;
   veddate date;
   
BEGIN
   /*   Create date : 27-01-2018    */
   --No.23
   --v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
   --v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

   vstdate :=sysdate;

   MERGE INTO PIBICSDM2.TM2 DM
        USING (SELECT * 
                    FROM PIBICS.TM2@PIBICS_PROD
                    WHERE CREATE_DATE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND CREATE_DATE <= TO_DATE(v_dend,'yyyymmdd')
                        AND UPDATE_DATE IS NULL) P
        ON (DM.TM2_SEQNO = P.TM2_SEQNO)

    WHEN MATCHED 
    THEN 
        UPDATE SET DM.CONV_SEQNO = P.CONV_SEQNO,
                    DM.IODTE = P.IODTE,
                    DM.CARDTYPE = P.CARDTYPE,
                    DM.CONVNM = P.CONVNM,
                    DM.CONVNATIONCD = P.CONVNATIONCD,
                    DM.CONVREGNO = P.CONVREGNO,
                    DM.CONVOWNER = P.CONVOWNER,
                    DM.TM2DEPT = P.TM2DEPT,
                    DM.IOCOUNTCD = P.IOCOUNTCD,
                    DM.IOPORTNM = P.IOPORTNM,
                    DM.TM5_SEQNO = P.TM5_SEQNO,
                    DM.CREATE_BY = P.CREATE_BY,
                    DM.CREATE_DATE = P.CREATE_DATE,
                    DM.UPDATE_BY = P.UPDATE_BY,
                    DM.UPDATE_DATE = P.UPDATE_DATE,
                    DM.VERSION = P.VERSION,
                    DM.TM2NO = P.TM2NO,
                    DM.TM2DTE = P.TM2DTE,
                    DM.TM2USR = P.TM2USR,
                    DM.FLIGHTNO = P.FLIGHTNO,
                    DM.CONVCODE = P.CONVCODE,
                    DM.IONOTE = P.IONOTE,
                    DM.IODEPT = P.IODEPT,
                    DM.IODEPTTH = P.IODEPTTH,
                    DM.AMOUNT_CRW = P.AMOUNT_CRW,
                    DM.AMOUNT_PSG = P.AMOUNT_PSG,
                    DM.AMOUNT_IO = P.AMOUNT_IO,
                    DM.AMOUNT_T = P.AMOUNT_T,
                    DM.AMOUNT_S = P.AMOUNT_S,
                    DM.CONVTYPE_SEQNO = P.CONVTYPE_SEQNO,
                    DM.ACTFLAG = P.ACTFLAG,
                    DM.TM2MAIN_SEQNO = P.TM2MAIN_SEQNO,
                    DM.NOTE = P.NOTE,
                    DM.CREATE_IP = P.CREATE_IP,
                    DM.UPDATE_IP = P.UPDATE_IP,
                    DM.SHIFT_SEQNO = P.SHIFT_SEQNO,
                    DM.PD_SEQNO = P.PD_SEQNO,
                    DM.ZONE_SEQNO = P.ZONE_SEQNO,
                    DM.HEALTHFLAG = P.HEALTHFLAG
   WHEN NOT MATCHED 
    THEN 
        INSERT (DM.TM2_SEQNO,
                DM.CONV_SEQNO,
                DM.IODTE,
                DM.CARDTYPE,
                DM.CONVNM,
                DM.CONVNATIONCD,
                DM.CONVREGNO,
                DM.CONVOWNER,
                DM.TM2DEPT,
                DM.IOCOUNTCD,
                DM.IOPORTNM,
                DM.TM5_SEQNO,
                DM.CREATE_BY,
                DM.CREATE_DATE,
                DM.UPDATE_BY,
                DM.UPDATE_DATE,
                DM.VERSION,
                DM.TM2NO,
                DM.TM2DTE,
                DM.TM2USR,
                DM.FLIGHTNO,
                DM.CONVCODE,
                DM.IONOTE,
                DM.IODEPT,
                DM.IODEPTTH,
                DM.AMOUNT_CRW,
                DM.AMOUNT_PSG,
                DM.AMOUNT_IO,
                DM.AMOUNT_T,
                DM.AMOUNT_S,
                DM.CONVTYPE_SEQNO,
                DM.ACTFLAG,
                DM.TM2MAIN_SEQNO,
                DM.NOTE,
                DM.CREATE_IP,
                DM.UPDATE_IP,
                DM.SHIFT_SEQNO,
                DM.PD_SEQNO,
                DM.ZONE_SEQNO,
                DM.HEALTHFLAG) 
        VALUES (P.TM2_SEQNO,
                P.CONV_SEQNO,
                P.IODTE,
                P.CARDTYPE,
                P.CONVNM,
                P.CONVNATIONCD,
                P.CONVREGNO,
                P.CONVOWNER,
                P.TM2DEPT,
                P.IOCOUNTCD,
                P.IOPORTNM,
                P.TM5_SEQNO,
                P.CREATE_BY,
                P.CREATE_DATE,
                P.UPDATE_BY,
                P.UPDATE_DATE,
                P.VERSION,
                P.TM2NO,
                P.TM2DTE,
                P.TM2USR,
                P.FLIGHTNO,
                P.CONVCODE,
                P.IONOTE,
                P.IODEPT,
                P.IODEPTTH,
                P.AMOUNT_CRW,
                P.AMOUNT_PSG,
                P.AMOUNT_IO,
                P.AMOUNT_T,
                P.AMOUNT_S,
                P.CONVTYPE_SEQNO,
                P.ACTFLAG,
                P.TM2MAIN_SEQNO,
                P.NOTE,
                P.CREATE_IP,
                P.UPDATE_IP,
                P.SHIFT_SEQNO,
                P.PD_SEQNO,
                P.ZONE_SEQNO,
                P.HEALTHFLAG);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG VALUES ('TM2_C_M', var_rows, SYSDATE);
   
   veddate :=sysdate;
   INSERT INTO IMPORT_LOG_DETAIL VALUES ('TM2_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);


   COMMIT;
   
   vstdate :=sysdate; 
   
   MERGE INTO PIBICSDM2.TM2 DM
        USING (SELECT * 
                    FROM PIBICS.TM2@PIBICS_PROD
                    WHERE UPDATE_DATE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND UPDATE_DATE < TO_DATE(v_dend,'yyyymmdd')) P
        ON (DM.TM2_SEQNO = P.TM2_SEQNO)

    WHEN MATCHED 
    THEN 
        UPDATE SET DM.CONV_SEQNO = P.CONV_SEQNO,
                    DM.IODTE = P.IODTE,
                    DM.CARDTYPE = P.CARDTYPE,
                    DM.CONVNM = P.CONVNM,
                    DM.CONVNATIONCD = P.CONVNATIONCD,
                    DM.CONVREGNO = P.CONVREGNO,
                    DM.CONVOWNER = P.CONVOWNER,
                    DM.TM2DEPT = P.TM2DEPT,
                    DM.IOCOUNTCD = P.IOCOUNTCD,
                    DM.IOPORTNM = P.IOPORTNM,
                    DM.TM5_SEQNO = P.TM5_SEQNO,
                    DM.CREATE_BY = P.CREATE_BY,
                    DM.CREATE_DATE = P.CREATE_DATE,
                    DM.UPDATE_BY = P.UPDATE_BY,
                    DM.UPDATE_DATE = P.UPDATE_DATE,
                    DM.VERSION = P.VERSION,
                    DM.TM2NO = P.TM2NO,
                    DM.TM2DTE = P.TM2DTE,
                    DM.TM2USR = P.TM2USR,
                    DM.FLIGHTNO = P.FLIGHTNO,
                    DM.CONVCODE = P.CONVCODE,
                    DM.IONOTE = P.IONOTE,
                    DM.IODEPT = P.IODEPT,
                    DM.IODEPTTH = P.IODEPTTH,
                    DM.AMOUNT_CRW = P.AMOUNT_CRW,
                    DM.AMOUNT_PSG = P.AMOUNT_PSG,
                    DM.AMOUNT_IO = P.AMOUNT_IO,
                    DM.AMOUNT_T = P.AMOUNT_T,
                    DM.AMOUNT_S = P.AMOUNT_S,
                    DM.CONVTYPE_SEQNO = P.CONVTYPE_SEQNO,
                    DM.ACTFLAG = P.ACTFLAG,
                    DM.TM2MAIN_SEQNO = P.TM2MAIN_SEQNO,
                    DM.NOTE = P.NOTE,
                    DM.CREATE_IP = P.CREATE_IP,
                    DM.UPDATE_IP = P.UPDATE_IP,
                    DM.SHIFT_SEQNO = P.SHIFT_SEQNO,
                    DM.PD_SEQNO = P.PD_SEQNO,
                    DM.ZONE_SEQNO = P.ZONE_SEQNO,
                    DM.HEALTHFLAG = P.HEALTHFLAG
    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.TM2_SEQNO,
                DM.CONV_SEQNO,
                DM.IODTE,
                DM.CARDTYPE,
                DM.CONVNM,
                DM.CONVNATIONCD,
                DM.CONVREGNO,
                DM.CONVOWNER,
                DM.TM2DEPT,
                DM.IOCOUNTCD,
                DM.IOPORTNM,
                DM.TM5_SEQNO,
                DM.CREATE_BY,
                DM.CREATE_DATE,
                DM.UPDATE_BY,
                DM.UPDATE_DATE,
                DM.VERSION,
                DM.TM2NO,
                DM.TM2DTE,
                DM.TM2USR,
                DM.FLIGHTNO,
                DM.CONVCODE,
                DM.IONOTE,
                DM.IODEPT,
                DM.IODEPTTH,
                DM.AMOUNT_CRW,
                DM.AMOUNT_PSG,
                DM.AMOUNT_IO,
                DM.AMOUNT_T,
                DM.AMOUNT_S,
                DM.CONVTYPE_SEQNO,
                DM.ACTFLAG,
                DM.TM2MAIN_SEQNO,
                DM.NOTE,
                DM.CREATE_IP,
                DM.UPDATE_IP,
                DM.SHIFT_SEQNO,
                DM.PD_SEQNO,
                DM.ZONE_SEQNO,
                DM.HEALTHFLAG) 
        VALUES (P.TM2_SEQNO,
                P.CONV_SEQNO,
                P.IODTE,
                P.CARDTYPE,
                P.CONVNM,
                P.CONVNATIONCD,
                P.CONVREGNO,
                P.CONVOWNER,
                P.TM2DEPT,
                P.IOCOUNTCD,
                P.IOPORTNM,
                P.TM5_SEQNO,
                P.CREATE_BY,
                P.CREATE_DATE,
                P.UPDATE_BY,
                P.UPDATE_DATE,
                P.VERSION,
                P.TM2NO,
                P.TM2DTE,
                P.TM2USR,
                P.FLIGHTNO,
                P.CONVCODE,
                P.IONOTE,
                P.IODEPT,
                P.IODEPTTH,
                P.AMOUNT_CRW,
                P.AMOUNT_PSG,
                P.AMOUNT_IO,
                P.AMOUNT_T,
                P.AMOUNT_S,
                P.CONVTYPE_SEQNO,
                P.ACTFLAG,
                P.TM2MAIN_SEQNO,
                P.NOTE,
                P.CREATE_IP,
                P.UPDATE_IP,
                P.SHIFT_SEQNO,
                P.PD_SEQNO,
                P.ZONE_SEQNO,
                P.HEALTHFLAG);



   var_rows := SQL%ROWCOUNT;
   
   INSERT INTO IMPORT_LOG VALUES ('TM2_U_M', var_rows, SYSDATE);
   
   veddate :=sysdate;
   INSERT INTO IMPORT_LOG_DETAIL VALUES ('TM2_U_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);


   COMMIT;
   
   
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_TM2_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_TM2_M" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_TM2_M" TO "BIOSAADM";
