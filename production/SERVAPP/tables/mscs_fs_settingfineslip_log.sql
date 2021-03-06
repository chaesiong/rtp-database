CREATE TABLE "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" 
   (	"FSSETFINESLOG_SEQNO" NUMBER NOT NULL ENABLE, 
	"IPADDRESS" VARCHAR2(15 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"COUNTERNM" VARCHAR2(50 CHAR), 
	"SLIPNUM" NUMBER(38,0), 
	"MAXSLIPNO" VARCHAR2(10 CHAR), 
	"MAXSLIPBOOKNO" VARCHAR2(10 CHAR), 
	"PRATE_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER(10,0)
   ) ;
  GRANT SELECT ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_FS_SETTINGFINESLIP_LOG" TO "BIOSAADM";
