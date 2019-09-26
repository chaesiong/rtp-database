CREATE TABLE "PIBICSDM2"."EXT_BOI_SPLAW" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"FACTTYPE" CHAR(1 CHAR), 
	"DUE_YEAR" NUMBER(5,1), 
	"GUARANTY_NO" VARCHAR2(20 CHAR), 
	"GUARANTY_DATE" DATE, 
	"GUARANTY_YEAR" NUMBER(4,1), 
	"CONTINENT_SEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(500 CHAR), 
	"TERMINAL_DATE" DATE, 
	"CHGPASS_NAME" VARCHAR2(100 CHAR), 
	"CHGPASS_OPASS" VARCHAR2(100 CHAR), 
	"CHGPASS_NPASS" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"GUARANTY_NO2" VARCHAR2(20 CHAR), 
	"COMPANY_SEQNO" NUMBER, 
	"COMPANYNM" VARCHAR2(1000 CHAR), 
	"POSITION" VARCHAR2(500 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_SPLAW" ADD CONSTRAINT "EXT_BOI_SPLAW_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_SPLAW" ADD CONSTRAINT "EXT_BOI_SPLAW_R01" FOREIGN KEY ("PROC_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PROCESS" ("PROC_SEQNO") ENABLE NOVALIDATE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_SPLAW" ADD CONSTRAINT "EXT_BOI_SPLAW_R02" FOREIGN KEY ("CONTINENT_SEQNO")
	  REFERENCES "PIBICSDM2"."CONTINENT" ("CONTINENT_SEQNO") ENABLE NOVALIDATE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_SPLAW" ADD CONSTRAINT "EXT_BOI_SPLAW_R03" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE NOVALIDATE;
  ALTER TABLE "PIBICSDM2"."EXT_BOI_SPLAW" ADD CONSTRAINT "EXT_BOI_SPLAW_R04" FOREIGN KEY ("COMPANY_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_COMPANY" ("COMPANY_SEQNO") ENABLE NOVALIDATE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_BOI_SPLAW_PK" ON "PIBICSDM2"."EXT_BOI_SPLAW" ("PRO_SEQNO") 
  ;
