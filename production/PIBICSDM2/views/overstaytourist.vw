CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."OVERSTAYTOURIST" ("TMOVSSEQNO", "TM6NO", "TDTNO", "INOUTDTE", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "SEX", "BIRTHDTE", "YEAROFDOB", "AGE", "COUNT_SEQNO", "NATION", "VISATYPE_SEQNO", "VISA", "VISAEXPDTE", "LASTPERMITDTE", "DEPTLEVEL1", "DEPTABBLEVEL1", "DEPTLEVEL2", "DEPTABBLEVEL2", "DEPT_SEQNO", "DEPTABBLEVEL3", "CONV_SEQNO", "CONVNM", "CONVREGNO", "CREUSRNM", "CREDTE", "BUILDING", "ADDR", "ROAD", "PV_SEQNO", "PROVINCETNM", "PROVINCEENM", "AMP_SEQNO", "AMPURTNM", "AMPURENM", "TMB_SEQNO", "TAMBONTNM", "TAMBONENM", "TEL") AS 
  select tmovsseqno, tm6no, tdtno, inoutdte, efamilynm, efirstnm, emiddlenm, sex, birthdte, yearofdob, get_age(birthdte) age, count_seqno, get_nationnm(count_seqno, 'T') nation, 
visatype_seqno, get_visatypesbyseq(visatype_seqno, 'T') visa, visaexpdte, lastpermitdte, deptlevel1, get_deptabblevel1(deptlevel1, 'T') deptabblevel1, deptlevel2, get_deptabblevel2(deptlevel2, 'T') deptabblevel2, 
dept_seqno, get_deptabblevel3(dept_seqno, 'T') deptabblevel3, conv_seqno, get_conveyancesseqno(conv_seqno, 'T') convnm, convregno,
case when updusr is not null then get_hrprofilefull(updusr) when update_by is not null then get_hrprofilefull(update_by) end as creusrnm,
case when upddte is not null then to_char(upddte, 'dd/MM/yyyy HH24:MI') when update_date is not null then to_char(update_date, 'dd/MM/yyyy HH24:MI') end as credte,
building, addr, road, pv_seqno, get_provincebyseqno(pv_seqno, 'D') provincetnm, get_provincebyseqno(pv_seqno, 'E') provinceenm, amp_seqno, get_ampurbyseqno(amp_seqno, 'D') ampurtnm, 
get_ampurbyseqno(amp_seqno, 'E') ampurenm, tmb_seqno, get_tambonbyseqno(tmb_seqno, 'D') tambontnm, get_tambonbyseqno(tmb_seqno, 'E') tambonenm, tel
from processfines a, departmentlevel b
where a.dept_seqno = b.deptseq;
   COMMENT ON TABLE "PIBICSDM2"."OVERSTAYTOURIST"  IS 'ตารางข้อมูลคนอยู่เกินฯ (นักท่องเที่ยว)';
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYTOURIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYTOURIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYTOURIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."OVERSTAYTOURIST" TO "BIOSAADM";
