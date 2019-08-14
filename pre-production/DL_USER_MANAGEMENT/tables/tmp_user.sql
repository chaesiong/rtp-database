CREATE TABLE "DL_USER_MANAGEMENT"."TMP_USER" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"FIRST_NAME" VARCHAR2(100 CHAR), 
	"LAST_NAME" VARCHAR2(100 CHAR)
   ) ;
  GRANT ALTER ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT READ ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."TMP_USER" TO "PIBICSAPP";
