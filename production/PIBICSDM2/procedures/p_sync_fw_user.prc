CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_SYNC_FW_USER" 
IS

var_rows NUMBER;

BEGIN
    
 MERGE INTO PIBICSDM2.FW_USER DM
  USING (SELECT F.* FROM PIBICS.FW_USER@PIBICS_PROD F
    WHERE UPPER(F.USER_ID) NOT IN (SELECT USER_ID FROM PIBICSDM2.FW_USER WHERE USER_ID LIKE '%.%')
    AND F.USER_ID LIKE '%.%' 
    ) P
  ON (DM.USER_ID = P.USER_ID)
 WHEN NOT MATCHED 
 THEN 
  INSERT (     DM.USER_ID,
     DM.USERNAME,
     DM.PASSWORD,
     DM.INITIALDATE,
     DM.EXPIREDATE,
     DM.EMAIL,
     DM.DISABLE,
     DM.USER_LEVEL,
     DM.USER_FLAG,
     DM.DEP_CODE,
     DM.UPD_USERID,
     DM.PERSON_ID,
     DM.LASTUPDATE,
     DM.TEL,
     DM.CHGPWDDATE,
     DM.PWDRPT,
     DM.MOBILE,
     DM.REMARK) 
  VALUES (     P.USER_ID,
     P.USERNAME,
     P.PASSWORD,
     P.INITIALDATE,
     P.EXPIREDATE,
     P.EMAIL,
     P.DISABLE,
     P.USER_LEVEL,
     P.USER_FLAG,
     P.DEP_CODE,
     P.UPD_USERID,
     P.PERSON_ID,
     P.LASTUPDATE,
     P.TEL,
     P.CHGPWDDATE,
     P.PWDRPT,
     P.MOBILE,
     P.REMARK);
     
 var_rows := SQL%ROWCOUNT;
 
 INSERT INTO IMPORT_LOG
  VALUES ('SYNC_FW_USER', var_rows, SYSDATE);
      
 COMMIT;
  
END P_SYNC_FW_USER;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_SYNC_FW_USER" TO "BIOSAADM";
