CREATE TABLE "DL_COMMON"."DYNAMIC_SQLS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"APP_ALIAS" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"PAGE_ID" NUMBER(10,0), 
	"SQL_TEXT" CLOB, 
	"SQL_TYPE" VARCHAR2(255 CHAR) DEFAULT ON NULL 'SQL' NOT NULL ENABLE, 
	"COMMENTS" VARCHAR2(4000 CHAR), 
	"OWNER" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"BIND_VAR_NAMES" VARCHAR2(4000 CHAR), 
	"BIND_VAR_VALUES" VARCHAR2(4000 CHAR), 
	"BIND_VAR_SEPARATOR" VARCHAR2(1 CHAR) DEFAULT ON NULL ':' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."DYNAMIC_SQLS" ADD CONSTRAINT "DYNAMIC_SQLS$CHK00" CHECK (DML_TYPE in ('I', 'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."DYNAMIC_SQLS" ADD CONSTRAINT "DYNAMIC_SQLS$CHK01" CHECK (SQL_TYPE in ('SQL', 'PLSQL')) ENABLE;
  ALTER TABLE "DL_COMMON"."DYNAMIC_SQLS" ADD CONSTRAINT "DYNAMIC_SQLS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."DYNAMIC_SQLS" ADD CONSTRAINT "DYNAMIC_SQLS$UK00" UNIQUE ("NAME", "APP_ALIAS")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."DYNAMIC_SQLS" ADD CONSTRAINT "DYNAMIC_SQLS$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
  CREATE UNIQUE INDEX "DL_COMMON"."DYNAMIC_SQLS$PK" ON "DL_COMMON"."DYNAMIC_SQLS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."DYNAMIC_SQLS$UK00" ON "DL_COMMON"."DYNAMIC_SQLS" ("NAME", "APP_ALIAS") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."SYS_IL0000722946C00005$$" ON "DL_COMMON"."DYNAMIC_SQLS" (
  ;
  GRANT SELECT ON "DL_COMMON"."DYNAMIC_SQLS" TO PUBLIC;