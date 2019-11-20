CREATE TABLE "PIBICSDM2"."TMCOMPARE02" 
   (	"TMSEQ" NUMBER, 
	"SEQ" VARCHAR2(20 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR), 
	"TDTNO" VARCHAR2(40 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"BIRTHDTE" VARCHAR2(20 CHAR), 
	"NATIONENM" VARCHAR2(200 CHAR), 
	"CARDTYPE" VARCHAR2(10 CHAR), 
	"INOUTDTE" VARCHAR2(100 CHAR), 
	"CONVREGNO" VARCHAR2(40 CHAR), 
	"DEPTTNM" VARCHAR2(200 CHAR), 
	"VISA" VARCHAR2(200 CHAR), 
	"AGE" VARCHAR2(3 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMCOMPARE02" ADD CONSTRAINT "TMCOMPARE02_PK" PRIMARY KEY ("TMSEQ")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMCOMPARE02_PK" ON "PIBICSDM2"."TMCOMPARE02" ("TMSEQ") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMCOMPARE02" TO "BIOSAADM";
