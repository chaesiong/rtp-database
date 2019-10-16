CREATE TABLE "PIBICSDM2"."BPPERSON" 
   (	"BPPERSONSEQNO" NUMBER, 
	"BPCARDSEQNO" NUMBER, 
	"BPCARDPERSONSEQNO" NUMBER, 
	"BPINOUTSEQNO" NUMBER, 
	"BPCD" VARCHAR2(30 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"INOUTDTE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"BPDOCSEQNO" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"TFAMILYNM" VARCHAR2(100 CHAR), 
	"TFIRSTNM" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"PERMITDTE" DATE, 
	"ISUCARDDTE" DATE, 
	"EXPCARDDTE" DATE, 
	"CITIZENID" VARCHAR2(13 CHAR), 
	"IMGSTS" CHAR(1 CHAR), 
	"IMGINOUT" BLOB, 
	"FGPSTS" CHAR(1 CHAR), 
	"FGPLOCATION" VARCHAR2(100 CHAR), 
	"INTYPE" CHAR(1 CHAR), 
	"SAVETYPE" CHAR(1 CHAR), 
	"CHKHISTCARD" CHAR(1 CHAR), 
	"RESULTHISTCARD" CHAR(1 CHAR), 
	"CHKDETEN" CHAR(1 CHAR), 
	"RESULTDETEN" CHAR(1 CHAR), 
	"DETENPERSON" VARCHAR2(20 CHAR), 
	"CHKTHAIBL" CHAR(1 CHAR), 
	"RESULTTHAIBL" CHAR(1 CHAR), 
	"THAIBLPERSON" VARCHAR2(20 CHAR), 
	"CHKWLCD" CHAR(1 CHAR), 
	"WLCD" VARCHAR2(20 CHAR), 
	"FLAGFINES" CHAR(1 CHAR), 
	"FINES_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(1000 CHAR), 
	"AGE" NUMBER, 
	"HEIGHT" NUMBER, 
	"CONVREGNO" VARCHAR2(100 CHAR), 
	"ELSNDXNM" VARCHAR2(100 CHAR), 
	"EFSNDXNM" VARCHAR2(100 CHAR), 
	"EMSNDXNM" VARCHAR2(100 CHAR), 
	"TLSNDXNM" VARCHAR2(100 CHAR), 
	"TFSNDXNM" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."BPPERSON" ADD CONSTRAINT "BPPERSON_PK" PRIMARY KEY ("BPPERSONSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."BPPERSON" ADD CONSTRAINT "BPPERSON_U01" UNIQUE ("COUNT_SEQNO", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "SEX", "BIRTHDTE")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."BPPERSON" ADD CONSTRAINT "BPPERSON_U02" UNIQUE ("BPCD")
  USING INDEX (CREATE INDEX "PIBICSDM2"."BPPERSON_BPCD_IDX" ON "PIBICSDM2"."BPPERSON" ("BPCD") 
  )  ENABLE;
  ALTER TABLE "PIBICSDM2"."BPPERSON" ADD CONSTRAINT "BPPERSON_R01" FOREIGN KEY ("BPCARDSEQNO")
	  REFERENCES "PIBICSDM2"."BPCARD" ("BPCARDSEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPPERSON" ADD CONSTRAINT "BPPERSON_R03" FOREIGN KEY ("BPDOCSEQNO")
	  REFERENCES "PIBICSDM2"."BPDOCTYPE" ("BPDOCSEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPPERSON" ADD CONSTRAINT "BPPERSON_R04" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPPERSON" ADD CONSTRAINT "BPPERSON_R05" FOREIGN KEY ("FINES_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FINES" ("FINES_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."BPPERSON_BIRTHDTE_IDX" ON "PIBICSDM2"."BPPERSON" ("BIRTHDTE") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_BPCARDSEQNO_IDX" ON "PIBICSDM2"."BPPERSON" ("BPCARDSEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_BPCD_IDX" ON "PIBICSDM2"."BPPERSON" ("BPCD") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_CARDTYPE_IDX" ON "PIBICSDM2"."BPPERSON" ("CARDTYPE") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_COUNT_SEQNO_IDX" ON "PIBICSDM2"."BPPERSON" ("COUNT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_CREATE_BY_IDX" ON "PIBICSDM2"."BPPERSON" ("CREATE_BY") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_CREATE_DATE_IDX" ON "PIBICSDM2"."BPPERSON" (TO_CHAR("CREATE_DATE",'YYYYMMDD')) 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_DEPT_SEQNO_IDX" ON "PIBICSDM2"."BPPERSON" ("DEPT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_EFAMILYNM_IDX" ON "PIBICSDM2"."BPPERSON" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_EFIRSTNM_IDX" ON "PIBICSDM2"."BPPERSON" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_EMIDDLENM_IDX" ON "PIBICSDM2"."BPPERSON" ("EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_INOUTDTE_IDX" ON "PIBICSDM2"."BPPERSON" (TO_CHAR("INOUTDTE",'YYYYMMDD')) 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_PERMITDTE_IDX" ON "PIBICSDM2"."BPPERSON" (TO_CHAR("PERMITDTE",'YYYYMMDD')) 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_TFAMILYNM_IDX" ON "PIBICSDM2"."BPPERSON" ("TFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."BPPERSON_TFIRSTNM_IDX" ON "PIBICSDM2"."BPPERSON" ("TFIRSTNM") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."BPPERSON_PK" ON "PIBICSDM2"."BPPERSON" ("BPPERSONSEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."BPPERSON_U01" ON "PIBICSDM2"."BPPERSON" ("COUNT_SEQNO", "EFAMILYNM", "EFIRSTNM", "EMIDDLENM", "SEX", "BIRTHDTE") 
  ;
  ;