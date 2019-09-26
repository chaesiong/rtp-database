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
