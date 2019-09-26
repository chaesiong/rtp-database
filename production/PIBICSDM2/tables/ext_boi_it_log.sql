CREATE TABLE "PIBICSDM2"."EXT_BOI_IT_LOG" 
   (	"PRO_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"DUE_YEAR" NUMBER(5,1), 
	"POSITION" VARCHAR2(500 CHAR), 
	"COMPANY_SEQNO" NUMBER, 
	"COMPANYNM" VARCHAR2(1000 CHAR), 
	"DOCPROVE_DATE" DATE, 
	"DOCPROVE_YEAR" NUMBER, 
	"DOCWORK_DATE" DATE, 
	"DOCWORK_EXPDATE" DATE, 
	"ALIENSALARY" NUMBER(15,2), 
	"ALIEXTAX" NUMBER(15,2), 
	"CONTINENT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(500 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"PROC_LOG_SEQNO" NUMBER, 
	"COMPANYTYPENM" VARCHAR2(2000 CHAR), 
	"CAPITAL" NUMBER(15,2), 
	"CAPITALPAY" NUMBER(15,2), 
	"SHARES" NUMBER(15,2), 
	"SUMINCOME" NUMBER(15,2), 
	"ASSET" NUMBER(15,2), 
	"SUMOFFICER" NUMBER, 
	"THAIOFFICER" NUMBER, 
	"PERMANENCE" NUMBER, 
	"DAILY" NUMBER, 
	"ALIENOFFICER" NUMBER, 
	"ALIENINCOMEM" NUMBER(15,2), 
	"ALIENTAXM" NUMBER(15,2), 
	"ALIENINCOMEY" NUMBER(15,2), 
	"ALIENTAXY" NUMBER(15,2), 
	"OTH" VARCHAR2(100 CHAR), 
	"FACT1" CHAR(1 CHAR), 
	"FACT2" CHAR(1 CHAR), 
	"FACT_LESSINCOME" NUMBER, 
	"ALIENCOMEM" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_IT_LOG" ADD CONSTRAINT "EXT_BOI_IT_LOG_PK" PRIMARY KEY ("PRO_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_BOI_IT_LOG_PK" ON "PIBICSDM2"."EXT_BOI_IT_LOG" ("PRO_LOG_SEQNO") 
  ;
