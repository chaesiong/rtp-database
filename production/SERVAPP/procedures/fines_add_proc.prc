CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."FINES_ADD_PROC" ( REQ IN BLOB, FINES_SEQNO_OUT OUT NUMBER ) 
AS
        SAVE_IP_CLIENT_VAL VARCHAR2(15);
        SAVE_USER_VAL VARCHAR2(20);
        SAVE_DATE_VAL TIMESTAMP(6);
        SYSTEM_CODE_VAL VARCHAR2(20);
        MODULE_VAL VARCHAR2(20);
        DEPT_SEQNO_VAL NUMBER;
        FINES_SEQNO_VAL NUMBER;
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

SELECT FINES_SEQNO.NEXTVAL,MAXSLIPNO,MAXSLIPBOOKNO  
INTO FINES_SEQNO_VAL,MAXSLIPNO_VAL,MAXSLIPBOOKNO_VAL 
FROM MSCS_FS_SETTINGFINESLIP
WHERE DEPT_SEQNO=DEPT_SEQNO_VAL AND IPADDRESS=SAVE_IP_CLIENT_VAL AND ROWNUM=1;--MAKE SURE WHEN IPADDRESS DON'T SET UNIQUE

INSERT INTO MSCS_FS_FINES(
        FINES_SEQNO
        ,FINESNO
        ,FINESLIPNO
        ,FINESLIPBOOKNO
        ,FINESLIPDATE
        ,PRINTFLAG
        ,FINESLIPAMOUNT
        ,CHARGEDOF
        ,CHARGENO
        ,DEPT_SEQNO
        ,PASSPORTNO
        ,TM6NO
        ,EFIRSTNM
        ,EMIDDLENM
        ,EFAMILYNM
        ,SEX
        ,BIRTHDTE
        ,NATION_SEQNO
        ,CONV_SEQNO
        ,CONVREGNO
        ,INDTE
        ,VISATYPE_SEQNO
        ,VISAEXPDTE
        ,OUTDTE
        ,FINESTATUS
        ,FINESREMARK
        ,FLAG_SYSTEM
        ,CREATE_BY
        ,CREATE_DATE
        ,CREATE_IP
        ,UPDATE_BY
        ,UPDATE_DATE
        ,UPDATE_IP
        ,VERSION
        ,PERMIT_SEQNO
        ,PERMIT_DATE
        ,SLIPTYPE
        ,SUFFIX_SEQNO
        ,TFAMILYNM
        ,TFIRSTNM
        ,STAFF_SEQNO)
SELECT FINES_SEQNO_VAL  
        ,e.FINESNO
        ,e.FINESLIPNO
        ,e.FINESLIPBOOKNO
        ,NVL2(e.FINESLIPDATE,TO_DATE(e.FINESLIPDATE,'DD/MM/YYYY'),SAVE_DATE_VAL) 
        ,e.PRINTFLAG
        ,e.FINESLIPAMOUNT
        ,e.CHARGEDOF
        ,e.CHARGENO
        ,e.DEPT_SEQNO
        ,e.PASSPORTNO
        ,e.TM6NO
        ,UPPER(e.EFIRSTNM)
        ,UPPER(e.EMIDDLENM)
        ,UPPER(e.EFAMILYNM)
        ,e.SEX
        ,e.BIRTHDTE
        ,e.NATION_SEQNO
        ,e.CONV_SEQNO
        ,e.CONVREGNO
        ,TO_DATE(e.INDTE,'DD/MM/YYYY')
        ,e.VISATYPE_SEQNO
        ,TO_DATE(e.VISAEXPDTE,'DD/MM/YYYY')
        ,TO_DATE(e.OUTDTE,'DD/MM/YYYY')
        ,NVL(e.FINESTATUS,'ACTIVE')
        ,e.FINESREMARK
        ,e.FLAG_SYSTEM
        ,SAVE_USER_VAL
		,SAVE_DATE_VAL
        ,SAVE_IP_CLIENT_VAL
		,SAVE_USER_VAL
        ,SAVE_DATE_VAL
        ,SAVE_IP_CLIENT_VAL
        ,1 VERSION
        ,e.PERMIT_SEQNO
        ,TO_DATE(e.PERMIT_DATE,'DD/MM/YYYY')
        ,e.SLIPTYPE
        ,e.SUFFIX_SEQNO
        ,e.TFAMILYNM
        ,e.TFIRSTNM
        ,e.STAFF_SEQNO
