CREATE TABLE "PIBICSDM2"."EXTFSLIP" 
   (	"IPADDRESS" VARCHAR2(255 CHAR), 
	"COUNTERNM" VARCHAR2(255 CHAR), 
	"SLIPNUM" VARCHAR2(255 CHAR), 
	"MAXSLIPNO" VARCHAR2(255 CHAR), 
	"MAXSLIPBOOKNO" VARCHAR2(255 CHAR), 
	"CREUSR" VARCHAR2(255 CHAR), 
	"CREDTE" DATE, 
	"UPDUSR" VARCHAR2(255 CHAR), 
	"UPDDTE" DATE, 
	"DEPTCD" VARCHAR2(255 CHAR), 
	"ORGCD" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXTFSLIP" ADD PRIMARY KEY ("IPADDRESS")
  USING INDEX  ENABLE;
  ;
