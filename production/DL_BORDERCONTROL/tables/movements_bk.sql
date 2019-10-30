CREATE TABLE "DL_BORDERCONTROL"."MOVEMENTS_BK" 
   (	"MVMNTID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BRDDOCID" VARCHAR2(32 CHAR), 
	"LANDBARCD" NUMBER(14,0), 
	"EXITFLG" NUMBER(1,0) NOT NULL ENABLE, 
	"MAX_STAY_DT" DATE, 
	"FINGERMATCH" NUMBER(3,0), 
	"FACEMATCH" NUMBER(3,0), 
	"MVMNTADDR" VARCHAR2(40 CHAR), 
	"ORIDEST" VARCHAR2(80 CHAR), 
	"INS_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"REFUSEDFLG" NUMBER, 
	"OBSERVATION" VARCHAR2(255 CHAR), 
	"TRNSPRTUNITID" VARCHAR2(32 CHAR), 
	"PERSON_TYPE" NUMBER(32,0), 
	"SCANNED_FLIGHT" VARCHAR2(20 CHAR), 
	"PS_1" VARCHAR2(256 CHAR), 
	"PS_2" VARCHAR2(256 CHAR), 
	"PS_3" VARCHAR2(256 CHAR), 
	"PS_4" VARCHAR2(256 CHAR), 
	"PS_5" VARCHAR2(256 CHAR), 
	"PS_6" NUMBER, 
	"PS_7" NUMBER, 
	"PS_8" NUMBER, 
	"PS_9" NUMBER, 
	"PS_10" NUMBER, 
	"FINGERMATCH_HISTORY" NUMBER, 
	"FACEMATC_HISTORY" NUMBER, 
	"REASON_OFFLOAD" VARCHAR2(256 CHAR), 
	"REASON_DEPORTEE" VARCHAR2(256 CHAR), 
	"VISA_TYPE" VARCHAR2(32 CHAR), 
	"VISA" VARCHAR2(32 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"IS_FINISHED" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"PRIOR_MOVEMENT" VARCHAR2(32 CHAR), 
	"ENTRY_FORM" VARCHAR2(32 CHAR), 
	"FORM_NO_APPROVED" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"MOVEMENT_DT" DATE NOT NULL ENABLE, 
	"SOURCE_SYSTEM" NUMBER NOT NULL ENABLE, 
	"DATE_OF_ENTRY" TIMESTAMP (6), 
	"MRZVISA" VARCHAR2(255 CHAR)
   ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BK" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BK" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENTS_BK" TO "BIOSUPPORT";
