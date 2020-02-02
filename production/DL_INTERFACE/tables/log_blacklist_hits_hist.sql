CREATE TABLE "DL_INTERFACE"."LOG_BLACKLIST_HITS_HIST" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"SENDER_SYSTEM" VARCHAR2(100 CHAR), 
	"SENDER_USER" VARCHAR2(100 CHAR), 
	"SENDER_OBJECT_ID" VARCHAR2(100 CHAR), 
	"RESPONSE" CLOB NOT NULL ENABLE, 
	"ELAPSED_TIME_SECONDS" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"NUMBER_OF_HITS" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1,'MONTH')) STORE IN ("DATALOG_HIST_NL") 
 (PARTITION "P201911"  VALUES LESS THAN (TO_DATE(' 2019-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P201912"  VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202001"  VALUES LESS THAN (TO_DATE(' 2020-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202002"  VALUES LESS THAN (TO_DATE(' 2020-03-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202003"  VALUES LESS THAN (TO_DATE(' 2020-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202004"  VALUES LESS THAN (TO_DATE(' 2020-05-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202005"  VALUES LESS THAN (TO_DATE(' 2020-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202006"  VALUES LESS THAN (TO_DATE(' 2020-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202007"  VALUES LESS THAN (TO_DATE(' 2020-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202008"  VALUES LESS THAN (TO_DATE(' 2020-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202009"  VALUES LESS THAN (TO_DATE(' 2020-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202010"  VALUES LESS THAN (TO_DATE(' 2020-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202011"  VALUES LESS THAN (TO_DATE(' 2020-12-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
 PARTITION "P202012"  VALUES LESS THAN (TO_DATE(' 2021-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) ) ;
  CREATE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS_HIST_IDX1" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_HIST" ("INS_AT") 
   LOCAL
 (PARTITION "P201911" , 
 PARTITION "P201912" , 
 PARTITION "P202001" , 
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
CREATE UNIQUE INDEX "DL_INTERFACE"."SYS_IL0000780237C00010$$" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_HIST" (
   LOCAL
 (PARTITION "SYS_IL_P27436" , 
 PARTITION "SYS_IL_P27437" , 
 PARTITION "SYS_IL_P27438" , 
 PARTITION "SYS_IL_P27439" , 
 PARTITION "SYS_IL_P27440" , 
 PARTITION "SYS_IL_P27441" , 
 PARTITION "SYS_IL_P27442" , 
 PARTITION "SYS_IL_P27443" , 
 PARTITION "SYS_IL_P27444" , 
 PARTITION "SYS_IL_P27445" , 
 PARTITION "SYS_IL_P27446" , 
 PARTITION "SYS_IL_P27447" , 
 PARTITION "SYS_IL_P27448" , 
 PARTITION "SYS_IL_P27449" ) ;
