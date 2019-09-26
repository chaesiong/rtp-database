CREATE TABLE "SERVAPP"."MSCS_FS_FEESDETAIL_LOG" 
   (	"FD_LOG_SEQNO" NUMBER NOT NULL ENABLE, 
	"FEESLOG_SEQNO" NUMBER, 
	"FEESDETAIL_SEQNO" NUMBER, 
	"PRATE_SEQNO" NUMBER, 
	"FEES_SEQNO" NUMBER, 
	"FEESLIPAMOUNT" NUMBER(10,2), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(60 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_FS_FEESDETAIL_LOG" ADD CONSTRAINT "MSCS_FS_FEESDETAIL_LOG_R01" PRIMARY KEY ("FD_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_FS_FEESDETAIL_LOG_R01" ON "SERVAPP"."MSCS_FS_FEESDETAIL_LOG" ("FD_LOG_SEQNO") 
  ;
