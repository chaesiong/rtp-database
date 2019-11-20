CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_QUE_TM8" 
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
  MERGE INTO PIBICSDM2.QUE_TM8 T
USING (
        SELECT *
        FROM PIBICS.QUE_TM8@PIBICS_PROD
        WHERE (CREATE_DATE BETWEEN TO_DATE(v_start_date,'DD/MM/YYYY HH24:MI:SS') 
                                  AND TO_DATE(v_end_date,'DD/MM/YYYY HH24:MI:SS'))
             or (UPDATE_DATE BETWEEN TO_DATE(v_start_date,'DD/MM/YYYY HH24:MI:SS') 
                                  AND TO_DATE(v_end_date,'DD/MM/YYYY HH24:MI:SS'))
       ) S
ON (T.QUE_SEQNO =S.QUE_SEQNO)
WHEN MATCHED THEN UPDATE SET
                 T.IDENTIFIED_SEQNO = S.IDENTIFIED_SEQNO
				,T.EFIRSTNM = S.EFIRSTNM
				,T.EFAMILYNM = S.EFAMILYNM
				,T.EMIDDLENM = S.EMIDDLENM
				,T.PASS_ISSUDATE = S.PASS_ISSUDATE
				,T.PASS_EXPDATE = S.PASS_EXPDATE
				,T.ADDRESS = S.ADDRESS
				,T.ROAD = S.ROAD
				,T.PROVINCE_SEQNO = S.PROVINCE_SEQNO
				,T.AMPUR_SEQNO = S.AMPUR_SEQNO
				,T.TAMBON_SEQNO = S.TAMBON_SEQNO
				,T.PHONE_MOBILE = S.PHONE_MOBILE
				,T.PHONE_HOME = S.PHONE_HOME
				,T.PERMITTYPE = S.PERMITTYPE
				,T.DEPT_SEQNO = S.DEPT_SEQNO
				,T.ZONE_SEQNO = S.ZONE_SEQNO
				,T.ACTFLAG = S.ACTFLAG
				,T.REPS_SEQNO = S.REPS_SEQNO
				,T.BARCODE = S.BARCODE
				,T.CREATE_DATE = S.CREATE_DATE
				,T.UPDATE_DATE = S.UPDATE_DATE
				,T.UPDATE_BY = S.UPDATE_BY
				,T.INCLUDE_NUM = S.INCLUDE_NUM
				,T.INTEND_GO = S.INTEND_GO
				,T.PURPOSE = S.PURPOSE
				,T.TRANSPORT = S.TRANSPORT
				,T.LEAVEDTE = S.LEAVEDTE
				,T.RETURNDTE = S.RETURNDTE
				,T.EMAIL = S.EMAIL
				,T.PASS_NO = S.PASS_NO
				,T.PASS_ISSUAT = S.PASS_ISSUAT
				,T.TM6NO = S.TM6NO
				,T.SEX = S.SEX
				,T.NATION_SEQNO = S.NATION_SEQNO
				,T.OCC_SEQNO = S.OCC_SEQNO
				,T.BIRTHPLACE_STATE = S.BIRTHPLACE_STATE
				,T.BIRTHPLACE_COUNTRY = S.BIRTHPLACE_COUNTRY
				,T.BIRTHDATE = S.BIRTHDATE
				,T.VISA_SEQNO = S.VISA_SEQNO
				,T.VISA_ISSUAT = S.VISA_ISSUAT
				,T.VISA_ISSUDATE = S.VISA_ISSUDATE
				,T.VISA_EXPDATE = S.VISA_EXPDATE
				,T.ARRIVED_DATE = S.ARRIVED_DATE
				,T.APPOINTMENT_SEQNO = S.APPOINTMENT_SEQNO
				,T.SUFFIX_SEQNO = S.SUFFIX_SEQNO
				,T.PERSONID = S.PERSONID
				,T.WALKIN = S.WALKIN
				,T.BARCODE_PATH = S.BARCODE_PATH
