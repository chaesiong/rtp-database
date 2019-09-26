CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."RPTADMIN3_L1" ("GROUP_ID", "DEPTTNM", "DEPT_SEQNO") AS 
  SELECT DISTINCT
          FW_GROUPUSER.GROUP_ID,
          CASE
             WHEN (get_RPTADMIN3 (GET_DEPTFROMUSERID (FW_GROUPUSER.USER_ID),
                                   'T'))
                     IS NULL
             THEN
                'ไม่มีหน่วยงาน'
             ELSE
                (get_RPTADMIN3 (GET_DEPTFROMUSERID (FW_GROUPUSER.USER_ID),
                                 'T'))
          END
             DEPTTNM,
          CASE
             WHEN GET_DEPTFROMUSERID (FW_GROUPUSER.USER_ID) IS NULL
             THEN
                '--' || FW_GROUPUSER.GROUP_ID
             ELSE
                GET_DEPTFROMUSERID (FW_GROUPUSER.USER_ID)
          END
             DEPT_SEQNO
     FROM FW_GROUPUSER;
