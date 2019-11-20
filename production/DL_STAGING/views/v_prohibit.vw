CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_PROHIBIT" ("PHB_SEQNO", "PHBNO", "PHBDTE", "PHBUSRID", "DOCID", "DOCNO", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "BIRTHDTE", "NATIONCD", "ISSDTE", "ISSPLACE", "EXPDTE", "DEPTDPT_SEQNO", "DEPTFWDNOTE", "ANU_SEQNO", "ANUNOTE", "DEPTPER", "DEPTDOCNO", "DEPTDOCDTE", "BEHAVIOR", "METHOD", "ACTFLAG", "IODTE", "CONVREGNO", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "DEPT_SEQNO", "TM6NO", "CONV_SEQNO", "DETENRECORD_IDCNO", "TMINOUT_SEQNO", "CHECKIO") AS 
  SELECT 
    phb_seqno
    , phbno
    , phbdte
    , phbusrid
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
    , anu_seqno
    , anunote
    , deptper
    , deptdocno
    , deptdocdte
    , behavior
    , method
    , actflag
    , iodte
    , convregno
    , create_by
    , create_date
    , update_by
    , update_date
    , version
    , dept_seqno
    , tm6no
    , conv_seqno
    , detenrecord_idcno
    , tminout_seqno
    , checkio
FROM pibicsdm2.prohibit;
  GRANT SELECT ON "DL_STAGING"."V_PROHIBIT" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_PROHIBIT" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_PROHIBIT" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_PROHIBIT" TO "BIOSAADM";
