CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWFS_FINES_ZONE" ("ZONE_SEQNO", "SYSTEM_CODE", "ZONENM", "REMARK", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "DEPT_SEQNO", "ACTFLAG", "ADDR", "TELNO", "QEXT_ACTFLAG", "QEXT_TYPE", "QEXT_NOTE", "QREPS_ACTFLAG", "QREPS_TYPE", "QREPS_NOTE") AS 
  select "ZONE_SEQNO","SYSTEM_CODE","ZONENM","REMARK","CREATE_BY","CREATE_DATE","UPDATE_BY","UPDATE_DATE","VERSION","DEPT_SEQNO","ACTFLAG","ADDR","TELNO","QEXT_ACTFLAG","QEXT_TYPE","QEXT_NOTE","QREPS_ACTFLAG","QREPS_TYPE","QREPS_NOTE" from zone where zone_seqno in (
select ZONE_SEQNO from mappingip where ZONE_SEQNO is not null
group by ZONE_SEQNO
union all
select FNZONE_SEQNO ZONE_SEQNO from mappingip where FNZONE_SEQNO is not null
group by FNZONE_SEQNO
union all
select REPSZONE_SEQNO ZONE_SEQNO from mappingip where REPSZONE_SEQNO is not null
group by REPSZONE_SEQNO
union all
select INOUTZONE_SEQNO ZONE_SEQNO from mappingip where INOUTZONE_SEQNO is not null
group by INOUTZONE_SEQNO
)
and  ACTFLAG = 'Y';
  GRANT SELECT ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWFS_FINES_ZONE" TO "BIOSAADM";
