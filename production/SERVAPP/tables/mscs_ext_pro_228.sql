CREATE TABLE "SERVAPP"."MSCS_EXT_PRO_228" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"ALIEN_DETAIL" VARCHAR2(2000 CHAR), 
	"COMMAND_FROM" VARCHAR2(150 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FACT1" CHAR(1 CHAR), 
	"FACT2" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_PRO_228" ADD CONSTRAINT "MSCS_EXT_PRO_228_PK" PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_EXT_PRO_228_PK" ON "SERVAPP"."MSCS_EXT_PRO_228" ("PRO_SEQNO") 
  ;