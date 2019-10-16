CREATE TABLE "PIBICSDM2"."WATCHLISTDOC" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"WLDOCNM" VARCHAR2(50 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WATCHLISTDOC" ADD CONSTRAINT "WATCHLISTDOC_PK" PRIMARY KEY ("WLCD", "SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WATCHLISTDOC_PK" ON "PIBICSDM2"."WATCHLISTDOC" ("WLCD", "SEQNO") 
  ;