CREATE TABLE "SERVAPP"."MSCS_INPRO" 
   (	"INPRO_SEQNO" NUMBER NOT NULL ENABLE, 
	"OFD_SEQNO" NUMBER, 
	"DPT_SEQNO" NUMBER, 
	"PRODTE" DATE, 
	"PROUSRID" VARCHAR2(60 CHAR), 
	"NOTE" VARCHAR2(200 CHAR), 
	"AUTHORISE" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_INPRO" ADD CONSTRAINT "INPRO_PK" PRIMARY KEY ("INPRO_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."INPRO_PK" ON "SERVAPP"."MSCS_INPRO" ("INPRO_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_INPRO" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_INPRO" TO "BIOSAADM";
