CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_DRS_RELEASEDETAINEE" 
   (	"RELEASEDETAINEE_SEQNO" NUMBER, 
	"RELEASE_SEQNO" NUMBER, 
	"DETENRECORD_SEQNO" NUMBER, 
	"RELEASETYPE_SEQNO" NUMBER, 
	"ISSUEDEPT_TO" NUMBER, 
	"FLIGHTNO" VARCHAR2(10 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"AIRLINENM" VARCHAR2(100 CHAR), 
	"PENALTYRATE" VARCHAR2(20 CHAR), 
	"REMARK" VARCHAR2(200 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"RELEASE_NO" VARCHAR2(50 CHAR), 
	"FLIGHTPREFIX" VARCHAR2(10 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(10 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_DRS_RELEASEDETAINEE" ADD CONSTRAINT "TMP_SYNC_MAS_DRS_RELEASEDETAINEE_PK" PRIMARY KEY ("RELEASEDETAINEE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_DRS_RELEASEDETAINEE_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_DRS_RELEASEDETAINEE" ("RELEASEDETAINEE_SEQNO") 
  ;
