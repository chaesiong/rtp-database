CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_EXT_EXTENSIONLIST" ("EXTLIST_SEQNO", "EXT_SEQNO", "EXTPERSON_SEQNO", "DOC_NO", "REASON_SEQNO", "EXT_DAY", "PASSPORTNO", "EXT_DATE", "TM6NO", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "BIRTH_DATE", "BIRTH_PLACE", "NATION_SEQNO", "PASSPORT_PLACE", "PASSPORT_DATE", "PASSPORT_EXPDATE", "IN_DATE", "CONV_SEQNO", "CONVREGNO", "FROMCOUNT_SEQNO", "DEPT_SEQNO", "VISATYPE_SEQNO", "VISA_EXPDATE", "BUILDING", "ADDR", "ROAD", "PV_SEQNO", "AMP_SEQNO", "TMB_SEQNO", "POSTCODE", "TEL", "PERSON_STS", "ACTFLAG", "FINE_SEQNO1", "FINE_SEQNO2", "FINE_SEQNO3", "FINE_SEQNO4", "FEESLIP_SEQNO", "APPROVE_STS", "COMMAND_SEQNO", "COMMAND_OTH", "PERMIT_DATE", "APPROVE_REM", "WAITCOMMENT_SEQNO", "WAITCOMMENT_OTH", "WAIT_DATE", "NO_DATE", "NO_REM", "UDEPT_SEQNO", "CPASSPORTNO", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "SUFFIX_SEQNO", "COUNT_SEQNO", "OCC_SEQNO", "PASSPORT_PIC", "VISA_DATE", "OLD_PERMIT_DATE", "COM_SEQNO", "FACTTYPE", "RELATIONSHIP", "REASON_VISA", "REF_PERSON", "REF_TEL", "REMARK_BL", "FINE_NUMBER1", "FINE_NUMBER2", "FINE_NUMBER3", "FINE_NUMBER4", "FINE_NUMBER5", "FINE_DAY1", "FINE_DAY2", "FINE_DAY3", "FINE_DAY4", "FINE_DAY5", "FINE_REMARK1", "FINE_REMARK2", "FINE_REMARK3", "FINE_REMARK4", "FINE_REMARK5", "FINE_STS1", "FINE_STS2", "FINE_STS3", "FINE_STS4", "FINE_STS5", "FLAGSYSTEM", "EXTPERSONQ_SEQNO", "IPADDRESS", "UIPADDRESS", "VISATYPESUB_SEQNO", "FEE_STS", "FINE_DATE1", "FINE_DATE2", "NOTROLE_REM", "CANCEL_REM", "PROVE_BY", "PROVE_ID", "T_IDICONCEPT", "REMARK", "ITEMNO", "FLAG_QUEONLINE", "STATUS_OFFLINE") AS 
  SELECT 
EXTLIST_SEQNO, EXT_SEQNO, EXTPERSON_SEQNO, DOC_NO, REASON_SEQNO, EXT_DAY, PASSPORTNO, EXT_DATE, TM6NO, EFIRSTNM, EMIDDLENM, EFAMILYNM, SEX, BIRTH_DATE, BIRTH_PLACE, NATION_SEQNO, PASSPORT_PLACE, PASSPORT_DATE, PASSPORT_EXPDATE, IN_DATE, CONV_SEQNO, CONVREGNO, FROMCOUNT_SEQNO, DEPT_SEQNO, VISATYPE_SEQNO, VISA_EXPDATE, BUILDING, ADDR, ROAD, PV_SEQNO, AMP_SEQNO, TMB_SEQNO, POSTCODE, TEL, PERSON_STS, ACTFLAG, FINE_SEQNO1, FINE_SEQNO2, FINE_SEQNO3, FINE_SEQNO4, FEESLIP_SEQNO, APPROVE_STS, COMMAND_SEQNO, COMMAND_OTH, PERMIT_DATE, APPROVE_REM, WAITCOMMENT_SEQNO, WAITCOMMENT_OTH, WAIT_DATE, NO_DATE, NO_REM, UDEPT_SEQNO, CPASSPORTNO, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, VERSION, SUFFIX_SEQNO, COUNT_SEQNO, OCC_SEQNO, PASSPORT_PIC, VISA_DATE, OLD_PERMIT_DATE, COM_SEQNO, FACTTYPE, RELATIONSHIP, REASON_VISA, REF_PERSON, REF_TEL, REMARK_BL, FINE_NUMBER1, FINE_NUMBER2, FINE_NUMBER3, FINE_NUMBER4, FINE_NUMBER5, FINE_DAY1, FINE_DAY2, FINE_DAY3, FINE_DAY4, FINE_DAY5, FINE_REMARK1, FINE_REMARK2, FINE_REMARK3, FINE_REMARK4, FINE_REMARK5, FINE_STS1, FINE_STS2, FINE_STS3, FINE_STS4, FINE_STS5, FLAGSYSTEM, EXTPERSONQ_SEQNO, IPADDRESS, UIPADDRESS, VISATYPESUB_SEQNO, FEE_STS, FINE_DATE1, FINE_DATE2, NOTROLE_REM, CANCEL_REM, PROVE_BY, PROVE_ID, T_IDICONCEPT, REMARK, ITEMNO, FLAG_QUEONLINE, STATUS_OFFLINE
FROM pibicsdm2.EXT_EXTENSIONLIST;
  GRANT SELECT ON "DL_STAGING"."V_EXT_EXTENSIONLIST" TO "DL_BORDERCONTROL";