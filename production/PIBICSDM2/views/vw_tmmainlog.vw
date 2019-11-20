CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_TMMAINLOG" ("CARDTYPE", "TMRUNNO", "TMMAINLOGID", "PERSONID", "IMGINOUT", "EFULLNAME", "SEX", "NATIONCD", "NATIONENM", "BIRTHDTE", "DEPTCD", "DEPTTNM", "EFIRSTNM", "EFAMILYNM", "EMIDDLENM", "TFIRSTNM", "TMIDDLENM", "TFAMILYNM", "TFSNDXNM", "TLSNDXNM", "EFSNDXNM", "ELSNDXNM", "EMSNDXNM", "TDTNO", "TM6NO", "SEQNO", "CONVREGNO", "CONVCD", "INOUTDTE", "TRAVCD", "VISATYPECD", "VISAEXPDTE", "DEPT_SEQNO", "LOGFLAG", "LOGDTE", "LOGUSERID", "TYPEDATA", "PERMITCD", "PERMITDTE", "FLAGMATCH") AS 
  SELECT '1' cardtype,
          tmrunno,
          TMMAINLOGID,
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
          tlsndxnm,
          efsndxnm,
          elsndxnm,
          emsndxnm,
          intdtno tdtno,
          intm6no tm6no,
          inseqno seqno,
          inconvregno convregno,
          inconvcd convcd,
          indte inoutdte,
          intravcd travcd,
          invisatypecd visatypecd,
          invisaexpdte visaexpdte,
          indept_seqno dept_seqno,
          LOGFLAG LOGFLAG,
          LOGDTE LOGDTE,
          LOGUSERID LOGUSERID,
          get_Typedata (typedata) typedata,
          inpermitcd permitcd,
          inpermitdte permitdte,
          flagmatch
     FROM tmmainlog
    WHERE indte IS NOT NULL AND logflag <> 'O'
   UNION ALL
   SELECT '2' cardtype,
          tmrunno,
          TMMAINLOGID,
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
          efsndxnm,
          elsndxnm,
          emsndxnm,
          outtdtno tdtno,
          outtm6no tm6no,
          outseqno seqno,
          outconvregno convregno,
          outconvcd convcd,
          outdte inoutdte,
          outtravcd travcd,
          outvisatypecd visatypecd,
          outvisaexpdte visaexpdte,
          outdept_seqno dept_seqno,
          LOGFLAG LOGFLAG,
          LOGDTE LOGDTE,
          LOGUSERID LOGUSERID,
          get_Typedata (typedata) typedata,
          outpermitcd permitcd,
          outpermitdte permitdte,
          flagmatch
     FROM tmmainlog
    WHERE outdte IS NOT NULL AND logflag <> 'O';
   COMMENT ON TABLE "PIBICSDM2"."VW_TMMAINLOG"  IS 'ตารางวิว Log ข้อมูลการเดินทางเข้า-ออกราชณาจักร';
  GRANT SELECT ON "PIBICSDM2"."VW_TMMAINLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_TMMAINLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_TMMAINLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_TMMAINLOG" TO "BIOSAADM";
