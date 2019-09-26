CREATE TABLE "PIBICSDM2"."WELFARE_WATERDETAILOT" 
   (	"CITIZENID" CHAR(13 CHAR), 
	"FSCYEAR" CHAR(4 CHAR), 
	"MONTH" NUMBER, 
	"WATERFEES" NUMBER(7,2), 
	"PROFILE_SEQNO" NUMBER, 
	"VERSION" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"WOT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WELFARE_WATERDETAILOT" ADD CONSTRAINT "WELFARE_WATERDETAILOT_PK" PRIMARY KEY ("WOT_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WELFARE_WATERDETAILOT_PK" ON "PIBICSDM2"."WELFARE_WATERDETAILOT" ("WOT_SEQNO") 
  ;
