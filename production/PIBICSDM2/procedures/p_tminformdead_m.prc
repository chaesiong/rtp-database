CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_TMINFORMDEAD_M" (v_dstart varchar2,v_dend varchar2)
IS
 var_rows NUMBER;
 vstdate date;
 veddate date;
 
BEGIN
   /*   Create date : 27-01-2018    */
   --No.22
  -- v_dstart := TO_CHAR (TRUNC (SYSDATE) - 1, 'yyyymmdd');
  -- v_dend := TO_CHAR (TRUNC (SYSDATE), 'yyyymmdd');

    vstdate :=sysdate;

   MERGE INTO PIBICSDM2.TMINFORMDEAD DM
        USING (SELECT * 
                    FROM PIBICS.TMINFORMDEAD@PIBICS_PROD
                    WHERE CREDTE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND CREDTE < TO_DATE(v_dend,'yyyymmdd')
                        AND UPDDTE IS NULL) P
        ON (DM.TMINFDEADSEQNO = P.TMINFDEADSEQNO)
    WHEN MATCHED 
    THEN 
        UPDATE SET DM.TMRUNNO = P.TMRUNNO,
                    DM.TM6NO = P.TM6NO,
                    DM.INOUTDTE = P.INOUTDTE,
                    DM.CARDTYPE = P.CARDTYPE,
                    DM.TFIRSTNM = P.TFIRSTNM,
                    DM.TMIDDLENM = P.TMIDDLENM,
                    DM.TFAMILYNM = P.TFAMILYNM,
                    DM.EFIRSTNM = P.EFIRSTNM,
                    DM.EMIDDLENM = P.EMIDDLENM,
                    DM.EFAMILYNM = P.EFAMILYNM,
                    DM.SEX = P.SEX,
                    DM.BIRTHDTE = P.BIRTHDTE,
                    DM.NATIONCD = P.NATIONCD,
                    DM.DEPTCD = P.DEPTCD,
                    DM.TRAVCD = P.TRAVCD,
                    DM.CONVCD = P.CONVCD,
                    DM.CONVREGNO = P.CONVREGNO,
                    DM.TDTCD = P.TDTCD,
                    DM.TDTNO = P.TDTNO,
                    DM.VISATYPECD = P.VISATYPECD,
                    DM.VISAEXPDTE = P.VISAEXPDTE,
                    DM.PASSPORTDTE = P.PASSPORTDTE,
                    DM.PASSPORTEXPDTE = P.PASSPORTEXPDTE,
                    DM.INTYPE = P.INTYPE,
                    DM.CHKPOINTNO = P.CHKPOINTNO,
                    DM.CREUSR = P.CREUSR,
                    DM.CREDTE = P.CREDTE,
                    DM.CREDTERM = P.CREDTERM,
                    DM.UPDUSR = P.UPDUSR,
                    DM.UPDDTE = P.UPDDTE,
                    DM.UPDTERM = P.UPDTERM,
                    DM.PERSONID = P.PERSONID,
                    DM.TFSNDXNM = P.TFSNDXNM,
                    DM.TLSNDXNM = P.TLSNDXNM,
                    DM.TMSNDXNM = P.TMSNDXNM,
                    DM.EFSNDXNM = P.EFSNDXNM,
                    DM.ELSNDXNM = P.ELSNDXNM,
                    DM.EMSNDXNM = P.EMSNDXNM,
                    DM.REMARK = P.REMARK,
                    DM.RESCERTNO = P.RESCERTNO,
                    DM.IMGINOUT = P.IMGINOUT,
                    DM.PERMITCD = P.PERMITCD,
                    DM.PERMITDTE = P.PERMITDTE,
                    DM.CONV_SEQNO = P.CONV_SEQNO,
                    DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                    DM.DEPT_SEQNO = P.DEPT_SEQNO,
                    DM.COUNT_SEQNO = P.COUNT_SEQNO,
                    DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                    DM.FLIGHTNUMBER = P.FLIGHTNUMBER,
                    DM.FLIGHTPREFIX = P.FLIGHTPREFIX,
                    DM.TMDEPT_SEQNO = P.TMDEPT_SEQNO,
                    DM.DATEOFDEATH = P.DATEOFDEATH,
                    DM.REASONOFDEATH = P.REASONOFDEATH,
                    DM.CERTIFICATEOFDEATH = P.CERTIFICATEOFDEATH,
                    DM.OFFICEOFREGIS = P.OFFICEOFREGIS,
                    DM.INFORMOFDEATH = P.INFORMOFDEATH,
                    DM.INFORMOFID13 = P.INFORMOFID13,
                    DM.INFORMOFRELATION = P.INFORMOFRELATION,
                    DM.INFORMPV_SEQNO = P.INFORMPV_SEQNO,
                    DM.FORMBASE = P.FORMBASE,
                    DM.PV_SEQNO = P.PV_SEQNO,
                    DM.TYPEENQ = P.TYPEENQ
    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.TMINFDEADSEQNO,
                DM.TMRUNNO,
                DM.TM6NO,
                DM.INOUTDTE,
                DM.CARDTYPE,
                DM.TFIRSTNM,
                DM.TMIDDLENM,
                DM.TFAMILYNM,
                DM.EFIRSTNM,
                DM.EMIDDLENM,
                DM.EFAMILYNM,
                DM.SEX,
                DM.BIRTHDTE,
                DM.NATIONCD,
                DM.DEPTCD,
                DM.TRAVCD,
                DM.CONVCD,
                DM.CONVREGNO,
                DM.TDTCD,
                DM.TDTNO,
                DM.VISATYPECD,
                DM.VISAEXPDTE,
                DM.PASSPORTDTE,
                DM.PASSPORTEXPDTE,
                DM.INTYPE,
                DM.CHKPOINTNO,
                DM.CREUSR,
                DM.CREDTE,
                DM.CREDTERM,
                DM.UPDUSR,
                DM.UPDDTE,
                DM.UPDTERM,
                DM.PERSONID,
                DM.TFSNDXNM,
                DM.TLSNDXNM,
                DM.TMSNDXNM,
                DM.EFSNDXNM,
                DM.ELSNDXNM,
                DM.EMSNDXNM,
                DM.REMARK,
                DM.RESCERTNO,
                DM.IMGINOUT,
                DM.PERMITCD,
                DM.PERMITDTE,
                DM.CONV_SEQNO,
                DM.VISATYPE_SEQNO,
                DM.DEPT_SEQNO,
                DM.COUNT_SEQNO,
                DM.PERMIT_SEQNO,
                DM.FLIGHTNUMBER,
                DM.FLIGHTPREFIX,
                DM.TMDEPT_SEQNO,
                DM.DATEOFDEATH,
                DM.REASONOFDEATH,
                DM.CERTIFICATEOFDEATH,
                DM.OFFICEOFREGIS,
                DM.INFORMOFDEATH,
                DM.INFORMOFID13,
                DM.INFORMOFRELATION,
                DM.INFORMPV_SEQNO,
                DM.FORMBASE,
                DM.PV_SEQNO,
                DM.TYPEENQ) 
        VALUES (P.TMINFDEADSEQNO,
                P.TMRUNNO,
                P.TM6NO,
                P.INOUTDTE,
                P.CARDTYPE,
                P.TFIRSTNM,
                P.TMIDDLENM,
                P.TFAMILYNM,
                P.EFIRSTNM,
                P.EMIDDLENM,
                P.EFAMILYNM,
                P.SEX,
                P.BIRTHDTE,
                P.NATIONCD,
                P.DEPTCD,
                P.TRAVCD,
                P.CONVCD,
                P.CONVREGNO,
                P.TDTCD,
                P.TDTNO,
                P.VISATYPECD,
                P.VISAEXPDTE,
                P.PASSPORTDTE,
                P.PASSPORTEXPDTE,
                P.INTYPE,
                P.CHKPOINTNO,
                P.CREUSR,
                P.CREDTE,
                P.CREDTERM,
                P.UPDUSR,
                P.UPDDTE,
                P.UPDTERM,
                P.PERSONID,
                P.TFSNDXNM,
                P.TLSNDXNM,
                P.TMSNDXNM,
                P.EFSNDXNM,
                P.ELSNDXNM,
                P.EMSNDXNM,
                P.REMARK,
                P.RESCERTNO,
                P.IMGINOUT,
                P.PERMITCD,
                P.PERMITDTE,
                P.CONV_SEQNO,
                P.VISATYPE_SEQNO,
                P.DEPT_SEQNO,
                P.COUNT_SEQNO,
                P.PERMIT_SEQNO,
                P.FLIGHTNUMBER,
                P.FLIGHTPREFIX,
                P.TMDEPT_SEQNO,
                P.DATEOFDEATH,
                P.REASONOFDEATH,
                P.CERTIFICATEOFDEATH,
                P.OFFICEOFREGIS,
                P.INFORMOFDEATH,
                P.INFORMOFID13,
                P.INFORMOFRELATION,
                P.INFORMPV_SEQNO,
                P.FORMBASE,
                P.PV_SEQNO,
                P.TYPEENQ);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('TMINFORMDEAD_C_M', var_rows, SYSDATE);

 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL VALUES ('TMINFORMDEAD_C_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);
 COMMIT;
 
 vstdate :=sysdate;
    
   
   MERGE INTO PIBICSDM2.TMINFORMDEAD DM
        USING (SELECT * 
                    FROM PIBICS.TMINFORMDEAD@PIBICS_PROD
                    WHERE UPDDTE >= TO_DATE(v_dstart,'yyyymmdd') 
                        AND UPDDTE < TO_DATE(v_dend,'yyyymmdd')) P
        ON (DM.TMINFDEADSEQNO = P.TMINFDEADSEQNO)
    WHEN MATCHED 
    THEN 
        UPDATE SET DM.TMRUNNO = P.TMRUNNO,
                    DM.TM6NO = P.TM6NO,
                    DM.INOUTDTE = P.INOUTDTE,
                    DM.CARDTYPE = P.CARDTYPE,
                    DM.TFIRSTNM = P.TFIRSTNM,
                    DM.TMIDDLENM = P.TMIDDLENM,
                    DM.TFAMILYNM = P.TFAMILYNM,
                    DM.EFIRSTNM = P.EFIRSTNM,
                    DM.EMIDDLENM = P.EMIDDLENM,
                    DM.EFAMILYNM = P.EFAMILYNM,
                    DM.SEX = P.SEX,
                    DM.BIRTHDTE = P.BIRTHDTE,
                    DM.NATIONCD = P.NATIONCD,
                    DM.DEPTCD = P.DEPTCD,
                    DM.TRAVCD = P.TRAVCD,
                    DM.CONVCD = P.CONVCD,
                    DM.CONVREGNO = P.CONVREGNO,
                    DM.TDTCD = P.TDTCD,
                    DM.TDTNO = P.TDTNO,
                    DM.VISATYPECD = P.VISATYPECD,
                    DM.VISAEXPDTE = P.VISAEXPDTE,
                    DM.PASSPORTDTE = P.PASSPORTDTE,
                    DM.PASSPORTEXPDTE = P.PASSPORTEXPDTE,
                    DM.INTYPE = P.INTYPE,
                    DM.CHKPOINTNO = P.CHKPOINTNO,
                    DM.CREUSR = P.CREUSR,
                    DM.CREDTE = P.CREDTE,
                    DM.CREDTERM = P.CREDTERM,
                    DM.UPDUSR = P.UPDUSR,
                    DM.UPDDTE = P.UPDDTE,
                    DM.UPDTERM = P.UPDTERM,
                    DM.PERSONID = P.PERSONID,
                    DM.TFSNDXNM = P.TFSNDXNM,
                    DM.TLSNDXNM = P.TLSNDXNM,
                    DM.TMSNDXNM = P.TMSNDXNM,
                    DM.EFSNDXNM = P.EFSNDXNM,
                    DM.ELSNDXNM = P.ELSNDXNM,
                    DM.EMSNDXNM = P.EMSNDXNM,
                    DM.REMARK = P.REMARK,
                    DM.RESCERTNO = P.RESCERTNO,
                    DM.IMGINOUT = P.IMGINOUT,
                    DM.PERMITCD = P.PERMITCD,
                    DM.PERMITDTE = P.PERMITDTE,
                    DM.CONV_SEQNO = P.CONV_SEQNO,
                    DM.VISATYPE_SEQNO = P.VISATYPE_SEQNO,
                    DM.DEPT_SEQNO = P.DEPT_SEQNO,
                    DM.COUNT_SEQNO = P.COUNT_SEQNO,
                    DM.PERMIT_SEQNO = P.PERMIT_SEQNO,
                    DM.FLIGHTNUMBER = P.FLIGHTNUMBER,
                    DM.FLIGHTPREFIX = P.FLIGHTPREFIX,
                    DM.TMDEPT_SEQNO = P.TMDEPT_SEQNO,
                    DM.DATEOFDEATH = P.DATEOFDEATH,
                    DM.REASONOFDEATH = P.REASONOFDEATH,
                    DM.CERTIFICATEOFDEATH = P.CERTIFICATEOFDEATH,
                    DM.OFFICEOFREGIS = P.OFFICEOFREGIS,
                    DM.INFORMOFDEATH = P.INFORMOFDEATH,
                    DM.INFORMOFID13 = P.INFORMOFID13,
                    DM.INFORMOFRELATION = P.INFORMOFRELATION,
                    DM.INFORMPV_SEQNO = P.INFORMPV_SEQNO,
                    DM.FORMBASE = P.FORMBASE,
                    DM.PV_SEQNO = P.PV_SEQNO,
                    DM.TYPEENQ = P.TYPEENQ
    WHEN NOT MATCHED 
    THEN 
        INSERT (DM.TMINFDEADSEQNO,
                DM.TMRUNNO,
                DM.TM6NO,
                DM.INOUTDTE,
                DM.CARDTYPE,
                DM.TFIRSTNM,
                DM.TMIDDLENM,
                DM.TFAMILYNM,
                DM.EFIRSTNM,
                DM.EMIDDLENM,
                DM.EFAMILYNM,
                DM.SEX,
                DM.BIRTHDTE,
                DM.NATIONCD,
                DM.DEPTCD,
                DM.TRAVCD,
                DM.CONVCD,
                DM.CONVREGNO,
                DM.TDTCD,
                DM.TDTNO,
                DM.VISATYPECD,
                DM.VISAEXPDTE,
                DM.PASSPORTDTE,
                DM.PASSPORTEXPDTE,
                DM.INTYPE,
                DM.CHKPOINTNO,
                DM.CREUSR,
                DM.CREDTE,
                DM.CREDTERM,
                DM.UPDUSR,
                DM.UPDDTE,
                DM.UPDTERM,
                DM.PERSONID,
                DM.TFSNDXNM,
                DM.TLSNDXNM,
                DM.TMSNDXNM,
                DM.EFSNDXNM,
                DM.ELSNDXNM,
                DM.EMSNDXNM,
                DM.REMARK,
                DM.RESCERTNO,
                DM.IMGINOUT,
                DM.PERMITCD,
                DM.PERMITDTE,
                DM.CONV_SEQNO,
                DM.VISATYPE_SEQNO,
                DM.DEPT_SEQNO,
                DM.COUNT_SEQNO,
                DM.PERMIT_SEQNO,
                DM.FLIGHTNUMBER,
                DM.FLIGHTPREFIX,
                DM.TMDEPT_SEQNO,
                DM.DATEOFDEATH,
                DM.REASONOFDEATH,
                DM.CERTIFICATEOFDEATH,
                DM.OFFICEOFREGIS,
                DM.INFORMOFDEATH,
                DM.INFORMOFID13,
                DM.INFORMOFRELATION,
                DM.INFORMPV_SEQNO,
                DM.FORMBASE,
                DM.PV_SEQNO,
                DM.TYPEENQ) 
        VALUES (P.TMINFDEADSEQNO,
                P.TMRUNNO,
                P.TM6NO,
                P.INOUTDTE,
                P.CARDTYPE,
                P.TFIRSTNM,
                P.TMIDDLENM,
                P.TFAMILYNM,
                P.EFIRSTNM,
                P.EMIDDLENM,
                P.EFAMILYNM,
                P.SEX,
                P.BIRTHDTE,
                P.NATIONCD,
                P.DEPTCD,
                P.TRAVCD,
                P.CONVCD,
                P.CONVREGNO,
                P.TDTCD,
                P.TDTNO,
                P.VISATYPECD,
                P.VISAEXPDTE,
                P.PASSPORTDTE,
                P.PASSPORTEXPDTE,
                P.INTYPE,
                P.CHKPOINTNO,
                P.CREUSR,
                P.CREDTE,
                P.CREDTERM,
                P.UPDUSR,
                P.UPDDTE,
                P.UPDTERM,
                P.PERSONID,
                P.TFSNDXNM,
                P.TLSNDXNM,
                P.TMSNDXNM,
                P.EFSNDXNM,
                P.ELSNDXNM,
                P.EMSNDXNM,
                P.REMARK,
                P.RESCERTNO,
                P.IMGINOUT,
                P.PERMITCD,
                P.PERMITDTE,
                P.CONV_SEQNO,
                P.VISATYPE_SEQNO,
                P.DEPT_SEQNO,
                P.COUNT_SEQNO,
                P.PERMIT_SEQNO,
                P.FLIGHTNUMBER,
                P.FLIGHTPREFIX,
                P.TMDEPT_SEQNO,
                P.DATEOFDEATH,
                P.REASONOFDEATH,
                P.CERTIFICATEOFDEATH,
                P.OFFICEOFREGIS,
                P.INFORMOFDEATH,
                P.INFORMOFID13,
                P.INFORMOFRELATION,
                P.INFORMPV_SEQNO,
                P.FORMBASE,
                P.PV_SEQNO,
                P.TYPEENQ);



   var_rows := SQL%ROWCOUNT;

   INSERT INTO IMPORT_LOG
        VALUES ('TMINFORMDEAD_U_M', var_rows, SYSDATE);

  veddate :=sysdate;
  INSERT INTO IMPORT_LOG_DETAIL VALUES ('TMINFORMDEAD_U_M', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);
  COMMIT;

   
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      NULL;
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END P_TMINFORMDEAD_M;
/
