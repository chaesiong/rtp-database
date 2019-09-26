CREATE TABLE "PIBICSDM2"."ARS_LEAVEPLACE_LOG" 
   (	"LEAVEPLACELOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"LEAVEPLACE_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"LEAVEPLACE_DESC" VARCHAR2(2500 CHAR), 
	"LEAVECONV_SEQNO" NUMBER, 
	"LEAVEFLIGHTNO" VARCHAR2(15 CHAR), 
	"LEAVE_DATE" DATE, 
	"NOTICEPLS_SEQNO" NUMBER, 
	"NOTICEPLS_NO" VARCHAR2(20 CHAR), 
	"NOTICEPLS_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"NPOLISBH_SEQNO" NUMBER, 
	"NPOLISPV_SEQNO" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"ALIENCERTLOG_SEQNO" NUMBER, 
	"LETTERFORM" VARCHAR2(2500 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_LEAVEPLACE_LOG" ADD CONSTRAINT "ARS_LEAVEPLACE_LOG_PK" PRIMARY KEY ("LEAVEPLACELOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_LEAVEPLACE_LOG" ADD CONSTRAINT "ARS_LEAVEPLACE_LOG_R02" FOREIGN KEY ("LEAVECONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_LEAVEPLACE_LOG" ADD CONSTRAINT "ARS_LEAVEPLACE_LOG_R01" FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_LEAVEPLACE_LOG_PK" ON "PIBICSDM2"."ARS_LEAVEPLACE_LOG" ("LEAVEPLACELOG_SEQNO") 
  ;
