CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_FN_HOTELTYPE" 
   (	"HTYPE_SEQNO" NUMBER, 
	"TYPENAME" VARCHAR2(50 CHAR), 
	"SHORTNESS" CHAR(1 CHAR), 
	"RUNNO" VARCHAR2(5 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"VERSION" NUMBER, 
	"SUBTYPE_FLAG" CHAR(1 CHAR), 
	"TYPE_NUM" VARCHAR2(2 CHAR), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_FN_HOTELTYPE" ADD CONSTRAINT "TMP_SYNC_MAS_FN_HOTELTYPE_PK" PRIMARY KEY ("HTYPE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_FN_HOTELTYPE_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_FN_HOTELTYPE" ("HTYPE_SEQNO") 
  ;
