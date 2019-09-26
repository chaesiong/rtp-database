CREATE TABLE "PIBICSDM2"."WATCHLISTNM" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"WLTLASTNM" VARCHAR2(60 CHAR), 
	"WLTFIRSTNM" VARCHAR2(60 CHAR), 
	"WLTMIDDLENM" VARCHAR2(60 CHAR), 
	"WLELASTNM" VARCHAR2(60 CHAR), 
	"WLEMIDDLENM" VARCHAR2(60 CHAR), 
	"WLEFIRSTNM" VARCHAR2(60 CHAR), 
	"EFSNDXNM" VARCHAR2(60 CHAR), 
	"EMSNDXNM" VARCHAR2(60 CHAR), 
	"ELSNDXNM" VARCHAR2(60 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"TFSNDXNM" VARCHAR2(60 CHAR), 
	"TMSNDXNM" VARCHAR2(60 CHAR), 
	"TLSNDXNM" VARCHAR2(60 CHAR), 
	"FLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WATCHLISTNM" ADD CONSTRAINT "PK_WATCHLISTNM" PRIMARY KEY ("SEQNO", "WLCD")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."WATCHLISTNM_I1" ON "PIBICSDM2"."WATCHLISTNM" ("NATIONCD", "WLCD") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_BIRTHDTE_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("BIRTHDTE") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_NATIONCD_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_WLCD_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("WLCD") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_WLEFIRSTNM_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("WLEFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_WLELASTNM_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("WLELASTNM") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_WLEMIDDLENM_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("WLEMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_WLTFIRSTNM_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("WLTFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_WLTLASTNM_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("WLTLASTNM") 
  ;
CREATE INDEX "PIBICSDM2"."WLNM_WLTMIDDLENM_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("WLTMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."WL_CONCAT_IDX" ON "PIBICSDM2"."WATCHLISTNM" ("WLEFIRSTNM"||' '||"WLEMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."WL_CONCAT_IDX3" ON "PIBICSDM2"."WATCHLISTNM" (REPLACE("WLEFIRSTNM"||"WLEMIDDLENM",' ','')) 
  ;
CREATE INDEX "PIBICSDM2"."WL_CONCAT_IDX4" ON "PIBICSDM2"."WATCHLISTNM" (REPLACE("WLEFIRSTNM"||"WLELASTNM"||"WLEMIDDLENM",' ','')) 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."PK_WATCHLISTNM" ON "PIBICSDM2"."WATCHLISTNM" ("SEQNO", "WLCD") 
  ;
