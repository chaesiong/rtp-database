CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_RQS_PERSON" ("RQSPERSON_SEQNO", "TM9AND14_SEQNO", "OPASSPORTNO", "CPASSPORTNO", "APPLY_DATE", "DOCNO", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "BIRTH_DATE", "BIRTH_PLACE", "NATION_SEQNO", "OPASSPORT_PLACE", "OPASSPORT_DATE", "OPASSPORT_EXPDATE", "CPASSPORT_PLACE", "CPASSPORT_EXPDATE", "CPASSPORT_DATE", "DEPT_SEQNO", "VISATYPE_SEQNO", "VISA_EXPDATE", "APPRVSTS", "PERMIT_DATE", "PERSON_STS", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "TM_FLAG", "TFIRSTNM", "TFAMILYNM", "TMIDDLENM", "STATUSRQS", "STATUSRQSDTE") AS 
  SELECT 
"RQSPERSON_SEQNO","TM9AND14_SEQNO","OPASSPORTNO","CPASSPORTNO","APPLY_DATE","DOCNO","EFIRSTNM","EMIDDLENM","EFAMILYNM","SEX","BIRTH_DATE","BIRTH_PLACE","NATION_SEQNO","OPASSPORT_PLACE","OPASSPORT_DATE","OPASSPORT_EXPDATE","CPASSPORT_PLACE","CPASSPORT_EXPDATE","CPASSPORT_DATE","DEPT_SEQNO","VISATYPE_SEQNO","VISA_EXPDATE","APPRVSTS","PERMIT_DATE","PERSON_STS","CREATE_BY","CREATE_DATE","UPDATE_BY","UPDATE_DATE","VERSION","TM_FLAG","TFIRSTNM","TFAMILYNM","TMIDDLENM","STATUSRQS","STATUSRQSDTE"
FROM pibicsdm2.RQS_PERSON;
  GRANT SELECT ON "DL_STAGING"."V_RQS_PERSON" TO "DL_BORDERCONTROL";