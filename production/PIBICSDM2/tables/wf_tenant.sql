CREATE TABLE "PIBICSDM2"."WF_TENANT" 
   (	"TENANT_SEQNO" NUMBER, 
	"APT_SEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"TENANT_PAYSTATUS" CHAR(1 CHAR), 
	"TENANT_CHECKINDATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TENANT_CHECKOUTDATE" DATE, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"APT_ROOMNO" VARCHAR2(5 CHAR), 
	"TENANT_ORDERNO" NUMBER, 
	"BD_ID" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_TENANT" ADD CONSTRAINT "WF_TENANT_PK" PRIMARY KEY ("TENANT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."WF_TENANT" ADD CONSTRAINT "WF_TENANT_R01" FOREIGN KEY ("APT_SEQNO")
	  REFERENCES "PIBICSDM2"."WF_APARTMENT" ("APT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_TENANT_PK" ON "PIBICSDM2"."WF_TENANT" ("TENANT_SEQNO") 
  ;
