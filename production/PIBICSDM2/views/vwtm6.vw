CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWTM6" ("TM6_SEQNO", "DEPT_SEQNO", "CONV_SEQNO", "IODTE", "CONVREGNO", "VISANO", "TM6NO", "ELASTNM", "EFIRSTNM", "EMIDDLENM", "NATION_SEQNO", "SEX", "PASSPORTNO", "BIRTHDTE", "BUILDING", "ADDR", "TEL", "CARDTYPE", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "IMGTM6", "SINCE_TIME", "VISATYPE_SEQNO", "REMARK", "DEPTNAME", "DEPTFULLNM", "CONVNAME", "NATIONNAME", "FULLNAME", "CARDTYPENAME", "INOUTDATE", "FLAGTM6", "TO_TIME") AS 
  SELECT   a."TM6_SEQNO",
            a."DEPT_SEQNO",
            a."CONV_SEQNO",
            a."IODTE",
            a."CONVREGNO",
            a."VISANO",
            a."TM6NO",
            a."ELASTNM",
            a."EFIRSTNM",
            a."EMIDDLENM",
            a."NATION_SEQNO",
            a."SEX",
            a."PASSPORTNO",
            a."BIRTHDTE",
            a."BUILDING",
            a."ADDR",
            a."TEL",
            a."CARDTYPE",
            a."CREATE_BY",
            a."CREATE_DATE",
            a."UPDATE_BY",
            a."UPDATE_DATE",
            a."VERSION",
            a."IMGTM6",
            a."SINCE_TIME",
            a."VISATYPE_SEQNO",
            a."REMARK",
            get_DeptName (dept_seqno, 'T') deptName,
            get_DeptNm3Level (dept_seqno, 'T') deptfullnm,
            get_ConveyancesSeqno (conv_seqno, 'T') convName,
            get_NationsBySeq (nation_seqno, 'T') nationname,
            (efirstnm || ' ' || emiddlenm || ' ' || elastnm) fullName,
            DECODE (cardtype, '1', 'เข้า', 'ออก') cardtypename,
            TO_CHAR (iodte, 'dd/mm/yyyy') inoutdate,
            flagtm6,
            a."TO_TIME"
     FROM   tm6 a ;
  GRANT SELECT ON "PIBICSDM2"."VWTM6" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWTM6" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWTM6" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWTM6" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWTM6" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWTM6" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWTM6" TO "BIOSAADM";
