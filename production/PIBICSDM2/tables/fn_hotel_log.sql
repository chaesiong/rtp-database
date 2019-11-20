CREATE TABLE "PIBICSDM2"."FN_HOTEL_LOG" 
   (	"FN_HOTEL_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"HOTEL_SEQNO" NUMBER, 
	"HOTELCD" VARCHAR2(10 CHAR), 
	"HTYPE_SEQNO" NUMBER, 
	"NAME" VARCHAR2(200 CHAR), 
	"ADDR" VARCHAR2(1000 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(100 CHAR), 
	"FAX" VARCHAR2(100 CHAR), 
	"EMAIL" VARCHAR2(50 CHAR), 
	"PASSWORD" VARCHAR2(20 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"APPV_DATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."FN_HOTEL_LOG" ADD CONSTRAINT "FN_HOTEL_LOG_PK" PRIMARY KEY ("FN_HOTEL_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FN_HOTEL_LOG_PK" ON "PIBICSDM2"."FN_HOTEL_LOG" ("FN_HOTEL_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FN_HOTEL_LOG" TO "BIOSAADM";
