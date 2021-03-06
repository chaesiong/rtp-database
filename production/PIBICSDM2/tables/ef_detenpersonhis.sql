CREATE TABLE "PIBICSDM2"."EF_DETENPERSONHIS" 
   (	"IDCNO" VARCHAR2(20 CHAR), 
	"DEPT_SEQNODTE" NUMBER, 
	"DTETYPE_SEQNO" VARCHAR2(5 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"TFIRSTNM" VARCHAR2(100 CHAR), 
	"TFAMILYNM" VARCHAR2(100 CHAR), 
	"TMIDDLENM" VARCHAR2(100 CHAR), 
	"GENDER" CHAR(1 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"ALLEGATION" NUMBER, 
	"SENDDEPT_SEQNO" NUMBER, 
	"SEQNO" NUMBER, 
	"EF_DETENPERSONLOG_SEQNO" NUMBER, 
	"REMANDLOGID" NUMBER, 
	"T_ID" VARCHAR2(20 CHAR), 
	"STATUSREMAND" VARCHAR2(5 CHAR), 
	"SENDRELEASEDATE" VARCHAR2(8 CHAR), 
	"RECEIVERELEASEDATE" VARCHAR2(8 CHAR), 
	"PRISONERID" VARCHAR2(15 CHAR), 
	"RACECDG" NUMBER, 
	"MAINALLEGATION1CDG" NUMBER, 
	"MAINALLEGATION2CDG" NUMBER, 
	"MAINALLEGATION3CDG" NUMBER, 
	"MAINALLEGATION4CDG" NUMBER, 
	"MAINALLEGATION5CDG" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EF_DETENPERSONHIS" TO "BIOSAADM";
