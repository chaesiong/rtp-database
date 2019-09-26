CREATE TABLE "PIBICSDM2"."VOA_ONLINE_LOG" 
   (	"VOAO_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(60 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VOAO_SEQNO" NUMBER, 
	"BARCODE" VARCHAR2(100 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"FROMCOUNTRY" NUMBER, 
	"IN_CONV_SEQNO" NUMBER, 
	"IN_CONVNO" VARCHAR2(10 CHAR), 
	"IN_FLIGHTPREFIX" VARCHAR2(10 CHAR), 
	"IN_FLIGHTNUMBER" VARCHAR2(10 CHAR), 
	"ADDR" VARCHAR2(1500 CHAR), 
	"PERADD" VARCHAR2(1500 CHAR), 
	"THAIREF" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"IN_DEPT_SEQNO" NUMBER, 
	"INDTE" TIMESTAMP (6), 
	"OUT_DEPT_SEQNO" NUMBER, 
	"OUT_CONVNO" VARCHAR2(20 CHAR), 
	"OUT_FLIGHTPREFIX" VARCHAR2(20 CHAR), 
	"OUT_FLIGHTNUMBER" VARCHAR2(20 CHAR), 
	"OUT_CONV_SEQNO" NUMBER, 
	"OUTDTE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."VOA_ONLINE_LOG" ADD CONSTRAINT "VOA_ONLINE_LOG_PK" PRIMARY KEY ("VOAO_LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_ONLINE_LOG" ADD FOREIGN KEY ("IN_CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_ONLINE_LOG" ADD FOREIGN KEY ("FROMCOUNTRY")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_ONLINE_LOG" ADD FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_ONLINE_LOG" ADD FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_ONLINE_LOG" ADD FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_ONLINE_LOG" ADD FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."VOA_ONLINE_LOG_PK" ON "PIBICSDM2"."VOA_ONLINE_LOG" ("VOAO_LOG_SEQNO") 
  ;
