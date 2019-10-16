CREATE TABLE "SERVAPP"."MSCS_EXT_COMPANY" 
   (	"COMPANY_SEQNO" NUMBER NOT NULL ENABLE, 
	"COMTYPE_SEQNO" NUMBER, 
	"CAPITAL" NUMBER(15,2), 
	"ASSET" NUMBER(15,2), 
	"SHARES" NUMBER(15,2), 
	"SUMINCOME" NUMBER(15,2), 
	"SUMOFFICER" NUMBER, 
	"THAIOFFICER" NUMBER, 
	"ALIENOFFICER" NUMBER, 
	"ALIENINCOMEM" NUMBER(15,2), 
	"ALIENTAXM" NUMBER(15,2), 
	"ALIENINCOMEY" NUMBER(15,2), 
	"ALIENTAXY" NUMBER(15,2), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"COMPANYNM" VARCHAR2(1000 CHAR), 
	"COMPANYTYPENM" VARCHAR2(200 CHAR), 
	"CAPITALPAY" NUMBER(15,2), 
	"ASSET_BOI" NUMBER(15,2), 
	"PERMANENCE" NUMBER, 
	"DAILY" NUMBER, 
	"TRANSFER_DATE" DATE, 
	"TRANSFER_TO" DATE, 
	"TRANSFER_AMOUNT" NUMBER(15,2), 
	"DEPT_SEQNO" NUMBER, 
	"SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"SUMEND" NUMBER DEFAULT 0, 
	"ADDR" VARCHAR2(1000 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"TEL" VARCHAR2(100 CHAR), 
	"STATALIENOFFICER" NUMBER, 
	"MOVESTAMP_TYPE" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_COMPANY" ADD CONSTRAINT "MSCS_EXT_COMPANY_PK" PRIMARY KEY ("COMPANY_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_EXT_COMPANY_PK" ON "SERVAPP"."MSCS_EXT_COMPANY" ("COMPANY_SEQNO") 
  ;