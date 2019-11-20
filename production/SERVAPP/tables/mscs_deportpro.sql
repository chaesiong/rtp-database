CREATE TABLE "SERVAPP"."MSCS_DEPORTPRO" 
   (	"DPP_SEQNO" NUMBER(10,0) NOT NULL ENABLE, 
	"PHB_SEQNO" NUMBER, 
	"PRODTE" TIMESTAMP (6), 
	"PROUSRID" VARCHAR2(20 CHAR), 
	"DEPORTTYPE" CHAR(1 CHAR), 
	"FLIGNTTYPE" CHAR(1 CHAR), 
	"CONVREGNO1" VARCHAR2(20 CHAR), 
	"CONVREGNO2" VARCHAR2(20 CHAR), 
	"CONVREGNO3" VARCHAR2(20 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"OUTDTE" TIMESTAMP (6), 
	"CONV_SEQNO" NUMBER, 
	"CONV_NOTE" VARCHAR2(200 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"DEPORTDEPT_SEQNO" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_DEPORTPRO" ADD CONSTRAINT "DPTPROID_PK" PRIMARY KEY ("DPP_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."DPTPROID_PK" ON "SERVAPP"."MSCS_DEPORTPRO" ("DPP_SEQNO") 
  ;
  GRANT SELECT ON "SERVAPP"."MSCS_DEPORTPRO" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_DEPORTPRO" TO "BIOSAADM";
