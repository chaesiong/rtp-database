CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_CHKFWUSERSTAFF" ("USER_ID", "USERNAME", "PASSWORD", "CARD_ID", "NAME", "SNAME") AS 
  SELECT f.user_id,
          f.username,
          f.password,
          h.card_id,
          h.name,
          h.sname
     FROM fw_user f, hr_profile h
    WHERE f.person_id = H.PROFILE_SEQNO AND h.LEVEL_SEQNO <= 12
    union
   SELECT f.user_id,
          f.username,
          f.password,
          h.card_id,
          h.name,
          h.sname
     FROM fw_user f, hr_profile h
    WHERE f.person_id = H.PROFILE_SEQNO AND DEPT_SEQNO=14 and f.user_id in (select user_id from fw_groupuser where group_id='91');
