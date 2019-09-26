CREATE TABLE "PIBICSDM2"."MAPPINGIP" 
   (	"IPADDRESS" VARCHAR2(15 CHAR), 
	"CHECKPOINTNO" VARCHAR2(50 CHAR), 
	"APPCD" VARCHAR2(10 CHAR), 
	"MAPPINGID" NUMBER, 
	"ZONE" VARCHAR2(100 CHAR), 
	"ORGCD" CHAR(4 CHAR), 
	"DEPTCD" CHAR(5 CHAR), 
	"MODULECD" CHAR(2 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"PASSPROFILE" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"REPSZONE_SEQNO" NUMBER, 
	"FNZONE_SEQNO" NUMBER, 
	"LAZONE_SEQNO" NUMBER, 
	"QTM8ZONE_SEQNO" NUMBER, 
	"QTM7ZONE_SEQNO" NUMBER, 
	"QFN90ZONE_SEQNO" NUMBER, 
	"INOUTZONE_SEQNO" NUMBER, 
	"TERMINAL" VARCHAR2(50 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"OTOW" CHAR(1 CHAR), 
	"MBC_FLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."MAPPINGIP" ADD CONSTRAINT "MAPPINGID_PK" PRIMARY KEY ("MAPPINGID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."MAPPINGIP" ADD CONSTRAINT "MAPPINGIP_R02" FOREIGN KEY ("APPCD")
	  REFERENCES "PIBICSDM2"."FW_SYSTEM" ("SYSTEM_CODE") ENABLE;
  ALTER TABLE "PIBICSDM2"."MAPPINGIP" ADD CONSTRAINT "MAPPINGIP_R03" FOREIGN KEY ("ZONE_SEQNO")
	  REFERENCES "PIBICSDM2"."ZONE" ("ZONE_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."MAPPINGIP_INDEX_DEPT_SEQNO" ON "PIBICSDM2"."MAPPINGIP" ("DEPT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."MAPPINGIP_INDEX_IPADDRESS" ON "PIBICSDM2"."MAPPINGIP" ("IPADDRESS") 
  ;
CREATE INDEX "PIBICSDM2"."MAPPINGIP_INDEX_ZONE" ON "PIBICSDM2"."MAPPINGIP" ("ZONE") 
  ;
CREATE INDEX "PIBICSDM2"."MAPPINGIP_ZONE_SEQNO_INDEX" ON "PIBICSDM2"."MAPPINGIP" ("ZONE_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."MAPPINGID_PK" ON "PIBICSDM2"."MAPPINGIP" ("MAPPINGID") 
  ;
