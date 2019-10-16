CREATE TABLE "PIBICSDM2"."IPSWITCHING" 
   (	"IPADDRESS_FROM" VARCHAR2(15 CHAR), 
	"DEPTCD_FROM" CHAR(5 CHAR), 
	"IPADDRESS_TO" VARCHAR2(15 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."IPSWITCHING" ADD CONSTRAINT "IPSWITCHING_PK" PRIMARY KEY ("IPADDRESS_FROM", "DEPTCD_FROM")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."IPSWITCHING_PK" ON "PIBICSDM2"."IPSWITCHING" ("IPADDRESS_FROM", "DEPTCD_FROM") 
  ;