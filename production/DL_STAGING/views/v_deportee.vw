CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_DEPORTEE" ("DPT_SEQNO", "DPTNO", "DPTDTE", "DPTUSRID", "DOCID", "DOCNO", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "BIRTHDTE", "NATIONCD", "ISSDTE", "ISSPLACE", "EXPDTE", "DEPTDPT_SEQNO", "DEPTFWDNOTE", "REASONDPT_SEQNO", "DPTREASONNOTE", "DEPTPER", "DEPTDOCNO", "DEPTDOCDTE", "BEHAVIOR", "METHOD", "ACTFLAG", "INDTE", "CONVREGNO", "COUNTCD", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "DEPT_SEQNO", "SECTION_SEQNO", "TM6NO", "CONV_SEQNO", "TFAMILYNM", "TFIRSTNM", "TMIDDLENM", "INOUT_SEQNO", "VISATYPECD", "VISATYPE_SEQNO", "VISAEXPDTE", "PERMIT_SEQNO", "PERMITDTE") AS 
  SELECT 
    dpt_seqno
    , dptno
    , dptdte
    , dptusrid
    , docid
    , docno
    , efirstnm
    , emiddlenm
    , efamilynm
    , sex
    , birthdte
    , nationcd
    , issdte
    , issplace
    , expdte
    , deptdpt_seqno
    , deptfwdnote
    , reasondpt_seqno
    , dptreasonnote
    , deptper
    , deptdocno
    , deptdocdte
    , behavior
    , method
    , actflag
    , indte
    , convregno
    , countcd
    , create_by
    , create_date
    , update_by
    , update_date
    , version
    , dept_seqno
    , section_seqno
    , tm6no
    , conv_seqno
    , tfamilynm
    , tfirstnm
    , tmiddlenm
    , inout_seqno
    , visatypecd
    , visatype_seqno
    , visaexpdte
    , permit_seqno
    , permitdte
FROM pibicsdm2.deportee;
  GRANT SELECT ON "DL_STAGING"."V_DEPORTEE" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_DEPORTEE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_DEPORTEE" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_DEPORTEE" TO "BIOSAADM";
