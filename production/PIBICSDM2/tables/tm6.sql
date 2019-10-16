CREATE TABLE "PIBICSDM2"."TM6" 
   (	"TM6_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"IODTE" DATE, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"VISANO" VARCHAR2(20 CHAR), 
	"TM6NO" VARCHAR2(7 CHAR), 
	"ELASTNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"BUILDING" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(500 CHAR), 
	"TEL" VARCHAR2(10 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"IMGTM6" VARCHAR2(200 CHAR), 
	"SINCE_TIME" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(1000 CHAR), 
	"FLAGTM6" CHAR(1 CHAR), 
	"TO_TIME" NUMBER, 
	"FLIGHTPREFIX" VARCHAR2(10 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(10 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TM6" ADD CONSTRAINT "TM6_PK" PRIMARY KEY ("TM6_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TM6" ADD CONSTRAINT "TM6_R02" FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TM6" ADD CONSTRAINT "TM6_R03" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TM6" ADD CONSTRAINT "TM6_R04" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TM6_PK" ON "PIBICSDM2"."TM6" ("TM6_SEQNO") 
  ;