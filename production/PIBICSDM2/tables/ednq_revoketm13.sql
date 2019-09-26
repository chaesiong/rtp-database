CREATE TABLE "PIBICSDM2"."EDNQ_REVOKETM13" 
   (	"EDMREVOKE_SEQNO" NUMBER, 
	"EDMREVOKE_NO" NUMBER, 
	"EDMREVOKE_DATE" DATE, 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"RCISSUE_BY" VARCHAR2(60 CHAR), 
	"RCISSUE_DATE" DATE, 
	"RCNO_PVCD" VARCHAR2(3 CHAR), 
	"RCNO_RUNNINGNO" NUMBER, 
	"RCNO_YEAR" CHAR(4 CHAR), 
	"TM13_SEQNO" NUMBER, 
	"TM13NO" NUMBER, 
	"TM13YEAR" CHAR(4 CHAR), 
	"EDMISSUE_DATE" DATE, 
	"EDMEXP_DATE" DATE, 
	"REVOKE_DATE" DATE, 
	"REVOKE_REASON" VARCHAR2(100 CHAR), 
	"REVOKESTS" CHAR(1 CHAR), 
	"REVOKEDESC" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"EDMREVOKETYPE" CHAR(1 CHAR), 
	"EDMISSUE_BYDEPT" NUMBER, 
	"OCC_DETAIL" VARCHAR2(60 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EDNQ_REVOKETM13" ADD CONSTRAINT "EDNQ_REVOKETM13_PK" PRIMARY KEY ("EDMREVOKE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_REVOKETM13" ADD CONSTRAINT "EDNQ_REVOKETM13_EDNQ_TM13_FK1" FOREIGN KEY ("TM13_SEQNO")
	  REFERENCES "PIBICSDM2"."EDNQ_TM13" ("TM13_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_REVOKETM13" ADD CONSTRAINT "EDNQ_REVOKETM13_OCCUPATIO_FK1" FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_REVOKETM13" ADD CONSTRAINT "EDNQ_REVOKETM13_COUNTRY_FK1" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EDNQ_REVOKETM13_PK" ON "PIBICSDM2"."EDNQ_REVOKETM13" ("EDMREVOKE_SEQNO") 
  ;
