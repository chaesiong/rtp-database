CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."FS_FINES_LOG_PROC" (FINES_SEQNO_IN IN NUMBER,LOG_FLAG IN CHAR) AS
FINESLOG_SEQNO_VAL NUMBER;
LOG_DATE TIMESTAMP(6);
BEGIN
    FINESLOG_SEQNO_VAL:=FINESLOG_SEQNO.NEXTVAL;
    LOG_DATE:=CURRENT_TIMESTAMP;
  INSERT INTO MSCS_FS_FINES_LOG
  SELECT FINESLOG_SEQNO_VAL
            ,e.FINES_SEQNO
            ,e.FINESNO
            ,e.FINESLIPNO
            ,e.FINESLIPBOOKNO
            ,e.FINESLIPDATE
            ,e.PRINTFLAG
            ,e.FINESLIPAMOUNT
            ,e.CHARGEDOF
            ,e.CHARGENO
            ,e.DEPT_SEQNO
            ,e.PASSPORTNO
            ,e.TM6NO
            ,e.EFIRSTNM
            ,e.EMIDDLENM
            ,e.EFAMILYNM
            ,e.SEX
            ,e.BIRTHDTE
            ,e.NATION_SEQNO
            ,e.CONV_SEQNO
            ,e.CONVREGNO
            ,e.INDTE
            ,e.VISATYPE_SEQNO
            ,e.VISAEXPDTE
            ,e.OUTDTE
            ,e.FINESTATUS
            ,e.FINESREMARK
            ,e.FLAG_SYSTEM
            ,e.CREATE_BY
            ,e.CREATE_DATE
            ,e.CREATE_IP
            ,e.UPDATE_BY
            ,e.UPDATE_DATE
            ,e.UPDATE_IP
            ,LOG_FLAG
            ,LOG_DATE
            ,e.UPDATE_BY LOG_USRUPD
            ,e.VERSION
            ,e.PERMIT_SEQNO
            ,e.PERMIT_DATE
            ,e.SLIPTYPE
            ,e.SUFFIX_SEQNO
            ,e.TFAMILYNM
            ,e.TFIRSTNM
            ,e.STAFF_SEQNO
  FROM MSCS_FS_FINES e WHERE e.FINES_SEQNO=FINES_SEQNO_IN;

  INSERT INTO MSCS_FS_FINESDETAIL_LOG
  SELECT FID_LOG_SEQNO.NEXTVAL
    ,FINESLOG_SEQNO_VAL
,e.FINESDETAIL_SEQNO
,e.FINES_SEQNO
,e.PRATE_SEQNO
,e.FINESLIPAMOUNT
,e.OVERSTAYDAY
,e.CREATE_BY
,e.CREATE_DATE
,e.CREATE_IP
,e.UPDATE_BY
,e.UPDATE_DATE
,e.UPDATE_IP
,LOG_FLAG
,e.UPDATE_BY LOG_USRUPD
,LOG_DATE
,e.VERSION
FROM MSCS_FS_FINESDETAIL e WHERE e.FINES_SEQNO=FINES_SEQNO_IN;



END FS_FINES_LOG_PROC;

/
  GRANT EXECUTE ON "SERVAPP"."FS_FINES_LOG_PROC" TO "BIOSAADM";
