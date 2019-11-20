CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEW_IN_TR15" ("INTDTNO", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "SEX", "NATIONNM", "BIRTHDTE", "INDATE", "VISATYPE", "INTM6NO", "INCONVREGNO", "DEPT", "CRESER", "INCREDTE", "INCREDTERM", "CHECKPOINTNO", "OUTDATE", "EXTDATE", "PERMITDATE", "INDATESTR", "INDTE") AS 
  select intdtno,efamilynm,efirstnm,emiddlenm,decode(sex,'F','หญิง','M','ชาย','') sex,get_Nationnm(nationcd,'T') Nationnm,birthdte birthdte,  trim (to_char (indte, 'dd/mm/yyyy') || ' ' || decode (to_char (indte, 'hh24:mi'), '00:00', null, to_char (indte, 'hh24:mi'))) indate,
get_visatypes(invisatypecd,'T') visatype,intm6no,inconvregno, get_deptall(indept_seqno,'C') dept,get_HrProfilefull(increusr) creser,
trim (to_char (incredte, 'dd/mm/yyyy') || ' ' || decode (to_char (incredte, 'hh24:mi'), '00:00', null, to_char (incredte, 'hh24:mi'))) incredte, incredterm,
get_countername(incredterm) checkpointno,  
trim (to_char (get_outdatebytmonline(intdtno,intm6no,count_seqno,to_char(indte,'yyyymmdd')) , 'dd/mm/yyyy') || ' ' || 
decode (to_char (get_outdatebytmonline(intdtno,intm6no,count_seqno,to_char(indte,'yyyymmdd')) , 'hh24:mi'), '00:00', null, 
to_char (get_outdatebytmonline(intdtno,intm6no,count_seqno,to_char(indte,'yyyymmdd')) , 'hh24:mi')))  outdate,
to_char (get_extdatebyext(intdtno,count_seqno,to_char(indte,'yyyymmdd')) , 'dd/mm/yyyy')  extdate, 
to_char (get_permitdatebyext(intdtno,count_seqno,to_char(indte,'yyyymmdd')) , 'dd/mm/yyyy')   permitdate,
to_number(trim (to_char (indte, 'yyyymmdd') || decode (to_char (indte, 'hh24mi'), '0000', null, to_char (indte, 'hh24mi'))))  indateStr,indte
from tmmain 
where to_char(indte,'yyyymmdd') between to_char(sysdate-30,'yyyymmdd') and  to_char(sysdate,'yyyymmdd') 
and nationcd like '%I02%' 
and indept_seqno in (select dept_seqno from department where dept_seqno = 16 or rel_code = 16 or rel_code in (select dept_seqno from department where rel_code = 16))
and invisatype_seqno =23;
  GRANT SELECT ON "PIBICSDM2"."VIEW_IN_TR15" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VIEW_IN_TR15" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VIEW_IN_TR15" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VIEW_IN_TR15" TO "BIOSAADM";
