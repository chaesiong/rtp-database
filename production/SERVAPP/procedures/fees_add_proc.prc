CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."FEES_ADD_PROC" ( REQ IN BLOB, FEES_SEQNO_OUT OUT NUMBER ) 
AS
        SAVE_IP_CLIENT_VAL VARCHAR2(15);
        SAVE_USER_VAL VARCHAR2(20);
        SAVE_DATE_VAL TIMESTAMP(6);
        SYSTEM_CODE_VAL VARCHAR2(20);
        MODULE_VAL VARCHAR2(20);
        DEPT_SEQNO_VAL NUMBER;
        FEES_SEQNO_VAL NUMBER;
        SLIPTYPE_VAL CHAR(1);
        MAXSLIPNO_VAL VARCHAR2(10);
        MAXSLIPBOOKNO_VAL VARCHAR2(10);
BEGIN

SELECT i.SAVE_IP_CLIENT,i.SAVE_USER,CURRENT_TIMESTAMP,i.DEPT_SEQNO,i.SLIPTYPE
INTO SAVE_IP_CLIENT_VAL,SAVE_USER_VAL,SAVE_DATE_VAL,DEPT_SEQNO_VAL,SLIPTYPE_VAL
FROM json_table(REQ  FORMAT JSON, '$'
 COLUMNS (
        SAVE_IP_CLIENT   	VARCHAR2  	PATH '$.headerInfo.ipClient',
        SAVE_USER   		VARCHAR2  	PATH '$.headerInfo.userId',
        DEPT_SEQNO          VARCHAR2  	PATH '$.recordInfo.DEPT_SEQNO',
        SLIPTYPE            VARCHAR2  	PATH '$.recordInfo.SLIPTYPE'
)) i;

SELECT FEES_SEQNO.NEXTVAL,MAXSLIPNO,MAXSLIPBOOKNO  
INTO FEES_SEQNO_VAL,MAXSLIPNO_VAL,MAXSLIPBOOKNO_VAL 
FROM MSCS_FS_SETTINGFEESLIP
WHERE DEPT_SEQNO=DEPT_SEQNO_VAL AND IPADDRESS=SAVE_IP_CLIENT_VAL AND ROWNUM=1;--MAKE SURE WHEN IPADDRESS DON'T SET UNIQUE

INSERT INTO MSCS_FS_FEES(
        FEES_SEQNO 
        , FEESNO 
        , FEESLIPNO 
        , FEESLIPBOOKNO 
        , FEESLIPDATE 
        , FEESLIPTOTAL 
        , PRINTFLAG 
        , DEPT_SEQNO 
        , PASSPORTNO 
        , TM6NO 
        , EFIRSTNM 
        , EMIDDLENM 
        , EFAMILYNM 
        , SEX 
        , BIRTHDTE 
        , NATION_SEQNO 
        , CONV_SEQNO 
        , CONVREGNO 
        , INDTE 
        , VISATYPE_SEQNO 
        , FEESSTATUS 
        , FEESREMARK 
        , FLAG_SYSTEM 
        , CREATE_BY 
        , CREATE_DATE 
        , CREATE_IP 
        , UPDATE_BY 
        , UPDATE_DATE 
        , UPDATE_IP 
        , VERSION 
        , SLIPTYPE 
        , SUFFIX_SEQNO 
        , APPROVE_BY)
