CREATE TABLE "PIBICSDM2"."FN_HOTEL_U" 
   (	"HOTEL_SEQNO" NUMBER(10,0), 
	"HOTELCD" VARCHAR2(500 CHAR), 
	"HTYPE_SEQNO" NUMBER(10,0), 
	"DEPT_SEQNO" NUMBER(10,0), 
	"NAME" VARCHAR2(500 CHAR), 
	"ADDR" VARCHAR2(500 CHAR), 
	"ROAD" VARCHAR2(500 CHAR), 
	"PV_SEQNO" NUMBER(10,0), 
	"AMP_SEQNO" NUMBER(10,0), 
	"TMB_SEQNO" NUMBER(10,0), 
	"POSTCODE" VARCHAR2(500 CHAR), 
	"TEL" VARCHAR2(500 CHAR), 
	"FAX" VARCHAR2(500 CHAR), 
	"EMAIL" VARCHAR2(500 CHAR), 
	"PASSWORD" VARCHAR2(500 CHAR), 
	"CREATE_BY" VARCHAR2(500 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(500 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"PV_NAME" VARCHAR2(500 CHAR), 
	"AMP_NAME" VARCHAR2(500 CHAR), 
	"TMB_NAME" VARCHAR2(500 CHAR), 
	"REMARK" VARCHAR2(500 CHAR), 
	"moo" VARCHAR2(500 CHAR), 
	"soi" VARCHAR2(500 CHAR), 
	"PASSWORDMD5" VARCHAR2(150 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FN_HOTEL_U" TO "BIOSAADM";
