CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_RANK" 
   (	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"RANKFULLNM" VARCHAR2(30 CHAR), 
	"RANKNM" VARCHAR2(20 CHAR), 
	"UPD_ID" VARCHAR2(13 CHAR), 
	"UPD_DATE" TIMESTAMP (6), 
	"UPD_ORG" VARCHAR2(5 CHAR), 
	"NEXT_RANK" VARCHAR2(3 CHAR), 
	"SPECIAL_RANK" VARCHAR2(3 CHAR), 
	"RANKID" CHAR(2 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_RANK" ADD CONSTRAINT "TMP_SYNC_MAS_RANK_PK" PRIMARY KEY ("RANK_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_RANK_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_RANK" ("RANK_SEQNO") 
  ;
