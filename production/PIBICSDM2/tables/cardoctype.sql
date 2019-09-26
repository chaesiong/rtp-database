CREATE TABLE "PIBICSDM2"."CARDOCTYPE" 
   (	"SEQNO" NUMBER, 
	"TYPENM" VARCHAR2(250 CHAR), 
	"PERMITDAY" NUMBER, 
	"VERSION" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CARDOCTYPE" ADD PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
  ;
