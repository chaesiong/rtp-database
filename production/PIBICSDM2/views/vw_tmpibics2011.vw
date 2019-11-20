CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_TMPIBICS2011" ("CARDTYPE", "TMRUNNO", "PERSONID", "IMGINOUT", "EFULLNAME", "SEX", "NATIONCD", "NATIONENM", "BIRTHDTE", "DEPTCD", "DEPTTNM", "EFIRSTNM", "EFAMILYNM", "EMIDDLENM", "TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "TFSNDXNM", "TMSNDXNM", "TLSNDXNM", "EFSNDXNM", "ELSNDXNM", "EMSNDXNM", "TDTNO", "TM6NO", "SEQNO", "CONVREGNO", "CONVCD", "INOUTDTE", "PM_EXTENSION", "TRAVCD", "VISATYPE_SEQNO", "VISATYPECD", "VISATYPETNM", "VISAEXPDTE", "FLAGMATCH", "FLAGDEAD", "INOUTDATE", "DEPT_SEQNO", "FLIGHTPREFIX", "FLIGHTNUMBER", "REMARK", "TDTCD", "TYPEDATA", "PERMITCD", "PERMITDTE", "PERMIT_SEQNO", "TMINOUTDTE", "PASSPORTDTE", "PASSPORTEXPDTE", "CREUSR", "CREDTE", "CREDTERM", "UPDUSR", "UPDDTE", "UPDTERM", "RESCERTNO", "FLAGJOINPASS", "DEPTL2TNM", "COUNT_SEQNO", "CONV_SEQNO", "TYPEENQ", "CHKPOINTNO") AS 
  SELECT '1' cardtype,
          tmrunno,
          personid,
          inimg imginout,
          efirstnm || ' ' || emiddlenm || ' ' || efamilynm AS efullname,
          sex,
          nationcd,
          get_Nationnm (nationcd, 'E') nationenm,
          birthdte,
          indeptcd deptcd,
          get_Departments (indeptcd, 'T') depttnm,
          efirstnm,
          efamilynm,
          emiddlenm,
          tfirstnm,
          tmiddlenm,
          tfamilynm,
          tfsndxnm,
          tmsndxnm,
          tlsndxnm,
          efsndxnm,
          elsndxnm,
          emsndxnm,
          intdtno tdtno,
          intm6no tm6no,
          inseqno seqno,
          inconvregno convregno,
          inconvcd convcd,
          TRIM (
             TO_CHAR (indte, 'dd/mm/yyyy') || ' '
             || DECODE (TO_CHAR (indte, 'hh24:mi'),
                        '00:00', NULL,
                        TO_CHAR (indte, 'hh24:mi')))
             inoutdte,
          inpm_extension pm_extension,
          intravcd travcd,
          invisatype_seqno visatype_seqno,
          invisatypecd visatypecd,
          get_visatypes (invisatypecd, 'T') visatypetnm,
          invisaexpdte visaexpdte,
          DECODE (outdte, NULL, '', 'MATCH') flagmatch,
          flagmatch flagdead,
          indte inoutdate,
          indept_seqno dept_seqno,
          inflightprefix flightprefix,
          inflightnumber flightnumber,
          inremark remark,
          intdtcd tdtcd,
          get_Typedata (typedata) typedata,
          inpermitcd permitcd,
          inpermitdte permitdte,
          inpermit_seqno permit_seqno,
          TO_CHAR (indte, 'yyyy-mm-dd hh24:mi:ss.sssssss') tminoutdte,
          inpassportdte passportdte,
          inpassportexpdte passportexpdte,
          increusr creusr,
          incredte credte,
          incredterm credterm,
          inupdusr updusr,
          inupddte upddte,
          inupdterm updterm,
          inrescertno rescertno,
          flagjoinpass,
          get_DeptAbbnnmUnderL2 (get_deptseqno (indeptcd), 'T') deptl2tnm,
          count_seqno,
          inconv_seqno conv_seqno,
          'TMMAIN' typeenq,
          inchkpointno chkpointno
     FROM tmmain_pibics2011
    WHERE indte IS NOT NULL
   UNION ALL
   SELECT '2' cardtype,
          tmrunno,
          personid,
          outimg imginout,
          efirstnm || ' ' || emiddlenm || ' ' || efamilynm AS efullname,
          sex,
          nationcd,
          get_Nationnm (nationcd, 'E') nationenm,
          birthdte,
          outdeptcd deptcd,
          get_Departments (outdeptcd, 'T') depttnm,
          efirstnm,
          efamilynm,
          emiddlenm,
          tfirstnm,
          tmiddlenm,
          tfamilynm,
          tfsndxnm,
          tlsndxnm,
          tmsndxnm,
          efsndxnm,
          elsndxnm,
          emsndxnm,
          outtdtno tdtno,
          outtm6no tm6no,
          outseqno seqno,
          outconvregno convregno,
          outconvcd convcd,
          TRIM (
             TO_CHAR (outdte, 'dd/mm/yyyy') || ' '
             || DECODE (TO_CHAR (outdte, 'hh24:mi'),
                        '00:00', NULL,
                        TO_CHAR (outdte, 'hh24:mi')))
             inoutdte,
          outpm_extension pm_extension,
          outtravcd travcd,
          outvisatype_seqno visatype_seqno,
          outvisatypecd visatypecd,
          get_visatypes (outvisatypecd, 'T') visatypetnm,
          outvisaexpdte visaexpdte,
          DECODE (indte, NULL, '', 'MATCH') flagmatch,
          flagmatch flagdead,
          outdte inoutdate,
          outdept_seqno dept_seqno,
          outflightprefix flightprefix,
          outflightnumber flightnumber,
          outremark remark,
          outtdtcd tdtcd,
          get_Typedata (typedata) typedata,
          outpermitcd permitcd,
          outpermitdte permitdte,
          outpermit_seqno permit_seqno,
          TO_CHAR (outdte, 'yyyy-mm-dd hh24:mi:ss.sssssss') tminoutdte,
          outpassportdte passportdte,
          outpassportexpdte passportexpdte,
          outcreusr creusr,
          outcredte credte,
          outcredterm credterm,
          outupdusr updusr,
          outupddte upddte,
          outupdterm updterm,
          outrescertno rescertno,
          flagjoinpass,
          get_DeptAbbnnmUnderL2 (get_deptseqno (outdeptcd), 'T') deptl2tnm,
          count_seqno,
          outconv_seqno conv_seqno,
          'TMMAIN' typeenq,
          outchkpointno chkpointno
     FROM tmmain_pibics2011
    WHERE outdte IS NOT NULL;
  GRANT SELECT ON "PIBICSDM2"."VW_TMPIBICS2011" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_TMPIBICS2011" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_TMPIBICS2011" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_TMPIBICS2011" TO "BIOSAADM";
