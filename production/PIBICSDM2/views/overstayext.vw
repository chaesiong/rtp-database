CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."OVERSTAYEXT" ("EXTOVS_SEQNO", "EXT_DATE", "DOCNO", "CPASSPORTNO", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "SEX", "BIRTH_DATE", "YEAROFDOB", "AGE", "NATION_SEQNO", "NATIONTNM", "NATIONENM", "PERMIT_DATE", "BUILDING", "ADDR", "ROAD", "PV_SEQNO", "PROVINCETNM", "PROVINCEENM", "AMP_SEQNO", "AMPURTNM", "AMPURENM", "TMB_SEQNO", "TAMBONTNM", "TAMBONENM", "TEL", "DEPTLEVEL1", "DEPTABBLEVEL1", "DEPTLEVEL2", "DEPTABBLEVEL2", "UDEPT_SEQNO", "DEPTABBLEVEL3", "REASON_SEQNO", "REASONEXTTNM", "CREUSRNAME", "CREATE_DATE") AS 
  SELECT extovs_seqno,
          ext_date,
          docno,
          cpassportno,
          efamilynm,
          efirstnm,
          emiddlenm,
          sex,
          birth_date,
          yearofdob,
          get_Age (birth_date) age,
          nation_seqno,
          get_nationnm (nation_seqno, 'T') nationtnm,
          get_nationnm (nation_seqno, 'E') nationenm,
          permit_date,
          building,
          addr,
          road,
          pv_seqno,
          get_provincebyseqno (pv_seqno, 'D') provincetnm,
          get_provincebyseqno (pv_seqno, 'E') provinceenm,
          amp_seqno,
          get_ampurbyseqno (amp_seqno, 'D') ampurtnm,
          get_ampurbyseqno (amp_seqno, 'E') ampurenm,
          tmb_seqno,
          get_tambonbyseqno (tmb_seqno, 'D') tambontnm,
          get_tambonbyseqno (tmb_seqno, 'E') tambonenm,
          tel,
          deptlevel1,
          get_deptabblevel1 (udept_seqno, 'T') deptabblevel1,
          deptlevel2,
          get_deptabblevel2 (udept_seqno, 'T') deptabblevel2,
          udept_seqno,
          get_deptabblevel3 (udept_seqno, 'T') deptabblevel3,
          a.reason_seqno,
          c.reasonexttnm,
          get_hrprofilefull (a.create_by) creusrname,
          a.create_date
     FROM processot a, departmentlevel b, ext_reason c
    WHERE a.udept_seqno = b.deptseq AND a.reason_seqno = c.reason_seqno;
   COMMENT ON TABLE "PIBICSDM2"."OVERSTAYEXT"  IS 'ตารางข้อมูลคนอยู่เกินฯ (กรณีขออยู่ต่อ)';
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYEXT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYEXT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYEXT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYEXT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."OVERSTAYEXT" TO "BIOSAADM";
