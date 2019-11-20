CREATE TABLE "PIBICSDM2"."TEMP_BIO_STAT" 
   (	"DATE_OF_ENTRY" TIMESTAMP (6), 
	"MVMNTID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"EXITFLG" NUMBER(1,0) NOT NULL ENABLE, 
	"DOCNO" VARCHAR2(15 CHAR) NOT NULL ENABLE, 
	"GIVENNAME" VARCHAR2(150 CHAR), 
	"SURNAME" VARCHAR2(150 CHAR) NOT NULL ENABLE, 
	"SEX" NUMBER(32,0) NOT NULL ENABLE, 
	"NAT" VARCHAR2(20 CHAR) NOT NULL ENABLE, 
	"BORDER_TYPE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"IPADDRESS" VARCHAR2(15 CHAR), 
	"USER_ID" VARCHAR2(255 CHAR), 
	"USERNAME" VARCHAR2(100 CHAR), 
	"DURATION_TIME" INTERVAL DAY (9) TO SECOND (6), 
	"DIFF_SECOND" NUMBER
   ) ;
  GRANT ALTER ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TEMP_BIO_STAT" TO "BIOSAADM";
