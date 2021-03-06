CREATE TABLE "PIBICSDM2"."INV_SUSPECT" 
   (	"SP_SEQNO" NUMBER, 
	"SP_IDCARD" VARCHAR2(13 CHAR), 
	"SP_TNAME" VARCHAR2(20 CHAR), 
	"SP_TSNAME" VARCHAR2(20 CHAR), 
	"SP_ENAME" VARCHAR2(20 CHAR), 
	"SP_EMNAME" VARCHAR2(20 CHAR), 
	"SP_ESNAME" VARCHAR2(20 CHAR), 
	"COUNT_SEQNO1" NUMBER, 
	"COUNT_SEQNO2" NUMBER, 
	"COUNT_SEQNO3" NUMBER, 
	"REL_CODE" VARCHAR2(2 CHAR), 
	"SP_GENDER" CHAR(1 CHAR), 
	"SP_BIRTHDATE" VARCHAR2(10 CHAR), 
	"SP_BIRTHPLACE" VARCHAR2(60 CHAR), 
	"SP_PASSNO" VARCHAR2(20 CHAR), 
	"SP_PASSISSUE" VARCHAR2(20 CHAR), 
	"SP_PASSISSUEDATE" DATE, 
	"SP_PASSEXPIREDATE" DATE, 
	"VISATYPE_SEQNO" NUMBER, 
	"SP_VISAEXPIREDATE" DATE, 
	"SP_TM6" VARCHAR2(7 CHAR), 
	"SP_CURRENTADDR" VARCHAR2(60 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"SP_CURRENTPOSTCD" CHAR(5 CHAR), 
	"SP_CURRENTTELNO" VARCHAR2(20 CHAR), 
	"SP_CURRENTMOBILENO" VARCHAR2(20 CHAR), 
	"SP_CURRENTEMAIL" VARCHAR2(30 CHAR), 
	"SP_HOMEADDR" VARCHAR2(60 CHAR), 
	"COUNT_SEQNO4" NUMBER, 
	"SP_HOMETELNO" VARCHAR2(20 CHAR), 
	"SP_SECURITYLEVEL" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"SP_REMARK1" VARCHAR2(60 CHAR), 
	"SP_REMARK2" VARCHAR2(60 CHAR), 
	"SP_REMARK3" VARCHAR2(60 CHAR), 
	"SP_REMARK4" VARCHAR2(60 CHAR), 
	"SP_REMARK5" VARCHAR2(60 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"SP_MARK" VARCHAR2(200 CHAR), 
	"DEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_PK" PRIMARY KEY ("SP_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R09" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R01" FOREIGN KEY ("COUNT_SEQNO1")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R02" FOREIGN KEY ("COUNT_SEQNO2")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R03" FOREIGN KEY ("COUNT_SEQNO3")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R04" FOREIGN KEY ("COUNT_SEQNO4")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R08" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R07" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R05" FOREIGN KEY ("REL_CODE")
	  REFERENCES "PIBICSDM2"."RELIGION" ("REL_CODE") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SUSPECT" ADD CONSTRAINT "INV_SUSPECT_R06" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SUSPECT_PK" ON "PIBICSDM2"."INV_SUSPECT" ("SP_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SUSPECT" TO "BIOSAADM";