FROM json_table(REQ  FORMAT JSON, '$'
    COLUMNS (
        -- FINES_SEQNO  VARCHAR2 PATH '$.recordInfo.FINES_SEQNO',
        FINESNO  VARCHAR2 PATH '$.recordInfo.FINESNO',
        FINESLIPNO  VARCHAR2 PATH '$.recordInfo.FINESLIPNO',
        FINESLIPBOOKNO  VARCHAR2 PATH '$.recordInfo.FINESLIPBOOKNO',
        FINESLIPDATE  VARCHAR2 PATH '$.recordInfo.FINESLIPDATE',
        PRINTFLAG  VARCHAR2 PATH '$.recordInfo.PRINTFLAG',
        FINESLIPAMOUNT  VARCHAR2 PATH '$.recordInfo.FINESLIPAMOUNT',
        CHARGEDOF  VARCHAR2 PATH '$.recordInfo.CHARGEDOF',
        CHARGENO  VARCHAR2 PATH '$.recordInfo.CHARGENO',
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
        VISAEXPDTE  VARCHAR2 PATH '$.recordInfo.VISAEXPDTE',
        OUTDTE  VARCHAR2 PATH '$.recordInfo.OUTDTE',
        FINESTATUS  VARCHAR2 PATH '$.recordInfo.FINESTATUS',
        FINESREMARK  VARCHAR2 PATH '$.recordInfo.FINESREMARK',
        FLAG_SYSTEM  VARCHAR2 PATH '$.recordInfo.FLAG_SYSTEM',
        -- CREATE_BY  VARCHAR2 PATH '$.recordInfo.CREATE_BY',
        -- CREATE_DATE  VARCHAR2 PATH '$.recordInfo.CREATE_DATE',
        -- CREATE_IP  VARCHAR2 PATH '$.recordInfo.CREATE_IP',
        -- UPDATE_BY  VARCHAR2 PATH '$.recordInfo.UPDATE_BY',
        -- UPDATE_DATE  VARCHAR2 PATH '$.recordInfo.UPDATE_DATE',
        -- UPDATE_IP  VARCHAR2 PATH '$.recordInfo.UPDATE_IP',
        -- VERSION  VARCHAR2 PATH '$.recordInfo.VERSION',
        PERMIT_SEQNO  VARCHAR2 PATH '$.recordInfo.PERMIT_SEQNO',
        PERMIT_DATE  VARCHAR2 PATH '$.recordInfo.PERMIT_DATE',
        SLIPTYPE  VARCHAR2 PATH '$.recordInfo.SLIPTYPE',
        SUFFIX_SEQNO  VARCHAR2 PATH '$.recordInfo.SUFFIX_SEQNO',
        TFAMILYNM  VARCHAR2 PATH '$.recordInfo.TFAMILYNM',
        TFIRSTNM  VARCHAR2 PATH '$.recordInfo.TFIRSTNM',
        STAFF_SEQNO  VARCHAR2 PATH '$.recordInfo.STAFF_SEQNO'
    )) e;

INSERT INTO MSCS_FS_FINESDETAIL ( 
        FINESDETAIL_SEQNO
        ,FINES_SEQNO
        ,PRATE_SEQNO
        ,FINESLIPAMOUNT
        ,OVERSTAYDAY
        ,CREATE_BY
        ,CREATE_DATE
        ,CREATE_IP
        ,UPDATE_BY
        ,UPDATE_DATE
        ,UPDATE_IP
        ,VERSION)
