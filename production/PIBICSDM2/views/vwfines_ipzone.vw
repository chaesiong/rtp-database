CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWFINES_IPZONE" ("ZONE_SEQNO", "IPADDRESS", "DEPT_SEQNO") AS 
  select zone_seqno, ipaddress, dept_seqno from (
select zone_seqno, ipaddress, dept_seqno from mappingip a where zone_seqno is not null group by zone_seqno, ipaddress, dept_seqno
union all
select fnzone_seqno zone_seqno, ipaddress, dept_seqno from mappingip where fnzone_seqno is not null group by fnzone_seqno, ipaddress, dept_seqno
) group by zone_seqno, ipaddress, dept_seqno;
