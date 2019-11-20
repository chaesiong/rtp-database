CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" ("TMRUNNO", "PERSONID", "TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "NATIONCD", "INSEQNO", "INDTE", "INDEPTCD", "INTRAVCD", "INCONVCD", "INCONVREGNO", "INTDTCD", "INTDTNO", "INTM6NO", "INVISATYPECDORG", "INPERMITCD", "INPERMITDTE", "INPASSPORTDTE", "INPASSPORTISU", "INPASSPORTEXPDTE", "VISANO", "VISAISSUE", "VISADTE", "VISABYRIGHTS", "INCHKPOINTNO", "INCREUSR", "INCREDTE", "INCREDTERM", "INUPDUSR", "INUPDDTE", "INUPDTERM", "INPROCESSUSR", "INPROCESSDTE", "INPROCESSTERM", "XTNDEPTCD", "XTNADDRESS", "XTNTYPE", "INPUTXTNDEPTCD", "APPDTE", "OUTSEQNO", "OUTDTE", "OUTDEPTCD", "OUTTRAVCD", "OUTCONVCD", "OUTCONVREGNO", "OUTTDTCD", "OUTTDTNO", "OUTTM6NO", "OUTVISATYPECDORG", "OUTPERMITCD", "OUTPERMITDTE", "OUTPASSPORTDTE", "OUTPASSPORTISU", "OUTPASSPORTEXPDTE", "OUTCHKPOINTNO", "OUTCREUSR", "OUTCREDTE", "OUTCREDTERM", "OUTUPDUSR", "OUTUPDDTE", "OUTUPDTERM", "OUTPROCESSUSR", "OUTPROCESSDTE", "OUTPROCESSTERM", "MATCHPROCESSUSR", "MATCHPROCESSDTE", "MATCHPROCESSTERM", "TFSNDXNM", "TLSNDXNM", "TMSNDXNM", "EFSNDXNM", "ELSNDXNM", "EMSNDXNM", "BIRTHDTE", "INVISAEXPDTE", "OUTVISAEXPDTE", "ININTYPE", "OUTINTYPE", "INTARGETNO", "OUTTARGETNO", "INREMARK", "OUTREMARK", "FLAGMATCH", "INRESCERTNO", "OUTRESCERTNO", "EXTID", "INPM_RE_ENTRY", "INPM_REEXPDTE", "INPM_EXTENSION", "INPM_EXEXPDTE", "INPM_NON_QUOTA", "INPM_NONEXPDTE", "INSTATUS", "INTM5_SEQNO", "INTM2INOUT_SEQNO", "OUTPM_RE_ENTRY", "OUTPM_REEXPDTE", "OUTPM_EXTENSION", "OUTPM_EXEXPDTE", "OUTPM_NON_QUOTA", "OUTPM_NONEXPDTE", "OUTSTATUS", "OUTTM5_SEQNO", "OUTTM2INOUT_SEQNO", "INCONV_SEQNO", "INVISATYPE_SEQNO", "INDEPT_SEQNO", "COUNT_SEQNO", "INPERMIT_SEQNO", "OUTCONV_SEQNO", "OUTVISATYPE_SEQNO", "OUTDEPT_SEQNO", "OUTPERMIT_SEQNO", "INFLIGHTPREFIX", "INFLIGHTNUMBER", "OUTFLIGHTPREFIX", "OUTFLIGHTNUMBER", "CITIZENID", "PASS_SEQNO", "INRPJSEQNO", "OUTRPJSEQNO", "INDEPTCDORG", "OUTDEPTCDORG", "TYPEDATA", "FLAGJOINPASS", "FLAGFINES", "INVISATYPECD", "OUTVISATYPECD", "SEND_FLAG", "VISARUNDAY", "PV_SEQNO", "INPD_SEQNO", "INZONE_SEQNO", "OUTPD_SEQNO", "OUTZONE_SEQNO", "INSHIFT_SEQNO", "OUTSHIFT_SEQNO") AS 
  SELECT
	tmrunno
	, personid
	, tfirstnm
	, tmiddlenm
	, tfamilynm
	, efirstnm
	, emiddlenm
	, efamilynm
	, sex
	, nationcd
	, inseqno
	, indte
	, indeptcd
	, intravcd
	, inconvcd
	, inconvregno
	, intdtcd
	, intdtno
	, intm6no
	, invisatypecdorg
	, inpermitcd
	, inpermitdte
	, inpassportdte
	, inpassportisu
	, inpassportexpdte
	, visano
	, visaissue
	, visadte
	, visabyrights
	, inchkpointno
	, increusr
	, incredte
	, incredterm
	, inupdusr
	, inupddte
	, inupdterm
	, inprocessusr
	, inprocessdte
	, inprocessterm
	, xtndeptcd
	, xtnaddress
	, xtntype
	, inputxtndeptcd
	, appdte
	, outseqno
	, outdte
	, outdeptcd
	, outtravcd
	, outconvcd
	, outconvregno
	, outtdtcd
	, outtdtno
	, outtm6no
	, outvisatypecdorg
	, outpermitcd
	, outpermitdte
	, outpassportdte
	, outpassportisu
	, outpassportexpdte
	, outchkpointno
	, outcreusr
	, outcredte
	, outcredterm
	, outupdusr
	, outupddte
	, outupdterm
	, outprocessusr
	, outprocessdte
	, outprocessterm
	, matchprocessusr
	, matchprocessdte
	, matchprocessterm
	, tfsndxnm
	, tlsndxnm
	, tmsndxnm
	, efsndxnm
	, elsndxnm
	, emsndxnm
	, birthdte
	, invisaexpdte
	, outvisaexpdte
	, inintype
	, outintype
	, intargetno
	, outtargetno
	, inremark
	, outremark
	, flagmatch
	, inrescertno
	, outrescertno
	, extid
	, inpm_re_entry
	, inpm_reexpdte
	, inpm_extension
	, inpm_exexpdte
	, inpm_non_quota
	, inpm_nonexpdte
	, instatus
	, intm5_seqno
	, intm2inout_seqno
	, outpm_re_entry
	, outpm_reexpdte
	, outpm_extension
	, outpm_exexpdte
	, outpm_non_quota
	, outpm_nonexpdte
	, outstatus
	, outtm5_seqno
	, outtm2inout_seqno
	, inconv_seqno
	, invisatype_seqno
	, indept_seqno
	, count_seqno
	, inpermit_seqno
	, outconv_seqno
	, outvisatype_seqno
	, outdept_seqno
	, outpermit_seqno
	, inflightprefix
	, inflightnumber
	, outflightprefix
	, outflightnumber
	, citizenid
	, pass_seqno
	, inrpjseqno
	, outrpjseqno
	, indeptcdorg
	, outdeptcdorg
	, typedata
	, flagjoinpass
	, flagfines
	, invisatypecd
	, outvisatypecd
	, send_flag
	, visarunday
	, pv_seqno
	, inpd_seqno
	, inzone_seqno
	, outpd_seqno
	, outzone_seqno
	, inshift_seqno
	, outshift_seqno
FROM pibicsdm2.tmmain_in_1hr_prod;
  GRANT SELECT ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING"."V_TMMAIN_IN_1HR_PROD" TO "BIOSAADM";
