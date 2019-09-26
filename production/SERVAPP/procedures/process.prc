CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROCESS" (
REQ IN BLOB,
PROC_SEQNO_INOUT IN OUT NUMBER
) AS 
DEPT_SEQNO_VAL NUMBER;
SAVE_IP_CLIENT_VAL VARCHAR2(15);
SAVE_USER_VAL VARCHAR2(20);
SAVE_DATE_VAL TIMESTAMP(6);
PROC_SEQNO_VAL NUMBER;
EXT_SEQNO_VAL NUMBER;
BEGIN
		SELECT i.SAVE_IP_CLIENT,i.SAVE_IP_USER,CURRENT_TIMESTAMP, i.DEPT_SEQNO,i.EXT_SEQNO 
        INTO SAVE_IP_CLIENT_VAL,SAVE_USER_VAL,SAVE_DATE_VAL,DEPT_SEQNO_VAL,EXT_SEQNO_VAL
		FROM json_table(REQ  FORMAT JSON, '$'
         COLUMNS (
			 	SAVE_IP_CLIENT   	VARCHAR2  	PATH '$.headerInfo.ipClient',
				SAVE_IP_USER   		VARCHAR2  	PATH '$.headerInfo.userId',
           		DEPT_SEQNO       	NUMBER  	PATH '$.processInfo.DEPT_SEQNO', 
		   		EXT_SEQNO			NUMBER		PATH '$.processInfo.EXT_SEQNO'
        )) i;

    IF(PROC_SEQNO_INOUT IS NULL) THEN
	SELECT PROC_SEQNO.NEXTVAL INTO PROC_SEQNO_VAL FROM DUAL;
    ELSE
    PROC_SEQNO_VAL:=PROC_SEQNO_INOUT;
    END IF;

    MERGE INTO MSCS_EXT_PROCESS d
    USING (
    SELECT PROC_SEQNO_VAL PROC_SEQNO
				,e.DOCNO
				,e.DOCNO_YEAR
				,e.GOVSECTION
				,e.GOVAT_1
				,e.GOVAT_2
				,e.PROC_TO
				,e.DOC_TEL
				,TO_DATE(e.DOC_DATE, 'DD/MM/YYYY') DOC_DATE
				,TO_DATE(e.IN_DATE, 'DD/MM/YYYY') IN_DATE
				,e.VISASTATUS
				,e.VISATYPE_SEQNO
				,TO_DATE(e.VISA_EXPDATE , 'DD/MM/YYYY') VISA_EXPDATE
				,e.REMARK1
				,TO_DATE(e.EXT_DATE , 'DD/MM/YYYY') EXT_DATE
				,e.EXT_DAY
				,e.APPROVESTS
				,TO_DATE(e.PERMIT_DATE , 'DD/MM/YYYY') PERMIT_DATE
				,e.DISAPP_REASON
				,e.REMARK4
				,SAVE_USER_VAL CREATE_BY
				,CURRENT_TIMESTAMP CREATE_DATE
				,SAVE_USER_VAL UPDATE_BY
				,CURRENT_TIMESTAMP UPDATE_DATE
				,1 VERSION
				,e.REMARK2_1
				,e.REMARK2_2
				,e.UDEPT_SEQNO
				,e.REASON_SEQNO
				,e.U_RANK_SEQNO
				,e.U_NAME
				,e.U_POSTLEVEL
				,e.P_RANK_SEQNO
				,e.P_NAME
				,e.P_POSTLEVEL
				,TO_DATE(e.PROVE_DATE , 'DD/MM/YYYY') PROVE_DATE
				,e.PROVE_BY
				,e.COMPANYNM
				,e.O_DOCNO
				,e.O_DOCNO_YEAR
				,TO_DATE(e.VISA_DATE , 'DD/MM/YYYY') VISA_DATE
				,e.COMPANY_SEQNO
				,e.PROVE_ID
				,TO_DATE(e.WPERMIT_DATE , 'DD/MM/YYYY') WPERMIT_DATE
				,TO_DATE(e.WEPERMIT_DATE , 'DD/MM/YYYY') WEPERMIT_DATE
				,e.PRESENT_BY
				,e.PRESENT_ID
				,e.IPADDRESS
				,e.UIPADDRESS
				,e.VISATYPESUB_SEQNO
				,e.STATUS_OFFLINE
 FROM json_table(REQ  FORMAT JSON, '$'
         COLUMNS (
				DEPT_SEQNO      VARCHAR2  PATH '$.processInfo.PROC_SEQNO',
				DOCNO      		VARCHAR2  PATH '$.processInfo.DOCNO',
				DOCNO_YEAR      VARCHAR2  PATH '$.processInfo.DOCNO_YEAR',
				GOVSECTION      VARCHAR2  PATH '$.processInfo.GOVSECTION',
				GOVAT_1      	VARCHAR2  PATH '$.processInfo.GOVAT_1',
				GOVAT_2      	VARCHAR2  PATH '$.processInfo.GOVAT_2',
				PROC_TO      	VARCHAR2  PATH '$.processInfo.PROC_TO',
				DOC_TEL      	VARCHAR2  PATH '$.processInfo.DOC_TEL',
				DOC_DATE      	VARCHAR2  PATH '$.processInfo.DOC_DATE',
				IN_DATE      	VARCHAR2  PATH '$.processInfo.IN_DATE',
				VISASTATUS      VARCHAR2  PATH '$.processInfo.VISASTATUS',
				VISATYPE_SEQNO  VARCHAR2  PATH '$.processInfo.VISATYPE_SEQNO',
				VISA_EXPDATE    VARCHAR2  PATH '$.processInfo.VISA_EXPDATE',
				REMARK1      	VARCHAR2  PATH '$.processInfo.REMARK1',
				EXT_DATE      	VARCHAR2  PATH '$.processInfo.EXT_DATE',
				EXT_DAY      	VARCHAR2  PATH '$.processInfo.EXT_DAY',
				APPROVESTS      VARCHAR2  PATH '$.processInfo.APPROVESTS',
				PERMIT_DATE     VARCHAR2  PATH '$.processInfo.PERMIT_DATE',
				DISAPP_REASON   VARCHAR2  PATH '$.processInfo.DISAPP_REASON',
				REMARK4      	VARCHAR2  PATH '$.processInfo.REMARK4',
				-- CREATE_BY      	VARCHAR2  PATH '$.processInfo.CREATE_BY',
				-- CREATE_DATE     VARCHAR2  PATH '$.processInfo.CREATE_DATE',
				-- UPDATE_BY      	VARCHAR2  PATH '$.processInfo.UPDATE_BY',
				-- UPDATE_DATE     VARCHAR2  PATH '$.processInfo.UPDATE_DATE',
				-- VERSION      	VARCHAR2  PATH '$.processInfo.VERSION',
				REMARK2_1      	VARCHAR2  PATH '$.processInfo.REMARK2_1',
				REMARK2_2      	VARCHAR2  PATH '$.processInfo.REMARK2_2',
				UDEPT_SEQNO     VARCHAR2  PATH '$.processInfo.UDEPT_SEQNO',
				REASON_SEQNO    VARCHAR2  PATH '$.processInfo.REASON_SEQNO',
				U_RANK_SEQNO    VARCHAR2  PATH '$.processInfo.U_RANK_SEQNO',
				U_NAME      	VARCHAR2  PATH '$.processInfo.U_NAME',
				U_POSTLEVEL     VARCHAR2  PATH '$.processInfo.U_POSTLEVEL',
				P_RANK_SEQNO    VARCHAR2  PATH '$.processInfo.P_RANK_SEQNO',
				P_NAME      	VARCHAR2  PATH '$.processInfo.P_NAME',
				P_POSTLEVEL     VARCHAR2  PATH '$.processInfo.P_POSTLEVEL',
				PROVE_DATE      VARCHAR2  PATH '$.processInfo.PROVE_DATE',
				PROVE_BY      	VARCHAR2  PATH '$.processInfo.PROVE_BY',
				COMPANYNM      	VARCHAR2  PATH '$.processInfo.COMPANYNM',
				O_DOCNO      	VARCHAR2  PATH '$.processInfo.O_DOCNO',
				O_DOCNO_YEAR     VARCHAR2  PATH '$.processInfo.O_DOCNO_YEAR',
				VISA_DATE      VARCHAR2  PATH '$.processInfo.VISA_DATE',
				COMPANY_SEQNO      VARCHAR2  PATH '$.processInfo.COMPANY_SEQNO',
				PROVE_ID      VARCHAR2  PATH '$.processInfo.PROVE_ID',
				WPERMIT_DATE      VARCHAR2  PATH '$.processInfo.WPERMIT_DATE',
				WEPERMIT_DATE      VARCHAR2  PATH '$.processInfo.WEPERMIT_DATE',
				PRESENT_BY      VARCHAR2  PATH '$.processInfo.PRESENT_BY',
				PRESENT_ID      VARCHAR2  PATH '$.processInfo.PRESENT_ID',
				IPADDRESS      VARCHAR2  PATH '$.processInfo.IPADDRESS',
				UIPADDRESS      VARCHAR2  PATH '$.processInfo.UIPADDRESS',
				VISATYPESUB_SEQNO      VARCHAR2  PATH '$.processInfo.VISATYPESUB_SEQNO',
				STATUS_OFFLINE      VARCHAR2  PATH '$.processInfo.STATUS_OFFLINE'
           )) e
    ) s
    ON(d.PROC_SEQNO=s.PROC_SEQNO)
    WHEN MATCHED THEN
    UPDATE SET
                    --,d.PROC_SEQNO=s.PROC_SEQNO
                    d.DOCNO=s.DOCNO
                    ,d.DOCNO_YEAR=s.DOCNO_YEAR
                    ,d.GOVSECTION=s.GOVSECTION
                    ,d.GOVAT_1=s.GOVAT_1
                    ,d.GOVAT_2=s.GOVAT_2
                    ,d.PROC_TO=s.PROC_TO
                    ,d.DOC_TEL=s.DOC_TEL
                    ,d.DOC_DATE=s.DOC_DATE
                    ,d.IN_DATE=s.IN_DATE
                    ,d.VISASTATUS=s.VISASTATUS
                    ,d.VISATYPE_SEQNO=s.VISATYPE_SEQNO
                    ,d.VISA_EXPDATE=s.VISA_EXPDATE
                    ,d.REMARK1=s.REMARK1
                    ,d.EXT_DATE=s.EXT_DATE
                    ,d.EXT_DAY=s.EXT_DAY
                    ,d.APPROVESTS=s.APPROVESTS
                    ,d.PERMIT_DATE=s.PERMIT_DATE
                    ,d.DISAPP_REASON=s.DISAPP_REASON
                    ,d.REMARK4=s.REMARK4
                    --,d.CREATE_BY=s.CREATE_BY
                    --,d.CREATE_DATE=s.CREATE_DATE
                    ,d.UPDATE_BY=s.UPDATE_BY
                    ,d.UPDATE_DATE=s.UPDATE_DATE
                    ,d.VERSION=d.VERSION+1
                    ,d.REMARK2_1=s.REMARK2_1
                    ,d.REMARK2_2=s.REMARK2_2
                    ,d.UDEPT_SEQNO=s.UDEPT_SEQNO
                    ,d.REASON_SEQNO=s.REASON_SEQNO
                    ,d.U_RANK_SEQNO=s.U_RANK_SEQNO
                    ,d.U_NAME=s.U_NAME
                    ,d.U_POSTLEVEL=s.U_POSTLEVEL
                    ,d.P_RANK_SEQNO=s.P_RANK_SEQNO
                    ,d.P_NAME=s.P_NAME
                    ,d.P_POSTLEVEL=s.P_POSTLEVEL
                    ,d.PROVE_DATE=s.PROVE_DATE
                    ,d.PROVE_BY=s.PROVE_BY
                    ,d.COMPANYNM=s.COMPANYNM
                    ,d.O_DOCNO=s.O_DOCNO
                    ,d.O_DOCNO_YEAR=s.O_DOCNO_YEAR
                    ,d.VISA_DATE=s.VISA_DATE
                    ,d.COMPANY_SEQNO=s.COMPANY_SEQNO
                    ,d.PROVE_ID=s.PROVE_ID
                    ,d.WPERMIT_DATE=s.WPERMIT_DATE
                    ,d.WEPERMIT_DATE=s.WEPERMIT_DATE
                    ,d.PRESENT_BY=s.PRESENT_BY
                    ,d.PRESENT_ID=s.PRESENT_ID
                    ,d.IPADDRESS=s.IPADDRESS
                    ,d.UIPADDRESS=s.UIPADDRESS
                    ,d.VISATYPESUB_SEQNO=s.VISATYPESUB_SEQNO
                    ,d.STATUS_OFFLINE=s.STATUS_OFFLINE
    WHEN NOT MATCHED THEN
    INSERT (PROC_SEQNO
				,DOCNO
				,DOCNO_YEAR
				,GOVSECTION
				,GOVAT_1
				,GOVAT_2
				,PROC_TO
				,DOC_TEL
				,DOC_DATE
				,IN_DATE
				,VISASTATUS
				,VISATYPE_SEQNO
				,VISA_EXPDATE
				,REMARK1
				,EXT_DATE
				,EXT_DAY
				,APPROVESTS
				,PERMIT_DATE
				,DISAPP_REASON
				,REMARK4
				,CREATE_BY
				,CREATE_DATE 
				,UPDATE_BY
				,UPDATE_DATE
				,VERSION
				,REMARK2_1
				,REMARK2_2
				,UDEPT_SEQNO
				,REASON_SEQNO
				,U_RANK_SEQNO
				,U_NAME
				,U_POSTLEVEL
				,P_RANK_SEQNO
				,P_NAME
				,P_POSTLEVEL
				,PROVE_DATE
				,PROVE_BY
				,COMPANYNM
				,O_DOCNO
				,O_DOCNO_YEAR
				,VISA_DATE
				,COMPANY_SEQNO
				,PROVE_ID
				,WPERMIT_DATE
				,WEPERMIT_DATE
				,PRESENT_BY
				,PRESENT_ID
				,IPADDRESS
				,UIPADDRESS
				,VISATYPESUB_SEQNO
				,STATUS_OFFLINE)
    VALUES(
                s.PROC_SEQNO
                ,s.DOCNO
                ,s.DOCNO_YEAR
                ,s.GOVSECTION
                ,s.GOVAT_1
                ,s.GOVAT_2
                ,s.PROC_TO
                ,s.DOC_TEL
                ,s.DOC_DATE
                ,s.IN_DATE
                ,s.VISASTATUS
                ,s.VISATYPE_SEQNO
                ,s.VISA_EXPDATE
                ,s.REMARK1
                ,s.EXT_DATE
                ,s.EXT_DAY
                ,s.APPROVESTS
                ,s.PERMIT_DATE
                ,s.DISAPP_REASON
                ,s.REMARK4
                ,s.CREATE_BY
                ,s.CREATE_DATE
                ,s.UPDATE_BY
                ,s.UPDATE_DATE
                ,s.VERSION
                ,s.REMARK2_1
                ,s.REMARK2_2
                ,s.UDEPT_SEQNO
                ,s.REASON_SEQNO
                ,s.U_RANK_SEQNO
                ,s.U_NAME
                ,s.U_POSTLEVEL
                ,s.P_RANK_SEQNO
                ,s.P_NAME
                ,s.P_POSTLEVEL
                ,s.PROVE_DATE
                ,s.PROVE_BY
                ,s.COMPANYNM
                ,s.O_DOCNO
                ,s.O_DOCNO_YEAR
                ,s.VISA_DATE
                ,s.COMPANY_SEQNO
                ,s.PROVE_ID
                ,s.WPERMIT_DATE
                ,s.WEPERMIT_DATE
                ,s.PRESENT_BY
                ,s.PRESENT_ID
                ,s.IPADDRESS
                ,s.UIPADDRESS
                ,s.VISATYPESUB_SEQNO
                ,s.STATUS_OFFLINE
    );


        MERGE INTO MSCS_EXT_PROCESSLIST d
        USING (
        SELECT 
				PROC_SEQNO_VAL PROC_SEQNO,
				e.EXTLIST_SEQNO,
				SAVE_USER_VAL CREATE_BY,
				SAVE_DATE_VAL CREATE_DATE,
				SAVE_USER_VAL UPDATE_BY,
				SAVE_DATE_VAL UPDATE_DATE,
				1 VERSION
            FROM json_table(REQ  FORMAT JSON, '$.extensionList[*]'
            COLUMNS (
	        EXTLIST_SEQNO	VARCHAR2      PATH '$.EXTLIST_SEQNO'
            )) e
        ) s
        ON (d.PROC_SEQNO=s.PROC_SEQNO AND d.EXTLIST_SEQNO=s.EXTLIST_SEQNO)
        WHEN MATCHED THEN
        UPDATE SET
                --d.PROCLIST_SEQNO,
				--d.PROC_SEQNO,
				--d.EXTLIST_SEQNO=s.EXTLIST_SEQNO,
				d.CREATE_BY=s.CREATE_BY,
				d.CREATE_DATE=s.CREATE_DATE,
				--d.UPDATE_BY=s.UPDATE_BY,
				--d.UPDATE_DATE=s.UPDATE_DATE,
				d.VERSION=d.VERSION+1
        WHEN NOT MATCHED THEN
        INSERT
        (PROCLIST_SEQNO,
				PROC_SEQNO,
				EXTLIST_SEQNO,
				CREATE_BY,
				CREATE_DATE,
				UPDATE_BY,
				UPDATE_DATE,
				VERSION)
        VALUES(PROCLIST_SEQNO.NEXTVAL,
				s.PROC_SEQNO,
				s.EXTLIST_SEQNO,
				s.CREATE_BY,
				s.CREATE_DATE,
				s.UPDATE_BY,
				s.UPDATE_DATE,
				1
        );



    DELETE 
    FROM MSCS_EXT_PROCESSLIST d 
    WHERE d.PROC_SEQNO = PROC_SEQNO_VAL AND
    NOT EXISTS(
        SELECT 1 FROM (
        SELECT s.EXTLIST_SEQNO
        FROM json_table(REQ  FORMAT JSON, '$.extensionList[*]'
        COLUMNS (
        EXTLIST_SEQNO	VARCHAR2      PATH '$.EXTLIST_SEQNO'
        )) s
        WHERE EXISTS (
                SELECT 1 FROM MSCS_EXT_PROCESSLIST d WHERE d.EXTLIST_SEQNO =s.EXTLIST_SEQNO
                )  
          ) s WHERE s.EXTLIST_SEQNO =d.EXTLIST_SEQNO 
        );


            PROC_SEQNO_INOUT:=PROC_SEQNO_VAL;
END PROCESS;

/
