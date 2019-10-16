CREATE TABLE "SERVAPP"."MSCS_PROHIBIT" 
   (	"PHB_SEQNO" NUMBER NOT NULL ENABLE, 
	"PHBNO" VARCHAR2(15 CHAR), 
	"PHBDTE" DATE, 
	"PHBUSRID" VARCHAR2(20 CHAR), 
	"DOCID" NUMBER(5,0), 
	"DOCNO" VARCHAR2(20 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(30 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" NUMBER, 
	"ISSDTE" DATE, 
	"ISSPLACE" VARCHAR2(100 CHAR), 
	"EXPDTE" DATE, 
	"DEPTDPT_SEQNO" NUMBER, 
	"DEPTFWDNOTE" CHAR(200 CHAR), 
	"ANU_SEQNO" NUMBER, 
	"ANUNOTE" VARCHAR2(500 CHAR), 
	"DEPTPER" VARCHAR2(60 CHAR), 
	"DEPTDOCNO" VARCHAR2(20 CHAR), 
	"DEPTDOCDTE" DATE, 
	"BEHAVIOR" VARCHAR2(250 CHAR), 
	"METHOD" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"IODTE" DATE, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"TM6NO" CHAR(7 CHAR), 
	"CONV_SEQNO" NUMBER, 
	"DETENRECORD_IDCNO" VARCHAR2(15 CHAR), 
	"TMINOUT_SEQNO" NUMBER, 
	"CHECKIO" CHAR(1 CHAR), 
	"IMGPHB" BLOB, 
	"IMGPASS" BLOB, 
	"PIBICSPK" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_PROHIBIT" ADD CONSTRAINT "PROHIBIT_PK" PRIMARY KEY ("PHB_SEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "SERVAPP"."CREATE_DATE_IDX1" ON "SERVAPP"."MSCS_PROHIBIT" (TO_CHAR("CREATE_DATE",'yyyymmddhh24miss')) 
  ;
CREATE INDEX "SERVAPP"."CREATE_DATE_IDX2" ON "SERVAPP"."MSCS_PROHIBIT" (TO_CHAR("CREATE_DATE",'yyyymmdd')) 
  ;
CREATE UNIQUE INDEX "SERVAPP"."PROHIBIT_PK" ON "SERVAPP"."MSCS_PROHIBIT" ("PHB_SEQNO") 
  ;
  ;
  ;