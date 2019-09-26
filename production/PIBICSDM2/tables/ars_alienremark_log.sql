CREATE TABLE "PIBICSDM2"."ARS_ALIENREMARK_LOG" 
   (	"ALIENREMARKLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"ALIENREMARK_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"RELEGATION" CHAR(2 CHAR), 
	"RELEGATION_DESC" VARCHAR2(100 CHAR), 
	"ORDERBYMOI" VARCHAR2(2500 CHAR), 
	"RELEGATION_DATE" DATE, 
	"RELEGATION_NOTICE" VARCHAR2(100 CHAR), 
	"DEATH" CHAR(1 CHAR), 
	"DEATHCERTNO_1" VARCHAR2(20 CHAR), 
	"DEATHCERTNO_2" VARCHAR2(20 CHAR), 
	"DEATHCERT_DATE" DATE, 
	"DEATHCERTISSUE" VARCHAR2(60 CHAR), 
	"DEATHNOTICEPLS_SEQNO" NUMBER, 
	"NOTICEPLS_NO" VARCHAR2(60 CHAR), 
	"NOTICEPLS_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"REMARKTYPE" CHAR(1 CHAR), 
	"NPOLISBH_SEQNO" NUMBER, 
	"NOPOLISPV_SEQNO" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"ALIENCERTLOG_SEQNO" NUMBER, 
	"REPORTNO" VARCHAR2(100 CHAR), 
	"REPORT_DATE" DATE, 
	"COPYRIGHTNO" VARCHAR2(100 CHAR), 
	"COPYRIGHT_DATE" DATE, 
	"APPROVAL" VARCHAR2(1000 CHAR), 
	"APPROVAL_DATE" DATE, 
	"INFORM_AT" VARCHAR2(20 CHAR), 
	"INFORM_DATE" DATE, 
	"OTHER_DESC" CLOB, 
	"REPORT_TIME" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_ALIENREMARK_LOG" ADD CONSTRAINT "ARS_ALIENREMARKLOG_PK" PRIMARY KEY ("ALIENREMARKLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_ALIENREMARK_LOG" ADD FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_ALIENREMARKLOG_PK" ON "PIBICSDM2"."ARS_ALIENREMARK_LOG" ("ALIENREMARKLOG_SEQNO") 
  ;
  ;
