CREATE TABLE "PIBICSDM2"."FNSTATISTICPIBICS" 
   (	"HOTEL_SEQNO" NUMBER, 
	"NAME" VARCHAR2(200 CHAR), 
	"PV_SEQNO" VARCHAR2(200 CHAR), 
	"JAN55" NUMBER, 
	"FEB55" NUMBER, 
	"MAR55" NUMBER, 
	"APR55" NUMBER, 
	"MAY55" NUMBER, 
	"JUN55" NUMBER, 
	"JUL55" NUMBER, 
	"AUG55" NUMBER, 
	"SEP55" NUMBER, 
	"OCT55" NUMBER, 
	"NOV55" NUMBER, 
	"DEC55" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FNSTATISTICPIBICS" ADD CONSTRAINT "FNSTATISTICPIBICS_PK" PRIMARY KEY ("HOTEL_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FNSTATISTICPIBICS_PK" ON "PIBICSDM2"."FNSTATISTICPIBICS" ("HOTEL_SEQNO") 
  ;