WHEN NOT MATCHED THEN INSERT
                (
                T.QUE_SEQNO
				,T.IDENTIFIED_SEQNO
				,T.EFIRSTNM
				,T.EFAMILYNM
				,T.EMIDDLENM
				,T.PASS_ISSUDATE
				,T.PASS_EXPDATE
				,T.ADDRESS
				,T.ROAD
				,T.PROVINCE_SEQNO
				,T.AMPUR_SEQNO
				,T.TAMBON_SEQNO
				,T.PHONE_MOBILE
				,T.PHONE_HOME
				,T.PERMITTYPE
				,T.DEPT_SEQNO
				,T.ZONE_SEQNO
				,T.ACTFLAG
				,T.REPS_SEQNO
				,T.BARCODE
				,T.CREATE_DATE
				,T.UPDATE_DATE
				,T.UPDATE_BY
				,T.INCLUDE_NUM
				,T.INTEND_GO
				,T.PURPOSE
				,T.TRANSPORT
				,T.LEAVEDTE
				,T.RETURNDTE
				,T.EMAIL
				,T.PASS_NO
				,T.PASS_ISSUAT
				,T.TM6NO
				,T.SEX
				,T.NATION_SEQNO
				,T.OCC_SEQNO
				,T.BIRTHPLACE_STATE
				,T.BIRTHPLACE_COUNTRY
				,T.BIRTHDATE
				,T.VISA_SEQNO
				,T.VISA_ISSUAT
				,T.VISA_ISSUDATE
				,T.VISA_EXPDATE
				,T.ARRIVED_DATE
				,T.APPOINTMENT_SEQNO
				,T.SUFFIX_SEQNO
				,T.PERSONID
				,T.WALKIN
				,T.BARCODE_PATH
                )
                VALUES(
                 S.QUE_SEQNO
				,S.IDENTIFIED_SEQNO
				,S.EFIRSTNM
				,S.EFAMILYNM
				,S.EMIDDLENM
				,S.PASS_ISSUDATE
				,S.PASS_EXPDATE
				,S.ADDRESS
				,S.ROAD
				,S.PROVINCE_SEQNO
				,S.AMPUR_SEQNO
				,S.TAMBON_SEQNO
				,S.PHONE_MOBILE
				,S.PHONE_HOME
				,S.PERMITTYPE
				,S.DEPT_SEQNO
				,S.ZONE_SEQNO
				,S.ACTFLAG
				,S.REPS_SEQNO
				,S.BARCODE
				,S.CREATE_DATE
				,S.UPDATE_DATE
				,S.UPDATE_BY
				,S.INCLUDE_NUM
				,S.INTEND_GO
				,S.PURPOSE
				,S.TRANSPORT
				,S.LEAVEDTE
				,S.RETURNDTE
				,S.EMAIL
				,S.PASS_NO
				,S.PASS_ISSUAT
				,S.TM6NO
				,S.SEX
				,S.NATION_SEQNO
				,S.OCC_SEQNO
				,S.BIRTHPLACE_STATE
				,S.BIRTHPLACE_COUNTRY
				,S.BIRTHDATE
				,S.VISA_SEQNO
				,S.VISA_ISSUAT
				,S.VISA_ISSUDATE
				,S.VISA_EXPDATE
				,S.ARRIVED_DATE
				,S.APPOINTMENT_SEQNO
				,S.SUFFIX_SEQNO
				,S.PERSONID
				,S.WALKIN
				,S.BARCODE_PATH
                );
 d_end := sysdate;
  var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('QUE_TM8', var_rows, sysdate);
 INSERT INTO IMPORT_LOG_DETAIL VALUES ('QUE_TM8', var_rows,SYSDATE,v_start_date,v_end_date,d_start,d_end);
   COMMIT;
END P_QUE_TM8;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_QUE_TM8" TO "BIOSAADM";
