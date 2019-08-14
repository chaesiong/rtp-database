CREATE TABLE "DL_INTERFACE"."PARAMETERS" 
   (	"KEY_VALUE" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"PARAMETER_VALUE" VARCHAR2(250 CHAR) NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR)
   ) ;
  ALTER TABLE "DL_INTERFACE"."PARAMETERS" ADD CONSTRAINT "PARAMETERS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_INTERFACE"."PARAMETERS" ADD CONSTRAINT "PARAMETERS$CK02" CHECK (IS_ACTIVE in ('Y','N')) ENABLE;
  ALTER TABLE "DL_INTERFACE"."PARAMETERS" ADD CONSTRAINT "PARAMETERS$CK03" CHECK (DML_TYPE in ('I','U')) ENABLE;
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."KEY_VALUE" IS 'Primary key and keyword for the parameter';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."PARAMETER_VALUE" IS 'Value of the keyword / parameter';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."IS_ACTIVE" IS 'Is this parameter active? Y.es, N.o';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS"."NOTICE" IS 'Comment for Parameter';
   COMMENT ON TABLE "DL_INTERFACE"."PARAMETERS"  IS 'Table to save parameters for the interface schema';
  CREATE UNIQUE INDEX "DL_INTERFACE"."PARAMETERS$PK" ON "DL_INTERFACE"."PARAMETERS" ("KEY_VALUE") 
  ;
  GRANT DELETE ON "DL_INTERFACE"."PARAMETERS" TO "DL_COMMON";
  GRANT INSERT ON "DL_INTERFACE"."PARAMETERS" TO "DL_COMMON";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS" TO "DL_COMMON";
  GRANT UPDATE ON "DL_INTERFACE"."PARAMETERS" TO "DL_COMMON";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS" TO "SERVAPP";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS" TO "BIO_BD";
  GRANT DELETE ON "DL_INTERFACE"."PARAMETERS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_INTERFACE"."PARAMETERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_INTERFACE"."PARAMETERS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS" TO "APPSUP";
