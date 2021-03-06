CREATE TABLE "PIBICSDM2"."DRS_BAILDETAINEE_LOG" 
   (	"BAILDETAINEE_SEQNO" NUMBER, 
	"BAIL_SEQNO" NUMBER, 
	"DETENRECORD_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(50 CHAR), 
	"BAILDETAINEE_LOG_SEQNO" NUMBER, 
	"RECEIVEDETAINEE_SEQNO" NUMBER, 
	"BAIL_LOG_SEQNO" NUMBER, 
	"DETENRECORD_LOG_SEQNO" NUMBER, 
	"RECEIVEDETAINEE_LOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_BAILDETAINEE_LOG" ADD PRIMARY KEY ("BAILDETAINEE_LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_BAILDETAINEE_LOG" ADD FOREIGN KEY ("BAIL_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_BAIL" ("BAIL_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_BAILDETAINEE_LOG" ADD FOREIGN KEY ("DETENRECORD_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_DETENRECORD" ("DETENRECORD_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_BAILDETAINEE_LOG" ADD FOREIGN KEY ("BAIL_LOG_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_BAIL_LOG" ("BAIL_LOG_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_BAILDETAINEE_LOG" ADD FOREIGN KEY ("DETENRECORD_LOG_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_DETENRECORD_LOG" ("DETENRECORD_LOG_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_BAILDETAINEE_LOG" ADD FOREIGN KEY ("RECEIVEDETAINEE_LOG_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_RECEIVEDETAINEE_LOG" ("RECEIVEDETAINEE_LOG_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00206828" ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" ("BAILDETAINEE_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DRS_BAILDETAINEE_LOG" TO "BIOSAADM";
