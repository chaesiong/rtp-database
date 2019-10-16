CREATE TABLE "PIBICSDM2"."FS_ACCOUNTPERSON" 
   (	"FSACCPERSONSEQNO" NUMBER, 
	"FSACCOUNTSEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"ACPAMOUNT2PER" NUMBER(7,2), 
	"ACPAMOUNT1PER" NUMBER(7,2), 
	"ACPAMOUNT" NUMBER(7,2), 
	"FSDEPT_SEQNO" NUMBER, 
	"POSLEVEL_SEQNO" NUMBER, 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"FSFIRSTNM" VARCHAR2(60 CHAR), 
	"FSFAMILYNM" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FS_ACCOUNTPERSON" ADD CONSTRAINT "FS_ACCOUNTPERSON_PK" PRIMARY KEY ("FSACCPERSONSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_ACCOUNTPERSON" ADD CONSTRAINT "FS_ACCOUNTPERSON_R01" FOREIGN KEY ("FSACCOUNTSEQNO")
	  REFERENCES "PIBICSDM2"."FS_ACCOUNT" ("FSACCOUNTSEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."FS_ACCOUNTPERSON" ADD CONSTRAINT "FS_ACCOUNTPERSON_R04" FOREIGN KEY ("POSLEVEL_SEQNO")
	  REFERENCES "PIBICSDM2"."POSLEVEL" ("POSLEVEL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FS_ACCOUNTPERSON_PK" ON "PIBICSDM2"."FS_ACCOUNTPERSON" ("FSACCPERSONSEQNO") 
  ;