CREATE TABLE "PIBICSDM2"."OT_POLICEDUE" 
   (	"PLDSEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"RELATIONAMOUNT" NUMBER, 
	"RELATIONFUND" NUMBER(7,2), 
	"POLICEDEATHAMOUNT" NUMBER, 
	"COMMISSIONFUND" NUMBER(7,2), 
	"WARRANTFUND" NUMBER(7,2), 
	"EMPLOYEEFUND" NUMBER(7,2), 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CFADJUSTBALANCE" CHAR(1 CHAR), 
	"CFUADJUSTBALANCE" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_POLICEDUE" ADD CONSTRAINT "OT_POLICEDUE_PK" PRIMARY KEY ("PLDSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_POLICEDUE" ADD CONSTRAINT "OT_POLICEDUE_U01" UNIQUE ("ESTIMATEMONTH", "ESTIMATEYEAR")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_POLICEDUE_PK" ON "PIBICSDM2"."OT_POLICEDUE" ("PLDSEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."OT_POLICEDUE_U01" ON "PIBICSDM2"."OT_POLICEDUE" ("ESTIMATEMONTH", "ESTIMATEYEAR") 
  ;
