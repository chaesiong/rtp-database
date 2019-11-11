CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" ("CARDTYPE", "TMRUNNO", "PERSONID", "TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "EFIRSTNM", "EMIDDLENM", "EFAMILYNM", "SEX", "NATIONCD", "SEQNO", "INOUTDTE", "DEPTCD", "TRAVCD", "CONVCD", "CONVREGNO", "TDTNO", "TM6NO", "VISATYPECD", "PASSPORTEXPDTE", "CHKPOINTNO", "CREUSR", "CREDTE", "CREDTERM", "UPDUSR", "UPDDTE", "UPDTERM", "TFSNDXNM", "TLSNDXNM", "TMSNDXNM", "EFSNDXNM", "ELSNDXNM", "EMSNDXNM", "BIRTHDTE", "VISAEXPDTE", "INTYPE", "TARGETNO", "REMARK", "RESCERTNO", "IMGINOUT", "PM_RE_ENTRY", "PM_REEXPDTE", "PM_EXTENSION", "PM_EXEXPDTE", "PM_NON_QUOTA", "PM_NONEXPDTE", "STATUS", "TM5_SEQNO", "TM2INOUT_SEQNO", "RPJSEQNO", "CITIZENID", "PASS_SEQNO", "FLIGHTPREFIX", "FLIGHTNUMBER", "TDTCD", "TYPEDATA", "FLAGJOINPASS", "FLAGFINES", "PV_SEQNO", "PD_SEQNO", "ZONE_SEQNO", "PERMITCD", "NEWPERMIT", "PASSPORTISU") AS 
  SELECT 2                 AS cardtype
      ,tmrunno           AS tmrunno
      ,personid          AS personid
      ,tfirstnm          AS tfirstnm
      ,tmiddlenm         AS tmiddlenm
      ,tfamilynm         AS tfamilynm
      ,efirstnm          AS efirstnm
      ,emiddlenm         AS emiddlenm
      ,efamilynm         AS efamilynm
      ,sex               AS sex
      ,nationcd          AS nationcd
      ,outseqno          AS seqno
      ,outdte            AS inoutdte
      ,outdeptcd         AS deptcd
      ,outtravcd         AS travcd
      ,outconvcd         AS convcd
      ,outconvregno      AS convregno
      ,outtdtno          AS tdtno
      ,outtm6no          AS tm6no
      ,outvisatypecd     AS visatypecd
      ,outpassportexpdte AS passportexpdte
      ,outchkpointno     AS chkpointno
      ,outcreusr         AS creusr
      ,outcredte         AS credte
      ,outcredterm       AS credterm
      ,outupdusr         AS updusr
      ,outupddte         AS upddte
      ,outupdterm        AS updterm
      ,tfsndxnm          AS tfsndxnm
      ,tlsndxnm          AS tlsndxnm
      ,tmsndxnm          AS tmsndxnm
      ,efsndxnm          AS efsndxnm
      ,elsndxnm          AS elsndxnm
      ,emsndxnm          AS emsndxnm
      ,birthdte          AS birthdte
      ,outvisaexpdte     AS visaexpdte
      ,outintype         AS intype
      ,outtargetno       AS targetno
      ,outremark         AS remark
      ,outrescertno      AS rescertno
      ,outimg            AS imginout
      ,outpm_re_entry    AS pm_re_entry
      ,outpm_reexpdte    AS pm_reexpdte
      ,outpm_extension   AS pm_extension
      ,outpm_exexpdte    AS pm_exexpdte
      ,outpm_non_quota   AS pm_non_quota
      ,outpm_nonexpdte   AS pm_nonexpdte
      ,outstatus         AS status
      ,outtm5_seqno      AS tm5_seqno
      ,outtm2inout_seqno AS tm2inout_seqno
      ,outrpjseqno       AS rpjseqno
      ,citizenid         AS citizenid
      ,pass_seqno        AS pass_seqno
      ,outflightprefix   AS flightprefix
      ,outflightnumber   AS flightnumber
      ,outtdtcd          AS tdtcd
      ,typedata          AS typedata
      ,flagjoinpass      AS flagjoinpass
      ,flagfines         AS flagfines
      ,pv_seqno          AS pv_seqno
      ,outpd_seqno       AS pd_seqno
      ,outzone_seqno     AS zone_seqno
      ,outpermitcd       AS permitcd
      ,outpermitdte      AS newpermit
      ,outpassportisu    AS passportisu
FROM dl_staging4pibics.tmmain
WHERE outseqno IS NOT NULL
UNION ALL
SELECT 1                AS cardtype
      ,tmrunno          AS tmrunno
      ,personid         AS personid
      ,tfirstnm         AS tfirstnm
      ,tmiddlenm        AS tmiddlenm
      ,tfamilynm        AS tfamilynm
      ,efirstnm         AS efirstnm
      ,emiddlenm        AS emiddlenm
      ,efamilynm        AS efamilynm
      ,sex              AS sex
      ,nationcd         AS nationcd
      ,inseqno          AS seqno
      ,indte            AS inoutdte
      ,indeptcd         AS deptcd
      ,intravcd         AS travcd
      ,inconvcd         AS convcd
      ,inconvregno      AS convregno
      ,intdtno          AS tdtno
      ,intm6no          AS tm6no
      ,invisatypecd     AS visatypecd
      ,inpassportexpdte AS passportexpdte
      ,inchkpointno     AS chkpointno
      ,increusr         AS creusr
      ,incredte         AS credte
      ,incredterm       AS credterm
      ,inupdusr         AS updusr
      ,inupddte         AS upddte
      ,inupdterm        AS updterm
      ,tfsndxnm         AS tfsndxnm
      ,tlsndxnm         AS tlsndxnm
      ,tmsndxnm         AS tmsndxnm
      ,efsndxnm         AS efsndxnm
      ,elsndxnm         AS elsndxnm
      ,emsndxnm         AS emsndxnm
      ,birthdte         AS birthdte
      ,invisaexpdte     AS visaexpdte
      ,inintype         AS intype
      ,intargetno       AS targetno
      ,inremark         AS remark
      ,inrescertno      AS rescertno
      ,inimg            AS imginout
      ,inpm_re_entry    AS pm_re_entry
      ,inpm_reexpdte    AS pm_reexpdte
      ,inpm_extension   AS pm_extension
      ,inpm_exexpdte    AS pm_exexpdte
      ,inpm_non_quota   AS pm_non_quota
      ,inpm_nonexpdte   AS pm_nonexpdte
      ,instatus         AS status
      ,intm5_seqno      AS tm5_seqno
      ,intm2inout_seqno AS tm2inout_seqno
      ,inrpjseqno       AS rpjseqno
      ,citizenid        AS citizenid
      ,pass_seqno       AS pass_seqno
      ,inflightprefix   AS flightprefix
      ,inflightnumber   AS flightnumber
      ,intdtcd          AS tdtcd
      ,typedata         AS typedata
      ,flagjoinpass     AS flagjoinpass
      ,flagfines        AS flagfines
      ,pv_seqno         AS pv_seqno
      ,inpd_seqno       AS pd_seqno
      ,inzone_seqno     AS zone_seqno
      ,inpermitcd       AS permitcd
      ,inpermitdte      AS newpermit
      ,inpassportisu    AS passportisu
FROM dl_staging4pibics.tmmain
WHERE inseqno IS NOT NULL;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "DERMALOG_PROXY";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING4PIBICS_INTF"."TMMAIN_UNION" TO "BIOSAADM";
