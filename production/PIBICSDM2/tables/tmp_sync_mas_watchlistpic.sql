CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_WATCHLISTPIC" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"WLPIC" BLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_WATCHLISTPIC" ADD CONSTRAINT "TMP_SYNC_MAS_WATCHLISTPIC_PK" PRIMARY KEY ("SEQNO", "WLCD")
  USING INDEX  ENABLE;
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_WATCHLISTPIC_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_WATCHLISTPIC" ("SEQNO", "WLCD") 
  ;