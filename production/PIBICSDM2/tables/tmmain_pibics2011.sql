CREATE TABLE "PIBICSDM2"."TMMAIN_PIBICS2011" 
   (	"TMRUNNO" VARCHAR2(20 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"INSEQNO" VARCHAR2(20 CHAR), 
	"INDTE" DATE, 
	"INDEPTCD" CHAR(5 CHAR), 
	"INTRAVCD" CHAR(4 CHAR), 
	"INCONVCD" CHAR(4 CHAR), 
	"INCONVREGNO" VARCHAR2(20 CHAR), 
	"INTDTCD" VARCHAR2(4 CHAR), 
	"INTDTNO" VARCHAR2(20 CHAR), 
	"INTM6NO" VARCHAR2(20 CHAR), 
	"INVISATYPECDORG" CHAR(4 CHAR), 
	"INPERMITCD" CHAR(4 CHAR), 
	"INPERMITDTE" DATE, 
	"INPASSPORTDTE" DATE, 
	"INPASSPORTISU" VARCHAR2(60 CHAR), 
	"INPASSPORTEXPDTE" DATE, 
	"VISANO" VARCHAR2(20 CHAR), 
	"VISAISSUE" VARCHAR2(60 CHAR), 
	"VISADTE" DATE, 
	"VISABYRIGHTS" CHAR(1 CHAR), 
	"INCHKPOINTNO" VARCHAR2(10 CHAR), 
	"INCREUSR" VARCHAR2(20 CHAR), 
	"INCREDTE" DATE, 
	"INCREDTERM" VARCHAR2(30 CHAR), 
	"INUPDUSR" VARCHAR2(20 CHAR), 
	"INUPDDTE" DATE, 
	"INUPDTERM" VARCHAR2(30 CHAR), 
	"INPROCESSUSR" VARCHAR2(30 CHAR), 
	"INPROCESSDTE" DATE, 
	"INPROCESSTERM" VARCHAR2(30 CHAR), 
	"XTNDEPTCD" CHAR(5 CHAR), 
	"XTNADDRESS" VARCHAR2(60 CHAR), 
	"XTNTYPE" CHAR(2 CHAR), 
	"INPUTXTNDEPTCD" CHAR(5 CHAR), 
	"APPDTE" DATE, 
	"OUTSEQNO" VARCHAR2(20 CHAR), 
	"OUTDTE" DATE, 
	"OUTDEPTCD" CHAR(5 CHAR), 
	"OUTTRAVCD" CHAR(4 CHAR), 
	"OUTCONVCD" CHAR(4 CHAR), 
	"OUTCONVREGNO" VARCHAR2(20 CHAR), 
	"OUTTDTCD" VARCHAR2(4 CHAR), 
	"OUTTDTNO" VARCHAR2(20 CHAR), 
	"OUTTM6NO" VARCHAR2(20 CHAR), 
	"OUTVISATYPECDORG" CHAR(4 CHAR), 
	"OUTPERMITCD" CHAR(4 CHAR), 
	"OUTPERMITDTE" DATE, 
	"OUTPASSPORTDTE" DATE, 
	"OUTPASSPORTISU" VARCHAR2(60 CHAR), 
	"OUTPASSPORTEXPDTE" DATE, 
	"OUTCHKPOINTNO" VARCHAR2(10 CHAR), 
	"OUTCREUSR" VARCHAR2(20 CHAR), 
	"OUTCREDTE" DATE, 
	"OUTCREDTERM" VARCHAR2(30 CHAR), 
	"OUTUPDUSR" VARCHAR2(20 CHAR), 
	"OUTUPDDTE" DATE, 
	"OUTUPDTERM" VARCHAR2(30 CHAR), 
	"OUTPROCESSUSR" VARCHAR2(30 CHAR), 
	"OUTPROCESSDTE" DATE, 
	"OUTPROCESSTERM" VARCHAR2(30 CHAR), 
	"MATCHPROCESSUSR" VARCHAR2(30 CHAR), 
	"MATCHPROCESSDTE" DATE, 
	"MATCHPROCESSTERM" VARCHAR2(30 CHAR), 
	"TFSNDXNM" VARCHAR2(60 CHAR), 
	"TLSNDXNM" VARCHAR2(60 CHAR), 
	"TMSNDXNM" VARCHAR2(60 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"INVISAEXPDTE" DATE, 
	"OUTVISAEXPDTE" DATE, 
	"ININTYPE" CHAR(1 CHAR), 
	"OUTINTYPE" CHAR(1 CHAR), 
	"INTARGETNO" CHAR(6 CHAR), 
	"OUTTARGETNO" CHAR(6 CHAR), 
	"INREMARK" VARCHAR2(1000 CHAR), 
	"OUTREMARK" VARCHAR2(1000 CHAR), 
	"FLAGMATCH" CHAR(1 CHAR), 
	"INRESCERTNO" VARCHAR2(20 CHAR), 
	"OUTRESCERTNO" VARCHAR2(20 CHAR), 
	"INIMG" BLOB, 
	"OUTIMG" BLOB, 
	"EXTID" NUMBER(20,0), 
	"INPM_RE_ENTRY" VARCHAR2(20 CHAR), 
	"INPM_REEXPDTE" DATE, 
	"INPM_EXTENSION" VARCHAR2(20 CHAR), 
	"INPM_EXEXPDTE" DATE, 
	"INPM_NON_QUOTA" VARCHAR2(20 CHAR), 
	"INPM_NONEXPDTE" DATE, 
	"INSTATUS" CHAR(1 CHAR), 
	"INTM5_SEQNO" NUMBER, 
	"INTM2INOUT_SEQNO" NUMBER, 
	"OUTPM_RE_ENTRY" VARCHAR2(20 CHAR), 
	"OUTPM_REEXPDTE" DATE, 
	"OUTPM_EXTENSION" VARCHAR2(20 CHAR), 
	"OUTPM_EXEXPDTE" DATE, 
	"OUTPM_NON_QUOTA" VARCHAR2(20 CHAR), 
	"OUTPM_NONEXPDTE" DATE, 
	"OUTSTATUS" CHAR(1 CHAR), 
	"OUTTM5_SEQNO" NUMBER, 
	"OUTTM2INOUT_SEQNO" NUMBER, 
	"INCONV_SEQNO" NUMBER, 
	"INVISATYPE_SEQNO" NUMBER, 
	"INDEPT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"INPERMIT_SEQNO" NUMBER, 
	"OUTCONV_SEQNO" NUMBER, 
	"OUTVISATYPE_SEQNO" NUMBER, 
	"OUTDEPT_SEQNO" NUMBER, 
	"OUTPERMIT_SEQNO" NUMBER, 
	"INFLIGHTPREFIX" VARCHAR2(20 CHAR), 
	"INFLIGHTNUMBER" VARCHAR2(20 CHAR), 
	"OUTFLIGHTPREFIX" VARCHAR2(20 CHAR), 
	"OUTFLIGHTNUMBER" VARCHAR2(20 CHAR), 
	"CITIZENID" VARCHAR2(13 CHAR), 
	"PASS_SEQNO" NUMBER, 
	"INRPJSEQNO" NUMBER, 
	"OUTRPJSEQNO" NUMBER, 
	"INDEPTCDORG" CHAR(5 CHAR), 
	"OUTDEPTCDORG" CHAR(5 CHAR), 
	"TYPEDATA" VARCHAR2(20 CHAR), 
	"FLAGJOINPASS" CHAR(1 CHAR), 
	"FLAGFINES" CHAR(1 CHAR), 
	"INVISATYPECD" CHAR(4 CHAR), 
	"OUTVISATYPECD" CHAR(4 CHAR), 
	"SEND_FLAG" VARCHAR2(1 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302142C00091$$" ON "PIBICSDM2"."TMMAIN_PIBICS2011" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000302142C00092$$" ON "PIBICSDM2"."TMMAIN_PIBICS2011" (
  ;
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMMAIN_PIBICS2011" TO "BIOSAADM";