SELECT FEES_SEQNO_VAL  
        ,e.FEESNO
        ,e.FEESLIPNO
        ,e.FEESLIPBOOKNO
        ,NVL2(e.FEESLIPDATE,TO_DATE(e.FEESLIPDATE,'DD/MM/YYYY'),SAVE_DATE_VAL)
        ,e.FEESLIPTOTAL
        ,e.PRINTFLAG
        ,e.DEPT_SEQNO
        ,e.PASSPORTNO
        ,e.TM6NO
        ,UPPER(e.EFIRSTNM)
        ,UPPER(e.EMIDDLENM)
        ,UPPER(e.EFAMILYNM)
        ,e.SEX
        ,TO_DATE(e.BIRTHDTE,'DD/MM/YYYY')
        ,e.NATION_SEQNO
        ,e.CONV_SEQNO
        ,e.CONVREGNO
        ,TO_DATE(e.INDTE,'DD/MM/YYYY')
        ,e.VISATYPE_SEQNO
        ,NVL(e.FEESSTATUS,'ACTIVE')
        ,e.FEESREMARK
        ,e.FLAG_SYSTEM
        ,SAVE_USER_VAL
		,SAVE_DATE_VAL
        ,SAVE_IP_CLIENT_VAL
		,SAVE_USER_VAL
        ,SAVE_DATE_VAL
        ,SAVE_IP_CLIENT_VAL
        ,1 VERSION
        ,e.SLIPTYPE
        ,e.SUFFIX_SEQNO
        ,e.APPROVE_BY
FROM json_table(REQ  FORMAT JSON, '$'
    COLUMNS (
        -- FEES_SEQNO  VARCHAR2 PATH '$.recordInfo.FEES_SEQNO',
        FEESNO  VARCHAR2 PATH '$.recordInfo.FEESNO',
        FEESLIPNO  VARCHAR2 PATH '$.recordInfo.FEESLIPNO',
        FEESLIPBOOKNO  VARCHAR2 PATH '$.recordInfo.FEESLIPBOOKNO',
        FEESLIPDATE  VARCHAR2 PATH '$.recordInfo.FEESLIPDATE',
        FEESLIPTOTAL  VARCHAR2 PATH '$.recordInfo.FEESLIPTOTAL',
        PRINTFLAG  VARCHAR2 PATH '$.recordInfo.PRINTFLAG',
        DEPT_SEQNO  VARCHAR2 PATH '$.recordInfo.DEPT_SEQNO',
        PASSPORTNO  VARCHAR2 PATH '$.recordInfo.PASSPORTNO',
        TM6NO  VARCHAR2 PATH '$.recordInfo.TM6NO',
        EFIRSTNM  VARCHAR2 PATH '$.recordInfo.EFIRSTNM',
        EMIDDLENM  VARCHAR2 PATH '$.recordInfo.EMIDDLENM',
        EFAMILYNM  VARCHAR2 PATH '$.recordInfo.EFAMILYNM',
        SEX  VARCHAR2 PATH '$.recordInfo.SEX',
        BIRTHDTE  VARCHAR2 PATH '$.recordInfo.BIRTHDTE',
        NATION_SEQNO  VARCHAR2 PATH '$.recordInfo.NATION_SEQNO',
        CONV_SEQNO  VARCHAR2 PATH '$.recordInfo.CONV_SEQNO',
        CONVREGNO  VARCHAR2 PATH '$.recordInfo.CONVREGNO',
        INDTE  VARCHAR2 PATH '$.recordInfo.INDTE',
        VISATYPE_SEQNO  VARCHAR2 PATH '$.recordInfo.VISATYPE_SEQNO',
        FEESSTATUS  VARCHAR2 PATH '$.recordInfo.FEESSTATUS',
        FEESREMARK  VARCHAR2 PATH '$.recordInfo.FEESREMARK',
        FLAG_SYSTEM  VARCHAR2 PATH '$.recordInfo.FLAG_SYSTEM',
        -- CREATE_BY  VARCHAR2 PATH '$.recordInfo.CREATE_BY',
        -- CREATE_DATE  VARCHAR2 PATH '$.recordInfo.CREATE_DATE',
        -- CREATE_IP  VARCHAR2 PATH '$.recordInfo.CREATE_IP',
        -- UPDATE_BY  VARCHAR2 PATH '$.recordInfo.UPDATE_BY',
        -- UPDATE_DATE  VARCHAR2 PATH '$.recordInfo.UPDATE_DATE',
        -- UPDATE_IP  VARCHAR2 PATH '$.recordInfo.UPDATE_IP',
        -- VERSION  VARCHAR2 PATH '$.recordInfo.VERSION',
        SLIPTYPE  VARCHAR2 PATH '$.recordInfo.SLIPTYPE',
        SUFFIX_SEQNO  VARCHAR2 PATH '$.recordInfo.SUFFIX_SEQNO',
        APPROVE_BY  VARCHAR2 PATH '$.recordInfo.APPROVE_BY'
    )) e;