SELECT  FINESDETAIL_SEQNO.NEXTVAL
        ,FINES_SEQNO_VAL
        ,e.PRATE_SEQNO
        ,e.FINESLIPAMOUNT
        ,e.OVERSTAYDAY
        ,SAVE_USER_VAL 
        ,SAVE_DATE_VAL 
        ,SAVE_IP_CLIENT_VAL 
        ,SAVE_USER_VAL 
        ,SAVE_DATE_VAL
        ,SAVE_IP_CLIENT_VAL
        ,1 AS VERSION
FROM json_table(REQ  FORMAT JSON, '$.finesDetail[*]'
        COLUMNS (
        -- FINESDETAIL_SEQNO  VARCHAR2 PATH '$.recordInfo.FINESDETAIL_SEQNO',
        -- FINES_SEQNO  VARCHAR2 PATH '$.recordInfo.FINES_SEQNO',
        PRATE_SEQNO  VARCHAR2 PATH '$.PRATE_SEQNO',
        FINESLIPAMOUNT  VARCHAR2 PATH '$.FINESLIPAMOUNT',
        OVERSTAYDAY  VARCHAR2 PATH '$.OVERSTAYDAY'--,
        -- CREATE_BY  VARCHAR2 PATH '$.recordInfo.CREATE_BY',
        -- CREATE_DATE  VARCHAR2 PATH '$.recordInfo.CREATE_DATE',
        -- CREATE_IP  VARCHAR2 PATH '$.recordInfo.CREATE_IP',
        -- UPDATE_BY  VARCHAR2 PATH '$.recordInfo.UPDATE_BY',
        -- UPDATE_DATE  VARCHAR2 PATH '$.recordInfo.UPDATE_DATE',
        -- UPDATE_IP  VARCHAR2 PATH '$.recordInfo.UPDATE_IP',
        -- VERSION  VARCHAR2 PATH '$.recordInfo.VERSION',
)) e;

-- UPDATE FINESLIPTOTAL
UPDATE MSCS_FS_FINESDETAIL 
SET FINESLIPAMOUNT =(case when PRATE_SEQNO =15 then (case when (FINESLIPAMOUNT*OVERSTAYDAY) >20000 then 20000 else FINESLIPAMOUNT*OVERSTAYDAY end)
                     else  FINESLIPAMOUNT*OVERSTAYDAY end)
WHERE FINES_SEQNO=FINES_SEQNO_VAL;-- Additional from free fine have overstayday cause fine rated  per day 

UPDATE MSCS_FS_FINES SET FINESLIPAMOUNT =(SELECT SUM(FINESLIPAMOUNT) FROM MSCS_FS_FINESDETAIL WHERE FINES_SEQNO=FINES_SEQNO_VAL) WHERE FINES_SEQNO=FINES_SEQNO_VAL;

-- IN CASE AUTO SLIP
IF(SLIPTYPE_VAL='A') THEN
UPDATE MSCS_FS_FINES SET FINESLIPNO = MAXSLIPNO_VAL,FINESLIPBOOKNO =MAXSLIPBOOKNO_VAL
WHERE FINES_SEQNO=FINES_SEQNO_VAL;
MAXSLIPNO_VAL:=MAXSLIPNO_VAL+1;

-- UPDATE SLIPNUM & RUNNING
UPDATE MSCS_FS_SETTINGFINESLIP f SET f.SLIPNUM = f.SLIPNUM-1 ,f.MAXSLIPNO=MAXSLIPNO_VAL
WHERE DEPT_SEQNO=DEPT_SEQNO_VAL AND IPADDRESS=SAVE_IP_CLIENT_VAL;
END IF;


FINES_SEQNO_OUT:=FINES_SEQNO_VAL;

END FINES_ADD_PROC;
/