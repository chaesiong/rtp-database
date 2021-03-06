CREATE TABLE "PIBICSDM2"."INV_MASTERFILE" 
   (	"MT_SEQNO" NUMBER, 
	"MT_CASENO" VARCHAR2(12 CHAR), 
	"MT_SPNAME" VARCHAR2(20 CHAR), 
	"MT_SPSNAME" VARCHAR2(20 CHAR), 
	"SP_SEQNO" NUMBER, 
	"PRECINCT_SEQNO" NUMBER, 
	"MT_ARRESTNO" VARCHAR2(20 CHAR), 
	"MT_OCCURDATE" DATE, 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"MT_SECURITYLEVEL" NUMBER, 
	"MT_SPENAME" VARCHAR2(20 CHAR), 
	"MT_SPEMNAME" VARCHAR2(20 CHAR), 
	"MT_SPESNAME" VARCHAR2(20 CHAR), 
	"PLS_SEQNO1" NUMBER, 
	"PLS_SEQNO2" NUMBER, 
	"PLS_SEQNO3" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"MT_PASSNO" VARCHAR2(20 CHAR), 
	"MT_IDCARD" VARCHAR2(13 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"MT_CASEYEAR" VARCHAR2(4 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_MASTERFILE" ADD CONSTRAINT "INV_MASTERFILE_PK" PRIMARY KEY ("MT_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_MASTERFILE" ADD CONSTRAINT "INV_MASTERFILE_R03" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_MASTERFILE_PK" ON "PIBICSDM2"."INV_MASTERFILE" ("MT_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_MASTERFILE" TO "BIOSAADM";
