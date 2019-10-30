CREATE TABLE "DL_INTERFACE"."PARAMETERS$HIS" 
   (	"KEY_VALUE" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"PARAMETER_VALUE" VARCHAR2(250 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_TYPE" VARCHAR2(1 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR)
   ) ;
  ALTER TABLE "DL_INTERFACE"."PARAMETERS$HIS" ADD CONSTRAINT "PARAMETERS$HIS$CK00" CHECK (DML_TYPE in ('I','U','D')) ENABLE;
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."KEY_VALUE" IS 'Primary key and keyword for the parameter';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."PARAMETER_VALUE" IS 'Value of the keyword / parameter';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."IS_ACTIVE" IS 'Is this parameter active? Y.es, N.o';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."PARAMETERS$HIS"."NOTICE" IS 'Comment for Parameter';
   COMMENT ON TABLE "DL_INTERFACE"."PARAMETERS$HIS"  IS 'Table to save parameters for the interface schema';
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_INTERFACE"."PARAMETERS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_INTERFACE"."PARAMETERS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_INTERFACE"."PARAMETERS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_INTERFACE"."PARAMETERS$HIS" TO "BIOSUPPORT";
