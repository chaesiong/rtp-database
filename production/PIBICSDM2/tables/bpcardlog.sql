CREATE TABLE "PIBICSDM2"."BPCARDLOG" 
   (	"BPCARDLOGSEQNO" NUMBER, 
	"BPCARDSEQNO" NUMBER, 
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
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDATE" TIMESTAMP (6), 
	"LOGUSER" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"HEIGHT" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."BPCARDLOG" ADD CONSTRAINT "BPCARDLOG_PK" PRIMARY KEY ("BPCARDLOGSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."BPCARDLOG" ADD CONSTRAINT "BPCARDLOG_R02" FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."BPCARDLOG" ADD CONSTRAINT "BPCARDLOG_R03" FOREIGN KEY ("BPDOCSEQNO")
	  REFERENCES "PIBICSDM2"."BPDOCTYPE" ("BPDOCSEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."BPCARDLOG_PK" ON "PIBICSDM2"."BPCARDLOG" ("BPCARDLOGSEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300831C00020$$" ON "PIBICSDM2"."BPCARDLOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."BPCARDLOG" TO "BIOSAADM";
