CREATE TABLE "SERVAPP"."MSCS_MAPPINGIP" 
   (	"IPADDRESS" VARCHAR2(15 CHAR) NOT NULL ENABLE, 
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
	"MBC_FLAG" CHAR(1 CHAR), 
	"UPDATE_IP" VARCHAR2(200), 
	"DEPT_LEVEL" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_MAPPINGIP" ADD CONSTRAINT "MSCS_MAPPINGIP_PK" PRIMARY KEY ("IPADDRESS")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_MAPPINGIP_PK" ON "SERVAPP"."MSCS_MAPPINGIP" ("IPADDRESS") 
  ;
