CREATE MATERIALIZED VIEW "PIBICSDM2"."HR_PROFILE_PIBICS" ("PROFILE_SEQNO", "PID", "RANK_SEQNO", "LEVEL_SEQNO", "REL_SEQNO", "TITLE_SEQNO", "CARD_ID", "NAME", "SNAME", "SEX", "C_TYPE", "MAR_STATUS", "STATUS_SEQNO", "BIRTH_DATE", "POS_SEQNO", "KP7", "RETIRE_DATE", "SIXTY_DATE", "QUIT_DATE", "BANK_SEQNO", "ACC_NO", "ADDRESS1", "ADDRESS2", "PROV_CODE", "POST_CODE", "TEL", "MOBILE", "EMAIL", "HEALTH_BENEFIT", "CREMATION", "CREATE_BY", "CREATE_DATE", "UPDATE_BY", "UPDATE_DATE", "VERSION", "DEPT_SEQNO", "POS_DATE", "POS_NO", "STATUS_TM", "DEPTPOLIS_SEQNO", "PD_SEQNO", "SHIFT_SEQNO")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_PIBICSDM" 
  BUILD IMMEDIATE
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_PIBICSDM" 
  REFRESH COMPLETE ON DEMAND NEXT null
  WITH PRIMARY KEY USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS SELECT "HR_PROFILE"."PROFILE_SEQNO" "PROFILE_SEQNO","HR_PROFILE"."PID" "PID","HR_PROFILE"."RANK_SEQNO" "RANK_SEQNO","HR_PROFILE"."LEVEL_SEQNO" "LEVEL_SEQNO","HR_PROFILE"."REL_SEQNO" "REL_SEQNO","HR_PROFILE"."TITLE_SEQNO" "TITLE_SEQNO","HR_PROFILE"."CARD_ID" "CARD_ID","HR_PROFILE"."NAME" "NAME","HR_PROFILE"."SNAME" "SNAME","HR_PROFILE"."SEX" "SEX","HR_PROFILE"."C_TYPE" "C_TYPE","HR_PROFILE"."MAR_STATUS" "MAR_STATUS","HR_PROFILE"."STATUS_SEQNO" "STATUS_SEQNO","HR_PROFILE"."BIRTH_DATE" "BIRTH_DATE","HR_PROFILE"."POS_SEQNO" "POS_SEQNO","HR_PROFILE"."KP7" "KP7","HR_PROFILE"."RETIRE_DATE" "RETIRE_DATE","HR_PROFILE"."SIXTY_DATE" "SIXTY_DATE","HR_PROFILE"."QUIT_DATE" "QUIT_DATE","HR_PROFILE"."BANK_SEQNO" "BANK_SEQNO","HR_PROFILE"."ACC_NO" "ACC_NO","HR_PROFILE"."ADDRESS1" "ADDRESS1","HR_PROFILE"."ADDRESS2" "ADDRESS2","HR_PROFILE"."PROV_CODE" "PROV_CODE","HR_PROFILE"."POST_CODE" "POST_CODE","HR_PROFILE"."TEL" "TEL","HR_PROFILE"."MOBILE" "MOBILE","HR_PROFILE"."EMAIL" "EMAIL","HR_PROFILE"."HEALTH_BENEFIT" "HEALTH_BENEFIT","HR_PROFILE"."CREMATION" "CREMATION","HR_PROFILE"."CREATE_BY" "CREATE_BY","HR_PROFILE"."CREATE_DATE" "CREATE_DATE","HR_PROFILE"."UPDATE_BY" "UPDATE_BY","HR_PROFILE"."UPDATE_DATE" "UPDATE_DATE","HR_PROFILE"."VERSION" "VERSION","HR_PROFILE"."DEPT_SEQNO" "DEPT_SEQNO","HR_PROFILE"."POS_DATE" "POS_DATE","HR_PROFILE"."POS_NO" "POS_NO","HR_PROFILE"."STATUS_TM" "STATUS_TM","HR_PROFILE"."DEPTPOLIS_SEQNO" "DEPTPOLIS_SEQNO","HR_PROFILE"."PD_SEQNO" "PD_SEQNO","HR_PROFILE"."SHIFT_SEQNO" "SHIFT_SEQNO" FROM "PIBICS"."HR_PROFILE"@"PIBICS_PROD" "HR_PROFILE";
   COMMENT ON MATERIALIZED VIEW "PIBICSDM2"."HR_PROFILE_PIBICS"  IS 'snapshot table for snapshot PIBICSDM2.HR_PROFILE_PIBICS';
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C_SNAP$_222HR_PROFILE_PK" ON "PIBICSDM2"."HR_PROFILE_PIBICS" ("PROFILE_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."HR_PROFILE_PIBICS" TO "BIOSAADM";
