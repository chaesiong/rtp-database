CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" ("SEQNO", "TM6NO", "INOUTDTE", "CARDTYPE", "TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "BIRTHDTE", "NATIONCD", "DEPTCD", "TRAVCD", "CONVCD", "CONVREGNO", "TDTCD", "TDTNO", "VISATYPECD", "VISAEXPDTE", "PASSPORTDTE", "PASSPORTISU", "PASSPORTEXPDTE", "TARGETNO", "INTYPE", "CHKPOINTNO", "CREUSR", "CREDTE", "CREDTERM", "UPDUSR", "UPDDTE", "UPDTERM", "ISPROCESS", "PERSONID", "TFSNDXNM", "TLSNDXNM", "TMSNDXNM", "EFSNDXNM", "ELSNDXNM", "EMSNDXNM", "REMARK", "RESCERTNO", "PM_RE_ENTRY", "PM_REEXPDTE", "PM_EXTENSION", "PM_EXEXPDTE", "PM_NON_QUOTA", "PM_NONEXPDTE", "STATUS", "TM5_SEQNO", "TM2INOUT_SEQNO", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "RPJSEQNO", "PERMITCD", "NEWPERMIT", "CONV_SEQNO", "VISATYPE_SEQNO", "DEPT_SEQNO", "COUNT_SEQNO", "PERMIT_SEQNO", "CITIZENID", "PASS_SEQNO", "FLIGHTPREFIX", "FLIGHTNUMBER", "TYPEDATA", "DEPTCDORG", "FLAGJOINPASS", "FLAGFINES", "RESCERTTYPE", "RESPVCD", "RESNOYEAR", "PV_SEQNO", "PD_SEQNO", "ZONE_SEQNO", "SHIFT_SEQNO", "FLAGMATCH") AS 
  SELECT
	seqno
	, tm6no
	, inoutdte
	, cardtype
	, tfirstnm
	, tmiddlenm
	, tfamilynm
	, efirstnm
	, emiddlenm
	, efamilynm
	, sex
	, birthdte
	, nationcd
	, deptcd
	, travcd
	, convcd
	, convregno
	, tdtcd
	, tdtno
	, visatypecd
	, visaexpdte
	, passportdte
	, passportisu
	, passportexpdte
	, targetno
	, intype
	, chkpointno
	, creusr
	, credte
	, credterm
	, updusr
	, upddte
	, updterm
	, isprocess
	, personid
	, tfsndxnm
	, tlsndxnm
	, tmsndxnm
	, efsndxnm
	, elsndxnm
	, emsndxnm
	, remark
	, rescertno
	, pm_re_entry
	, pm_reexpdte
	, pm_extension
	, pm_exexpdte
	, pm_non_quota
	, pm_nonexpdte
	, status
	, tm5_seqno
	, tm2inout_seqno
	, create_by
	, create_date
	, update_by
	, update_date
	, version
	, rpjseqno
	, permitcd
	, newpermit
	, conv_seqno
	, visatype_seqno
	, dept_seqno
	, count_seqno
	, permit_seqno
	, citizenid
	, pass_seqno
	, flightprefix
	, flightnumber
	, typedata
	, deptcdorg
	, flagjoinpass
	, flagfines
	, rescerttype
	, respvcd
	, resnoyear
	, pv_seqno
	, pd_seqno
	, zone_seqno
	, shift_seqno
	, flagmatch
FROM pibicsdm2.tminout_ma_1hr_prod;
  GRANT SELECT ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_TMINOUT_MA_1HR_PROD" TO "BIOSAADM";
