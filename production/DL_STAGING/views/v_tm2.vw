CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_TM2" ("TM2_SEQNO", "CONV_SEQNO", "IODTE", "CARDTYPE", "CONVNM", "CONVNATIONCD", "CONVREGNO", "CONVOWNER", "TM2DEPT", "IOCOUNTCD", "IOPORTNM", "TM5_SEQNO", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "TM2NO", "TM2DTE", "TM2USR", "FLIGHTNO", "CONVCODE", "IONOTE", "IODEPT", "IODEPTTH", "AMOUNT_CRW", "AMOUNT_PSG", "AMOUNT_IO", "AMOUNT_T", "AMOUNT_S", "CONVTYPE_SEQNO", "ACTFLAG", "TM2MAIN_SEQNO", "NOTE", "CREATE_IP", "UPDATE_IP", "SHIFT_SEQNO", "PD_SEQNO", "ZONE_SEQNO", "HEALTHFLAG") AS 
  SELECT 
"TM2_SEQNO","CONV_SEQNO","IODTE","CARDTYPE","CONVNM","CONVNATIONCD","CONVREGNO","CONVOWNER","TM2DEPT","IOCOUNTCD","IOPORTNM","TM5_SEQNO","CREATE_BY","CREATE_DATE","UPDATE_BY","UPDATE_DATE","VERSION","TM2NO","TM2DTE","TM2USR","FLIGHTNO","CONVCODE","IONOTE","IODEPT","IODEPTTH","AMOUNT_CRW","AMOUNT_PSG","AMOUNT_IO","AMOUNT_T","AMOUNT_S","CONVTYPE_SEQNO","ACTFLAG","TM2MAIN_SEQNO","NOTE","CREATE_IP","UPDATE_IP","SHIFT_SEQNO","PD_SEQNO","ZONE_SEQNO","HEALTHFLAG"
FROM pibicsdm2.TM2;
  GRANT SELECT ON "DL_STAGING"."V_TM2" TO "DL_BORDERCONTROL";
