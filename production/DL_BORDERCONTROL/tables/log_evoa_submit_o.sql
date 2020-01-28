CREATE TABLE "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"SENDER" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"SENDER_OBJECT" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"SENDER_OBJECT_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"REQUEST" CLOB, 
	"RESPONSE_CODE" VARCHAR2(50 CHAR), 
	"RESPONSE_STATUS" VARCHAR2(50 CHAR), 
	"RESPONSE_STATUS_DESC" VARCHAR2(4000 CHAR), 
	"RESPONSE" CLOB, 
	"PROCESS_TIME" NUMBER
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
  ALTER TABLE "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" ADD CONSTRAINT "LOG_EVOA_SUBMIT$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."DML_TYPE" IS 'Audit (I.nsert, U.pdate, D.elete)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."SENDER" IS 'Name of application, schema or identifier who send this message';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."SENDER_OBJECT" IS 'Name of Object that should be transfered (e.g. EVOA)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."SENDER_OBJECT_ID" IS 'PK of Object that should be transfered';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."REQUEST" IS 'Request packet that should be transfered';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."RESPONSE_CODE" IS 'Response code received';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."RESPONSE_STATUS" IS 'Response status that came from another system';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."RESPONSE_STATUS_DESC" IS 'Response status DESC that came from another system';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."RESPONSE" IS 'Response (complete) that came from another system';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O"."PROCESS_TIME" IS 'The time in seconds that the Request took to get a Response.';
  CREATE INDEX "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT$IX00" ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" ("SENDER_OBJECT_ID") 
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
CREATE INDEX "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_IDX1_O" ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" ("INS_AT") 
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
CREATE INDEX "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_IDX2_O" ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" ("DML_AT") 
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
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT$PK" ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000698639C00010$$" ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" (
   LOCAL
 (PARTITION "SYS_IL_P22515" , 
 PARTITION "SYS_IL_P22516" , 
 PARTITION "SYS_IL_P22517" , 
 PARTITION "SYS_IL_P22518" , 
 PARTITION "SYS_IL_P22519" , 
 PARTITION "SYS_IL_P22520" , 
 PARTITION "SYS_IL_P22521" , 
 PARTITION "SYS_IL_P22522" , 
 PARTITION "SYS_IL_P22523" , 
 PARTITION "SYS_IL_P22524" , 
 PARTITION "SYS_IL_P22525" , 
 PARTITION "SYS_IL_P22526" , 
 PARTITION "SYS_IL_P22527" , 
 PARTITION "SYS_IL_P22528" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000698639C00014$$" ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" (
   LOCAL
 (PARTITION "SYS_IL_P22543" , 
 PARTITION "SYS_IL_P22544" , 
 PARTITION "SYS_IL_P22545" , 
 PARTITION "SYS_IL_P22546" , 
 PARTITION "SYS_IL_P22547" , 
 PARTITION "SYS_IL_P22548" , 
 PARTITION "SYS_IL_P22549" , 
 PARTITION "SYS_IL_P22550" , 
 PARTITION "SYS_IL_P22551" , 
 PARTITION "SYS_IL_P22552" , 
 PARTITION "SYS_IL_P22553" , 
 PARTITION "SYS_IL_P22554" , 
 PARTITION "SYS_IL_P22555" , 
 PARTITION "SYS_IL_P22556" ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "SOMPORN_K";
  GRANT ALTER ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LOG_EVOA_SUBMIT_O" TO "PUNYAWII_D";
