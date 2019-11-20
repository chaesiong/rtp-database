CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_LOSTPASSPORT_PROD" ("LPPCD", "NATIONCD", "PASSPORTNO", "CITIZENID", "TFIRSTNM", "TFAMILYNM", "EFIRSTNM", "EFAMILYNM", "BIRTHDATE", "SEX", "ISUPASSPORTDTE", "ISUPASSPORTPLACE", "PASSPORTEXPDTE", "PASSPORTTYPE", "LOSTPASSPORTDTE", "LOSTPASSPORTPLACE", "TMIDDLENM", "EMIDDLENM", "REMARK", "CREUSR", "CREDTE", "UPDUSR", "UPDDTE", "NEWPASSPORTNO", "NEWPASSPORTTYPE", "NEWISUPASSPORTDTE", "NEWISUPASSPORTPLACE", "NEWPASSPORTEXPDTE", "INFORMPASSPORTDTE", "OWNERAGE", "AGCPHONE", "EMGCONT", "DOCREF", "SECLEV", "REASONCD", "AGCCONT", "OPERREF", "TDCD", "LPPERSON", "POLISSTATION", "VISATYPE_SEQNO", "VISAEXPDTE", "TDT_SEQNO", "DEPT_SEQNO", "PID", "ORG_CODE") AS 
  SELECT 
        lppcd,
        nationcd,
        passportno,
        citizenid,
        tfirstnm,
        tfamilynm,
        efirstnm,
        efamilynm,
        birthdate,
        sex,
        isupassportdte,
        isupassportplace,
        passportexpdte,
        passporttype,
        lostpassportdte,
        lostpassportplace,
        tmiddlenm,
        emiddlenm,
        remark,
        creusr,
        credte,
        updusr,
        upddte,
        newpassportno,
        newpassporttype,
        newisupassportdte,
        newisupassportplace,
        newpassportexpdte,
        informpassportdte,
        ownerage,
        agcphone,
        emgcont,
        docref,
        seclev,
        reasoncd,
        agccont,
        operref,
        tdcd,
        lpperson,
        polisstation,
        visatype_seqno,
        visaexpdte,
        tdt_seqno,
        dept_seqno,
        pid,
        org_code
    FROM pibics.lostpassport@pibics_prod;
  GRANT SELECT ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."V_LOSTPASSPORT_PROD" TO "BIOSAADM";
