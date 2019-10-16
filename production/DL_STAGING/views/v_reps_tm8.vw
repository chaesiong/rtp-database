CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_REPS_TM8" ("TM8_SEQNO", "TM8NO", "YEAR", "FEES_SEQNO", "WRITTEN", "PERSONID", "FAMILYNM", "FIRSTNM", "MIDDLENM", "NATIONAL_SEQNO", "BIRTH_DATE", "SEX", "AGE", "OCC_SEQNO", "BIRTH_PLACE", "BIRTHCOUNT_SEQNO", "PASSPORTNO", "PASSPORT_DATE", "PASSPORTEXP_DATE", "PASSPORTISSUEBY", "CHILDNO", "ADDR", "ROAD", "TMB_SEQNO", "AMP_SEQNO", "PV_SEQNO", "VISANO", "TDT_SEQNO", "VISAISSUE", "VISA_DATE", "OPERMIT_SEQNO", "ARRIVE_DATE", "OPERMIT_DATE", "DOCTYPE", "PURPOSECOUNT_SEQNO", "CONV_SEQNO", "LEAVE_DATE", "RETURN_DATE", "PURPOSE", "APPVSTS", "DOC_DATE", "DEPT_SEQNO", "PERMIT_STATUS", "NEWPERMIT_DATE", "REASON_SEQNO", "REASONDESC", "TM6_SEQNO", "ENDPERMIT_DATE", "CREATE_DATE", "CREATE_BY", "UPDATE_DATE", "UPDATE_BY", "VERSION", "OVISATYPE_SEQNO", "TODAY_DATE", "TM6NO", "APPVSTSBYDATE", "APPVSTSBYDEPT_SEQNO", "FLAG_BOI", "IPADDRESS", "UIPADDRESS", "T_IDICONCEPT", "ZONE_SEQNO", "SUFFIX_SEQNO", "EXTLIST_SEQNO", "MANUALTM8", "REPSPERSON_SEQNO", "TELEPHONE", "FLAG_QUEONLINE", "PD_SEQNO") AS 
  SELECT 
TM8_SEQNO, TM8NO, YEAR, FEES_SEQNO, WRITTEN, PERSONID, FAMILYNM, FIRSTNM, MIDDLENM, NATIONAL_SEQNO, BIRTH_DATE, SEX, AGE, OCC_SEQNO, BIRTH_PLACE, BIRTHCOUNT_SEQNO, PASSPORTNO, PASSPORT_DATE, PASSPORTEXP_DATE, PASSPORTISSUEBY, CHILDNO, ADDR, ROAD, TMB_SEQNO, AMP_SEQNO, PV_SEQNO, VISANO, TDT_SEQNO, VISAISSUE, VISA_DATE, OPERMIT_SEQNO, ARRIVE_DATE, OPERMIT_DATE, DOCTYPE, PURPOSECOUNT_SEQNO, CONV_SEQNO, LEAVE_DATE, RETURN_DATE, PURPOSE, APPVSTS, DOC_DATE, DEPT_SEQNO, PERMIT_STATUS, NEWPERMIT_DATE, REASON_SEQNO, REASONDESC, TM6_SEQNO, ENDPERMIT_DATE, CREATE_DATE, CREATE_BY, UPDATE_DATE, UPDATE_BY, VERSION, OVISATYPE_SEQNO, TODAY_DATE, TM6NO, APPVSTSBYDATE, APPVSTSBYDEPT_SEQNO, FLAG_BOI, IPADDRESS, UIPADDRESS, T_IDICONCEPT, ZONE_SEQNO, SUFFIX_SEQNO, EXTLIST_SEQNO, MANUALTM8, REPSPERSON_SEQNO, TELEPHONE, FLAG_QUEONLINE, PD_SEQNO
FROM pibicsdm2.REPS_TM8;
  GRANT SELECT ON "DL_STAGING"."V_REPS_TM8" TO "DL_BORDERCONTROL";