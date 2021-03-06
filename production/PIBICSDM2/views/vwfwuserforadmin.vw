CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWFWUSERFORADMIN" ("USER_ID", "USERNAME", "DEPT_SEQNO") AS 
  SELECT FW_USER.USER_ID,RANK.RANKNM||' '||HR_PROFILE.NAME||' '||HR_PROFILE.SNAME AS USERNAME, HR_PROFILE.DEPT_SEQNO
       FROM    FW_USER
            INNER JOIN
               HR_PROFILE
            ON (FW_USER.PERSON_ID = HR_PROFILE.PROFILE_SEQNO
                AND DEPT_SEQNO IS NOT NULL)
            INNER JOIN 
                RANK 
            ON(RANK.RANK_SEQNO = HR_PROFILE.RANK_SEQNO)
      WHERE 1 = 1
            AND USER_ID IN (SELECT USER_ID
                              FROM FW_GROUPUSER
                             WHERE GROUP_ID NOT IN (0, 15, 16))
   ORDER BY USER_ID;
  GRANT SELECT ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWFWUSERFORADMIN" TO "BIOSAADM";
