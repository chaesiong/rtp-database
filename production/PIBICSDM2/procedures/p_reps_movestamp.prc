CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_REPS_MOVESTAMP" 
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
  MERGE INTO PIBICSDM2.REPS_MOVESTAMP T
USING (
        SELECT *
        FROM PIBICS.REPS_MOVESTAMP@PIBICS_PROD
        WHERE (CREATE_DATE BETWEEN TO_DATE(v_start_date,'DD/MM/YYYY HH24:MI:SS') 
                                  AND TO_DATE(v_end_date,'DD/MM/YYYY HH24:MI:SS'))
             or (UPDATE_DATE BETWEEN TO_DATE(v_start_date,'DD/MM/YYYY HH24:MI:SS') 
                                  AND TO_DATE(v_end_date,'DD/MM/YYYY HH24:MI:SS'))
       ) S
ON (T.MOVESTAMP_SEQNO =S.MOVESTAMP_SEQNO)
WHEN MATCHED THEN UPDATE SET
                 T.REPSPERSON_SEQNO = S.REPSPERSON_SEQNO
                ,T.FLAGMOVE = S.FLAGMOVE
                ,T.YEAR = S.YEAR
                ,T.SUFFIX_SEQNO = S.SUFFIX_SEQNO
                ,T.EFIRSTNM = S.EFIRSTNM
                ,T.EMIDDLENM = S.EMIDDLENM
                ,T.EFAMILYNM = S.EFAMILYNM
                ,T.TFAMILYNM = S.TFAMILYNM
                ,T.TMIDDLENM = S.TMIDDLENM
                ,T.TFIRSTNM = S.TFIRSTNM
                ,T.NATION_SEQNO = S.NATION_SEQNO
                ,T.BIRTH_DATE = S.BIRTH_DATE
                ,T.BIRTH_PLACE = S.BIRTH_PLACE
                ,T.SEX = S.SEX
                ,T.AGE = S.AGE
                ,T.OCC_SEQNO = S.OCC_SEQNO
                ,T.OPASSPORTNO = S.OPASSPORTNO
                ,T.OPASSPORT_PIC = S.OPASSPORT_PIC
                ,T.OPASSPORTISSUE_DATE = S.OPASSPORTISSUE_DATE
                ,T.OPASSPORTISSUE_BY = S.OPASSPORTISSUE_BY
                ,T.OPASSPORTEXP_DATE = S.OPASSPORTEXP_DATE
                ,T.NPASSPORTNO = S.NPASSPORTNO
                ,T.NPASSPORT_PIC = S.NPASSPORT_PIC
                ,T.NPASSPORTISSUE_DATE = S.NPASSPORTISSUE_DATE
                ,T.NPASSPORTISSUE_BY = S.NPASSPORTISSUE_BY
                ,T.NPASSPORTEXP_DATE = S.NPASSPORTEXP_DATE
                ,T.CONV_SEQNO = S.CONV_SEQNO
                ,T.IN_DATE = S.IN_DATE
                ,T.PORTOFARRV_DEPT = S.PORTOFARRV_DEPT
                ,T.TM6NO = S.TM6NO
                ,T.VISATYPE_SEQNO = S.VISATYPE_SEQNO
                ,T.REASONDESC = S.REASONDESC
                ,T.PERMIT_DATE = S.PERMIT_DATE
                ,T.CREATE_BY = S.CREATE_BY
                ,T.CREATE_DATE = S.CREATE_DATE
                ,T.UPDATE_BY = S.UPDATE_BY
                ,T.UPDATE_DATE = S.UPDATE_DATE
                ,T.VERSION = S.VERSION
                ,T.FLIGHTNO = S.FLIGHTNO
                ,T.VISA_DATE = S.VISA_DATE
                ,T.TM8NO = S.TM8NO
                ,T.DOCDATE = S.DOCDATE
                ,T.IPADDRESS = S.IPADDRESS
                ,T.UIPADDRESS = S.UIPADDRESS
                ,T.DEPT_SEQNO = S.DEPT_SEQNO
