CREATE TABLE "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0)
   ) ;
  ALTER TABLE "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" ADD CONSTRAINT "INCIDNT_TYPES$I18N$HIS$CHK$C05" CHECK (DML_TYPE in ('I'
                                                                                                              ,'U'
                                                                                                              ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."DISPLAY_VALUE" IS 'Name of the Incident Types';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."INCIDENT_TYPES$I18N$HIS"  IS 'History of Translation of Incident Types';
  CREATE INDEX "DL_COMMON"."INCIDENT_TYPES$I18N$HIS$IX00" ON "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" ("KEY_VALUE", "LOCALE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."INCIDENT_TYPES$I18N$HIS" TO "APPSUP";
