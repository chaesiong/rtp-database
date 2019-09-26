CREATE TABLE "PIBICSDM2"."EXTSLIPLOG" 
   (	"EXTSLIPLOGID" VARCHAR2(255 CHAR), 
	"EXTSLIPID" VARCHAR2(255 CHAR), 
	"SLIPNO" VARCHAR2(255 CHAR), 
	"SLIPBOOKNO" VARCHAR2(255 CHAR), 
	"EXTID" VARCHAR2(255 CHAR), 
	"SLIPDTE" DATE, 
	"FULLNM" VARCHAR2(255 CHAR), 
	"AMOUNT" NUMBER(*,0), 
	"PRINTFLAG" VARCHAR2(255 CHAR), 
	"STATUS" VARCHAR2(255 CHAR), 
	"CREUSR" VARCHAR2(255 CHAR), 
	"CREDTE" DATE, 
	"UPDUSR" VARCHAR2(255 CHAR), 
	"UPDDTE" DATE, 
	"LOGUSERID" VARCHAR2(255 CHAR), 
	"LOGFLAG" VARCHAR2(255 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXTSLIPLOG" ADD PRIMARY KEY ("EXTSLIPLOGID")
  USING INDEX  ENABLE;
  ;
