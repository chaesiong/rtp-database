CREATE TABLE "PIBICSDM2"."OT_POLICEDUELOG" 
   (	"PLDLOGSEQNO" NUMBER, 
	"PLDSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"RELATIONAMOUNT" NUMBER, 
	"RELATIONFUND" NUMBER, 
	"POLICEDEATHAMOUNT" NUMBER, 
	"COMMISSIONFUND" NUMBER, 
	"WARRANTFUND" NUMBER, 
	"EMPLOYEEFUND" NUMBER, 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USERID" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CFADJUSTBALANCE" VARCHAR2(1 CHAR), 
	"CFUADJUSTBALANCE" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_POLICEDUELOG" ADD CONSTRAINT "OT_POLICEDUELOG_PK" PRIMARY KEY ("PLDLOGSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_POLICEDUELOG_PK" ON "PIBICSDM2"."OT_POLICEDUELOG" ("PLDLOGSEQNO") 
  ;