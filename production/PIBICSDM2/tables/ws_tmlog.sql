CREATE TABLE "PIBICSDM2"."WS_TMLOG" 
   (	"WS_TMLOGSEQNO" NUMBER, 
	"TYPEDATA" VARCHAR2(10 CHAR), 
	"SEQUENCENO" VARCHAR2(100 CHAR), 
	"SENDDATETIME" VARCHAR2(14 CHAR), 
	"MSGVERSION" NUMBER, 
	"ISSUCCESS" CHAR(1 CHAR), 
	"ERRORDESC" VARCHAR2(2000 CHAR), 
	"SEQNO" VARCHAR2(100 CHAR), 
	"LOGDATE" DATE
   ) ;
  CREATE INDEX "PIBICSDM2"."WS_LOGDTE_IDX" ON "PIBICSDM2"."WS_TMLOG" (TO_CHAR("LOGDATE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."WS_SEQNO_IDX" ON "PIBICSDM2"."WS_TMLOG" ("SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."WS_TYPEDATA_IDX" ON "PIBICSDM2"."WS_TMLOG" ("TYPEDATA") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."WS_TMLOG_PK" ON "PIBICSDM2"."WS_TMLOG" ("WS_TMLOGSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WS_TMLOG" TO "BIOSAADM";
