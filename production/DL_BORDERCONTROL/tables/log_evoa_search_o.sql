CREATE TABLE "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"SENDER_SYSTEM" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"SENDER_USER" VARCHAR2(255 CHAR), 
	"SENDER_OBJECT" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"SENDER_OBJECT_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"REQUEST_TYPE" VARCHAR2(50 CHAR) DEFAULT ON NULL 'SEARCH' NOT NULL ENABLE, 
	"REQUEST" CLOB, 
	"RESPONSE" CLOB, 
	"RESPONSE_CODE" VARCHAR2(50 CHAR), 
	"ELAPSED_TIME_SECONDS" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"NUMBER_OF_HITS" NUMBER, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) 
  PARTITION BY RANGE ("DML_AT") INTERVAL (NUMTOYMINTERVAL(1,'MONTH')) 
 (PARTITION "P201911"  VALUES LESS THAN (TIMESTAMP' 2019-12-01 00:00:00') , 
 PARTITION "P201912"  VALUES LESS THAN (TIMESTAMP' 2020-01-01 00:00:00') , 
 PARTITION "P202001"  VALUES LESS THAN (TIMESTAMP' 2020-02-01 00:00:00') , 
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
  ALTER TABLE "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" ADD CONSTRAINT "LOG_EVOA_SEARCH$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."SENDER_SYSTEM" IS 'System what sent the request (e.g. BMBS)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."SENDER_USER" IS 'Username of the user who sent the request';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."SENDER_OBJECT_ID" IS 'ID of the object that raising the request';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."REQUEST_TYPE" IS 'Type of request';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."REQUEST" IS 'JSON code of the request that was send';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."RESPONSE" IS 'Response of the service';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."RESPONSE_CODE" IS 'Response code';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."ELAPSED_TIME_SECONDS" IS 'Elapsed time in seconds it took to send a resoonse';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."NUMBER_OF_HITS" IS 'Number of hits the response got';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O"."DML_TYPE" IS 'Audit (I.nsert, U.pdate, D.elete)';
  CREATE INDEX "DL_BORDERCONTROL"."LOG_EVOA_SEARCH$IX00" ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" ("SENDER_OBJECT_ID") 
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
CREATE INDEX "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_IDX2_O" ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" ("DML_AT") 
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
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."LOG_EVOA_SEARCH$PK" ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000698532C00007$$" ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" (
   LOCAL
 (PARTITION "SYS_IL_P22459" , 
 PARTITION "SYS_IL_P22460" , 
 PARTITION "SYS_IL_P22461" , 
 PARTITION "SYS_IL_P22462" , 
 PARTITION "SYS_IL_P22463" , 
 PARTITION "SYS_IL_P22464" , 
 PARTITION "SYS_IL_P22465" , 
 PARTITION "SYS_IL_P22466" , 
 PARTITION "SYS_IL_P22467" , 
 PARTITION "SYS_IL_P22468" , 
 PARTITION "SYS_IL_P22469" , 
 PARTITION "SYS_IL_P22470" , 
 PARTITION "SYS_IL_P22471" , 
 PARTITION "SYS_IL_P22472" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000698532C00008$$" ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" (
   LOCAL
 (PARTITION "SYS_IL_P22487" , 
 PARTITION "SYS_IL_P22488" , 
 PARTITION "SYS_IL_P22489" , 
 PARTITION "SYS_IL_P22490" , 
 PARTITION "SYS_IL_P22491" , 
 PARTITION "SYS_IL_P22492" , 
 PARTITION "SYS_IL_P22493" , 
 PARTITION "SYS_IL_P22494" , 
 PARTITION "SYS_IL_P22495" , 
 PARTITION "SYS_IL_P22496" , 
 PARTITION "SYS_IL_P22497" , 
 PARTITION "SYS_IL_P22498" , 
 PARTITION "SYS_IL_P22499" , 
 PARTITION "SYS_IL_P22500" ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "SOMPORN_K";
  GRANT ALTER ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SEARCH_O" TO "PUNYAWII_D";
