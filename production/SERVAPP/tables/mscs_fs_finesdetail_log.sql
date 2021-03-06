CREATE TABLE "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" 
   (	"FID_LOG_SEQNO" NUMBER NOT NULL ENABLE, 
	"FINESLOG_SEQNO" NUMBER, 
	"FINESDETAIL_SEQNO" NUMBER, 
	"FINES_SEQNO" NUMBER, 
	"PRATE_SEQNO" NUMBER, 
	"FINESLIPAMOUNT" NUMBER(10,2), 
	"OVERSTAYDAY" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" ADD CONSTRAINT "MSCS_FS_FINESDETAIL_LOG_R01" PRIMARY KEY ("FID_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_FS_FINESDETAIL_LOG_R01" ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" ("FID_LOG_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_FS_FINESDETAIL_LOG" TO "BIOSAADM";
