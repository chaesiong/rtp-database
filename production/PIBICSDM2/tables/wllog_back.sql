CREATE TABLE "PIBICSDM2"."WLLOG_BACK" 
   (	"USERID" CHAR(6 CHAR), 
	"WLLOGDTE" DATE, 
	"WLCD" VARCHAR2(7 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"INOUTDTE" DATE, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"REASONCD" CHAR(4 CHAR), 
	"TRAVEL" CHAR(1 CHAR), 
	"WLLOGID" NUMBER(38,0), 
	"NATIONCD" VARCHAR2(60 CHAR), 
	"PRINTFLAG" VARCHAR2(1 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR), 
	"TDTNO" VARCHAR2(20 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"DEPTCD" CHAR(5 CHAR), 
	"WLIMG" BLOB, 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"ORGCD" CHAR(4 CHAR)
   ) ;
  CREATE INDEX "PIBICSDM2"."IDX_WLLOG_BIRTHDTE" ON "PIBICSDM2"."WLLOG_BACK" ("BIRTHDTE") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_DEPTCD" ON "PIBICSDM2"."WLLOG_BACK" ("DEPTCD") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_EFAMILYNM" ON "PIBICSDM2"."WLLOG_BACK" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_EFIRSTNM" ON "PIBICSDM2"."WLLOG_BACK" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_EMIDDLENM" ON "PIBICSDM2"."WLLOG_BACK" ("EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_NATIONCD" ON "PIBICSDM2"."WLLOG_BACK" ("NATIONCD") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_ORGCD" ON "PIBICSDM2"."WLLOG_BACK" ("ORGCD") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_SEX" ON "PIBICSDM2"."WLLOG_BACK" ("SEX") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_TFAMILYNM" ON "PIBICSDM2"."WLLOG_BACK" ("TFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_TFIRSTNM" ON "PIBICSDM2"."WLLOG_BACK" ("TFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_WLCD" ON "PIBICSDM2"."WLLOG_BACK" ("WLCD") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_WLLOG_WLLOGDTE" ON "PIBICSDM2"."WLLOG_BACK" (TO_CHAR("WLLOGDTE",'dd/mm/yyyy')) 
  ;
  ;
