CREATE TABLE "PIBICSDM2"."INV_PLPERSON" 
   (	"PLP_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PLP_PASSNO" VARCHAR2(30 CHAR), 
	"PLP_IDCARD" CHAR(13 CHAR), 
	"PLP_TNAME" VARCHAR2(20 CHAR), 
	"PLP_TSNAME" VARCHAR2(20 CHAR), 
	"PLP_ENAME" VARCHAR2(20 CHAR), 
	"PLP_EMNAME" VARCHAR2(20 CHAR), 
	"PLP_ESNAME" VARCHAR2(20 CHAR), 
	"PLP_REMARK" VARCHAR2(600 CHAR), 
	"PLP_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"PLP_RELATEDTYPE" VARCHAR2(20 CHAR), 
	"PLP_OTHER" VARCHAR2(40 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLPERSON" ADD CONSTRAINT "INV_PLPERSON_PK" PRIMARY KEY ("PLP_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLPERSON" ADD CONSTRAINT "INV_PLPERSON_R01" FOREIGN KEY ("PL_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE" ("PL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLPERSON_PK" ON "PIBICSDM2"."INV_PLPERSON" ("PLP_SEQNO") 
  ;