CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_TMMAIN_OM_M" (v_dstart varchar2,v_dend varchar2)
IS
 var_rows NUMBER;
  vstdate DATE;
  veddate DATE;
BEGIN
 /* Create date : 6-12-2108 */
-- v_dstart := CONCAT(TO_CHAR(SYSDATE-1, 'yyyymmdd'),'2315');
-- v_dend := CONCAT(TO_CHAR (SYSDATE, 'yyyymmdd'),'0015');


vstdate :=sysdate;

 MERGE INTO PIBICSDM2.TMMAIN DM
  USING (SELECT *
     FROM PIBICS.TMMAIN@PIBICS_PROD
     WHERE (TO_CHAR(INCREDTE,'yyyymmddhh24mi') >= v_dstart
      AND TO_CHAR(INCREDTE,'yyyymmddhh24mi') < v_dend)
     OR (TO_CHAR(OUTCREDTE,'yyyymmddhh24mi') >= v_dstart
      AND TO_CHAR(OUTCREDTE,'yyyymmddhh24mi') < v_dend)) P
  ON (DM.TMRUNNO = P.TMRUNNO)
 WHEN MATCHED
 THEN
  UPDATE SET      DM.PERSONID = P.PERSONID,
     DM.TFIRSTNM = P.TFIRSTNM,
     DM.TMIDDLENM = P.TMIDDLENM,
     DM.TFAMILYNM = P.TFAMILYNM,
     DM.EFIRSTNM = P.EFIRSTNM,
     DM.EMIDDLENM = P.EMIDDLENM,
     DM.EFAMILYNM = P.EFAMILYNM,
     DM.SEX = P.SEX,
     DM.NATIONCD = P.NATIONCD,
     DM.INSEQNO = P.INSEQNO,
     DM.INDTE = P.INDTE,
     DM.INDEPTCD = P.INDEPTCD,
     DM.INTRAVCD = P.INTRAVCD,
     DM.INCONVCD = P.INCONVCD,
     DM.INCONVREGNO = P.INCONVREGNO,
     DM.INTDTCD = P.INTDTCD,
     DM.INTDTNO = P.INTDTNO,
     DM.INTM6NO = P.INTM6NO,
     DM.INVISATYPECDORG = P.INVISATYPECDORG,
     DM.INPERMITCD = P.INPERMITCD,
     DM.INPERMITDTE = P.INPERMITDTE,
     DM.INPASSPORTDTE = P.INPASSPORTDTE,
     DM.INPASSPORTISU = P.INPASSPORTISU,
     DM.INPASSPORTEXPDTE = P.INPASSPORTEXPDTE,
     DM.VISANO = P.VISANO,
     DM.VISAISSUE = P.VISAISSUE,
     DM.VISADTE = P.VISADTE,
     DM.VISABYRIGHTS = P.VISABYRIGHTS,
     DM.INCHKPOINTNO = P.INCHKPOINTNO,
     DM.INCREUSR = P.INCREUSR,
     DM.INCREDTE = P.INCREDTE,
     DM.INCREDTERM = P.INCREDTERM,
     DM.INUPDUSR = P.INUPDUSR,
     DM.INUPDDTE = P.INUPDDTE,
     DM.INUPDTERM = P.INUPDTERM,
     DM.INPROCESSUSR = P.INPROCESSUSR,
     DM.INPROCESSDTE = P.INPROCESSDTE,
     DM.INPROCESSTERM = P.INPROCESSTERM,
     DM.XTNDEPTCD = P.XTNDEPTCD,
     DM.XTNADDRESS = P.XTNADDRESS,
     DM.XTNTYPE = P.XTNTYPE,
     DM.INPUTXTNDEPTCD = P.INPUTXTNDEPTCD,
     DM.APPDTE = P.APPDTE,
     DM.OUTSEQNO = P.OUTSEQNO,
     DM.OUTDTE = P.OUTDTE,
     DM.OUTDEPTCD = P.OUTDEPTCD,
     DM.OUTTRAVCD = P.OUTTRAVCD,
     DM.OUTCONVCD = P.OUTCONVCD,
     DM.OUTCONVREGNO = P.OUTCONVREGNO,
     DM.OUTTDTCD = P.OUTTDTCD,
     DM.OUTTDTNO = P.OUTTDTNO,
     DM.OUTTM6NO = P.OUTTM6NO,
     DM.OUTVISATYPECDORG = P.OUTVISATYPECDORG,
     DM.OUTPERMITCD = P.OUTPERMITCD,
     DM.OUTPERMITDTE = P.OUTPERMITDTE,
     DM.OUTPASSPORTDTE = P.OUTPASSPORTDTE,
     DM.OUTPASSPORTISU = P.OUTPASSPORTISU,
     DM.OUTPASSPORTEXPDTE = P.OUTPASSPORTEXPDTE,
     DM.OUTCHKPOINTNO = P.OUTCHKPOINTNO,
     DM.OUTCREUSR = P.OUTCREUSR,
     DM.OUTCREDTE = P.OUTCREDTE,
     DM.OUTCREDTERM = P.OUTCREDTERM,
     DM.OUTUPDUSR = P.OUTUPDUSR,
     DM.OUTUPDDTE = P.OUTUPDDTE,
     DM.OUTUPDTERM = P.OUTUPDTERM,
     DM.OUTPROCESSUSR = P.OUTPROCESSUSR,
     DM.OUTPROCESSDTE = P.OUTPROCESSDTE,
     DM.OUTPROCESSTERM = P.OUTPROCESSTERM,
     DM.MATCHPROCESSUSR = P.MATCHPROCESSUSR,
     DM.MATCHPROCESSDTE = P.MATCHPROCESSDTE,
     DM.MATCHPROCESSTERM = P.MATCHPROCESSTERM,
     DM.TFSNDXNM = P.TFSNDXNM,
     DM.TLSNDXNM = P.TLSNDXNM,
     DM.TMSNDXNM = P.TMSNDXNM,
     DM.EFSNDXNM = P.EFSNDXNM,
     DM.ELSNDXNM = P.ELSNDXNM,
     DM.EMSNDXNM = P.EMSNDXNM,
     DM.BIRTHDTE = P.BIRTHDTE,
     DM.INVISAEXPDTE = P.INVISAEXPDTE,
     DM.OUTVISAEXPDTE = P.OUTVISAEXPDTE,
     DM.ININTYPE = P.ININTYPE,
     DM.OUTINTYPE = P.OUTINTYPE,
     DM.INTARGETNO = P.INTARGETNO,
     DM.OUTTARGETNO = P.OUTTARGETNO,
     DM.INREMARK = P.INREMARK,
     DM.OUTREMARK = P.OUTREMARK,
     DM.FLAGMATCH = P.FLAGMATCH,
     DM.INRESCERTNO = P.INRESCERTNO,
     DM.OUTRESCERTNO = P.OUTRESCERTNO,
     --DM.INIMG = P.INIMG,
     --DM.OUTIMG = P.OUTIMG,
     DM.EXTID = P.EXTID,
     DM.INPM_RE_ENTRY = P.INPM_RE_ENTRY,
     DM.INPM_REEXPDTE = P.INPM_REEXPDTE,
     DM.INPM_EXTENSION = P.INPM_EXTENSION,
     DM.INPM_EXEXPDTE = P.INPM_EXEXPDTE,
     DM.INPM_NON_QUOTA = P.INPM_NON_QUOTA,
     DM.INPM_NONEXPDTE = P.INPM_NONEXPDTE,
     DM.INSTATUS = P.INSTATUS,
     DM.INTM5_SEQNO = P.INTM5_SEQNO,
     DM.INTM2INOUT_SEQNO = P.INTM2INOUT_SEQNO,
     DM.OUTPM_RE_ENTRY = P.OUTPM_RE_ENTRY,
     DM.OUTPM_REEXPDTE = P.OUTPM_REEXPDTE,
     DM.OUTPM_EXTENSION = P.OUTPM_EXTENSION,
     DM.OUTPM_EXEXPDTE = P.OUTPM_EXEXPDTE,
     DM.OUTPM_NON_QUOTA = P.OUTPM_NON_QUOTA,
     DM.OUTPM_NONEXPDTE = P.OUTPM_NONEXPDTE,
     DM.OUTSTATUS = P.OUTSTATUS,
     DM.OUTTM5_SEQNO = P.OUTTM5_SEQNO,
     DM.OUTTM2INOUT_SEQNO = P.OUTTM2INOUT_SEQNO,
     DM.INCONV_SEQNO = P.INCONV_SEQNO,
     DM.INVISATYPE_SEQNO = P.INVISATYPE_SEQNO,
     DM.INDEPT_SEQNO = P.INDEPT_SEQNO,
     DM.COUNT_SEQNO = P.COUNT_SEQNO,
     DM.INPERMIT_SEQNO = P.INPERMIT_SEQNO,
     DM.OUTCONV_SEQNO = P.OUTCONV_SEQNO,
     DM.OUTVISATYPE_SEQNO = P.OUTVISATYPE_SEQNO,
     DM.OUTDEPT_SEQNO = P.OUTDEPT_SEQNO,
     DM.OUTPERMIT_SEQNO = P.OUTPERMIT_SEQNO,
     DM.INFLIGHTPREFIX = P.INFLIGHTPREFIX,
     DM.INFLIGHTNUMBER = P.INFLIGHTNUMBER,
     DM.OUTFLIGHTPREFIX = P.OUTFLIGHTPREFIX,
     DM.OUTFLIGHTNUMBER = P.OUTFLIGHTNUMBER,
     DM.CITIZENID = P.CITIZENID,
     DM.PASS_SEQNO = P.PASS_SEQNO,
     DM.INRPJSEQNO = P.INRPJSEQNO,
     DM.OUTRPJSEQNO = P.OUTRPJSEQNO,
     DM.INDEPTCDORG = P.INDEPTCDORG,
     DM.OUTDEPTCDORG = P.OUTDEPTCDORG,
     DM.TYPEDATA = P.TYPEDATA,
     DM.FLAGJOINPASS = P.FLAGJOINPASS,
     DM.FLAGFINES = P.FLAGFINES,
     DM.INVISATYPECD = P.INVISATYPECD,
     DM.OUTVISATYPECD = P.OUTVISATYPECD,
     DM.SEND_FLAG = P.SEND_FLAG,
     DM.VISARUNDAY = P.VISARUNDAY,
     DM.PV_SEQNO = P.PV_SEQNO,
     DM.INPD_SEQNO = P.INPD_SEQNO,
     DM.INZONE_SEQNO = P.INZONE_SEQNO,
     DM.OUTPD_SEQNO = P.OUTPD_SEQNO,
     DM.OUTZONE_SEQNO = P.OUTZONE_SEQNO,
     DM.INSHIFT_SEQNO = P.INSHIFT_SEQNO,
     DM.OUTSHIFT_SEQNO = P.OUTSHIFT_SEQNO
 WHEN NOT MATCHED
 THEN
  INSERT (     DM.TMRUNNO,
     DM.PERSONID,
     DM.TFIRSTNM,
     DM.TMIDDLENM,
     DM.TFAMILYNM,
     DM.EFIRSTNM,
     DM.EMIDDLENM,
     DM.EFAMILYNM,
     DM.SEX,
     DM.NATIONCD,
     DM.INSEQNO,
     DM.INDTE,
     DM.INDEPTCD,
     DM.INTRAVCD,
     DM.INCONVCD,
     DM.INCONVREGNO,
     DM.INTDTCD,
     DM.INTDTNO,
     DM.INTM6NO,
     DM.INVISATYPECDORG,
     DM.INPERMITCD,
     DM.INPERMITDTE,
     DM.INPASSPORTDTE,
     DM.INPASSPORTISU,
     DM.INPASSPORTEXPDTE,
     DM.VISANO,
     DM.VISAISSUE,
     DM.VISADTE,
     DM.VISABYRIGHTS,
     DM.INCHKPOINTNO,
     DM.INCREUSR,
     DM.INCREDTE,
     DM.INCREDTERM,
     DM.INUPDUSR,
     DM.INUPDDTE,
     DM.INUPDTERM,
     DM.INPROCESSUSR,
     DM.INPROCESSDTE,
     DM.INPROCESSTERM,
     DM.XTNDEPTCD,
     DM.XTNADDRESS,
     DM.XTNTYPE,
     DM.INPUTXTNDEPTCD,
     DM.APPDTE,
     DM.OUTSEQNO,
     DM.OUTDTE,
     DM.OUTDEPTCD,
     DM.OUTTRAVCD,
     DM.OUTCONVCD,
     DM.OUTCONVREGNO,
     DM.OUTTDTCD,
     DM.OUTTDTNO,
     DM.OUTTM6NO,
     DM.OUTVISATYPECDORG,
     DM.OUTPERMITCD,
     DM.OUTPERMITDTE,
     DM.OUTPASSPORTDTE,
     DM.OUTPASSPORTISU,
     DM.OUTPASSPORTEXPDTE,
     DM.OUTCHKPOINTNO,
     DM.OUTCREUSR,
     DM.OUTCREDTE,
     DM.OUTCREDTERM,
     DM.OUTUPDUSR,
     DM.OUTUPDDTE,
     DM.OUTUPDTERM,
     DM.OUTPROCESSUSR,
     DM.OUTPROCESSDTE,
     DM.OUTPROCESSTERM,
     DM.MATCHPROCESSUSR,
     DM.MATCHPROCESSDTE,
     DM.MATCHPROCESSTERM,
     DM.TFSNDXNM,
     DM.TLSNDXNM,
     DM.TMSNDXNM,
     DM.EFSNDXNM,
     DM.ELSNDXNM,
     DM.EMSNDXNM,
     DM.BIRTHDTE,
     DM.INVISAEXPDTE,
     DM.OUTVISAEXPDTE,
     DM.ININTYPE,
     DM.OUTINTYPE,
     DM.INTARGETNO,
     DM.OUTTARGETNO,
     DM.INREMARK,
     DM.OUTREMARK,
     DM.FLAGMATCH,
     DM.INRESCERTNO,
     DM.OUTRESCERTNO,
     --DM.INIMG,
     --DM.OUTIMG,
     DM.EXTID,
     DM.INPM_RE_ENTRY,
     DM.INPM_REEXPDTE,
     DM.INPM_EXTENSION,
     DM.INPM_EXEXPDTE,
     DM.INPM_NON_QUOTA,
     DM.INPM_NONEXPDTE,
     DM.INSTATUS,
     DM.INTM5_SEQNO,
     DM.INTM2INOUT_SEQNO,
     DM.OUTPM_RE_ENTRY,
     DM.OUTPM_REEXPDTE,
     DM.OUTPM_EXTENSION,
     DM.OUTPM_EXEXPDTE,
     DM.OUTPM_NON_QUOTA,
     DM.OUTPM_NONEXPDTE,
     DM.OUTSTATUS,
     DM.OUTTM5_SEQNO,
     DM.OUTTM2INOUT_SEQNO,
     DM.INCONV_SEQNO,
     DM.INVISATYPE_SEQNO,
     DM.INDEPT_SEQNO,
     DM.COUNT_SEQNO,
     DM.INPERMIT_SEQNO,
     DM.OUTCONV_SEQNO,
     DM.OUTVISATYPE_SEQNO,
     DM.OUTDEPT_SEQNO,
     DM.OUTPERMIT_SEQNO,
     DM.INFLIGHTPREFIX,
     DM.INFLIGHTNUMBER,
     DM.OUTFLIGHTPREFIX,
     DM.OUTFLIGHTNUMBER,
     DM.CITIZENID,
     DM.PASS_SEQNO,
     DM.INRPJSEQNO,
     DM.OUTRPJSEQNO,
     DM.INDEPTCDORG,
     DM.OUTDEPTCDORG,
     DM.TYPEDATA,
     DM.FLAGJOINPASS,
     DM.FLAGFINES,
     DM.INVISATYPECD,
     DM.OUTVISATYPECD,
     DM.SEND_FLAG,
     DM.VISARUNDAY,
     DM.PV_SEQNO,
     DM.INPD_SEQNO,
     DM.INZONE_SEQNO,
     DM.OUTPD_SEQNO,
     DM.OUTZONE_SEQNO,
     DM.INSHIFT_SEQNO,
     DM.OUTSHIFT_SEQNO)
  VALUES (     P.TMRUNNO,
     P.PERSONID,
     P.TFIRSTNM,
     P.TMIDDLENM,
     P.TFAMILYNM,
     P.EFIRSTNM,
     P.EMIDDLENM,
     P.EFAMILYNM,
     P.SEX,
     P.NATIONCD,
     P.INSEQNO,
     P.INDTE,
     P.INDEPTCD,
     P.INTRAVCD,
     P.INCONVCD,
     P.INCONVREGNO,
     P.INTDTCD,
     P.INTDTNO,
     P.INTM6NO,
     P.INVISATYPECDORG,
     P.INPERMITCD,
     P.INPERMITDTE,
     P.INPASSPORTDTE,
     P.INPASSPORTISU,
     P.INPASSPORTEXPDTE,
     P.VISANO,
     P.VISAISSUE,
     P.VISADTE,
     P.VISABYRIGHTS,
     P.INCHKPOINTNO,
     P.INCREUSR,
     P.INCREDTE,
     P.INCREDTERM,
     P.INUPDUSR,
     P.INUPDDTE,
     P.INUPDTERM,
     P.INPROCESSUSR,
     P.INPROCESSDTE,
     P.INPROCESSTERM,
     P.XTNDEPTCD,
     P.XTNADDRESS,
     P.XTNTYPE,
     P.INPUTXTNDEPTCD,
     P.APPDTE,
     P.OUTSEQNO,
     P.OUTDTE,
     P.OUTDEPTCD,
     P.OUTTRAVCD,
     P.OUTCONVCD,
     P.OUTCONVREGNO,
     P.OUTTDTCD,
     P.OUTTDTNO,
     P.OUTTM6NO,
     P.OUTVISATYPECDORG,
     P.OUTPERMITCD,
     P.OUTPERMITDTE,
     P.OUTPASSPORTDTE,
     P.OUTPASSPORTISU,
     P.OUTPASSPORTEXPDTE,
     P.OUTCHKPOINTNO,
     P.OUTCREUSR,
     P.OUTCREDTE,
     P.OUTCREDTERM,
     P.OUTUPDUSR,
     P.OUTUPDDTE,
     P.OUTUPDTERM,
     P.OUTPROCESSUSR,
     P.OUTPROCESSDTE,
     P.OUTPROCESSTERM,
     P.MATCHPROCESSUSR,
     P.MATCHPROCESSDTE,
     P.MATCHPROCESSTERM,
     P.TFSNDXNM,
     P.TLSNDXNM,
     P.TMSNDXNM,
     P.EFSNDXNM,
     P.ELSNDXNM,
     P.EMSNDXNM,
     P.BIRTHDTE,
     P.INVISAEXPDTE,
     P.OUTVISAEXPDTE,
     P.ININTYPE,
     P.OUTINTYPE,
     P.INTARGETNO,
     P.OUTTARGETNO,
     P.INREMARK,
     P.OUTREMARK,
     P.FLAGMATCH,
     P.INRESCERTNO,
     P.OUTRESCERTNO,
     --P.INIMG,
     --P.OUTIMG,
     P.EXTID,
     P.INPM_RE_ENTRY,
     P.INPM_REEXPDTE,
     P.INPM_EXTENSION,
     P.INPM_EXEXPDTE,
     P.INPM_NON_QUOTA,
     P.INPM_NONEXPDTE,
     P.INSTATUS,
     P.INTM5_SEQNO,
     P.INTM2INOUT_SEQNO,
     P.OUTPM_RE_ENTRY,
     P.OUTPM_REEXPDTE,
     P.OUTPM_EXTENSION,
     P.OUTPM_EXEXPDTE,
     P.OUTPM_NON_QUOTA,
     P.OUTPM_NONEXPDTE,
     P.OUTSTATUS,
     P.OUTTM5_SEQNO,
     P.OUTTM2INOUT_SEQNO,
     P.INCONV_SEQNO,
     P.INVISATYPE_SEQNO,
     P.INDEPT_SEQNO,
     P.COUNT_SEQNO,
     P.INPERMIT_SEQNO,
     P.OUTCONV_SEQNO,
     P.OUTVISATYPE_SEQNO,
     P.OUTDEPT_SEQNO,
     P.OUTPERMIT_SEQNO,
     P.INFLIGHTPREFIX,
     P.INFLIGHTNUMBER,
     P.OUTFLIGHTPREFIX,
     P.OUTFLIGHTNUMBER,
     P.CITIZENID,
     P.PASS_SEQNO,
     P.INRPJSEQNO,
     P.OUTRPJSEQNO,
     P.INDEPTCDORG,
     P.OUTDEPTCDORG,
     P.TYPEDATA,
     P.FLAGJOINPASS,
     P.FLAGFINES,
     P.INVISATYPECD,
     P.OUTVISATYPECD,
     P.SEND_FLAG,
     P.VISARUNDAY,
     P.PV_SEQNO,
     P.INPD_SEQNO,
     P.INZONE_SEQNO,
     P.OUTPD_SEQNO,
     P.OUTZONE_SEQNO,
     P.INSHIFT_SEQNO,
     P.OUTSHIFT_SEQNO);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('TMMAIN_OM_M_C', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL
 VALUES ('TMMAIN_OM_M_C', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;



 vstdate :=sysdate;


 MERGE INTO PIBICSDM2.TMMAIN DM
  USING (SELECT *
     FROM PIBICS.TMMAIN@PIBICS_PROD
     WHERE (TO_CHAR(INUPDDTE,'yyyymmddhh24mi') >= v_dstart
      AND TO_CHAR(INUPDDTE,'yyyymmddhh24mi') < v_dend)
     OR (TO_CHAR(OUTUPDDTE,'yyyymmddhh24mi') >= v_dstart
      AND TO_CHAR(OUTUPDDTE,'yyyymmddhh24mi') < v_dend)) P
  ON (DM.TMRUNNO = P.TMRUNNO)
 WHEN MATCHED
 THEN
  UPDATE SET      DM.PERSONID = P.PERSONID,
     DM.TFIRSTNM = P.TFIRSTNM,
     DM.TMIDDLENM = P.TMIDDLENM,
     DM.TFAMILYNM = P.TFAMILYNM,
     DM.EFIRSTNM = P.EFIRSTNM,
     DM.EMIDDLENM = P.EMIDDLENM,
     DM.EFAMILYNM = P.EFAMILYNM,
     DM.SEX = P.SEX,
     DM.NATIONCD = P.NATIONCD,
     DM.INSEQNO = P.INSEQNO,
     DM.INDTE = P.INDTE,
     DM.INDEPTCD = P.INDEPTCD,
     DM.INTRAVCD = P.INTRAVCD,
     DM.INCONVCD = P.INCONVCD,
     DM.INCONVREGNO = P.INCONVREGNO,
     DM.INTDTCD = P.INTDTCD,
     DM.INTDTNO = P.INTDTNO,
     DM.INTM6NO = P.INTM6NO,
     DM.INVISATYPECDORG = P.INVISATYPECDORG,
     DM.INPERMITCD = P.INPERMITCD,
     DM.INPERMITDTE = P.INPERMITDTE,
     DM.INPASSPORTDTE = P.INPASSPORTDTE,
     DM.INPASSPORTISU = P.INPASSPORTISU,
     DM.INPASSPORTEXPDTE = P.INPASSPORTEXPDTE,
     DM.VISANO = P.VISANO,
     DM.VISAISSUE = P.VISAISSUE,
     DM.VISADTE = P.VISADTE,
     DM.VISABYRIGHTS = P.VISABYRIGHTS,
     DM.INCHKPOINTNO = P.INCHKPOINTNO,
     DM.INCREUSR = P.INCREUSR,
     DM.INCREDTE = P.INCREDTE,
     DM.INCREDTERM = P.INCREDTERM,
     DM.INUPDUSR = P.INUPDUSR,
     DM.INUPDDTE = P.INUPDDTE,
     DM.INUPDTERM = P.INUPDTERM,
     DM.INPROCESSUSR = P.INPROCESSUSR,
     DM.INPROCESSDTE = P.INPROCESSDTE,
     DM.INPROCESSTERM = P.INPROCESSTERM,
     DM.XTNDEPTCD = P.XTNDEPTCD,
     DM.XTNADDRESS = P.XTNADDRESS,
     DM.XTNTYPE = P.XTNTYPE,
     DM.INPUTXTNDEPTCD = P.INPUTXTNDEPTCD,
     DM.APPDTE = P.APPDTE,
     DM.OUTSEQNO = P.OUTSEQNO,
     DM.OUTDTE = P.OUTDTE,
     DM.OUTDEPTCD = P.OUTDEPTCD,
     DM.OUTTRAVCD = P.OUTTRAVCD,
     DM.OUTCONVCD = P.OUTCONVCD,
     DM.OUTCONVREGNO = P.OUTCONVREGNO,
     DM.OUTTDTCD = P.OUTTDTCD,
     DM.OUTTDTNO = P.OUTTDTNO,
     DM.OUTTM6NO = P.OUTTM6NO,
     DM.OUTVISATYPECDORG = P.OUTVISATYPECDORG,
     DM.OUTPERMITCD = P.OUTPERMITCD,
     DM.OUTPERMITDTE = P.OUTPERMITDTE,
     DM.OUTPASSPORTDTE = P.OUTPASSPORTDTE,
     DM.OUTPASSPORTISU = P.OUTPASSPORTISU,
     DM.OUTPASSPORTEXPDTE = P.OUTPASSPORTEXPDTE,
     DM.OUTCHKPOINTNO = P.OUTCHKPOINTNO,
     DM.OUTCREUSR = P.OUTCREUSR,
     DM.OUTCREDTE = P.OUTCREDTE,
     DM.OUTCREDTERM = P.OUTCREDTERM,
     DM.OUTUPDUSR = P.OUTUPDUSR,
     DM.OUTUPDDTE = P.OUTUPDDTE,
     DM.OUTUPDTERM = P.OUTUPDTERM,
     DM.OUTPROCESSUSR = P.OUTPROCESSUSR,
     DM.OUTPROCESSDTE = P.OUTPROCESSDTE,
     DM.OUTPROCESSTERM = P.OUTPROCESSTERM,
     DM.MATCHPROCESSUSR = P.MATCHPROCESSUSR,
     DM.MATCHPROCESSDTE = P.MATCHPROCESSDTE,
     DM.MATCHPROCESSTERM = P.MATCHPROCESSTERM,
     DM.TFSNDXNM = P.TFSNDXNM,
     DM.TLSNDXNM = P.TLSNDXNM,
     DM.TMSNDXNM = P.TMSNDXNM,
     DM.EFSNDXNM = P.EFSNDXNM,
     DM.ELSNDXNM = P.ELSNDXNM,
     DM.EMSNDXNM = P.EMSNDXNM,
     DM.BIRTHDTE = P.BIRTHDTE,
     DM.INVISAEXPDTE = P.INVISAEXPDTE,
     DM.OUTVISAEXPDTE = P.OUTVISAEXPDTE,
     DM.ININTYPE = P.ININTYPE,
     DM.OUTINTYPE = P.OUTINTYPE,
     DM.INTARGETNO = P.INTARGETNO,
     DM.OUTTARGETNO = P.OUTTARGETNO,
     DM.INREMARK = P.INREMARK,
     DM.OUTREMARK = P.OUTREMARK,
     DM.FLAGMATCH = P.FLAGMATCH,
     DM.INRESCERTNO = P.INRESCERTNO,
     DM.OUTRESCERTNO = P.OUTRESCERTNO,
     --DM.INIMG = P.INIMG,
     --DM.OUTIMG = P.OUTIMG,
     DM.EXTID = P.EXTID,
     DM.INPM_RE_ENTRY = P.INPM_RE_ENTRY,
     DM.INPM_REEXPDTE = P.INPM_REEXPDTE,
     DM.INPM_EXTENSION = P.INPM_EXTENSION,
     DM.INPM_EXEXPDTE = P.INPM_EXEXPDTE,
     DM.INPM_NON_QUOTA = P.INPM_NON_QUOTA,
     DM.INPM_NONEXPDTE = P.INPM_NONEXPDTE,
     DM.INSTATUS = P.INSTATUS,
     DM.INTM5_SEQNO = P.INTM5_SEQNO,
     DM.INTM2INOUT_SEQNO = P.INTM2INOUT_SEQNO,
     DM.OUTPM_RE_ENTRY = P.OUTPM_RE_ENTRY,
     DM.OUTPM_REEXPDTE = P.OUTPM_REEXPDTE,
     DM.OUTPM_EXTENSION = P.OUTPM_EXTENSION,
     DM.OUTPM_EXEXPDTE = P.OUTPM_EXEXPDTE,
     DM.OUTPM_NON_QUOTA = P.OUTPM_NON_QUOTA,
     DM.OUTPM_NONEXPDTE = P.OUTPM_NONEXPDTE,
     DM.OUTSTATUS = P.OUTSTATUS,
     DM.OUTTM5_SEQNO = P.OUTTM5_SEQNO,
     DM.OUTTM2INOUT_SEQNO = P.OUTTM2INOUT_SEQNO,
     DM.INCONV_SEQNO = P.INCONV_SEQNO,
     DM.INVISATYPE_SEQNO = P.INVISATYPE_SEQNO,
     DM.INDEPT_SEQNO = P.INDEPT_SEQNO,
     DM.COUNT_SEQNO = P.COUNT_SEQNO,
     DM.INPERMIT_SEQNO = P.INPERMIT_SEQNO,
     DM.OUTCONV_SEQNO = P.OUTCONV_SEQNO,
     DM.OUTVISATYPE_SEQNO = P.OUTVISATYPE_SEQNO,
     DM.OUTDEPT_SEQNO = P.OUTDEPT_SEQNO,
     DM.OUTPERMIT_SEQNO = P.OUTPERMIT_SEQNO,
     DM.INFLIGHTPREFIX = P.INFLIGHTPREFIX,
     DM.INFLIGHTNUMBER = P.INFLIGHTNUMBER,
     DM.OUTFLIGHTPREFIX = P.OUTFLIGHTPREFIX,
     DM.OUTFLIGHTNUMBER = P.OUTFLIGHTNUMBER,
     DM.CITIZENID = P.CITIZENID,
     DM.PASS_SEQNO = P.PASS_SEQNO,
     DM.INRPJSEQNO = P.INRPJSEQNO,
     DM.OUTRPJSEQNO = P.OUTRPJSEQNO,
     DM.INDEPTCDORG = P.INDEPTCDORG,
     DM.OUTDEPTCDORG = P.OUTDEPTCDORG,
     DM.TYPEDATA = P.TYPEDATA,
     DM.FLAGJOINPASS = P.FLAGJOINPASS,
     DM.FLAGFINES = P.FLAGFINES,
     DM.INVISATYPECD = P.INVISATYPECD,
     DM.OUTVISATYPECD = P.OUTVISATYPECD,
     DM.SEND_FLAG = P.SEND_FLAG,
     DM.VISARUNDAY = P.VISARUNDAY,
     DM.PV_SEQNO = P.PV_SEQNO,
     DM.INPD_SEQNO = P.INPD_SEQNO,
     DM.INZONE_SEQNO = P.INZONE_SEQNO,
     DM.OUTPD_SEQNO = P.OUTPD_SEQNO,
     DM.OUTZONE_SEQNO = P.OUTZONE_SEQNO,
     DM.INSHIFT_SEQNO = P.INSHIFT_SEQNO,
     DM.OUTSHIFT_SEQNO = P.OUTSHIFT_SEQNO
 WHEN NOT MATCHED
 THEN
  INSERT (     DM.TMRUNNO,
     DM.PERSONID,
     DM.TFIRSTNM,
     DM.TMIDDLENM,
     DM.TFAMILYNM,
     DM.EFIRSTNM,
     DM.EMIDDLENM,
     DM.EFAMILYNM,
     DM.SEX,
     DM.NATIONCD,
     DM.INSEQNO,
     DM.INDTE,
     DM.INDEPTCD,
     DM.INTRAVCD,
     DM.INCONVCD,
     DM.INCONVREGNO,
     DM.INTDTCD,
     DM.INTDTNO,
     DM.INTM6NO,
     DM.INVISATYPECDORG,
     DM.INPERMITCD,
     DM.INPERMITDTE,
     DM.INPASSPORTDTE,
     DM.INPASSPORTISU,
     DM.INPASSPORTEXPDTE,
     DM.VISANO,
     DM.VISAISSUE,
     DM.VISADTE,
     DM.VISABYRIGHTS,
     DM.INCHKPOINTNO,
     DM.INCREUSR,
     DM.INCREDTE,
     DM.INCREDTERM,
     DM.INUPDUSR,
     DM.INUPDDTE,
     DM.INUPDTERM,
     DM.INPROCESSUSR,
     DM.INPROCESSDTE,
     DM.INPROCESSTERM,
     DM.XTNDEPTCD,
     DM.XTNADDRESS,
     DM.XTNTYPE,
     DM.INPUTXTNDEPTCD,
     DM.APPDTE,
     DM.OUTSEQNO,
     DM.OUTDTE,
     DM.OUTDEPTCD,
     DM.OUTTRAVCD,
     DM.OUTCONVCD,
     DM.OUTCONVREGNO,
     DM.OUTTDTCD,
     DM.OUTTDTNO,
     DM.OUTTM6NO,
     DM.OUTVISATYPECDORG,
     DM.OUTPERMITCD,
     DM.OUTPERMITDTE,
     DM.OUTPASSPORTDTE,
     DM.OUTPASSPORTISU,
     DM.OUTPASSPORTEXPDTE,
     DM.OUTCHKPOINTNO,
     DM.OUTCREUSR,
     DM.OUTCREDTE,
     DM.OUTCREDTERM,
     DM.OUTUPDUSR,
     DM.OUTUPDDTE,
     DM.OUTUPDTERM,
     DM.OUTPROCESSUSR,
     DM.OUTPROCESSDTE,
     DM.OUTPROCESSTERM,
     DM.MATCHPROCESSUSR,
     DM.MATCHPROCESSDTE,
     DM.MATCHPROCESSTERM,
     DM.TFSNDXNM,
     DM.TLSNDXNM,
     DM.TMSNDXNM,
     DM.EFSNDXNM,
     DM.ELSNDXNM,
     DM.EMSNDXNM,
     DM.BIRTHDTE,
     DM.INVISAEXPDTE,
     DM.OUTVISAEXPDTE,
     DM.ININTYPE,
     DM.OUTINTYPE,
     DM.INTARGETNO,
     DM.OUTTARGETNO,
     DM.INREMARK,
     DM.OUTREMARK,
     DM.FLAGMATCH,
     DM.INRESCERTNO,
     DM.OUTRESCERTNO,
     --DM.INIMG,
     --DM.OUTIMG,
     DM.EXTID,
     DM.INPM_RE_ENTRY,
     DM.INPM_REEXPDTE,
     DM.INPM_EXTENSION,
     DM.INPM_EXEXPDTE,
     DM.INPM_NON_QUOTA,
     DM.INPM_NONEXPDTE,
     DM.INSTATUS,
     DM.INTM5_SEQNO,
     DM.INTM2INOUT_SEQNO,
     DM.OUTPM_RE_ENTRY,
     DM.OUTPM_REEXPDTE,
     DM.OUTPM_EXTENSION,
     DM.OUTPM_EXEXPDTE,
     DM.OUTPM_NON_QUOTA,
     DM.OUTPM_NONEXPDTE,
     DM.OUTSTATUS,
     DM.OUTTM5_SEQNO,
     DM.OUTTM2INOUT_SEQNO,
     DM.INCONV_SEQNO,
     DM.INVISATYPE_SEQNO,
     DM.INDEPT_SEQNO,
     DM.COUNT_SEQNO,
     DM.INPERMIT_SEQNO,
     DM.OUTCONV_SEQNO,
     DM.OUTVISATYPE_SEQNO,
     DM.OUTDEPT_SEQNO,
     DM.OUTPERMIT_SEQNO,
     DM.INFLIGHTPREFIX,
     DM.INFLIGHTNUMBER,
     DM.OUTFLIGHTPREFIX,
     DM.OUTFLIGHTNUMBER,
     DM.CITIZENID,
     DM.PASS_SEQNO,
     DM.INRPJSEQNO,
     DM.OUTRPJSEQNO,
     DM.INDEPTCDORG,
     DM.OUTDEPTCDORG,
     DM.TYPEDATA,
     DM.FLAGJOINPASS,
     DM.FLAGFINES,
     DM.INVISATYPECD,
     DM.OUTVISATYPECD,
     DM.SEND_FLAG,
     DM.VISARUNDAY,
     DM.PV_SEQNO,
     DM.INPD_SEQNO,
     DM.INZONE_SEQNO,
     DM.OUTPD_SEQNO,
     DM.OUTZONE_SEQNO,
     DM.INSHIFT_SEQNO,
     DM.OUTSHIFT_SEQNO)
VALUES (     P.TMRUNNO,
     P.PERSONID,
     P.TFIRSTNM,
     P.TMIDDLENM,
     P.TFAMILYNM,
     P.EFIRSTNM,
     P.EMIDDLENM,
     P.EFAMILYNM,
     P.SEX,
     P.NATIONCD,
     P.INSEQNO,
     P.INDTE,
     P.INDEPTCD,
     P.INTRAVCD,
     P.INCONVCD,
     P.INCONVREGNO,
     P.INTDTCD,
     P.INTDTNO,
     P.INTM6NO,
     P.INVISATYPECDORG,
     P.INPERMITCD,
     P.INPERMITDTE,
     P.INPASSPORTDTE,
     P.INPASSPORTISU,
     P.INPASSPORTEXPDTE,
     P.VISANO,
     P.VISAISSUE,
     P.VISADTE,
     P.VISABYRIGHTS,
     P.INCHKPOINTNO,
     P.INCREUSR,
     P.INCREDTE,
     P.INCREDTERM,
     P.INUPDUSR,
     P.INUPDDTE,
     P.INUPDTERM,
     P.INPROCESSUSR,
     P.INPROCESSDTE,
     P.INPROCESSTERM,
     P.XTNDEPTCD,
     P.XTNADDRESS,
     P.XTNTYPE,
     P.INPUTXTNDEPTCD,
     P.APPDTE,
     P.OUTSEQNO,
     P.OUTDTE,
     P.OUTDEPTCD,
     P.OUTTRAVCD,
     P.OUTCONVCD,
     P.OUTCONVREGNO,
     P.OUTTDTCD,
     P.OUTTDTNO,
     P.OUTTM6NO,
     P.OUTVISATYPECDORG,
     P.OUTPERMITCD,
     P.OUTPERMITDTE,
     P.OUTPASSPORTDTE,
     P.OUTPASSPORTISU,
     P.OUTPASSPORTEXPDTE,
     P.OUTCHKPOINTNO,
     P.OUTCREUSR,
     P.OUTCREDTE,
     P.OUTCREDTERM,
     P.OUTUPDUSR,
     P.OUTUPDDTE,
     P.OUTUPDTERM,
     P.OUTPROCESSUSR,
     P.OUTPROCESSDTE,
     P.OUTPROCESSTERM,
     P.MATCHPROCESSUSR,
     P.MATCHPROCESSDTE,
     P.MATCHPROCESSTERM,
     P.TFSNDXNM,
     P.TLSNDXNM,
     P.TMSNDXNM,
     P.EFSNDXNM,
     P.ELSNDXNM,
     P.EMSNDXNM,
     P.BIRTHDTE,
     P.INVISAEXPDTE,
     P.OUTVISAEXPDTE,
     P.ININTYPE,
     P.OUTINTYPE,
     P.INTARGETNO,
     P.OUTTARGETNO,
     P.INREMARK,
     P.OUTREMARK,
     P.FLAGMATCH,
     P.INRESCERTNO,
     P.OUTRESCERTNO,
     --P.INIMG,
     --P.OUTIMG,
     P.EXTID,
     P.INPM_RE_ENTRY,
     P.INPM_REEXPDTE,
     P.INPM_EXTENSION,
     P.INPM_EXEXPDTE,
     P.INPM_NON_QUOTA,
     P.INPM_NONEXPDTE,
     P.INSTATUS,
     P.INTM5_SEQNO,
     P.INTM2INOUT_SEQNO,
     P.OUTPM_RE_ENTRY,
     P.OUTPM_REEXPDTE,
     P.OUTPM_EXTENSION,
     P.OUTPM_EXEXPDTE,
     P.OUTPM_NON_QUOTA,
     P.OUTPM_NONEXPDTE,
     P.OUTSTATUS,
     P.OUTTM5_SEQNO,
     P.OUTTM2INOUT_SEQNO,
     P.INCONV_SEQNO,
     P.INVISATYPE_SEQNO,
     P.INDEPT_SEQNO,
     P.COUNT_SEQNO,
     P.INPERMIT_SEQNO,
     P.OUTCONV_SEQNO,
     P.OUTVISATYPE_SEQNO,
     P.OUTDEPT_SEQNO,
     P.OUTPERMIT_SEQNO,
     P.INFLIGHTPREFIX,
     P.INFLIGHTNUMBER,
     P.OUTFLIGHTPREFIX,
     P.OUTFLIGHTNUMBER,
     P.CITIZENID,
     P.PASS_SEQNO,
     P.INRPJSEQNO,
     P.OUTRPJSEQNO,
     P.INDEPTCDORG,
     P.OUTDEPTCDORG,
     P.TYPEDATA,
     P.FLAGJOINPASS,
     P.FLAGFINES,
     P.INVISATYPECD,
     P.OUTVISATYPECD,
     P.SEND_FLAG,
     P.VISARUNDAY,
     P.PV_SEQNO,
     P.INPD_SEQNO,
     P.INZONE_SEQNO,
     P.OUTPD_SEQNO,
     P.OUTZONE_SEQNO,
     P.INSHIFT_SEQNO,
     P.OUTSHIFT_SEQNO);



 var_rows := SQL%ROWCOUNT;

 INSERT INTO IMPORT_LOG
  VALUES ('TMMAIN_OM_M_U', var_rows, SYSDATE);
 veddate :=sysdate;
 INSERT INTO IMPORT_LOG_DETAIL
 VALUES ('TMMAIN_OM_M_U', var_rows,SYSDATE,v_dstart,v_dend,vstdate,veddate);

 COMMIT;


EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
  NULL;
 WHEN OTHERS
 THEN
 -- Consider logging the error and then re-raise
  RAISE;
END P_TMMAIN_OM_M;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_TMMAIN_OM_M" TO "BIOSAADM";
