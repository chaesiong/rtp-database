CREATE TABLE "PIBICSDM2"."DOCSTMINOUT" 
   (	"DOCSEQNO" NUMBER, 
	"SEQNO" VARCHAR2(100 CHAR), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"TDTCD" VARCHAR2(4 CHAR), 
	"TDTNO" VARCHAR2(60 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"IMGDOC" BLOB, 
	"REMARK" VARCHAR2(1000 CHAR), 
	"CREUSR" VARCHAR2(30 CHAR), 
	"CREDTE" DATE, 
	"CREDTERM" VARCHAR2(20 CHAR), 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"UPDTERM" VARCHAR2(20 CHAR), 
	"FILEDOC" VARCHAR2(100 CHAR), 
	"DEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DOCSTMINOUT" ADD CONSTRAINT "DOCSTMINOUT_PK" PRIMARY KEY ("DOCSEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."DTM_CREUSR_IDX" ON "PIBICSDM2"."DOCSTMINOUT" ("CREUSR") 
  ;
CREATE INDEX "PIBICSDM2"."DTM_SEQNO_IDX" ON "PIBICSDM2"."DOCSTMINOUT" ("SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."DOCSTMINOUT_PK" ON "PIBICSDM2"."DOCSTMINOUT" ("DOCSEQNO") 
  ;
  ;