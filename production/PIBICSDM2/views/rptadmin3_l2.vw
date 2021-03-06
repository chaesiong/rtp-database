CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."RPTADMIN3_L2" ("FULLNAME", "DEPT_SEQNO", "GROUP_ID") AS 
  SELECT DISTINCT
          (CASE
              WHEN GET_NAMEFULLNAME (
                      GET_HRFROMUSERID (FW_GROUPUSER.USER_ID, 'B'))
                      IS NULL
              THEN
                 (SELECT USERNAME
                    FROM FW_USER
                   WHERE USER_ID = FW_GROUPUSER.USER_ID)
              ELSE
                 (GET_NAMEFULLNAME (
                     GET_HRFROMUSERID (FW_GROUPUSER.USER_ID, 'B')))
           END)
             FULLNAME,
          CASE
             WHEN GET_DEPTFROMUSERID (FW_GROUPUSER.USER_ID) IS NULL
             THEN
                '--' || TO_CHAR (FW_GROUPUSER.GROUP_ID)
             ELSE
                GET_DEPTFROMUSERID (FW_GROUPUSER.USER_ID)
          END
             DEPT_SEQNO, FW_GROUPUSER.GROUP_ID
     FROM FW_GROUPUSER;
  GRANT SELECT ON "PIBICSDM2"."RPTADMIN3_L2" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RPTADMIN3_L2" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RPTADMIN3_L2" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."RPTADMIN3_L2" TO "BIOSAADM";
