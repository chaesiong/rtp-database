CREATE TABLE "PIBICSDM2"."WF_BILL_LOG" 
   (	"BILL_SEQNO_LOG" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USERID" VARCHAR2(30 CHAR), 
	"BILL_SEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"TENANT_SEQNO" NUMBER, 
	"APT_SEQNO" NUMBER, 
	"MON_SEQNO" NUMBER, 
	"BILL_WATERAMT" NUMBER, 
	"BILL_CLEANAMP" NUMBER, 
	"BILL_PROPERTYAMT" NUMBER, 
	"BILL_OTHERAMT" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"BILL_MONTH" NUMBER, 
	"BILL_YEAR" VARCHAR2(4 CHAR), 
	"WAT_SEQNO" NUMBER, 
	"BILL_SUMAMT" NUMBER, 
	"BD_ID" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_BILL_LOG" ADD CONSTRAINT "WF_FACILITYUSAGE_LOG_PK" PRIMARY KEY ("BILL_SEQNO_LOG")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."WF_BILL_LOG" ADD CONSTRAINT "WF_BILL_LOG_R03" FOREIGN KEY ("APT_SEQNO")
	  REFERENCES "PIBICSDM2"."WF_APARTMENT" ("APT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."WF_BILL_LOG" ADD CONSTRAINT "WF_BILL_LOG_R04" FOREIGN KEY ("MON_SEQNO")
	  REFERENCES "PIBICSDM2"."WF_MONTHLYBILL" ("MON_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."WF_BILL_LOG" ADD CONSTRAINT "WF_BILL_LOG_R02" FOREIGN KEY ("TENANT_SEQNO")
	  REFERENCES "PIBICSDM2"."WF_TENANT" ("TENANT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."WF_BILL_LOG" ADD CONSTRAINT "WF_BILL_LOG_R05" FOREIGN KEY ("WAT_SEQNO")
	  REFERENCES "PIBICSDM2"."WF_WATERUSAGE" ("WAT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_FACILITYUSAGE_LOG_PK" ON "PIBICSDM2"."WF_BILL_LOG" ("BILL_SEQNO_LOG") 
  ;