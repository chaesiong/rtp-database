CREATE TABLE "SERVAPP"."MSCS_GUARTDEPT" 
   (	"GUARTDEPT_SEQNO" NUMBER NOT NULL ENABLE, 
	"DEPT_SEQNO" NUMBER, 
	"COMNM" VARCHAR2(250 CHAR), 
	"AMOUNT" NUMBER, 
	"AMOUNTLEFT" NUMBER, 
	"ADDR" VARCHAR2(250 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"COMCD" VARCHAR2(20 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_GUARTDEPT" ADD CONSTRAINT "GUARTDEPT_PK" PRIMARY KEY ("GUARTDEPT_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."GUARTDEPT_PK" ON "SERVAPP"."MSCS_GUARTDEPT" ("GUARTDEPT_SEQNO") 
  ;