INSERT INTO MSCS_FS_FEESDETAIL ( 
        FEESDETAIL_SEQNO 
        , PRATE_SEQNO 
        , FEES_SEQNO 
        , FEESLIPAMOUNT 
        , CREATE_BY 
        , CREATE_DATE 
        , CREATE_IP 
        , UPDATE_BY 
        , UPDATE_DATE 
        , UPDATE_IP 
        , VERSION)
SELECT FEESDETAIL_SEQNO.NEXTVAL ,
         t.PRATE_SEQNO ,
         FEES_SEQNO_VAL ,
         t.FEESLIPAMOUNT ,
         SAVE_USER_VAL ,
         SAVE_DATE_VAL ,
         SAVE_IP_CLIENT_VAL ,
         SAVE_USER_VAL ,
         SAVE_DATE_VAL ,
         SAVE_IP_CLIENT_VAL ,
         1 AS VERSION
FROM json_table(REQ  FORMAT JSON, '$.feesDetail[*]'
        COLUMNS (
        --FEESDETAIL_SEQNO  VARCHAR2 PATH '$.recordInfo.FEESDETAIL_SEQNO',
        PRATE_SEQNO  VARCHAR2 PATH '$.PRATE_SEQNO',
        --FEES_SEQNO  VARCHAR2 PATH '$.recordInfo.FEES_SEQNO',
        FEESLIPAMOUNT  VARCHAR2 PATH '$.FEESLIPAMOUNT'--,
        -- CREATE_BY  VARCHAR2 PATH '$.recordInfo.CREATE_BY',
        -- CREATE_DATE  VARCHAR2 PATH '$.recordInfo.CREATE_DATE',
        -- CREATE_IP  VARCHAR2 PATH '$.recordInfo.CREATE_IP',
        -- UPDATE_BY  VARCHAR2 PATH '$.recordInfo.UPDATE_BY',
        -- UPDATE_DATE  VARCHAR2 PATH '$.recordInfo.UPDATE_DATE',
        -- UPDATE_IP  VARCHAR2 PATH '$.recordInfo.UPDATE_IP',
        -- VERSION  VARCHAR2 PATH '$.recordInfo.VERSION'
)) t;

-- UPDATE FEESLIPTOTAL
UPDATE MSCS_FS_FEES SET FEESLIPTOTAL =(SELECT SUM(FEESLIPAMOUNT) FROM MSCS_FS_FEESDETAIL WHERE FEES_SEQNO=FEES_SEQNO_VAL) WHERE FEES_SEQNO=FEES_SEQNO_VAL;

-- IN CASE AUTO SLIP
IF(SLIPTYPE_VAL='A') THEN
UPDATE MSCS_FS_FEES SET FEESLIPNO = MAXSLIPNO_VAL,FEESLIPBOOKNO =MAXSLIPBOOKNO_VAL
WHERE FEES_SEQNO=FEES_SEQNO_VAL;
MAXSLIPNO_VAL:=MAXSLIPNO_VAL+1;
END IF;

-- UPDATE SLIPNUM & RUNNING
UPDATE MSCS_FS_SETTINGFEESLIP f SET f.SLIPNUM = f.SLIPNUM-1 ,f.MAXSLIPNO=MAXSLIPNO_VAL
WHERE DEPT_SEQNO=DEPT_SEQNO_VAL AND IPADDRESS=SAVE_IP_CLIENT_VAL;

FEES_SEQNO_OUT:=FEES_SEQNO_VAL;

END FEES_ADD_PROC;
/
