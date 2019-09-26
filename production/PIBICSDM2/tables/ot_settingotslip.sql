CREATE TABLE "PIBICSDM2"."OT_SETTINGOTSLIP" 
   (	"IPADDRESS" VARCHAR2(15 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"COUNTERNM" VARCHAR2(50 CHAR), 
	"SLIPNUM" NUMBER, 
	"MAXSLIPNO" VARCHAR2(10 CHAR), 
	"MAXSLIPBOOKNO" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_SETTINGOTSLIP" ADD CONSTRAINT "OT_SETTINGOTSLIP_PK" PRIMARY KEY ("IPADDRESS")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_SETTINGOTSLIP" ADD CONSTRAINT "OT_SETTINGOTSLIP_U01" UNIQUE ("IPADDRESS", "DEPT_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_SETTINGOTSLIP_PK" ON "PIBICSDM2"."OT_SETTINGOTSLIP" ("IPADDRESS") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."OT_SETTINGOTSLIP_U01" ON "PIBICSDM2"."OT_SETTINGOTSLIP" ("DEPT_SEQNO", "IPADDRESS") 
  ;
