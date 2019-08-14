CREATE TABLE "DL_COMMON"."PLJSON_TESTSUITE" 
   (	"SUITE_ID" NUMBER, 
	"SUITE_NAME" VARCHAR2(30), 
	"FILE_NAME" VARCHAR2(30), 
	"PASSED" NUMBER, 
	"FAILED" NUMBER, 
	"TOTAL" NUMBER
   ) ;
  GRANT SELECT ON "DL_COMMON"."PLJSON_TESTSUITE" TO "SERVAPP";
  GRANT ALTER ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT DELETE ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT INDEX ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT INSERT ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT UPDATE ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT READ ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT QUERY REWRITE ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT DEBUG ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT FLASHBACK ON "DL_COMMON"."PLJSON_TESTSUITE" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."PLJSON_TESTSUITE" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PLJSON_TESTSUITE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PLJSON_TESTSUITE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PLJSON_TESTSUITE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PLJSON_TESTSUITE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PLJSON_TESTSUITE" TO "APPSUP";
