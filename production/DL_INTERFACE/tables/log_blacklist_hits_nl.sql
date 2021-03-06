CREATE TABLE "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"SENDER_SYSTEM" VARCHAR2(100 CHAR), 
	"SENDER_USER" VARCHAR2(100 CHAR), 
	"SENDER_OBJECT_ID" VARCHAR2(100 CHAR), 
	"SENDER_REQUEST" CLOB NOT NULL ENABLE, 
	"RESPONSE" CLOB NOT NULL ENABLE, 
	"ELAPSED_TIME_SECONDS" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"NUMBER_OF_HITS" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1,'MONTH')) STORE IN ("DATA_LOG_NL") 
 (PARTITION "P201912"  VALUES LESS THAN (TO_DATE(' 2020-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) , 
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
  ALTER TABLE "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" ADD CONSTRAINT "LOG_BLACKLIST_HITS_$PK" PRIMARY KEY ("KEY_VALUE", "INS_AT")
  USING INDEX (CREATE UNIQUE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS_$PK_NL" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" ("KEY_VALUE", "INS_AT") 
   LOCAL
 (PARTITION "P201912" , 
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
 PARTITION "P202012" ) )  ENABLE;
  CREATE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS_IDX1_NL" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" ("INS_AT") 
   LOCAL
 (PARTITION "P201912" , 
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
CREATE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS_IDX2_NL" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" ("SENDER_OBJECT_ID") 
   LOCAL
 (PARTITION "P201912" , 
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
CREATE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS_IDX3_NL" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" ("KEY_VALUE") 
   LOCAL
 (PARTITION "P201912" , 
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
CREATE UNIQUE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS_$PK_NL" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" ("KEY_VALUE", "INS_AT") 
   LOCAL
 (PARTITION "P201912" , 
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
CREATE UNIQUE INDEX "DL_INTERFACE"."SYS_IL0000778485C00010$$" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" (
   LOCAL
 (PARTITION "SYS_IL_P26231" , 
 PARTITION "SYS_IL_P26235" , 
 PARTITION "SYS_IL_P26239" , 
 PARTITION "SYS_IL_P26243" , 
 PARTITION "SYS_IL_P26247" , 
 PARTITION "SYS_IL_P26251" , 
 PARTITION "SYS_IL_P26255" , 
 PARTITION "SYS_IL_P26259" , 
 PARTITION "SYS_IL_P26263" , 
 PARTITION "SYS_IL_P26267" , 
 PARTITION "SYS_IL_P26271" , 
 PARTITION "SYS_IL_P26275" , 
 PARTITION "SYS_IL_P26279" ) ;
CREATE UNIQUE INDEX "DL_INTERFACE"."SYS_IL0000778485C00011$$" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" (
   LOCAL
 (PARTITION "SYS_IL_P26233" , 
 PARTITION "SYS_IL_P26237" , 
 PARTITION "SYS_IL_P26241" , 
 PARTITION "SYS_IL_P26245" , 
 PARTITION "SYS_IL_P26249" , 
 PARTITION "SYS_IL_P26253" , 
 PARTITION "SYS_IL_P26257" , 
 PARTITION "SYS_IL_P26261" , 
 PARTITION "SYS_IL_P26265" , 
 PARTITION "SYS_IL_P26269" , 
 PARTITION "SYS_IL_P26273" , 
 PARTITION "SYS_IL_P26277" , 
 PARTITION "SYS_IL_P26281" ) ;
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "APPSUP";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOAPPREPORT";
  GRANT ALTER ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT DELETE ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT INDEX ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT INSERT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT UPDATE ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT READ ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT DEBUG ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSAADM";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIOSUPPORT";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "BIO_BD";
  GRANT DELETE ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "PIBICSAPP";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "SERVAPP";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS_NL" TO "WORAGON_T";
