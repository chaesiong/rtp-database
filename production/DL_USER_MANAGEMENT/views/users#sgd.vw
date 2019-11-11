CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_USER_MANAGEMENT"."USERS#SGD" ("ID", "USERNAME", "FIRST_NAME", "LAST_NAME", "FIRST_NAME_THAI", "LAST_NAME_THAI", "DOB", "MAIL_ADDRESS", "PHONE_NUMBER", "NATIONAL_ID", "RANK", "DEPARTMENT_LEVEL_1", "DEPARTMENT_LEVEL_2", "DEPARTMENT_LEVEL_3", "POSITION", "STATE", "PW_HASH", "PW_SALT", "PW_ITERATION_COUNT", "PW_EXPIRATION_DATE", "PW_MUST_BE_CHANGED", "LOCALE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "ROW_FLAG_MASK", "TAG", "LAST_LOGIN", "BAD_PASSWORD_COUNT", "SET_EXPIRED", "OFFLINE_PIN") AS 
  select t0.ID
        ,t0.USERNAME
        ,t0.FIRST_NAME
        ,t0.LAST_NAME
        ,t0.FIRST_NAME_THAI
        ,t0.LAST_NAME_THAI
        ,t0.DOB
        ,t0.MAIL_ADDRESS
        ,t0.PHONE_NUMBER
        ,t0.NATIONAL_ID
        ,t0.RANK
        ,t0.DEPARTMENT_LEVEL_1
        ,t0.DEPARTMENT_LEVEL_2
        ,t0.DEPARTMENT_LEVEL_3
        ,t0.POSITION
        ,t0.STATE
        ,t0.PW_HASH
        ,t0.PW_SALT
        ,t0.PW_ITERATION_COUNT
        ,t0.PW_EXPIRATION_DATE
        ,t0.PW_MUST_BE_CHANGED
        ,t0.LOCALE
        ,t0.INS_AT
        ,t0.INS_BY
        ,t0.DML_AT
        ,t0.DML_BY
        ,t0.DML_TYPE
        ,t0.ROW_FLAG_MASK
        ,t0.TAG
        ,t1.LAST_LOGIN
        ,t1.BAD_PASSWORD_COUNT
        ,t1.SET_EXPIRED
        ,t1.OFFLINE_PIN
    from USERS t0
    left join USERS$SGD t1
      on t0.ID = t1.ID;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "DL_INTERFACE";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_USER_MANAGEMENT"."USERS#SGD" TO "BIOSAADM";
