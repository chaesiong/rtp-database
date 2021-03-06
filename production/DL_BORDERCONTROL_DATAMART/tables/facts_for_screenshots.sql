CREATE TABLE "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" 
   (	"DIMENSION_MOVEMENT_TYPES_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DIMENSION_AGENTS_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DIMENSION_OFFICERS_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DIMENSION_BORDER_POSTS_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DIMENSION_TRANSPORT_MODES_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DIMENSION_GENDER_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DIMENSION_DOCUMENT_TYPES_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DIMENSION_TIME_ID" NUMBER NOT NULL ENABLE, 
	"DIMENSION_VISA_TYPES_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DIMENSION_AGES_ID" NUMBER(3,0) NOT NULL ENABLE, 
	"COUNT_MOVEMENTS" NUMBER NOT NULL ENABLE, 
	"COUNT_INCIDENTS" NUMBER NOT NULL ENABLE, 
	"DIMENSION_NATIONALITIES_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE
   ) ;
   COMMENT ON TABLE "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS"  IS 'Only needed for making screenshots of the reporting application in APEX. Rows can be copied into the fact table.';
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."FACTS_FOR_SCREENSHOTS" TO "BIOSUPPORT";
