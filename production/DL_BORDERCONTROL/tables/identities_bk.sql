CREATE TABLE "DL_BORDERCONTROL"."IDENTITIES_BK" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"IDENTITY" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BRDDOCID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"SOURCE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE
   ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES_BK" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES_BK" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES_BK" TO "BIOSUPPORT";
