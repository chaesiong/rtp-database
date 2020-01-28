CREATE TABLE "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" 
   (	"FSETFEESLOG_SEQNO" NUMBER NOT NULL ENABLE, 
	"IPADDRESS" VARCHAR2(15 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"COUNTERNM" VARCHAR2(50 CHAR), 
	"SLIPNUM" NUMBER(38,0), 
	"MAXSLIPNO" VARCHAR2(10 CHAR), 
	"MAXSLIPBOOKNO" VARCHAR2(10 CHAR), 
	"PRATE_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER(10,0)
   ) 
  PARTITION BY RANGE ("CREATE_DATE") INTERVAL (NUMTOYMINTERVAL(1,'MONTH')) STORE IN ("TS_SERV_NL_LOG") 
 (PARTITION "P202001"  VALUES LESS THAN (TIMESTAMP' 2020-02-01 00:00:00') , 
 PARTITION "P202002"  VALUES LESS THAN (TIMESTAMP' 2020-03-01 00:00:00') , 
 PARTITION "P202003"  VALUES LESS THAN (TIMESTAMP' 2020-04-01 00:00:00') , 
 PARTITION "P202004"  VALUES LESS THAN (TIMESTAMP' 2020-05-01 00:00:00') , 
 PARTITION "P202005"  VALUES LESS THAN (TIMESTAMP' 2020-06-01 00:00:00') , 
 PARTITION "P202006"  VALUES LESS THAN (TIMESTAMP' 2020-07-01 00:00:00') , 
 PARTITION "P202007"  VALUES LESS THAN (TIMESTAMP' 2020-08-01 00:00:00') , 
 PARTITION "P202008"  VALUES LESS THAN (TIMESTAMP' 2020-09-01 00:00:00') , 
 PARTITION "P202009"  VALUES LESS THAN (TIMESTAMP' 2020-10-01 00:00:00') , 
 PARTITION "P202010"  VALUES LESS THAN (TIMESTAMP' 2020-11-01 00:00:00') , 
 PARTITION "P202011"  VALUES LESS THAN (TIMESTAMP' 2020-12-01 00:00:00') , 
 PARTITION "P202012"  VALUES LESS THAN (TIMESTAMP' 2021-01-01 00:00:00') ) ;
  CREATE INDEX "SERVAPP"."MSCS_FS_SETTING_LOG_IDX01" ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" ("CREATE_DATE") 
   LOCAL
 (PARTITION "P202001" , 
 PARTITION "P202002" , 
 PARTITION "P202003" , 
 PARTITION "P202004" , 
 PARTITION "P202005" , 
 PARTITION "P202006" , 
 PARTITION "P202007" , 
 PARTITION "P202008" , 
 PARTITION "P202009" , 
 PARTITION "P202010" , 
 PARTITION "P202011" , 
 PARTITION "P202012" ) ;
CREATE UNIQUE INDEX "SERVAPP"."MSCS_FS_SETTING_LOG_PK" ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" ("FSETFEESLOG_SEQNO", "CREATE_DATE") 
   LOCAL
 (PARTITION "P202001" , 
 PARTITION "P202002" , 
 PARTITION "P202003" , 
 PARTITION "P202004" , 
 PARTITION "P202005" , 
 PARTITION "P202006" , 
 PARTITION "P202007" , 
 PARTITION "P202008" , 
 PARTITION "P202009" , 
 PARTITION "P202010" , 
 PARTITION "P202011" , 
 PARTITION "P202012" ) ;
  GRANT ALTER ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_FS_SETTINGFEESLIP_LOG" TO "PIBICSAPP";
