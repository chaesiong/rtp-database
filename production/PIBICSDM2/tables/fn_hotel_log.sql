CREATE TABLE "PIBICSDM2"."FN_HOTEL_LOG" 
   (	"FN_HOTEL_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"HOTEL_SEQNO" NUMBER, 
	"HOTELCD" VARCHAR2(10 CHAR), 
	"HTYPE_SEQNO" NUMBER, 
	"NAME" VARCHAR2(200 CHAR), 
	"ADDR" VARCHAR2(1000 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(100 CHAR), 
	"FAX" VARCHAR2(100 CHAR), 
	"EMAIL" VARCHAR2(50 CHAR), 
	"PASSWORD" VARCHAR2(20 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"APPV_DATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FN_HOTEL_LOG" ADD CONSTRAINT "FN_HOTEL_LOG_PK" PRIMARY KEY ("FN_HOTEL_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FN_HOTEL_LOG_PK" ON "PIBICSDM2"."FN_HOTEL_LOG" ("FN_HOTEL_LOG_SEQNO") 
  ;