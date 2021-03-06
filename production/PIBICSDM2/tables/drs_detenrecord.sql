CREATE TABLE "PIBICSDM2"."DRS_DETENRECORD" 
   (	"DETENRECORD_SEQNO" NUMBER, 
	"DETENPERSON_SEQNO" NUMBER, 
	"IDCNO" VARCHAR2(15 CHAR), 
	"IDCDEPT_SEQNO" NUMBER, 
	"IDCTYPE_SEQNO" NUMBER, 
	"IDCSTS_SEQNO" NUMBER, 
	"RECV_FROM" VARCHAR2(100 CHAR), 
	"RECV_DATE" TIMESTAMP (6), 
	"RELEASE_FROM" VARCHAR2(100 CHAR), 
	"RELEASE_DATE" DATE, 
	"MASTER_ALLEGE" VARCHAR2(200 CHAR), 
	"OTHER_ALLEGE" VARCHAR2(200 CHAR), 
	"DETAINROOM_SEQNO" NUMBER, 
	"DETAINOFFICE_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORT_ISSUE" VARCHAR2(100 CHAR), 
	"PASSPORTEXP_DATE" DATE, 
	"CONTACTNM" VARCHAR2(100 CHAR), 
	"CONTACT_TEL" VARCHAR2(100 CHAR), 
	"CONTACT_MOBILE" VARCHAR2(100 CHAR), 
	"CONTACT_ADD" VARCHAR2(100 CHAR), 
	"CONTACT_ROAD" VARCHAR2(100 CHAR), 
	"CONTACT_TAMBON" VARCHAR2(100 CHAR), 
	"CONTACT_CITY" VARCHAR2(100 CHAR), 
	"CONTACT_STATE" VARCHAR2(100 CHAR), 
	"CONTACTCOUNT_SEQNO" NUMBER, 
	"CONTACT_ZIPCODE" VARCHAR2(20 CHAR), 
	"ENT_ROUTE" VARCHAR2(1500 CHAR), 
	"ENT_VEHICLE" VARCHAR2(60 CHAR), 
	"EXIT_ROUTE" VARCHAR2(100 CHAR), 
	"STATUSCOMPLETE" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"RECVTYPE_SEQNO" NUMBER, 
	"RELEASETYPE_SEQNO" NUMBER, 
	"REMARK" VARCHAR2(500 CHAR), 
	"RELEASE_EXITROUTE" VARCHAR2(200 CHAR), 
	"INROOM_FLAG" CHAR(1 CHAR), 
	"INROOMDESC" VARCHAR2(1000 CHAR), 
	"RECVTYPE" CHAR(1 CHAR), 
	"RECVFROMDEPT_SEQNO" NUMBER, 
	"REASON_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_DETENRECORD" ADD CONSTRAINT "DRS_DETENRECORD_PK" PRIMARY KEY ("DETENRECORD_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_DETENRECORD" ADD FOREIGN KEY ("CONTACTCOUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ON DELETE CASCADE DISABLE;
  ALTER TABLE "PIBICSDM2"."DRS_DETENRECORD" ADD FOREIGN KEY ("DETENPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_DETENPERSON" ("DETENPERSON_SEQNO") ON DELETE CASCADE DISABLE;
  ALTER TABLE "PIBICSDM2"."DRS_DETENRECORD" ADD FOREIGN KEY ("RECVTYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_RECVTYPE" ("RECVTYPE_SEQNO") ON DELETE CASCADE DISABLE;
  ALTER TABLE "PIBICSDM2"."DRS_DETENRECORD" ADD FOREIGN KEY ("RELEASETYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."DRS_RELEASETYPE" ("RELEASETYPE_SEQNO") ON DELETE CASCADE DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DRS_DETENRECORD_PK" ON "PIBICSDM2"."DRS_DETENRECORD" ("DETENRECORD_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DRS_DETENRECORD" TO "BIOSAADM";