WHEN NOT MATCHED THEN INSERT
                (
                T.MOVESTAMP_SEQNO
                ,T.REPSPERSON_SEQNO
                ,T.FLAGMOVE
                ,T.YEAR
                ,T.SUFFIX_SEQNO
                ,T.EFIRSTNM
                ,T.EMIDDLENM
                ,T.EFAMILYNM
                ,T.TFAMILYNM
                ,T.TMIDDLENM
                ,T.TFIRSTNM
                ,T.NATION_SEQNO
                ,T.BIRTH_DATE
                ,T.BIRTH_PLACE
                ,T.SEX
                ,T.AGE
                ,T.OCC_SEQNO
                ,T.OPASSPORTNO
                ,T.OPASSPORT_PIC
                ,T.OPASSPORTISSUE_DATE
                ,T.OPASSPORTISSUE_BY
                ,T.OPASSPORTEXP_DATE
                ,T.NPASSPORTNO
                ,T.NPASSPORT_PIC
                ,T.NPASSPORTISSUE_DATE
                ,T.NPASSPORTISSUE_BY
                ,T.NPASSPORTEXP_DATE
                ,T.CONV_SEQNO
                ,T.IN_DATE
                ,T.PORTOFARRV_DEPT
                ,T.TM6NO
                ,T.VISATYPE_SEQNO
                ,T.REASONDESC
                ,T.PERMIT_DATE
                ,T.CREATE_BY
                ,T.CREATE_DATE
                ,T.UPDATE_BY
                ,T.UPDATE_DATE
                ,T.VERSION
                ,T.FLIGHTNO
                ,T.VISA_DATE
                ,T.TM8NO
                ,T.DOCDATE
                ,T.IPADDRESS
                ,T.UIPADDRESS
                ,T.DEPT_SEQNO
                )
                VALUES(
                S.MOVESTAMP_SEQNO
                ,S.REPSPERSON_SEQNO
                ,S.FLAGMOVE
                ,S.YEAR
                ,S.SUFFIX_SEQNO
                ,S.EFIRSTNM
                ,S.EMIDDLENM
                ,S.EFAMILYNM
                ,S.TFAMILYNM
                ,S.TMIDDLENM
                ,S.TFIRSTNM
                ,S.NATION_SEQNO
                ,S.BIRTH_DATE
                ,S.BIRTH_PLACE
                ,S.SEX
                ,S.AGE
                ,S.OCC_SEQNO
                ,S.OPASSPORTNO
                ,S.OPASSPORT_PIC
                ,S.OPASSPORTISSUE_DATE
                ,S.OPASSPORTISSUE_BY
                ,S.OPASSPORTEXP_DATE
                ,S.NPASSPORTNO
                ,S.NPASSPORT_PIC
                ,S.NPASSPORTISSUE_DATE
                ,S.NPASSPORTISSUE_BY
                ,S.NPASSPORTEXP_DATE
                ,S.CONV_SEQNO
                ,S.IN_DATE
                ,S.PORTOFARRV_DEPT
                ,S.TM6NO
                ,S.VISATYPE_SEQNO
                ,S.REASONDESC
                ,S.PERMIT_DATE
                ,S.CREATE_BY
                ,S.CREATE_DATE
                ,S.UPDATE_BY
                ,S.UPDATE_DATE
                ,S.VERSION
                ,S.FLIGHTNO
                ,S.VISA_DATE
                ,S.TM8NO
                ,S.DOCDATE
                ,S.IPADDRESS
                ,S.UIPADDRESS
                ,S.DEPT_SEQNO
                );
 d_end := sysdate;
  var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('REPS_MOVESTAMP', var_rows, sysdate);
 INSERT INTO IMPORT_LOG_DETAIL VALUES ('REPS_MOVESTAMP', var_rows,SYSDATE,v_start_date,v_end_date,d_start,d_end);
   COMMIT;
END P_REPS_MOVESTAMP;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_REPS_MOVESTAMP" TO "BIOSAADM";
