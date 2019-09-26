CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWRPTUSERPIBICSCENTER" ("SYSTEM_NAME", "ROLE_SEQ", "USER_ID") AS 
  select "SYSTEM_NAME","ROLE_SEQ","USER_ID" from (
SELECT role_description SYSTEM_NAME, role_seq, a.user_id
       FROM fw_user a,
            fw_groupuser b,
            fw_group c,
            fw_role_memberlist d,
            fw_role e
      WHERE     a.user_id = b.user_id
            AND b.GROUP_ID = c.GROUP_ID
            AND c.GROUP_ID = d.GROUP_ID
            AND d.role_id = e.role_id 
   GROUP BY role_description, role_seq, a.user_id
   ORDER BY role_seq ASC) where SYSTEM_NAME is not null;
