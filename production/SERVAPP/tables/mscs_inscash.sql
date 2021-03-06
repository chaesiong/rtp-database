CREATE TABLE "SERVAPP"."MSCS_INSCASH" 
   (	"INSCASH_SEQNO" NUMBER NOT NULL ENABLE, 
	"TM5_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_INSCASH" ADD CONSTRAINT "INSCASH_PK" PRIMARY KEY ("INSCASH_SEQNO")
  USING INDEX (CREATE UNIQUE INDEX "SERVAPP"."MSCS_INSCASH_PK" ON "SERVAPP"."MSCS_INSCASH" ("INSCASH_SEQNO") 
  )  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_INSCASH_PK" ON "SERVAPP"."MSCS_INSCASH" ("INSCASH_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_INSCASH" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_INSCASH" TO "BIOSAADM";
