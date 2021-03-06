CREATE TABLE "PIBICSDM2"."BPCARD" 
   (	"BPCARDSEQNO" NUMBER, 
	"BPCARDPERSONSEQNO" NUMBER, 
	"BPNUM" NUMBER(*,0), 
	"BPCD" VARCHAR2(30 CHAR), 
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
	"ISUCARDDTE" DATE, 
	"EXPCARDDTE" DATE, 
	"CITIZENID" VARCHAR2(13 CHAR), 
	"IMGSTS" CHAR(1 CHAR), 
	"IMGBP" BLOB, 
	"REMARK" VARCHAR2(1000 CHAR), 
	"FGPSTS" CHAR(1 CHAR), 
	"FGPREMARK" VARCHAR2(1000 CHAR), 
	"BPCARDSTS" CHAR(1 CHAR), 
	"CANCELDTE" DATE, 
	"CANCELREMARK" VARCHAR2(1000 CHAR), 
	"PRINTCARDNUM" NUMBER, 
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
	"AGE" NUMBER, 
	"HEIGHT" NUMBER, 
	"BPTYPECARD" VARCHAR2(40 CHAR), 
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
  ALTER TABLE "PIBICSDM2"."BPCARD" ADD CONSTRAINT "BPCARD_PK" PRIMARY KEY ("BPCARDSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."BPCARD" ADD CONSTRAINT "BPCARD_R02" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPCARD" ADD CONSTRAINT "BPCARD_R03" FOREIGN KEY ("BPDOCSEQNO")
	  REFERENCES "PIBICSDM2"."BPDOCTYPE" ("BPDOCSEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPCARD" ADD CONSTRAINT "BPCARD_R04" FOREIGN KEY ("BPCARDPERSONSEQNO")
	  REFERENCES "PIBICSDM2"."BPCARDPERSON" ("BPCARDPERSONSEQNO") DISABLE;
  CREATE INDEX "PIBICSDM2"."BPCARD_BIRTHDTE_IDX" ON "PIBICSDM2"."BPCARD" ("BIRTHDTE") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_BPCD_IDX" ON "PIBICSDM2"."BPCARD" ("BPCD") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_COUNT_SEQNO_IDX" ON "PIBICSDM2"."BPCARD" ("COUNT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_CREATE_BY_IDX" ON "PIBICSDM2"."BPCARD" ("CREATE_BY") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_CREATE_DATE_IDX" ON "PIBICSDM2"."BPCARD" (TO_CHAR("CREATE_DATE",'YYYYMMDD')) 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_DEPT_SEQNO_IDX" ON "PIBICSDM2"."BPCARD" ("DEPT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_EFAMILYNM_IDX" ON "PIBICSDM2"."BPCARD" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_EFIRSTNM_IDX" ON "PIBICSDM2"."BPCARD" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_EMIDDLENM_IDX" ON "PIBICSDM2"."BPCARD" ("EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_EXPCARDDTE_IDX" ON "PIBICSDM2"."BPCARD" (TO_CHAR("EXPCARDDTE",'YYYYMMDD')) 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_ISUCARDDTE_IDX" ON "PIBICSDM2"."BPCARD" (TO_CHAR("ISUCARDDTE",'YYYYMMDD')) 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_PERSONSEQNO_IDX" ON "PIBICSDM2"."BPCARD" ("BPCARDPERSONSEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_TFAMILYNM_IDX" ON "PIBICSDM2"."BPCARD" ("TFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."BPCARD_TFIRSTNM_IDX" ON "PIBICSDM2"."BPCARD" ("TFIRSTNM") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."BPCARD_PK" ON "PIBICSDM2"."BPCARD" ("BPCARDSEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300828C00019$$" ON "PIBICSDM2"."BPCARD" (
  ;
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."BPCARD" TO "BIOSAADM";
