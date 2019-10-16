CREATE TABLE "SERVAPP"."MSCS_GUARTBANK" 
   (	"GUARTBANK_SEQNO" NUMBER NOT NULL ENABLE, 
	"GUARTDEPT_SEQNO" NUMBER, 
	"BANKNM" VARCHAR2(250 CHAR), 
	"BANKDESC" VARCHAR2(250 CHAR), 
	"AMOUNT" NUMBER(38,0), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_GUARTBANK" ADD CONSTRAINT "GUARTBANK_PK" PRIMARY KEY ("GUARTBANK_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."GUARTBANK_PK" ON "SERVAPP"."MSCS_GUARTBANK" ("GUARTBANK_SEQNO") 
  ;