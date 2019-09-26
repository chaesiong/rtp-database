CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_EXT_COMPANY" 
(
  P_START_DATE IN VARCHAR2 
, P_END_DATE IN VARCHAR2 
) AS 
  v_start_date varchar2(50);
  v_end_date varchar2(50);
  var_rows   NUMBER;
  d_start date;
   d_end date;
BEGIN
  v_start_date :=P_START_DATE;
  v_end_date := P_END_DATE;
  d_start := sysdate;
  if v_start_date is null then
  v_start_date :=to_char(sysdate,'dd/mm/yyyy')||' 00:00:00';
  end if;
   if v_end_date is null then
  v_end_date :=to_char(sysdate,'dd/mm/yyyy')||' 23:59:59';
  end if;
  MERGE INTO PIBICSDM2.EXT_COMPANY T
USING (
        SELECT *
        FROM PIBICS.EXT_COMPANY@PIBICS_PROD
        WHERE (CREATE_DATE BETWEEN TO_DATE(v_start_date,'DD/MM/YYYY HH24:MI:SS') 
                                  AND TO_DATE(v_end_date,'DD/MM/YYYY HH24:MI:SS'))
             or (UPDATE_DATE BETWEEN TO_DATE(v_start_date,'DD/MM/YYYY HH24:MI:SS') 
                                  AND TO_DATE(v_end_date,'DD/MM/YYYY HH24:MI:SS'))
       ) S
ON (T.COMPANY_SEQNO =S.COMPANY_SEQNO)
WHEN MATCHED THEN UPDATE SET
                 T.COMTYPE_SEQNO = S.COMTYPE_SEQNO
                ,T.CAPITAL = S.CAPITAL
                ,T.ASSET = S.ASSET
                ,T.SHARES = S.SHARES
                ,T.SUMINCOME = S.SUMINCOME
                ,T.SUMOFFICER = S.SUMOFFICER
                ,T.THAIOFFICER = S.THAIOFFICER
                ,T.ALIENOFFICER = S.ALIENOFFICER
                ,T.ALIENINCOMEM = S.ALIENINCOMEM
                ,T.ALIENTAXM = S.ALIENTAXM
                ,T.ALIENINCOMEY = S.ALIENINCOMEY
                ,T.ALIENTAXY = S.ALIENTAXY
                ,T.CREATE_BY = S.CREATE_BY
                ,T.CREATE_DATE = S.CREATE_DATE
                ,T.UPDATE_BY = S.UPDATE_BY
                ,T.UPDATE_DATE = S.UPDATE_DATE
                ,T.VERSION = S.VERSION
                ,T.COMPANYNM = S.COMPANYNM
                ,T.COMPANYTYPENM = S.COMPANYTYPENM
                ,T.CAPITALPAY = S.CAPITALPAY
                ,T.ASSET_BOI = S.ASSET_BOI
                ,T.PERMANENCE = S.PERMANENCE
                ,T.DAILY = S.DAILY
                ,T.TRANSFER_DATE = S.TRANSFER_DATE
                ,T.TRANSFER_TO = S.TRANSFER_TO
                ,T.TRANSFER_AMOUNT = S.TRANSFER_AMOUNT
                ,T.DEPT_SEQNO = S.DEPT_SEQNO
                ,T.SEQNO = S.SEQNO
                ,T.ACTFLAG = S.ACTFLAG
                ,T.SUMEND = S.SUMEND
                ,T.ADDR = S.ADDR
                ,T.ROAD = S.ROAD
                ,T.PV_SEQNO = S.PV_SEQNO
                ,T.AMP_SEQNO = S.AMP_SEQNO
                ,T.TMB_SEQNO = S.TMB_SEQNO
                ,T.TEL = S.TEL
                ,T.STATALIENOFFICER = S.STATALIENOFFICER
                ,T.MOVESTAMP_TYPE = S.MOVESTAMP_TYPE
WHEN NOT MATCHED THEN INSERT
                (
                T.COMPANY_SEQNO
                ,T.COMTYPE_SEQNO
                ,T.CAPITAL
                ,T.ASSET
                ,T.SHARES
                ,T.SUMINCOME
                ,T.SUMOFFICER
                ,T.THAIOFFICER
                ,T.ALIENOFFICER
                ,T.ALIENINCOMEM
                ,T.ALIENTAXM
                ,T.ALIENINCOMEY
                ,T.ALIENTAXY
                ,T.CREATE_BY
                ,T.CREATE_DATE
                ,T.UPDATE_BY
                ,T.UPDATE_DATE
                ,T.VERSION
                ,T.COMPANYNM
                ,T.COMPANYTYPENM
                ,T.CAPITALPAY
                ,T.ASSET_BOI
                ,T.PERMANENCE
                ,T.DAILY
                ,T.TRANSFER_DATE
                ,T.TRANSFER_TO
                ,T.TRANSFER_AMOUNT
                ,T.DEPT_SEQNO
                ,T.SEQNO
                ,T.ACTFLAG
                ,T.SUMEND
                ,T.ADDR
                ,T.ROAD
                ,T.PV_SEQNO
                ,T.AMP_SEQNO
                ,T.TMB_SEQNO
                ,T.TEL
                ,T.STATALIENOFFICER
                ,T.MOVESTAMP_TYPE
                )
                VALUES(
                S.COMPANY_SEQNO
                ,S.COMTYPE_SEQNO
                ,S.CAPITAL
                ,S.ASSET
                ,S.SHARES
                ,S.SUMINCOME
                ,S.SUMOFFICER
                ,S.THAIOFFICER
                ,S.ALIENOFFICER
                ,S.ALIENINCOMEM
                ,S.ALIENTAXM
                ,S.ALIENINCOMEY
                ,S.ALIENTAXY
                ,S.CREATE_BY
                ,S.CREATE_DATE
                ,S.UPDATE_BY
                ,S.UPDATE_DATE
                ,S.VERSION
                ,S.COMPANYNM
                ,S.COMPANYTYPENM
                ,S.CAPITALPAY
                ,S.ASSET_BOI
                ,S.PERMANENCE
                ,S.DAILY
                ,S.TRANSFER_DATE
                ,S.TRANSFER_TO
                ,S.TRANSFER_AMOUNT
                ,S.DEPT_SEQNO
                ,S.SEQNO
                ,S.ACTFLAG
                ,S.SUMEND
                ,S.ADDR
                ,S.ROAD
                ,S.PV_SEQNO
                ,S.AMP_SEQNO
                ,S.TMB_SEQNO
                ,S.TEL
                ,S.STATALIENOFFICER
                ,S.MOVESTAMP_TYPE
                );
 d_end := sysdate;
  var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('EXT_COMPANY', var_rows, sysdate);
 INSERT INTO IMPORT_LOG_DETAIL VALUES ('EXT_COMPANY', var_rows,SYSDATE,v_start_date,v_end_date,d_start,d_end);
   COMMIT;
END P_EXT_COMPANY;
/
