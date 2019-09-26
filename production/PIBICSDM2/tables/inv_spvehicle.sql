CREATE TABLE "PIBICSDM2"."INV_SPVEHICLE" 
   (	"SPV_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"VHC_SEQNO" NUMBER, 
	"SPV_LICENSENO" VARCHAR2(30 CHAR), 
	"PV_SEQNO" NUMBER, 
	"SPV_BRAND" VARCHAR2(50 CHAR), 
	"SPV_MODEL" VARCHAR2(50 CHAR), 
	"SPV_COLOR" VARCHAR2(50 CHAR), 
	"SPV_REMARK" VARCHAR2(500 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPV_SECURITYLEVEL" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPVEHICLE" ADD CONSTRAINT "INV_SPVEHICLE_PK" PRIMARY KEY ("SPV_SEQNO")
  USING INDEX (CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPVIHICLE_PK" ON "PIBICSDM2"."INV_SPVEHICLE" ("SPV_SEQNO") 
  )  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPVEHICLE" ADD CONSTRAINT "INV_SPVEHICLE_R01" FOREIGN KEY ("SP_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT" ("SP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPVEHICLE" ADD CONSTRAINT "INV_SPVEHICLE_R02" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPVEHICLE" ADD CONSTRAINT "INV_SPVEHICLE_R03" FOREIGN KEY ("VHC_SEQNO")
	  REFERENCES "PIBICSDM2"."VEHICLETYPE" ("VHC_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPVIHICLE_PK" ON "PIBICSDM2"."INV_SPVEHICLE" ("SPV_SEQNO") 
  ;
