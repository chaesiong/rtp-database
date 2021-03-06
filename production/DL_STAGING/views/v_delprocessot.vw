CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_DELPROCESSOT" ("DELEXTOVS_SEQNO", "EXTOVS_SEQNO", "EXTPERSON_SEQNO", "OPASSPORTNO", "CPASSPORTNO", "EXT_DATE", "DOCNO", "TM6NO", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "BIRTH_DATE", "BIRTH_PLACE", "NATION_SEQNO", "OPASSPORT_PLACE", "OPASSPORT_DATE", "OPASSPORT_EXPDATE", "CPASSPORT_PLACE", "CPASSPORT_EXPDATE", "CPASSPORT_DATE", "IN_DATE", "CONV_SEQNO", "CONVREGNO", "FROMCOUNT", "DEPT_SEQNO", "VISATYPE_SEQNO", "VISA_EXPDATE", "BUILDING", "ADDR", "ROAD", "PV_SEQNO", "AMP_SEQNO", "TMB_SEQNO", "POSTCODE", "TEL", "REASON_SEQNO", "REASON_DAY", "APPROVE_STS", "PERMIT_DATE", "PERSON_STS", "EXT_SEQNO", "FEESLIP_SEQNO", "SEQNO", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "UDEPT_SEQNO", "STATUSEXT", "STATUSEXTDTE", "RQS_STS", "VISATYPESUB_SEQNO", "SUFFIX_SEQNO", "EXTOVS_DATE", "CHNGPERSON_SEQNO", "CHNGPERMITDTE", "CHNGFLAG", "RQSPERSON_SEQNO", "RQSPERMITDTE", "RQSFLAG", "PROCESSDTE", "PROCESSDELDTE", "FLAGDEL", "EXTFLAG", "TYPEDATA", "UDEPT_ORG", "YEAROFDOB", "SEXDESC", "DEPTLEVEL2", "DEPTLEVEL1", "DELUSER") AS 
  SELECT 
"DELEXTOVS_SEQNO","EXTOVS_SEQNO","EXTPERSON_SEQNO","OPASSPORTNO","CPASSPORTNO","EXT_DATE","DOCNO","TM6NO","EFIRSTNM","EMIDDLENM","EFAMILYNM","SEX","BIRTH_DATE","BIRTH_PLACE","NATION_SEQNO","OPASSPORT_PLACE","OPASSPORT_DATE","OPASSPORT_EXPDATE","CPASSPORT_PLACE","CPASSPORT_EXPDATE","CPASSPORT_DATE","IN_DATE","CONV_SEQNO","CONVREGNO","FROMCOUNT","DEPT_SEQNO","VISATYPE_SEQNO","VISA_EXPDATE","BUILDING","ADDR","ROAD","PV_SEQNO","AMP_SEQNO","TMB_SEQNO","POSTCODE","TEL","REASON_SEQNO","REASON_DAY","APPROVE_STS","PERMIT_DATE","PERSON_STS","EXT_SEQNO","FEESLIP_SEQNO","SEQNO","CREATE_BY","CREATE_DATE","UPDATE_BY","UPDATE_DATE","VERSION","UDEPT_SEQNO","STATUSEXT","STATUSEXTDTE","RQS_STS","VISATYPESUB_SEQNO","SUFFIX_SEQNO","EXTOVS_DATE","CHNGPERSON_SEQNO","CHNGPERMITDTE","CHNGFLAG","RQSPERSON_SEQNO","RQSPERMITDTE","RQSFLAG","PROCESSDTE","PROCESSDELDTE","FLAGDEL","EXTFLAG","TYPEDATA","UDEPT_ORG","YEAROFDOB","SEXDESC","DEPTLEVEL2","DEPTLEVEL1","DELUSER"
FROM pibicsdm2.DELPROCESSOT;
  GRANT SELECT ON "DL_STAGING"."V_DELPROCESSOT" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_DELPROCESSOT" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING"."V_DELPROCESSOT" TO "BIO_BD";
  GRANT SELECT ON "DL_STAGING"."V_DELPROCESSOT" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_DELPROCESSOT" TO "BIOSAADM";
