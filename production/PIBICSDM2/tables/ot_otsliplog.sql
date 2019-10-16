CREATE TABLE "PIBICSDM2"."OT_OTSLIPLOG" 
   (	"OTSLIPLOGSEQNO" NUMBER, 
	"OTSLIPSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"AGENTNAME" VARCHAR2(100 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"OTSLIPNO" VARCHAR2(20 CHAR), 
	"OTSLIPBOOKNO" VARCHAR2(20 CHAR), 
	"OTSLIPDATE" TIMESTAMP (6), 
	"TOTALAMOUNT" NUMBER(10,2), 
	"PRINTFLAG" CHAR(1 CHAR), 
	"OTSLIPSTATUS" VARCHAR2(10 CHAR), 
	"OTREMARK" VARCHAR2(1000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USERID" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"SLIPTYPE" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_OTSLIPLOG" ADD CONSTRAINT "OT_OTSLIPLOG_PK" PRIMARY KEY ("OTSLIPLOGSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_OTSLIPLOG_PK" ON "PIBICSDM2"."OT_OTSLIPLOG" ("OTSLIPLOGSEQNO") 
  ;