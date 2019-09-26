CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWFWPERSONONEDIT" ("PERSON_GEN", "PERSON_NAME", "PERSON_ID", "POSLEVEL_GEN", "BIRTHDATE", "ORG_GEN", "ORG_CODE", "ORG_NAME", "USER_ID") AS 
  SELECT   HR_PROFILE.PROFILE_SEQNO PERSON_GEN,
                 GET_RANKNAME (HR_PROFILE.RANK_SEQNO, 'A')
              || ' '
              || HR_PROFILE.NAME
              || ' '
              || HR_PROFILE.SNAME
                 PERSON_NAME,
              HR_PROFILE.CARD_ID PERSON_ID,
              HR_PROFILE.LEVEL_SEQNO POSLEVEL_GEN,
              HR_PROFILE.BIRTH_DATE BIRTHDATE,
              DEPARTMENT.DEPT_SEQNO ORG_GEN,
              DEPARTMENT.DEPTCD ORG_CODE,
              decode(GET_DEPTABBRNM3LEVEL (DEPARTMENT.DEPT_SEQNO, ' '), null, PIBICS.get_DeptName(DEPARTMENT.DEPT_SEQNO, 'T'), GET_DEPTABBRNM3LEVEL (DEPARTMENT.DEPT_SEQNO, ' '))  ORG_NAME,
              FW_USER.USER_ID
       FROM         HR_PROFILE
                 INNER JOIN
                    DEPARTMENT
                 ON (DEPARTMENT.DEPT_SEQNO = HR_PROFILE.DEPT_SEQNO)
              INNER JOIN
                 FW_USER
              ON (FW_USER.PERSON_ID = HR_PROFILE.PROFILE_SEQNO)
      WHERE   HR_PROFILE.PROFILE_SEQNO IN (SELECT   PERSON_ID
                                             FROM   FW_USER
                                            WHERE   PERSON_ID IS NOT NULL)
   ORDER BY   PERSON_NAME;
